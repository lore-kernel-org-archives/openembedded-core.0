Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF39C982DB
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:48 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.619.1789670320767513171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 11:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=KEeoNUkR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260917183838e6f74f38ae000207a1-_mgqbc@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260917183838e6f74f38ae000207a1
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Sep 2026 20:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ptuunu9Ekxp3uKtgAOW8NMhTLyzXG9DBvccZfd3MFMA=;
 b=KEeoNUkR1u38Zih2czXdl0OlwCL7uASSkJpg5p1g0Tqkwc7fF6sp/N4tRH/6ozVUCg2UW4
 CjflUSuFFiNwbeKXRwIK6i/vwaq8C3PbtkYlzZjNaEk8bjoO+vtCPfvR+8GZozlmMG23We2j
 SrRWdyGNb4RLEAuj3EBInVgpHV3SQuOuLc7xo6ySPYYXc+Y3wgg1QJGeUG3W/50+TCuDMNi5
 cHF8bTIH/fCIPBPMFU6rfOsXI3/T5CowEAwavpA9tW7CboxLLDeRYlGt7FwTtKuaydmUTcm8
 uIqQ8foovo8IEaK0zMY9+/a+Fm6IHvWVV5YAgPpUvxG5tQEjLcfoYVrA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/7] oe-selftest: devtool ide-sdk shorter test names
Date: Thu, 17 Sep 2026 20:37:55 +0200
Message-ID: <20260917183832.998361-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260917183832.998361-1-adrian.freihofer@siemens.com>
References: <20260917183832.998361-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 18:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246081

From: Adrian Freihofer <adrian.freihofer@siemens.com>

No functional changes, only test name shortening.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 54 ++++++++++++-------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0cede11d67..535ffed9f0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3547,7 +3547,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         """Verify a recipe's binary was extracted into the NFS debug rootfs."""
         self.assertExists(os.path.join(nfs_rootfs, 'usr', 'bin', example_exe))
 
-    def _test_devtool_ide_sdk_code_nfs_debug_rootfs(self):
+    def _test_code_nfs_debug_rootfs(self):
         """Verify ide-sdk extracts an NFS debug rootfs for VS Code debugging."""
         recipe_name = self._cmake_recipe_name
         build_file = "CMakeLists.txt"
@@ -3564,7 +3564,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self._verify_nfs_binary_deployed(nfs_rootfs, recipe_name)
         self._verify_nfs_launch_json(tempdir, nfs_rootfs)
 
-    def _test_devtool_ide_sdk_code_and_none_qemu(self, nfs=False, slirp=False):
+    def _test_code_and_none_qemu(self, nfs=False, slirp=False):
         """Verify devtool ide-sdk --ide=code --ide=none for cmake, meson and the target toolchain.
 
         Generating the VS Code (ide=code) and generic (ide=none) IDE
@@ -4225,27 +4225,27 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
                 os.path.join(nfs_rootfs, 'usr', 'src', 'debug'),
                 configuration['sourceFileMap']['/usr/src/debug'])
 
-    def test_devtool_ide_sdk_code_nfs_debug_rootfs(self):
+    def test_code_nfs_debug_rootfs(self):
         """Verify ide-sdk extracts an NFS debug rootfs for VS Code debugging."""
-        self._test_devtool_ide_sdk_code_nfs_debug_rootfs()
+        self._test_code_nfs_debug_rootfs()
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_code_and_none_qemu(self):
+    def test_code_and_none_qemu(self):
         """Verify devtool ide-sdk --ide=code --ide=none for cmake-example/meson-example with GCC and GDB."""
-        self._test_devtool_ide_sdk_code_and_none_qemu()
+        self._test_code_and_none_qemu()
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_none_nfs_qemu(self):
+    def test_code_and_none_nfs_qemu(self):
         """Verify the full ide=code,none workflow through an NFS-root QEMU target."""
-        self._test_devtool_ide_sdk_code_and_none_qemu(nfs=True)
+        self._test_code_and_none_qemu(nfs=True)
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_none_nfs_qemu_slirp(self):
+    def test_code_and_none_nfs_qemu_slirp(self):
         """Verify the full ide=code,none workflow through an NFS-root slirp target."""
-        self._test_devtool_ide_sdk_code_and_none_qemu(nfs=True, slirp=True)
+        self._test_code_and_none_qemu(nfs=True, slirp=True)
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_none_qemu_slirp(self):
+    def test_code_and_none_qemu_slirp(self):
         """Verify devtool ide-sdk works with runqemu slirp networking.
 
         Slirp mode uses SSH port forwarding (default: localhost:2222 -> guest:22).
