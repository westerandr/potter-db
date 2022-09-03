# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require_relative "lib/rack/health_check"

use Rack::Cors do
  allow do
    origins '*'
    resource '/health', headers: :any, methods: :get
  end
end

map "/health" do
  run Rack::HealthCheck.new
end

run Rails.application
Rails.application.load_server
