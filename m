Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38524.1793004973870975863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=HGvhrnMt;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E04CE3D81886;
	Mon, 26 Oct 2026 04:56:12 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 1DbCJP5o0Y9D; Mon, 26 Oct 2026 04:56:12 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DDE803D81896;
	Mon, 26 Oct 2026 04:56:11 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com DDE803D81896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004971; bh=QuBNPmiC+CmLPjndRVy+du3hchxNnRcsJCOUm+3IHxY=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=HGvhrnMtKM7F0EoJmZLnVyHyEmdHrD7UZ7LsODpNYekGf4Ik7TaPMcwxkMXXeurAg
	 v85sW6E1ViW1EH7eTLsm0cN6BkWxcM8QR9WbxAKowEXBaaojzR2tM7hGp/jx8oGBfz
	 78ft9DAiptKZiVIlAf12G9/ExLgxzIwcwM2gROjkxfHLu5r03BHUzYIBPJxIU8RCQg
	 63e05UJDWHawx+4EGSfAt0ie6sFy5EWjXyzzJWo0Eg3vR+lS6Xx7Of7gEyQy2bbmFW
	 D0wz+1Y7gXgipvSHXyUXKlkD41kbELWedzNeLq10cHM3YDGfeyqLaXogkBe97XyZ3f
	 3w7Z/Vm7QvPzQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id W1si99SANAWv; Mon, 26 Oct 2026 04:56:11 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 547FB3D81844;
	Mon, 26 Oct 2026 04:56:11 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:42 +0100
Subject: [PATCH 04/20] devtool: ide-sdk: recommend Rust Analyzer for Cargo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-4-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248642

Recommend rust-analyzer for Cargo recipes and verify the extension appears
in the generated VS Code recommendations file.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 14 ++++++++++++++
 scripts/lib/devtool/ide_plugins/ide_code.py |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 265f2147a4..941f54e36b 100644
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

