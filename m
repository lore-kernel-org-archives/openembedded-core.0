Return-Path: <libertad.cruz@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 18E4878287
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 19:40:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2017 12:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,437,1500966000"; d="scan'208";a="139275567"
Received: from liberta1-mobl1.zpn.intel.com ([10.219.128.45])
	by orsmga002.jf.intel.com with ESMTP; 25 Sep 2017 12:41:00 -0700
From: libertad.cruz@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Sep 2017 14:50:18 -0500
Message-Id: <1506369018-2646-1-git-send-email-libertad.cruz@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: libertad.cruz@intel.com
Subject: [PATCH] devtool.py: update testcase Ids in morty
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
X-List-Received-Date: Mon, 25 Sep 2017 19:41:00 -0000

From: libertad <libertad.cruz@intel.com>

eSDK testcases Ids were modified on testopia, hence there needs to be a change in the devtool script.

[YOCTO #11603]

Signed-off-by: libertad <libertad.cruz@intel.com>
---
 meta/lib/oeqa/sdkext/devtool.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/devtool.py
index 65f41f68750..7eab49f94fb 100644
--- a/meta/lib/oeqa/sdkext/devtool.py
+++ b/meta/lib/oeqa/sdkext/devtool.py
@@ -45,22 +45,22 @@ class DevtoolTest(oeSDKExtTest):
         self._run('devtool add myapp %s' % self.myapp_dst)
         self._run('devtool reset myapp')
     
-    @testcase(1473)
+    @testcase(1605)
     @skipUnlessPassed('test_devtool_location')
     def test_devtool_build_make(self):
         self._test_devtool_build(self.myapp_dst)
     
-    @testcase(1474)
+    @testcase(1606)
     @skipUnlessPassed('test_devtool_location')
     def test_devtool_build_esdk_package(self):
         self._test_devtool_build_package(self.myapp_dst)
 
-    @testcase(1479)
+    @testcase(1607)
     @skipUnlessPassed('test_devtool_location')
     def test_devtool_build_cmake(self):
         self._test_devtool_build(self.myapp_cmake_dst)
     
-    @testcase(1482)
+    @testcase(1608)
     @skipUnlessPassed('test_devtool_location')
     def test_extend_autotools_recipe_creation(self):
         req = 'https://github.com/rdfa/librdfa'
@@ -74,7 +74,7 @@ class DevtoolTest(oeSDKExtTest):
             raise e
         self._run('devtool reset %s' % recipe)
 
-    @testcase(1484)
+    @testcase(1609)
     @skipUnlessPassed('test_devtool_location')
     def test_devtool_kernelmodule(self):
         docfile = 'https://github.com/umlaeute/v4l2loopback.git'
@@ -88,7 +88,7 @@ class DevtoolTest(oeSDKExtTest):
             raise e
         self._run('devtool reset %s' % recipe)
 
-    @testcase(1478)
+    @testcase(1610)
     @skipUnlessPassed('test_devtool_location')
     def test_recipes_for_nodejs(self):
         package_nodejs = "npm://registry.npmjs.org;name=winston;version=2.2.0"
-- 
2.12.3


