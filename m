Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6191.1794231918037246001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=NrWwxWHO;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AA5D93D81838;
	Mon,  9 Nov 2026 08:45:16 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id IvSzK59mV24w; Mon,  9 Nov 2026 08:45:15 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A7BD53D8176B;
	Mon,  9 Nov 2026 08:45:15 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A7BD53D8176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231915; bh=6ai6xwDvj57On1WiS+GLTQWqwdkYEs5vV0nWnJcZjeM=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=NrWwxWHOUKNmbQlB1ljv4eaiZi9O39boZB/e9QROytoonAzQaVH7+ChFOFaU++9j/
	 sdMqnz/qg+QMuPmdNf7Y55ThUlBzNBx0p5nVBmML1Tq+eRatFSSwHCJVeUOGWCH65k
	 dA7VdnsILeXH9rL3BFWZAQw/nJxWPEqARR50y6oXFMluHYE+xUfiOJus2rkJaw96nZ
	 mpXZ29L8YkhRJuDEGSGrigaqAIAHntlCT5M35m1AzAa2mg/51dP8P6H9cHIUMbBySy
	 qDMXs32do+yLg30UP5yyJ+FamtwSFwQyZrmP+em3QJ8d+1f3dD2Xpr48EtOyaBqyOt
	 Ku+WwamgyjipQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id bHRNMiRl40vr; Mon,  9 Nov 2026 08:45:15 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 21F923D80F35;
	Mon,  9 Nov 2026 08:45:15 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:22 +0100
Subject: [PATCH v2 05/18] devtool: ide-sdk: recommend Rust Analyzer for
 Cargo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-5-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249832

Recommend rust-analyzer for Cargo recipes and verify the extension appears
in the generated VS Code recommendations file.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 14 ++++++++++++++
 scripts/lib/devtool/ide_plugins/ide_code.py |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index cab49b4c02..8e90dba7d0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4339,6 +4339,20 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
         self._test_code_and_none_qemu(slirp=True)
 
 
+class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
+
+    def test_code_cargo_rust_analyzer_recommendation(self):
+        recipe_name = "cargo-example"
+        self._check_workspace()
+        self._write_bb_config()
+        tempdir = self._devtool_ide_sdk_recipe(recipe_name, "Cargo.toml", None)
+        runCmd('devtool ide-sdk %s oe-selftest-image --ide=code' % recipe_name,
+               output_log=self._cmd_logger)
+
+        with open(os.path.join(tempdir, '.vscode', 'extensions.json')) as extensions_file:
+            extensions = json.load(extensions_file)
+        self.assertIn('rust-lang.rust-analyzer', extensions['recommendations'])
+
 class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
 
     @OETestTag("runqemu")
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 081dc08657..cf7f81293c 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -303,6 +303,8 @@ class IdeVSCode(IdeBase):
 
     def vscode_extensions(self, modified_recipe):
         recommendations = []
+        if modified_recipe.build_tool is BuildTool.CARGO:
+            recommendations.append("rust-lang.rust-analyzer")
         # clangd (matched to the recipe's real cross compiler via
         # compile_commands.json) replaces cpptools as the IntelliSense provider
         # when selected via IDE_SDK_INTELLISENSE (defaults to clangd for the

-- 
2.53.0