@@ -4255,13 +4255,13 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
           - runqemu boots the image in slirp mode.
           - devtool deploy-target reaches the target via localhost:2222.
         """
-        self._test_devtool_ide_sdk_code_and_none_qemu(slirp=True)
+        self._test_code_and_none_qemu(slirp=True)
 
 
 class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_code_kernel_module(self):
+    def test_code_kernel_module(self):
         """Verify a kernel module recipe works with ide=code mode
 
         Test flow:
@@ -4477,7 +4477,7 @@ class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
 
 class DevtoolIdeSdkSharedTests(DevtoolIdeSdkTests):
 
-    def test_devtool_ide_sdk_shared_sysroots(self):
+    def test_shared_sysroots(self):
         """Verify the shared sysroot SDK"""
 
         # Handle the workspace (which is not needed by this test case)
@@ -5045,15 +5045,15 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
             lldb_server_pid, pid_file))
         self.assertEqual(status, 0)
 
-    def test_devtool_ide_sdk_code_nfs_debug_rootfs(self):
+    def test_sdk_code_nfs_debug_rootfs(self):
         """Verify ide-sdk extracts an NFS debug rootfs for VS Code (CodeLLDB) debugging."""
-        self._test_devtool_ide_sdk_code_nfs_debug_rootfs()
+        self._test_code_nfs_debug_rootfs()
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_code_and_none_qemu(self):
+    def test_code_and_none_qemu(self):
         """Verify devtool ide-sdk --ide=code --ide=none for cmake/meson-example-clang with Clang and LLDB.
 
-        See DevtoolIdeSdkTests._test_devtool_ide_sdk_code_and_none_qemu for
+        See DevtoolIdeSdkTests._test_code_and_none_qemu for
         the shared workflow. Clang-specific here: the generated configs
         select lldb-native/lldb-server instead of gdb-cross/gdbserver
         (extensions.json recommends vadimcn.vscode-lldb, launch.json uses
@@ -5066,31 +5066,31 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         -fdebug-prefix-map/-ffile-prefix-map underflow breaking
         source-level breakpoint resolution in CodeLLDB.
         """
-        self._test_devtool_ide_sdk_code_and_none_qemu()
+        self._test_code_and_none_qemu()
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_none_nfs_qemu(self):
+    def test_sdk_none_nfs_qemu(self):
         """Verify the full ide=code,none workflow through an NFS-root QEMU target."""
-        self._test_devtool_ide_sdk_code_and_none_qemu(nfs=True)
+        self._test_code_and_none_qemu(nfs=True)
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_none_nfs_qemu_slirp(self):
+    def test_sdk_none_nfs_qemu_slirp(self):
         """Verify the full ide=code,none workflow through an NFS-root slirp target."""
-        self._test_devtool_ide_sdk_code_and_none_qemu(nfs=True, slirp=True)
+        self._test_code_and_none_qemu(nfs=True, slirp=True)
 
     @OETestTag("runqemu")
-    def test_devtool_ide_sdk_none_qemu_slirp(self):
+    def test_sdk_none_qemu_slirp(self):
         """Verify devtool ide-sdk works with runqemu slirp networking.
 
         Slirp mode uses SSH port forwarding (default: localhost:2222 -> guest:22).
         """
-        self._test_devtool_ide_sdk_code_and_none_qemu(slirp=True)
+        self._test_code_and_none_qemu(slirp=True)
 
 
 class DevtoolIdeSdkMiscTests(DevtoolIdeSdkTests):
 
-    def test_devtool_ide_sdk_plugins(self):
-        """Test that devtool ide-sdk can use plugins from other layers."""
+    def test_plugins(self):
+        """Test that plugins from other layers can be used by devtool ide-sdk."""
 
         # We need a workspace layer and a modified recipe (but no image)
         modified_recipe_name = "meson-example"
-- 
2.55.0


