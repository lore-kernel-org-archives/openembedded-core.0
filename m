Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3E84C774A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 20:14:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2017 12:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="219408837"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 30 Jan 2017 12:14:56 -0800
Received: from fjpedraz-MOBL3.zpn.intel.com (fjpedraz-mobl3.zpn.intel.com
	[10.219.128.40])
	by linux.intel.com (Postfix) with ESMTP id 245A86A4006;
	Mon, 30 Jan 2017 12:13:58 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 14:14:36 -0600
Message-Id: <1485807276-16613-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v1] sdkext/cases oeqa/selftest: Updates decorators
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
X-List-Received-Date: Mon, 30 Jan 2017 20:14:58 -0000

Updates decorators for eSDK in test cases at:
sdkext/cases/devtool.py and oeqa/selftest/eSDK.py

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 12 ++++++------
 meta/lib/oeqa/selftest/eSDK.py        |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index da0050c..43214a5 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -49,22 +49,22 @@ class DevtoolTest(OESDKExtTestCase):
         self._run('devtool add myapp %s' % self.myapp_dst)
         self._run('devtool reset myapp')
     
-    @OETestID(1473)
+    @OETestID(1605)
     @OETestDepends(['test_devtool_location'])
     def test_devtool_build_make(self):
         self._test_devtool_build(self.myapp_dst)
     
-    @OETestID(1474)
+    @OETestID(1606)
     @OETestDepends(['test_devtool_location'])
     def test_devtool_build_esdk_package(self):
         self._test_devtool_build_package(self.myapp_dst)
 
-    @OETestID(1479)
+    @OETestID(1607)
     @OETestDepends(['test_devtool_location'])
     def test_devtool_build_cmake(self):
         self._test_devtool_build(self.myapp_cmake_dst)
     
-    @OETestID(1482)
+    @OETestID(1608)
     @OETestDepends(['test_devtool_location'])
     def test_extend_autotools_recipe_creation(self):
         req = 'https://github.com/rdfa/librdfa'
@@ -78,7 +78,7 @@ class DevtoolTest(OESDKExtTestCase):
             raise e
         self._run('devtool reset %s' % recipe)
 
-    @OETestID(1484)
+    @OETestID(1609)
     @OETestDepends(['test_devtool_location'])
     def test_devtool_kernelmodule(self):
         docfile = 'https://github.com/umlaeute/v4l2loopback.git'
@@ -92,7 +92,7 @@ class DevtoolTest(OESDKExtTestCase):
             raise e
         self._run('devtool reset %s' % recipe)
 
-    @OETestID(1478)
+    @OETestID(1610)
     @OETestDepends(['test_devtool_location'])
     def test_recipes_for_nodejs(self):
         package_nodejs = "npm://registry.npmjs.org;name=winston;version=2.2.0"
diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/eSDK.py
index c95ca6d..ee1ca6a 100644
--- a/meta/lib/oeqa/selftest/eSDK.py
+++ b/meta/lib/oeqa/selftest/eSDK.py
@@ -15,7 +15,7 @@ class oeSDKExtSelfTest(oeSelfTest):
     """
     # Bugzilla Test Plan: 6033
     # This code is planned to be part of the automation for eSDK containig
-    # Install libraries and headers, image generation binary feeds.
+    # Install libraries and headers, image generation binary feeds, sdk-update.
     """
 
     @staticmethod
@@ -109,14 +109,14 @@ SSTATE_MIRRORS =  "file://.* http://%s/PATH"
         shutil.rmtree(cls.tmpdir_eSDKQA)
         cls.http_service.stop()
 
-    @testcase (1471)
+    @testcase (1602)
     def test_install_libraries_headers(self):
         pn_sstate = 'bc'
         bitbake(pn_sstate)
         cmd = "devtool sdk-install %s " % pn_sstate
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
     
-    @testcase(1472)
+    @testcase(1603)
     def test_image_generation_binary_feeds(self):
         image = 'core-image-minimal'
         cmd = "devtool build-image %s" % image
-- 
2.5.0


