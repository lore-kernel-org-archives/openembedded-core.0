Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 156AD700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 17:23:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2017 09:22:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="224767682"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2017 09:22:55 -0800
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 44AF66A4006;
	Mon, 13 Feb 2017 09:21:53 -0800 (PST)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 11:25:37 -0600
Message-Id: <1487006737-16306-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa: fix typo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Feb 2017 17:23:20 -0000

The word 'uninstall' was spelled incorrectly in various parts of
oeqa files.

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 meta-selftest/lib/oeqa/runtime/cases/selftest.py |  6 +++---
 meta/lib/oeqa/oetest.py                          | 12 ++++++------
 meta/lib/oeqa/selftest/runtime-test.py           |  2 +-
 meta/lib/oeqa/utils/package_manager.py           |  4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/selftest.py b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
index 329470f..19de740 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/selftest.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
@@ -8,7 +8,7 @@ class Selftest(OERuntimeTestCase):
         """
         Summary: Check basic package installation functionality.
         Expected: 1. Before the test socat must be installed using scp.
-                  2. After the test socat must be unistalled using ssh.
+                  2. After the test socat must be uninstalled using ssh.
                      This can't be checked in this test.
         Product: oe-core
         Author: Mariano Lopez <mariano.lopez@intel.com>
@@ -18,10 +18,10 @@ class Selftest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg="socat is not installed")
 
     @OETestDepends(['selftest.Selftest.test_install_package'])
-    def test_verify_unistall(self):
+    def test_verify_uninstall(self):
         """
         Summary: Check basic package installation functionality.
-        Expected: 1. test_install_package must unistall socat.
+        Expected: 1. test_install_package must uninstall socat.
                      This test is just to verify that.
         Product: oe-core
         Author: Mariano Lopez <mariano.lopez@intel.com>
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index b886130..a89bd11 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -106,7 +106,7 @@ class oeRuntimeTest(oeTest):
         pass
 
     def tearDown(self):
-        # Unistall packages in the DUT
+        # Uninstall packages in the DUT
         self.tc.install_uninstall_packages(self.id(), False)
 
         res = getResults()
@@ -546,7 +546,7 @@ class RuntimeTestContext(TestContext):
 
     def install_uninstall_packages(self, test_id, pkg_dir, install):
         """
-        Check if the test requires a package and Install/Unistall it in the DUT
+        Check if the test requires a package and Install/Uninstall it in the DUT
         """
 
         test = test_id.split(".")[4]
@@ -559,7 +559,7 @@ class RuntimeTestContext(TestContext):
 
     def _install_uninstall_packages(self, needed_packages, pkg_dir, install=True):
         """
-        Install/Unistall packages in the DUT without using a package manager
+        Install/Uninstall packages in the DUT without using a package manager
         """
 
         if isinstance(needed_packages, dict):
@@ -577,7 +577,7 @@ class RuntimeTestContext(TestContext):
             if install and extract:
                 self.target.connection.copy_dir_to(src_dir, "/")
 
-            # Unistall package
+            # Uninstall package
             elif not install and rm:
                 self.target.connection.delete_dir_structure(src_dir, "/")
 
@@ -600,7 +600,7 @@ class ImageTestContext(RuntimeTestContext):
 
     def install_uninstall_packages(self, test_id, install=True):
         """
-        Check if the test requires a package and Install/Unistall it in the DUT
+        Check if the test requires a package and Install/Uninstall it in the DUT
         """
 
         pkg_dir = self.d.getVar("TEST_EXTRACTED_DIR")
@@ -623,7 +623,7 @@ class ExportTestContext(RuntimeTestContext):
 
     def install_uninstall_packages(self, test_id, install=True):
         """
-        Check if the test requires a package and Install/Unistall it in the DUT
+        Check if the test requires a package and Install/Uninstall it in the DUT
         """
 
         export_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 52e5b27..a673f36 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -102,7 +102,7 @@ class TestImage(oeSelfTest):
         """
         Summary: Check install packages functionality for testimage/testexport.
         Expected: 1. Import tests from a directory other than meta.
-                  2. Check install/unistall of socat.
+                  2. Check install/uninstall of socat.
         Product: oe-core
         Author: Mariano Lopez <mariano.lopez@intel.com>
         """
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index 9264648..724afb2 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -187,7 +187,7 @@ def test_needs_package(test_case):
 
 def _install_uninstall_packages(needed_packages, test_case, install=True):
     """
-    Install/Unistall packages in the DUT without using a package manager
+    Install/Uninstall packages in the DUT without using a package manager
     """
 
     if isinstance(needed_packages, dict):
@@ -205,6 +205,6 @@ def _install_uninstall_packages(needed_packages, test_case, install=True):
         if install and extract:
             test_case.tc.target.copyDirTo(src_dir, '/')
 
-        # Unistall package
+        # Uninstall package
         elif not install and rm:
             test_case.tc.target.deleteDirStructure(src_dir, '/')
-- 
2.7.4


