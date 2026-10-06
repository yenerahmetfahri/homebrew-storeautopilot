class Storeautopilot < Formula
  desc "Release Flutter apps to the App Store and Google Play from your own Mac"
  homepage "https://github.com/yenerahmetfahri/StoreAutopilot"
  url "https://github.com/yenerahmetfahri/StoreAutopilot/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "ef595dea485d1359de9ad1e76aef3446eec16087e446cf217e26047e9088e149"
  license "MIT"

  depends_on "fastlane"
  depends_on :macos
  depends_on "ruby"

  def install
    libexec.install "bin", "lib", "fastlane", "templates"
    (bin/"storeautopilot").write_env_script libexec/"bin/storeautopilot",
                                            PATH: "#{Formula["ruby"].opt_bin}:#{Formula["fastlane"].opt_bin}:$PATH"
  end

  test do
    assert_match "storeautopilot #{version}", shell_output("#{bin}/storeautopilot --version")
    assert_match "Usage: storeautopilot", shell_output("#{bin}/storeautopilot --help")
  end
end
