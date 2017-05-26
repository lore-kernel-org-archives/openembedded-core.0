Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ED4E57836F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:39:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887964"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:39:15 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:38:01 -0500
Message-Id: <6261b4ed0e29fb734458c4d2ff7c766d6676f3c4.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 35/36] oeqa/selftest/cases: Migrate test cases into the new oe-qa framework
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
X-List-Received-Date: Fri, 26 May 2017 20:39:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

New framework has different classes/decorators so adapt current test cases to
support these. Changes include changes on base classes and decorators.

Also include paths in selftest/__init__.py isn't needed because the
loader is the standard unittest one.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/__init__.py                 |  2 -
 .../selftest/{ => cases}/_sstatetests_noauto.py    |  7 +-
 meta/lib/oeqa/selftest/{ => cases}/archiver.py     | 14 ++--
 meta/lib/oeqa/selftest/{ => cases}/bblayers.py     | 24 +++----
 meta/lib/oeqa/selftest/{ => cases}/bbtests.py      | 57 +++++++--------
 meta/lib/oeqa/selftest/{ => cases}/buildhistory.py |  5 +-
 meta/lib/oeqa/selftest/{ => cases}/buildoptions.py | 34 ++++-----
 .../oeqa/selftest/{ => cases}/containerimage.py    |  4 +-
 meta/lib/oeqa/selftest/{ => cases}/devtool.py      | 68 +++++++++---------
 meta/lib/oeqa/selftest/{ => cases}/eSDK.py         | 18 ++---
 .../lib/oeqa/selftest/{ => cases}/image_typedep.py |  4 +-
 .../lib/oeqa/selftest/{ => cases}/imagefeatures.py | 16 ++---
 meta/lib/oeqa/selftest/{ => cases}/layerappend.py  | 15 ++--
 meta/lib/oeqa/selftest/{ => cases}/liboe.py        |  7 +-
 .../{lic-checksum.py => cases/lic_checksum.py}     |  8 +--
 meta/lib/oeqa/selftest/{ => cases}/manifest.py     | 52 +++++++-------
 .../oeqa/selftest/{ => cases}/oelib/__init__.py    |  0
 .../selftest/{ => cases}/oelib/buildhistory.py     |  4 +-
 meta/lib/oeqa/selftest/{ => cases}/oelib/elf.py    |  4 +-
 .../lib/oeqa/selftest/{ => cases}/oelib/license.py |  6 +-
 meta/lib/oeqa/selftest/{ => cases}/oelib/path.py   |  4 +-
 meta/lib/oeqa/selftest/{ => cases}/oelib/types.py  |  6 +-
 meta/lib/oeqa/selftest/{ => cases}/oelib/utils.py  |  6 +-
 meta/lib/oeqa/selftest/{ => cases}/oescripts.py    | 15 ++--
 meta/lib/oeqa/selftest/{ => cases}/package.py      |  4 +-
 meta/lib/oeqa/selftest/{ => cases}/pkgdata.py      | 29 ++++----
 meta/lib/oeqa/selftest/{ => cases}/prservice.py    | 27 ++++---
 meta/lib/oeqa/selftest/{ => cases}/recipetool.py   | 81 +++++++++++----------
 meta/lib/oeqa/selftest/{ => cases}/runqemu.py      | 31 ++++----
 .../{runtime-test.py => cases/runtime_test.py}     | 15 ++--
 meta/lib/oeqa/selftest/{ => cases}/signing.py      | 15 ++--
 meta/lib/oeqa/selftest/{ => cases}/sstate.py       |  5 +-
 meta/lib/oeqa/selftest/{ => cases}/sstatetests.py  | 46 ++++++------
 meta/lib/oeqa/selftest/{ => cases}/tinfoil.py      | 25 ++++---
 meta/lib/oeqa/selftest/{ => cases}/wic.py          | 84 +++++++++++-----------
 35 files changed, 355 insertions(+), 387 deletions(-)
 delete mode 100644 meta/lib/oeqa/selftest/__init__.py
 rename meta/lib/oeqa/selftest/{ => cases}/_sstatetests_noauto.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/archiver.py (91%)
 rename meta/lib/oeqa/selftest/{ => cases}/bblayers.py (94%)
 rename meta/lib/oeqa/selftest/{ => cases}/bbtests.py (95%)
 rename meta/lib/oeqa/selftest/{ => cases}/buildhistory.py (94%)
 rename meta/lib/oeqa/selftest/{ => cases}/buildoptions.py (94%)
 rename meta/lib/oeqa/selftest/{ => cases}/containerimage.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/devtool.py (99%)
 rename meta/lib/oeqa/selftest/{ => cases}/eSDK.py (92%)
 rename meta/lib/oeqa/selftest/{ => cases}/image_typedep.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/imagefeatures.py (95%)
 rename meta/lib/oeqa/selftest/{ => cases}/layerappend.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/liboe.py (96%)
 rename meta/lib/oeqa/selftest/{lic-checksum.py => cases/lic_checksum.py} (87%)
 rename meta/lib/oeqa/selftest/{ => cases}/manifest.py (80%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/__init__.py (100%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/buildhistory.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/elf.py (92%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/license.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/path.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/types.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/utils.py (91%)
 rename meta/lib/oeqa/selftest/{ => cases}/oescripts.py (72%)
 rename meta/lib/oeqa/selftest/{ => cases}/package.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/pkgdata.py (96%)
 rename meta/lib/oeqa/selftest/{ => cases}/prservice.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/recipetool.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/runqemu.py (92%)
 rename meta/lib/oeqa/selftest/{runtime-test.py => cases/runtime_test.py} (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/signing.py (96%)
 rename meta/lib/oeqa/selftest/{ => cases}/sstate.py (95%)
 rename meta/lib/oeqa/selftest/{ => cases}/sstatetests.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/tinfoil.py (96%)
 rename meta/lib/oeqa/selftest/{ => cases}/wic.py (97%)

diff --git a/meta/lib/oeqa/selftest/__init__.py b/meta/lib/oeqa/selftest/__init__.py
deleted file mode 100644
index 3ad9513..0000000
--- a/meta/lib/oeqa/selftest/__init__.py
+++ /dev/null
@@ -1,2 +0,0 @@
-from pkgutil import extend_path
-__path__ = extend_path(__path__, __name__)
diff --git a/meta/lib/oeqa/selftest/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
similarity index 97%
rename from meta/lib/oeqa/selftest/_sstatetests_noauto.py
rename to meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
index fc9ae7e..0e58962 100644
--- a/meta/lib/oeqa/selftest/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -1,19 +1,16 @@
-import datetime
-import unittest
 import os
-import re
 import shutil
 
 import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
-from oeqa.selftest.sstate import SStateBase
+from oeqa.selftest.cases.sstate import SStateBase
 
 
 class RebuildFromSState(SStateBase):
 
     @classmethod
     def setUpClass(self):
+        super(RebuildFromSState, self).setUpClass()
         self.builddir = os.path.join(os.environ.get('BUILDDIR'))
 
     def get_dep_targets(self, primary_targets):
diff --git a/meta/lib/oeqa/selftest/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
similarity index 91%
rename from meta/lib/oeqa/selftest/archiver.py
rename to meta/lib/oeqa/selftest/cases/archiver.py
index d7f215c..70c7282 100644
--- a/meta/lib/oeqa/selftest/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -1,14 +1,12 @@
-from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import bitbake, get_bb_vars
-from oeqa.utils.decorators import testcase
-import glob
 import os
-import shutil
-
+import glob
+from oeqa.utils.commands import bitbake, get_bb_vars
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.oeid import OETestID
 
-class Archiver(oeSelfTest):
+class Archiver(OESelftestTestCase):
 
-    @testcase(1345)
+    @OETestID(1345)
     def test_archiver_allows_to_filter_on_recipe_name(self):
         """
         Summary:     The archiver should offer the possibility to filter on the recipe. (#6929)
diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
similarity index 94%
rename from meta/lib/oeqa/selftest/bblayers.py
rename to meta/lib/oeqa/selftest/cases/bblayers.py
index cd658c5..90a2249 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -1,39 +1,37 @@
-import unittest
 import os
-import logging
 import re
-import shutil
 
 import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, get_bb_var
-from oeqa.utils.decorators import testcase
 
-class BitbakeLayers(oeSelfTest):
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.oeid import OETestID
 
-    @testcase(756)
+class BitbakeLayers(OESelftestTestCase):
+
+    @OETestID(756)
     def test_bitbakelayers_showcrossdepends(self):
         result = runCmd('bitbake-layers show-cross-depends')
         self.assertTrue('aspell' in result.output, msg = "No dependencies were shown. bitbake-layers show-cross-depends output: %s" % result.output)
 
-    @testcase(83)
+    @OETestID(83)
     def test_bitbakelayers_showlayers(self):
         result = runCmd('bitbake-layers show-layers')
         self.assertTrue('meta-selftest' in result.output, msg = "No layers were shown. bitbake-layers show-layers output: %s" % result.output)
 
-    @testcase(93)
+    @OETestID(93)
     def test_bitbakelayers_showappends(self):
         recipe = "xcursor-transparent-theme"
         bb_file = self.get_recipe_basename(recipe)
         result = runCmd('bitbake-layers show-appends')
         self.assertTrue(bb_file in result.output, msg="%s file was not recognised. bitbake-layers show-appends output: %s" % (bb_file, result.output))
 
-    @testcase(90)
+    @OETestID(90)
     def test_bitbakelayers_showoverlayed(self):
         result = runCmd('bitbake-layers show-overlayed')
         self.assertTrue('aspell' in result.output, msg="aspell overlayed recipe was not recognised bitbake-layers show-overlayed %s" % result.output)
 
-    @testcase(95)
+    @OETestID(95)
     def test_bitbakelayers_flatten(self):
         recipe = "xcursor-transparent-theme"
         recipe_path = "recipes-graphics/xcursor-transparent-theme"
@@ -48,7 +46,7 @@ class BitbakeLayers(oeSelfTest):
         find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
         self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
-    @testcase(1195)
+    @OETestID(1195)
     def test_bitbakelayers_add_remove(self):
         test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
@@ -66,7 +64,7 @@ class BitbakeLayers(oeSelfTest):
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
 
-    @testcase(1384)
+    @OETestID(1384)
     def test_bitbakelayers_showrecipes(self):
         result = runCmd('bitbake-layers show-recipes')
         self.assertIn('aspell:', result.output)
diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
similarity index 95%
rename from meta/lib/oeqa/selftest/bbtests.py
rename to meta/lib/oeqa/selftest/cases/bbtests.py
index 46e09f5..4c82049 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -2,30 +2,31 @@ import os
 import re
 
 import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
-from oeqa.utils.decorators import testcase
 
-class BitbakeTests(oeSelfTest):
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.oeid import OETestID
+
+class BitbakeTests(OESelftestTestCase):
 
     def getline(self, res, line):
         for l in res.output.split('\n'):
             if line in l:
                 return l
 
-    @testcase(789)
+    @OETestID(789)
     def test_run_bitbake_from_dir_1(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
         self.assertEqual(bitbake('-e').status, 0, msg = "bitbake couldn't run from \"conf\" dir")
 
-    @testcase(790)
+    @OETestID(790)
     def test_run_bitbake_from_dir_2(self):
         my_env = os.environ.copy()
         my_env['BBPATH'] = my_env['BUILDDIR']
         os.chdir(os.path.dirname(os.environ['BUILDDIR']))
         self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from builddir")
 
-    @testcase(806)
+    @OETestID(806)
     def test_event_handler(self):
         self.write_config("INHERIT += \"test_events\"")
         result = bitbake('m4-native')
@@ -35,7 +36,7 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue(find_build_completed, msg = "Match failed in:\n%s" % result.output)
         self.assertFalse('Test for bb.event.InvalidEvent' in result.output, msg = "\"Test for bb.event.InvalidEvent\" message found during bitbake process. bitbake output: %s" % result.output)
 
-    @testcase(103)
+    @OETestID(103)
     def test_local_sstate(self):
         bitbake('m4-native')
         bitbake('m4-native -cclean')
@@ -43,17 +44,17 @@ class BitbakeTests(oeSelfTest):
         find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
         self.assertTrue(find_setscene, msg = "No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native. bitbake output: %s" % result.output )
 
-    @testcase(105)
+    @OETestID(105)
     def test_bitbake_invalid_recipe(self):
         result = bitbake('-b asdf', ignore_status=True)
         self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
-    @testcase(107)
+    @OETestID(107)
     def test_bitbake_invalid_target(self):
         result = bitbake('asdf', ignore_status=True)
         self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output, msg = "Though no 'asdf' target exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
-    @testcase(106)
+    @OETestID(106)
     def test_warnings_errors(self):
         result = bitbake('-b asdf', ignore_status=True)
         find_warnings = re.search("Summary: There w.{2,3}? [1-9][0-9]* WARNING messages* shown", result.output)
@@ -61,7 +62,7 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue(find_warnings, msg="Did not find the mumber of warnings at the end of the build:\n" + result.output)
         self.assertTrue(find_errors, msg="Did not find the mumber of errors at the end of the build:\n" + result.output)
 
-    @testcase(108)
+    @OETestID(108)
     def test_invalid_patch(self):
         # This patch already exists in SRC_URI so adding it again will cause the
         # patch to fail.
@@ -73,7 +74,7 @@ class BitbakeTests(oeSelfTest):
         line = self.getline(result, "Function failed: patch_do_patch")
         self.assertTrue(line and line.startswith("ERROR:"), msg = "Repeated patch application didn't fail. bitbake output: %s" % result.output)
 
-    @testcase(1354)
+    @OETestID(1354)
     def test_force_task_1(self):
         # test 1 from bug 5875
         test_recipe = 'zlib'
@@ -98,7 +99,7 @@ class BitbakeTests(oeSelfTest):
         ret = bitbake(test_recipe)
         self.assertIn('task do_package_write_rpm:', ret.output, 'Task do_package_write_rpm did not re-executed.')
 
-    @testcase(163)
+    @OETestID(163)
     def test_force_task_2(self):
         # test 2 from bug 5875
         test_recipe = 'zlib'
@@ -111,7 +112,7 @@ class BitbakeTests(oeSelfTest):
         for task in look_for_tasks:
             self.assertIn(task, result.output, msg="Couldn't find %s task.")
 
-    @testcase(167)
+    @OETestID(167)
     def test_bitbake_g(self):
         result = bitbake('-g core-image-minimal')
         for f in ['pn-buildlist', 'recipe-depends.dot', 'task-depends.dot']:
@@ -119,7 +120,7 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue('Task dependencies saved to \'task-depends.dot\'' in result.output, msg = "No task dependency \"task-depends.dot\" file was generated for the given task target. bitbake output: %s" % result.output)
         self.assertTrue('busybox' in ftools.read_file(os.path.join(self.builddir, 'task-depends.dot')), msg = "No \"busybox\" dependency found in task-depends.dot file.")
 
-    @testcase(899)
+    @OETestID(899)
     def test_image_manifest(self):
         bitbake('core-image-minimal')
         bb_vars = get_bb_vars(["DEPLOY_DIR_IMAGE", "IMAGE_LINK_NAME"], "core-image-minimal")
@@ -128,7 +129,7 @@ class BitbakeTests(oeSelfTest):
         manifest = os.path.join(deploydir, imagename + ".manifest")
         self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image. It should have been created in %s" % manifest)
 
-    @testcase(168)
+    @OETestID(168)
     def test_invalid_recipe_src_uri(self):
         data = 'SRC_URI = "file://invalid"'
         self.write_recipeinc('man', data)
@@ -149,7 +150,7 @@ doesn't exist, yet no error message encountered. bitbake output: %s" % result.ou
         self.assertTrue(line and line.startswith("ERROR:"), msg = "\"invalid\" file \
 doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result.output)
 
-    @testcase(171)
+    @OETestID(171)
     def test_rename_downloaded_file(self):
         # TODO unique dldir instead of using cleanall
         # TODO: need to set sstatedir?
@@ -167,29 +168,29 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz')), msg = "File rename failed. No corresponding test-aspell.tar.gz file found under %s" % dl_dir)
         self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz.done')), "File rename failed. No corresponding test-aspell.tar.gz.done file found under %s" % dl_dir)
 
-    @testcase(1028)
+    @OETestID(1028)
     def test_environment(self):
         self.write_config("TEST_ENV=\"localconf\"")
         result = runCmd('bitbake -e | grep TEST_ENV=')
         self.assertTrue('localconf' in result.output, msg = "bitbake didn't report any value for TEST_ENV variable. To test, run 'bitbake -e | grep TEST_ENV='")
 
-    @testcase(1029)
+    @OETestID(1029)
     def test_dry_run(self):
         result = runCmd('bitbake -n m4-native')
         self.assertEqual(0, result.status, "bitbake dry run didn't run as expected. %s" % result.output)
 
-    @testcase(1030)
+    @OETestID(1030)
     def test_just_parse(self):
         result = runCmd('bitbake -p')
         self.assertEqual(0, result.status, "errors encountered when parsing recipes. %s" % result.output)
 
-    @testcase(1031)
+    @OETestID(1031)
     def test_version(self):
         result = runCmd('bitbake -s | grep wget')
         find = re.search("wget *:([0-9a-zA-Z\.\-]+)", result.output)
         self.assertTrue(find, "No version returned for searched recipe. bitbake output: %s" % result.output)
 
-    @testcase(1032)
+    @OETestID(1032)
     def test_prefile(self):
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
@@ -200,7 +201,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
         self.assertTrue('localconf' in result.output, "Preconfigure file \"prefile.conf\"was not taken into consideration.")
 
-    @testcase(1033)
+    @OETestID(1033)
     def test_postfile(self):
         postconf = os.path.join(self.builddir, 'conf/postfile.conf')
         self.track_for_cleanup(postconf)
@@ -209,12 +210,12 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         result = runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
         self.assertTrue('postfile' in result.output, "Postconfigure file \"postfile.conf\"was not taken into consideration.")
 
-    @testcase(1034)
+    @OETestID(1034)
     def test_checkuri(self):
         result = runCmd('bitbake -c checkuri m4')
         self.assertEqual(0, result.status, msg = "\"checkuri\" task was not executed. bitbake output: %s" % result.output)
 
-    @testcase(1035)
+    @OETestID(1035)
     def test_continue(self):
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
@@ -229,7 +230,7 @@ INHERIT_remove = \"report-error\"
         continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
         self.assertLess(errorpos,continuepos, msg = "bitbake didn't pass do_fail_task. bitbake output: %s" % result.output)
 
-    @testcase(1119)
+    @OETestID(1119)
     def test_non_gplv3(self):
         self.write_config('INCOMPATIBLE_LICENSE = "GPLv3"')
         result = bitbake('selftest-ed', ignore_status=True)
@@ -238,7 +239,7 @@ INHERIT_remove = \"report-error\"
         self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv3')))
         self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv2')))
 
-    @testcase(1422)
+    @OETestID(1422)
     def test_setscene_only(self):
         """ Bitbake option to restore from sstate only within a build (i.e. execute no real tasks, only setscene)"""
         test_recipe = 'ed'
@@ -253,7 +254,7 @@ INHERIT_remove = \"report-error\"
             self.assertIn('_setscene', task, 'A task different from _setscene ran: %s.\n'
                                              'Executed tasks were: %s' % (task, str(tasks)))
 
-    @testcase(1425)
+    @OETestID(1425)
     def test_bbappend_order(self):
         """ Bitbake should bbappend to recipe in a predictable order """
         test_recipe = 'ed'
diff --git a/meta/lib/oeqa/selftest/buildhistory.py b/meta/lib/oeqa/selftest/cases/buildhistory.py
similarity index 94%
rename from meta/lib/oeqa/selftest/buildhistory.py
rename to meta/lib/oeqa/selftest/cases/buildhistory.py
index 008c39c..06792d9 100644
--- a/meta/lib/oeqa/selftest/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/buildhistory.py
@@ -2,12 +2,11 @@ import os
 import re
 import datetime
 
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_vars
-from oeqa.utils.decorators import testcase
 
 
-class BuildhistoryBase(oeSelfTest):
+class BuildhistoryBase(OESelftestTestCase):
 
     def config_buildhistory(self, tmp_bh_location=False):
         bb_vars = get_bb_vars(['USER_CLASSES', 'INHERIT'])
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
similarity index 94%
rename from meta/lib/oeqa/selftest/buildoptions.py
rename to meta/lib/oeqa/selftest/cases/buildoptions.py
index ce37ea4..1f1bb7a 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -3,15 +3,15 @@ import re
 import glob as g
 import shutil
 import tempfile
-from oeqa.selftest.base import oeSelfTest
-from oeqa.selftest.buildhistory import BuildhistoryBase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import oeqa.utils.ftools as ftools
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
-class ImageOptionsTests(oeSelfTest):
+class ImageOptionsTests(OESelftestTestCase):
 
-    @testcase(761)
+    @OETestID(761)
     def test_incremental_image_generation(self):
         image_pkgtype = get_bb_var("IMAGE_PKGTYPE")
         if image_pkgtype != 'rpm':
@@ -30,7 +30,7 @@ class ImageOptionsTests(oeSelfTest):
         incremental_removed = re.search(r"Erasing\s*:\s*packagegroup-core-ssh-openssh", log_data_removed)
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
-    @testcase(286)
+    @OETestID(286)
     def test_ccache_tool(self):
         bitbake("ccache-native")
         bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'ccache-native')
@@ -43,7 +43,7 @@ class ImageOptionsTests(oeSelfTest):
         res = runCmd("grep ccache %s" % log_compile, ignore_status=True)
         self.assertEqual(0, res.status, msg="No match for ccache in m4 log.do_compile. For further details: %s" % log_compile)
 
-    @testcase(1435)
+    @OETestID(1435)
     def test_read_only_image(self):
         distro_features = get_bb_var('DISTRO_FEATURES')
         if not ('x11' in distro_features and 'opengl' in distro_features):
@@ -52,9 +52,9 @@ class ImageOptionsTests(oeSelfTest):
         bitbake("core-image-sato")
         # do_image will fail if there are any pending postinsts
 
-class DiskMonTest(oeSelfTest):
+class DiskMonTest(OESelftestTestCase):
 
-    @testcase(277)
+    @OETestID(277)
     def test_stoptask_behavior(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
@@ -68,13 +68,13 @@ class DiskMonTest(oeSelfTest):
         res = bitbake("m4")
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
-class SanityOptionsTest(oeSelfTest):
+class SanityOptionsTest(OESelftestTestCase):
     def getline(self, res, line):
         for l in res.output.split('\n'):
             if line in l:
                 return l
 
-    @testcase(927)
+    @OETestID(927)
     def test_options_warnqa_errorqa_switch(self):
 
         self.write_config("INHERIT_remove = \"report-error\"")
@@ -96,7 +96,7 @@ class SanityOptionsTest(oeSelfTest):
         line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
 
-    @testcase(278)
+    @OETestID(278)
     def test_sanity_unsafe_script_references(self):
         self.write_config('WARN_QA_append = " unsafe-references-in-scripts"')
 
@@ -114,7 +114,7 @@ do_install_append_pn-gzip () {
         line = self.getline(res, "QA Issue: gzip")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
 
-    @testcase(1421)
+    @OETestID(1421)
     def test_layer_without_git_dir(self):
         """
         Summary:     Test that layer git revisions are displayed and do not fail without git repository
@@ -156,20 +156,20 @@ do_install_append_pn-gzip () {
 
 class BuildhistoryTests(BuildhistoryBase):
 
-    @testcase(293)
+    @OETestID(293)
     def test_buildhistory_basic(self):
         self.run_buildhistory_operation('xcursor-transparent-theme')
         self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
 
-    @testcase(294)
+    @OETestID(294)
     def test_buildhistory_buildtime_pr_backwards(self):
         target = 'xcursor-transparent-theme'
         error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1.* to .*-r0.*)" % target
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
-class ArchiverTest(oeSelfTest):
-    @testcase(926)
+class ArchiverTest(OESelftestTestCase):
+    @OETestID(926)
     def test_arch_work_dir_and_export_source(self):
         """
         Test for archiving the work directory and exporting the source files.
diff --git a/meta/lib/oeqa/selftest/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
similarity index 97%
rename from meta/lib/oeqa/selftest/containerimage.py
rename to meta/lib/oeqa/selftest/cases/containerimage.py
index def481f..73162fa 100644
--- a/meta/lib/oeqa/selftest/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -1,6 +1,6 @@
 import os
 
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
 
 # This test builds an image with using the "container" IMAGE_FSTYPE, and
@@ -16,7 +16,7 @@ from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
 # of them, but this test is more to catch if other packages get added by
 # default other than what is in ROOTFS_BOOTSTRAP_INSTALL.
 #
-class ContainerImageTests(oeSelfTest):
+class ContainerImageTests(OESelftestTestCase):
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
similarity index 99%
rename from meta/lib/oeqa/selftest/devtool.py
rename to meta/lib/oeqa/selftest/cases/devtool.py
index 39f3543..75340d6 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1,6 +1,4 @@
-import unittest
 import os
-import logging
 import re
 import shutil
 import tempfile
@@ -8,12 +6,12 @@ import glob
 import fnmatch
 
 import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.commands import get_bb_vars, runqemu, get_test_layer
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
-class DevtoolBase(oeSelfTest):
+class DevtoolBase(OESelftestTestCase):
 
     def _test_recipe_contents(self, recipefile, checkvars, checkinherits):
         with open(recipefile, 'r') as f:
@@ -120,6 +118,7 @@ class DevtoolTests(DevtoolBase):
 
     @classmethod
     def setUpClass(cls):
+        super(DevtoolTests, cls).setUpClass()
         bb_vars = get_bb_vars(['TOPDIR', 'SSTATE_DIR'])
         cls.original_sstate = bb_vars['SSTATE_DIR']
         cls.devtool_sstate = os.path.join(bb_vars['TOPDIR'], 'sstate_devtool')
@@ -129,8 +128,9 @@ class DevtoolTests(DevtoolBase):
 
     @classmethod
     def tearDownClass(cls):
-        cls.log.debug('Deleting devtool sstate cache on %s' % cls.devtool_sstate)
+        cls.logger.debug('Deleting devtool sstate cache on %s' % cls.devtool_sstate)
         runCmd('rm -rf %s' % cls.devtool_sstate)
+        super(DevtoolTests, cls).tearDownClass()
 
     def setUp(self):
         """Test case setup function"""
@@ -168,7 +168,7 @@ class DevtoolTests(DevtoolBase):
         if expected_status:
             self.fail('Missing file changes: %s' % expected_status)
 
-    @testcase(1158)
+    @OETestID(1158)
     def test_create_workspace(self):
         # Check preconditions
         result = runCmd('bitbake-layers show-layers')
@@ -189,7 +189,7 @@ class DevtoolTests(DevtoolBase):
         self.assertNotIn(tempdir, result.output)
         self.assertIn(self.workspacedir, result.output)
 
-    @testcase(1159)
+    @OETestID(1159)
     def test_devtool_add(self):
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -222,7 +222,7 @@ class DevtoolTests(DevtoolBase):
             bindir = bindir[1:]
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
 
-    @testcase(1423)
+    @OETestID(1423)
     def test_devtool_add_git_local(self):
         # Fetch source from a remote URL, but do it outside of devtool
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -262,7 +262,7 @@ class DevtoolTests(DevtoolBase):
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
 
-    @testcase(1162)
+    @OETestID(1162)
     def test_devtool_add_library(self):
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -311,7 +311,7 @@ class DevtoolTests(DevtoolBase):
         self.assertFalse(matches, 'Stamp files exist for recipe libftdi that should have been cleaned')
         self.assertFalse(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), 'libftdi binary still found in STAGING_LIBDIR after cleaning')
 
-    @testcase(1160)
+    @OETestID(1160)
     def test_devtool_add_fetch(self):
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -357,7 +357,7 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(recipefile, checkvars, [])
 
-    @testcase(1161)
+    @OETestID(1161)
     def test_devtool_add_fetch_git(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -405,7 +405,7 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRCREV'] = checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
 
-    @testcase(1391)
+    @OETestID(1391)
     def test_devtool_add_fetch_simple(self):
         # Fetch source from a remote URL, auto-detecting name
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -433,7 +433,7 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRC_URI'] = url.replace(testver, '${PV}')
         self._test_recipe_contents(recipefile, checkvars, [])
 
-    @testcase(1164)
+    @OETestID(1164)
     def test_devtool_modify(self):
         import oe.path
 
@@ -537,7 +537,7 @@ class DevtoolTests(DevtoolBase):
         finally:
             self.delete_recipeinc('m4')
 
-    @testcase(1166)
+    @OETestID(1166)
     def test_devtool_modify_invalid(self):
         # Try modifying some recipes
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -566,7 +566,7 @@ class DevtoolTests(DevtoolBase):
             self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed. devtool output: %s' %  (testrecipe, result.output))
             self.assertIn('ERROR: ', result.output, 'devtool modify on %s should have given an ERROR' % testrecipe)
 
-    @testcase(1365)
+    @OETestID(1365)
     def test_devtool_modify_native(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
@@ -596,7 +596,7 @@ class DevtoolTests(DevtoolBase):
         self.assertTrue(inheritnative, 'None of these recipes do "inherit native" - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
 
 
-    @testcase(1165)
+    @OETestID(1165)
     def test_devtool_modify_git(self):
         # Check preconditions
         testrecipe = 'mkelfimage'
@@ -624,7 +624,7 @@ class DevtoolTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
-    @testcase(1167)
+    @OETestID(1167)
     def test_devtool_modify_localfiles(self):
         # Check preconditions
         testrecipe = 'lighttpd'
@@ -655,7 +655,7 @@ class DevtoolTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
-    @testcase(1378)
+    @OETestID(1378)
     def test_devtool_modify_virtual(self):
         # Try modifying a virtual recipe
         virtrecipe = 'virtual/make'
@@ -678,7 +678,7 @@ class DevtoolTests(DevtoolBase):
         # This is probably sufficient
 
 
-    @testcase(1169)
+    @OETestID(1169)
     def test_devtool_update_recipe(self):
         # Check preconditions
         testrecipe = 'minicom'
@@ -711,7 +711,7 @@ class DevtoolTests(DevtoolBase):
                            ('??', '.*/0002-Add-a-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @testcase(1172)
+    @OETestID(1172)
     def test_devtool_update_recipe_git(self):
         # Check preconditions
         testrecipe = 'mtd-utils'
@@ -781,7 +781,7 @@ class DevtoolTests(DevtoolBase):
                            ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @testcase(1170)
+    @OETestID(1170)
     def test_devtool_update_recipe_append(self):
         # Check preconditions
         testrecipe = 'mdadm'
@@ -850,7 +850,7 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, f.readlines())
         # Deleting isn't expected to work under these circumstances
 
-    @testcase(1171)
+    @OETestID(1171)
     def test_devtool_update_recipe_append_git(self):
         # Check preconditions
         testrecipe = 'mtd-utils'
@@ -940,7 +940,7 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, set(f.readlines()))
         # Deleting isn't expected to work under these circumstances
 
-    @testcase(1370)
+    @OETestID(1370)
     def test_devtool_update_recipe_local_files(self):
         """Check that local source files are copied over instead of patched"""
         testrecipe = 'makedevs'
@@ -972,7 +972,7 @@ class DevtoolTests(DevtoolBase):
                            ('??', '.*/makedevs/0001-Add-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @testcase(1371)
+    @OETestID(1371)
     def test_devtool_update_recipe_local_files_2(self):
         """Check local source files support when oe-local-files is in Git"""
         testrecipe = 'lzo'
@@ -1085,7 +1085,7 @@ class DevtoolTests(DevtoolBase):
         expected_status = []
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @testcase(1163)
+    @OETestID(1163)
     def test_devtool_extract(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
@@ -1097,7 +1097,7 @@ class DevtoolTests(DevtoolBase):
         self.assertFalse(os.path.exists(self.workspacedir))
         self._check_src_repo(tempdir)
 
-    @testcase(1379)
+    @OETestID(1379)
     def test_devtool_extract_virtual(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
@@ -1108,7 +1108,7 @@ class DevtoolTests(DevtoolBase):
         self.assertFalse(os.path.exists(self.workspacedir))
         self._check_src_repo(tempdir)
 
-    @testcase(1168)
+    @OETestID(1168)
     def test_devtool_reset_all(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -1135,7 +1135,7 @@ class DevtoolTests(DevtoolBase):
         matches2 = glob.glob(stampprefix2 + '*')
         self.assertFalse(matches2, 'Stamp files exist for recipe %s that should have been cleaned' % testrecipe2)
 
-    @testcase(1272)
+    @OETestID(1272)
     def test_devtool_deploy_target(self):
         # NOTE: Whilst this test would seemingly be better placed as a runtime test,
         # unfortunately the runtime tests run under bitbake and you can't run
@@ -1221,7 +1221,7 @@ class DevtoolTests(DevtoolBase):
             result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
             self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
 
-    @testcase(1366)
+    @OETestID(1366)
     def test_devtool_build_image(self):
         """Test devtool build-image plugin"""
         # Check preconditions
@@ -1255,7 +1255,7 @@ class DevtoolTests(DevtoolBase):
         if reqpkgs:
             self.fail('The following packages were not present in the image as expected: %s' % ', '.join(reqpkgs))
 
-    @testcase(1367)
+    @OETestID(1367)
     def test_devtool_upgrade(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
@@ -1300,7 +1300,7 @@ class DevtoolTests(DevtoolBase):
         self.assertNotIn(recipe, result.output)
         self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after resetting')
 
-    @testcase(1433)
+    @OETestID(1433)
     def test_devtool_upgrade_git(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
@@ -1337,7 +1337,7 @@ class DevtoolTests(DevtoolBase):
         self.assertNotIn(recipe, result.output)
         self.assertFalse(os.path.exists(os.path.join(self.workspacedir, 'recipes', recipe)), 'Recipe directory should not exist after resetting')
 
-    @testcase(1352)
+    @OETestID(1352)
     def test_devtool_layer_plugins(self):
         """Test that devtool can use plugins from other layers.
 
@@ -1609,7 +1609,7 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(newrecipefile, checkvars, [])
 
-    @testcase(1577)
+    @OETestID(1577)
     def test_devtool_virtual_kernel_modify(self):
         """
         Summary:        The purpose of this test case is to verify that
diff --git a/meta/lib/oeqa/selftest/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
similarity index 92%
rename from meta/lib/oeqa/selftest/eSDK.py
rename to meta/lib/oeqa/selftest/cases/eSDK.py
index 1596c6e..f36c3cc 100644
--- a/meta/lib/oeqa/selftest/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -1,16 +1,12 @@
-import unittest
 import tempfile
 import shutil
 import os
 import glob
-import logging
-import subprocess
-import oeqa.utils.ftools as ftools
-from oeqa.utils.decorators import testcase
-from oeqa.selftest.base import oeSelfTest
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 
-class oeSDKExtSelfTest(oeSelfTest):
+class oeSDKExtSelfTest(OESelftestTestCase):
     """
     # Bugzilla Test Plan: 6033
     # This code is planned to be part of the automation for eSDK containig
@@ -73,6 +69,7 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
 
     @classmethod
     def setUpClass(cls):
+        super(oeSDKExtSelfTest, cls).setUpClass()
         cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
 
         sstate_dir = get_bb_var('SSTATE_DIR')
@@ -97,19 +94,18 @@ SSTATE_MIRRORS =  "file://.* file://%s/PATH"
     @classmethod
     def tearDownClass(cls):
         shutil.rmtree(cls.tmpdir_eSDKQA)
+        super(oeSDKExtSelfTest, cls).tearDownClass()
 
-    @testcase (1602)
+    @OETestID(1602)
     def test_install_libraries_headers(self):
         pn_sstate = 'bc'
         bitbake(pn_sstate)
         cmd = "devtool sdk-install %s " % pn_sstate
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
 
-    @testcase(1603)
+    @OETestID(1603)
     def test_image_generation_binary_feeds(self):
         image = 'core-image-minimal'
         cmd = "devtool build-image %s" % image
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
 
-if __name__ == '__main__':
-    unittest.main()
diff --git a/meta/lib/oeqa/selftest/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
similarity index 93%
rename from meta/lib/oeqa/selftest/image_typedep.py
rename to meta/lib/oeqa/selftest/cases/image_typedep.py
index 256142d25..0614c76 100644
--- a/meta/lib/oeqa/selftest/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -1,9 +1,9 @@
 import os
 
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
-class ImageTypeDepTests(oeSelfTest):
+class ImageTypeDepTests(OESelftestTestCase):
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
similarity index 95%
rename from meta/lib/oeqa/selftest/imagefeatures.py
rename to meta/lib/oeqa/selftest/cases/imagefeatures.py
index 76896c7..45a06fe 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -1,17 +1,15 @@
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.sshcontrol import SSHControl
 import os
-import sys
-import logging
 
-class ImageFeatures(oeSelfTest):
+class ImageFeatures(OESelftestTestCase):
 
     test_user = 'tester'
     root_user = 'root'
 
-    @testcase(1107)
+    @OETestID(1107)
     def test_non_root_user_can_connect_via_ssh_without_password(self):
         """
         Summary: Check if non root user can connect via ssh without password
@@ -37,7 +35,7 @@ class ImageFeatures(oeSelfTest):
                 status, output = ssh.run("true")
                 self.assertEqual(status, 0, 'ssh to user %s failed with %s' % (user, output))
 
-    @testcase(1115)
+    @OETestID(1115)
     def test_all_users_can_connect_via_ssh_without_password(self):
         """
         Summary:     Check if all users can connect via ssh without password
@@ -67,7 +65,7 @@ class ImageFeatures(oeSelfTest):
                     self.assertEqual(status, 0, 'ssh to user tester failed with %s' % output)
 
 
-    @testcase(1116)
+    @OETestID(1116)
     def test_clutter_image_can_be_built(self):
         """
         Summary:     Check if clutter image can be built
@@ -80,7 +78,7 @@ class ImageFeatures(oeSelfTest):
         # Build a core-image-clutter
         bitbake('core-image-clutter')
 
-    @testcase(1117)
+    @OETestID(1117)
     def test_wayland_support_in_image(self):
         """
         Summary:     Check Wayland support in image
diff --git a/meta/lib/oeqa/selftest/layerappend.py b/meta/lib/oeqa/selftest/cases/layerappend.py
similarity index 93%
rename from meta/lib/oeqa/selftest/layerappend.py
rename to meta/lib/oeqa/selftest/cases/layerappend.py
index 37bb32c..9562116 100644
--- a/meta/lib/oeqa/selftest/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -1,15 +1,11 @@
-import unittest
 import os
-import logging
-import re
 
-from oeqa.selftest.base import oeSelfTest
-from oeqa.selftest.buildhistory import BuildhistoryBase
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
-class LayerAppendTests(oeSelfTest):
+class LayerAppendTests(OESelftestTestCase):
     layerconf = """
 # We have a conf and classes directory, append to BBPATH
 BBPATH .= ":${LAYERDIR}"
@@ -51,8 +47,9 @@ SRC_URI_append += "file://appendtest.txt"
     def tearDownLocal(self):
         if self.layerappend:
             ftools.remove_from_file(self.builddir + "/conf/bblayers.conf", self.layerappend)
+        super(LayerAppendTests, self).tearDownLocal()
 
-    @testcase(1196)
+    @OETestID(1196)
     def test_layer_appends(self):
         corebase = get_bb_var("COREBASE")
 
@@ -96,5 +93,3 @@ SRC_URI_append += "file://appendtest.txt"
         bitbake("layerappendtest")
         data = ftools.read_file(stagingdir + "/appendtest.txt")
         self.assertEqual(data, "Layer 2 test")
-
-
diff --git a/meta/lib/oeqa/selftest/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
similarity index 96%
rename from meta/lib/oeqa/selftest/liboe.py
rename to meta/lib/oeqa/selftest/cases/liboe.py
index 0b0301d..01b2cab 100644
--- a/meta/lib/oeqa/selftest/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -1,14 +1,13 @@
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake, runCmd
 import oe.path
-import glob
 import os
-import os.path
 
-class LibOE(oeSelfTest):
+class LibOE(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
+        super(LibOE, cls).setUpClass()
         cls.tmp_dir = get_bb_var('TMPDIR')
 
     def test_copy_tree_special(self):
diff --git a/meta/lib/oeqa/selftest/lic-checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
similarity index 87%
rename from meta/lib/oeqa/selftest/lic-checksum.py
rename to meta/lib/oeqa/selftest/cases/lic_checksum.py
index 2e81373..3740715 100644
--- a/meta/lib/oeqa/selftest/lic-checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -1,16 +1,16 @@
 import os
 import tempfile
 
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 from oeqa.utils import CommandError
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
-class LicenseTests(oeSelfTest):
+class LicenseTests(OESelftestTestCase):
 
     # Verify that changing a license file that has an absolute path causes
     # the license qa to fail due to a mismatched md5sum.
-    @testcase(1197)
+    @OETestID(1197)
     def test_nonmatching_checksum(self):
         bitbake_cmd = '-c populate_lic emptytest'
         error_msg = 'emptytest: The new md5 checksum is 8d777f385d3dfec8815d20f7496026dc'
diff --git a/meta/lib/oeqa/selftest/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
similarity index 80%
rename from meta/lib/oeqa/selftest/manifest.py
rename to meta/lib/oeqa/selftest/cases/manifest.py
index fe6f949..1460719 100644
--- a/meta/lib/oeqa/selftest/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -1,9 +1,8 @@
-import unittest
 import os
 
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
 class ManifestEntry:
     '''A manifest item of a collection able to list missing packages'''
@@ -11,7 +10,7 @@ class ManifestEntry:
         self.file = entry
         self.missing = []
 
-class VerifyManifest(oeSelfTest):
+class VerifyManifest(OESelftestTestCase):
     '''Tests for the manifest files and contents of an image'''
 
     @classmethod
@@ -21,14 +20,14 @@ class VerifyManifest(oeSelfTest):
             with open(manifest, "r") as mfile:
                 for line in mfile:
                     manifest_entry = os.path.join(path, line.split()[0])
-                    self.log.debug("{}: looking for {}"\
+                    self.logger.debug("{}: looking for {}"\
                                     .format(self.classname, manifest_entry))
                     if not os.path.isfile(manifest_entry):
                         manifest_errors.append(manifest_entry)
-                        self.log.debug("{}: {} not found"\
+                        self.logger.debug("{}: {} not found"\
                                     .format(self.classname, manifest_entry))
         except OSError as e:
-            self.log.debug("{}: checking of {} failed"\
+            self.logger.debug("{}: checking of {} failed"\
                     .format(self.classname, manifest))
             raise e
 
@@ -40,7 +39,7 @@ class VerifyManifest(oeSelfTest):
         target == self.buildtarget if target == None else target
         directory = get_bb_var(bb_var, target);
         if not directory or not os.path.isdir(directory):
-            self.log.debug("{}: {} points to {} when target = {}"\
+            self.logger.debug("{}: {} points to {} when target = {}"\
                     .format(self.classname, bb_var, directory, target))
             raise OSError
         return directory
@@ -48,18 +47,19 @@ class VerifyManifest(oeSelfTest):
     @classmethod
     def setUpClass(self):
 
+        super(VerifyManifest, self).setUpClass()
         self.buildtarget = 'core-image-minimal'
         self.classname = 'VerifyManifest'
 
-        self.log.info("{}: doing bitbake {} as a prerequisite of the test"\
+        self.logger.info("{}: doing bitbake {} as a prerequisite of the test"\
                 .format(self.classname, self.buildtarget))
         if bitbake(self.buildtarget).status:
-            self.log.debug("{} Failed to setup {}"\
+            self.logger.debug("{} Failed to setup {}"\
                     .format(self.classname, self.buildtarget))
-            unittest.SkipTest("{}: Cannot setup testing scenario"\
+            self.skipTest("{}: Cannot setup testing scenario"\
                     .format(self.classname))
 
-    @testcase(1380)
+    @OETestID(1380)
     def test_SDK_manifest_entries(self):
         '''Verifying the SDK manifest entries exist, this may take a build'''
 
@@ -67,12 +67,12 @@ class VerifyManifest(oeSelfTest):
         # to do an additional setup for the sdk
         sdktask = '-c populate_sdk'
         bbargs = sdktask + ' ' + self.buildtarget
-        self.log.debug("{}: doing bitbake {} as a prerequisite of the test"\
+        self.logger.debug("{}: doing bitbake {} as a prerequisite of the test"\
                 .format(self.classname, bbargs))
         if bitbake(bbargs).status:
-            self.log.debug("{} Failed to bitbake {}"\
+            self.logger.debug("{} Failed to bitbake {}"\
                     .format(self.classname, bbargs))
-            unittest.SkipTest("{}: Cannot setup testing scenario"\
+            self.skipTest("{}: Cannot setup testing scenario"\
                     .format(self.classname))
 
 
@@ -91,7 +91,7 @@ class VerifyManifest(oeSelfTest):
                         k)
                 mpath[k] = os.path.join(mdir, mfilename[k])
                 if not os.path.isfile(mpath[k]):
-                    self.log.debug("{}: {} does not exist".format(
+                    self.logger.debug("{}: {} does not exist".format(
                         self.classname, mpath[k]))
                     raise IOError
                 m_entry[k] = ManifestEntry(mpath[k])
@@ -101,11 +101,11 @@ class VerifyManifest(oeSelfTest):
                 reverse_dir[k] = os.path.join(pkgdata_dir[k],
                         'runtime-reverse')
                 if not os.path.exists(reverse_dir[k]):
-                    self.log.debug("{}: {} does not exist".format(
+                    self.logger.debug("{}: {} does not exist".format(
                         self.classname, reverse_dir[k]))
                     raise IOError
         except OSError:
-            raise unittest.SkipTest("{}: Error in obtaining manifest dirs"\
+            raise self.skipTest("{}: Error in obtaining manifest dirs"\
                 .format(self.classname))
         except IOError:
             msg = "{}: Error cannot find manifests in the specified dir:\n{}"\
@@ -113,7 +113,7 @@ class VerifyManifest(oeSelfTest):
             self.fail(msg)
 
         for k in d_target.keys():
-            self.log.debug("{}: Check manifest {}".format(
+            self.logger.debug("{}: Check manifest {}".format(
                 self.classname, m_entry[k].file))
 
             m_entry[k].missing = self.check_manifest_entries(\
@@ -122,11 +122,11 @@ class VerifyManifest(oeSelfTest):
                 msg = '{}: {} Error has the following missing entries'\
                         .format(self.classname, m_entry[k].file)
                 logmsg = msg+':\n'+'\n'.join(m_entry[k].missing)
-                self.log.debug(logmsg)
-                self.log.info(msg)
+                self.logger.debug(logmsg)
+                self.logger.info(msg)
                 self.fail(logmsg)
 
-    @testcase(1381)
+    @OETestID(1381)
     def test_image_manifest_entries(self):
         '''Verifying the image manifest entries exist'''
 
@@ -146,14 +146,14 @@ class VerifyManifest(oeSelfTest):
             revdir = os.path.join(pkgdata_dir, 'runtime-reverse')
             if not os.path.exists(revdir): raise IOError
         except OSError:
-            raise unittest.SkipTest("{}: Error in obtaining manifest dirs"\
+            raise self.skipTest("{}: Error in obtaining manifest dirs"\
                 .format(self.classname))
         except IOError:
             msg = "{}: Error cannot find manifests in dir:\n{}"\
                     .format(self.classname, mdir)
             self.fail(msg)
 
-        self.log.debug("{}: Check manifest {}"\
+        self.logger.debug("{}: Check manifest {}"\
                             .format(self.classname, m_entry.file))
         m_entry.missing = self.check_manifest_entries(\
                                                     m_entry.file, revdir)
@@ -161,6 +161,6 @@ class VerifyManifest(oeSelfTest):
             msg = '{}: {} Error has the following missing entries'\
                     .format(self.classname, m_entry.file)
             logmsg = msg+':\n'+'\n'.join(m_entry.missing)
-            self.log.debug(logmsg)
-            self.log.info(msg)
+            self.logger.debug(logmsg)
+            self.logger.info(msg)
             self.fail(logmsg)
diff --git a/meta/lib/oeqa/selftest/oelib/__init__.py b/meta/lib/oeqa/selftest/cases/oelib/__init__.py
similarity index 100%
rename from meta/lib/oeqa/selftest/oelib/__init__.py
rename to meta/lib/oeqa/selftest/cases/oelib/__init__.py
diff --git a/meta/lib/oeqa/selftest/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
similarity index 97%
rename from meta/lib/oeqa/selftest/oelib/buildhistory.py
rename to meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 5ed4b02..4e87751 100644
--- a/meta/lib/oeqa/selftest/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -1,11 +1,11 @@
 import os
-import unittest
+from oeqa.selftest.case import OESelftestTestCase
 import tempfile
 from git import Repo
 from oeqa.utils.commands import get_bb_var
 from oe.buildhistory_analysis import blob_to_dict, compare_dict_blobs
 
-class TestBlobParsing(unittest.TestCase):
+class TestBlobParsing(OESelftestTestCase):
 
     def setUp(self):
         import time
diff --git a/meta/lib/oeqa/selftest/oelib/elf.py b/meta/lib/oeqa/selftest/cases/oelib/elf.py
similarity index 92%
rename from meta/lib/oeqa/selftest/oelib/elf.py
rename to meta/lib/oeqa/selftest/cases/oelib/elf.py
index 1f59037..0451eba 100644
--- a/meta/lib/oeqa/selftest/oelib/elf.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/elf.py
@@ -1,7 +1,7 @@
-import unittest
+from oeqa.selftest.case import OESelftestTestCase
 import oe.qa
 
-class TestElf(unittest.TestCase):
+class TestElf(OESelftestTestCase):
     def test_machine_name(self):
         """
         Test elf_machine_to_string()
diff --git a/meta/lib/oeqa/selftest/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
similarity index 93%
rename from meta/lib/oeqa/selftest/oelib/license.py
rename to meta/lib/oeqa/selftest/cases/oelib/license.py
index c388886..a6d9c9a 100644
--- a/meta/lib/oeqa/selftest/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -1,4 +1,4 @@
-import unittest
+from oeqa.selftest.case import OESelftestTestCase
 import oe.license
 
 class SeenVisitor(oe.license.LicenseVisitor):
@@ -9,7 +9,7 @@ class SeenVisitor(oe.license.LicenseVisitor):
     def visit_Str(self, node):
         self.seen.append(node.s)
 
-class TestSingleLicense(unittest.TestCase):
+class TestSingleLicense(OESelftestTestCase):
     licenses = [
         "GPLv2",
         "LGPL-2.0",
@@ -37,7 +37,7 @@ class TestSingleLicense(unittest.TestCase):
                 self.parse(license)
             self.assertEqual(cm.exception.license, license)
 
-class TestSimpleCombinations(unittest.TestCase):
+class TestSimpleCombinations(OESelftestTestCase):
     tests = {
         "FOO&BAR": ["FOO", "BAR"],
         "BAZ & MOO": ["BAZ", "MOO"],
diff --git a/meta/lib/oeqa/selftest/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
similarity index 97%
rename from meta/lib/oeqa/selftest/oelib/path.py
rename to meta/lib/oeqa/selftest/cases/oelib/path.py
index 44d0681..2ae5eaf 100644
--- a/meta/lib/oeqa/selftest/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -1,11 +1,11 @@
-import unittest
+from oeqa.selftest.case import OESelftestTestCase
 import oe, oe.path
 import tempfile
 import os
 import errno
 import shutil
 
-class TestRealPath(unittest.TestCase):
+class TestRealPath(OESelftestTestCase):
     DIRS = [ "a", "b", "etc", "sbin", "usr", "usr/bin", "usr/binX", "usr/sbin", "usr/include", "usr/include/gdbm" ]
     FILES = [ "etc/passwd", "b/file" ]
     LINKS = [
diff --git a/meta/lib/oeqa/selftest/oelib/types.py b/meta/lib/oeqa/selftest/cases/oelib/types.py
similarity index 93%
rename from meta/lib/oeqa/selftest/oelib/types.py
rename to meta/lib/oeqa/selftest/cases/oelib/types.py
index 4fe2746..99c8404 100644
--- a/meta/lib/oeqa/selftest/oelib/types.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/types.py
@@ -1,7 +1,7 @@
-import unittest
+from oeqa.selftest.case import OESelftestTestCase
 from oe.maketype import create
 
-class TestBooleanType(unittest.TestCase):
+class TestBooleanType(OESelftestTestCase):
     def test_invalid(self):
         self.assertRaises(ValueError, create, '', 'boolean')
         self.assertRaises(ValueError, create, 'foo', 'boolean')
@@ -31,7 +31,7 @@ class TestBooleanType(unittest.TestCase):
         self.assertEqual(create('y', 'boolean'), True)
         self.assertNotEqual(create('y', 'boolean'), False)
 
-class TestList(unittest.TestCase):
+class TestList(OESelftestTestCase):
     def assertListEqual(self, value, valid, sep=None):
         obj = create(value, 'list', separator=sep)
         self.assertEqual(obj, valid)
diff --git a/meta/lib/oeqa/selftest/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
similarity index 91%
rename from meta/lib/oeqa/selftest/oelib/utils.py
rename to meta/lib/oeqa/selftest/cases/oelib/utils.py
index 7deb10f..5bc5fff 100644
--- a/meta/lib/oeqa/selftest/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -1,7 +1,7 @@
-import unittest
+from oeqa.selftest.case import OESelftestTestCase
 from oe.utils import packages_filter_out_system, trim_version
 
-class TestPackagesFilterOutSystem(unittest.TestCase):
+class TestPackagesFilterOutSystem(OESelftestTestCase):
     def test_filter(self):
         """
         Test that oe.utils.packages_filter_out_system works.
@@ -31,7 +31,7 @@ class TestPackagesFilterOutSystem(unittest.TestCase):
         self.assertEqual(pkgs, ["foo-data"])
 
 
-class TestTrimVersion(unittest.TestCase):
+class TestTrimVersion(OESelftestTestCase):
     def test_version_exception(self):
         with self.assertRaises(TypeError):
             trim_version(None, 2)
diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
similarity index 72%
rename from meta/lib/oeqa/selftest/oescripts.py
rename to meta/lib/oeqa/selftest/cases/oescripts.py
index 29547f5..1ee7537 100644
--- a/meta/lib/oeqa/selftest/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -1,18 +1,11 @@
-import datetime
-import unittest
-import os
-import re
-import shutil
-
-import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
-from oeqa.selftest.buildhistory import BuildhistoryBase
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
 class BuildhistoryDiffTests(BuildhistoryBase):
 
-    @testcase(295)
+    @OETestID(295)
     def test_buildhistory_diff(self):
         target = 'xcursor-transparent-theme'
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
diff --git a/meta/lib/oeqa/selftest/package.py b/meta/lib/oeqa/selftest/cases/package.py
similarity index 97%
rename from meta/lib/oeqa/selftest/package.py
rename to meta/lib/oeqa/selftest/cases/package.py
index 95125f2..6a8bc92 100644
--- a/meta/lib/oeqa/selftest/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -1,9 +1,9 @@
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_vars
 import subprocess, os
 import oe.path
 
-class VersionOrdering(oeSelfTest):
+class VersionOrdering(OESelftestTestCase):
     # version1, version2, sort order
     tests = (
         ("1.0", "1.0", 0),
diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
similarity index 96%
rename from meta/lib/oeqa/selftest/pkgdata.py
rename to meta/lib/oeqa/selftest/cases/pkgdata.py
index d69c3c8..0b4caf1 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -1,24 +1,21 @@
-import unittest
 import os
 import tempfile
-import logging
 import fnmatch
 
-import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
-class OePkgdataUtilTests(oeSelfTest):
+class OePkgdataUtilTests(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
+        super(OePkgdataUtilTests, cls).setUpClass()
         # Ensure we have the right data in pkgdata
-        logger = logging.getLogger("selftest")
-        logger.info('Running bitbake to generate pkgdata')
+        cls.logger.info('Running bitbake to generate pkgdata')
         bitbake('busybox zlib m4')
 
-    @testcase(1203)
+    @OETestID(1203)
     def test_lookup_pkg(self):
         # Forward tests
         result = runCmd('oe-pkgdata-util lookup-pkg "zlib busybox"')
@@ -37,7 +34,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
-    @testcase(1205)
+    @OETestID(1205)
     def test_read_value(self):
         result = runCmd('oe-pkgdata-util read-value PN libz1')
         self.assertEqual(result.output, 'zlib')
@@ -47,7 +44,7 @@ class OePkgdataUtilTests(oeSelfTest):
         pkgsize = int(result.output.strip())
         self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
 
-    @testcase(1198)
+    @OETestID(1198)
     def test_find_path(self):
         result = runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
         self.assertEqual(result.output, 'zlib: /lib/libz.so.1')
@@ -57,7 +54,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
 
-    @testcase(1204)
+    @OETestID(1204)
     def test_lookup_recipe(self):
         result = runCmd('oe-pkgdata-util lookup-recipe "libz-staticdev busybox"')
         self.assertEqual(result.output, 'zlib\nbusybox')
@@ -67,7 +64,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
-    @testcase(1202)
+    @OETestID(1202)
     def test_list_pkgs(self):
         # No arguments
         result = runCmd('oe-pkgdata-util list-pkgs')
@@ -111,7 +108,7 @@ class OePkgdataUtilTests(oeSelfTest):
         pkglist = sorted(result.output.split())
         self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc'], "Packages listed: %s" % result.output)
 
-    @testcase(1201)
+    @OETestID(1201)
     def test_list_pkg_files(self):
         def splitoutput(output):
             files = {}
@@ -201,7 +198,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
 
-    @testcase(1200)
+    @OETestID(1200)
     def test_glob(self):
         tempdir = tempfile.mkdtemp(prefix='pkgdataqa')
         self.track_for_cleanup(tempdir)
@@ -221,7 +218,7 @@ class OePkgdataUtilTests(oeSelfTest):
         self.assertNotIn('libz-dev', resultlist)
         self.assertNotIn('libz-dbg', resultlist)
 
-    @testcase(1206)
+    @OETestID(1206)
     def test_specify_pkgdatadir(self):
         result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' % get_bb_var('PKGDATA_DIR'))
         self.assertEqual(result.output, 'libz1')
diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
similarity index 93%
rename from meta/lib/oeqa/selftest/prservice.py
rename to meta/lib/oeqa/selftest/cases/prservice.py
index 34d4197..ed36f0f 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -1,20 +1,19 @@
-import unittest
 import os
-import logging
 import re
 import shutil
 import datetime
 
 import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.network import get_free_port
 
-class BitbakePrTests(oeSelfTest):
+class BitbakePrTests(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
+        super(BitbakePrTests, cls).setUpClass()
         cls.pkgdata_dir = get_bb_var('PKGDATA_DIR')
 
     def get_pr_version(self, package_name):
@@ -89,39 +88,39 @@ class BitbakePrTests(oeSelfTest):
 
         self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
 
-    @testcase(930)
+    @OETestID(930)
     def test_import_export_replace_db(self):
         self.run_test_pr_export_import('m4')
 
-    @testcase(931)
+    @OETestID(931)
     def test_import_export_override_db(self):
         self.run_test_pr_export_import('m4', replace_current_db=False)
 
-    @testcase(932)
+    @OETestID(932)
     def test_pr_service_rpm_arch_dep(self):
         self.run_test_pr_service('m4', 'rpm', 'do_package')
 
-    @testcase(934)
+    @OETestID(934)
     def test_pr_service_deb_arch_dep(self):
         self.run_test_pr_service('m4', 'deb', 'do_package')
 
-    @testcase(933)
+    @OETestID(933)
     def test_pr_service_ipk_arch_dep(self):
         self.run_test_pr_service('m4', 'ipk', 'do_package')
 
-    @testcase(935)
+    @OETestID(935)
     def test_pr_service_rpm_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'rpm', 'do_package')
 
-    @testcase(937)
+    @OETestID(937)
     def test_pr_service_deb_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'deb', 'do_package')
 
-    @testcase(936)
+    @OETestID(936)
     def test_pr_service_ipk_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_package')
 
-    @testcase(1419)
+    @OETestID(1419)
     def test_stopping_prservice_message(self):
         port = get_free_port()
 
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
similarity index 97%
rename from meta/lib/oeqa/selftest/recipetool.py
rename to meta/lib/oeqa/selftest/cases/recipetool.py
index 7bfb02f..12c9011 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1,18 +1,15 @@
 import os
-import logging
 import shutil
 import tempfile
 import urllib.parse
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.commands import get_bb_vars, create_temp_layer
-from oeqa.utils.decorators import testcase
-from oeqa.selftest import devtool
-
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.selftest.cases import devtool
 
 templayerdir = None
 
-
 def setUpModule():
     global templayerdir
     templayerdir = tempfile.mkdtemp(prefix='recipetoolqa')
@@ -28,6 +25,7 @@ def tearDownModule():
 class RecipetoolBase(devtool.DevtoolBase):
 
     def setUpLocal(self):
+        super(RecipetoolBase, self).setUpLocal()
         self.templayerdir = templayerdir
         self.tempdir = tempfile.mkdtemp(prefix='recipetoolqa')
         self.track_for_cleanup(self.tempdir)
@@ -37,6 +35,7 @@ class RecipetoolBase(devtool.DevtoolBase):
 
     def tearDownLocal(self):
         runCmd('rm -rf %s/recipes-*' % self.templayerdir)
+        super(RecipetoolBase, self).tearDownLocal()
 
     def _try_recipetool_appendcmd(self, cmd, testrecipe, expectedfiles, expectedlines=None):
         result = runCmd(cmd)
@@ -70,9 +69,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @classmethod
     def setUpClass(cls):
+        super(RecipetoolTests, cls).setUpClass()
         # Ensure we have the right data in shlibs/pkgdata
-        logger = logging.getLogger("selftest")
-        logger.info('Running bitbake to generate pkgdata')
+        cls.logger.info('Running bitbake to generate pkgdata')
         bitbake('-c packagedata base-files coreutils busybox selftest-recipetool-appendfile')
         bb_vars = get_bb_vars(['COREBASE', 'BBPATH'])
         cls.corebase = bb_vars['COREBASE']
@@ -90,7 +89,7 @@ class RecipetoolTests(RecipetoolBase):
         for errorstr in checkerror:
             self.assertIn(errorstr, result.output)
 
-    @testcase(1177)
+    @OETestID(1177)
     def test_recipetool_appendfile_basic(self):
         # Basic test
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -98,14 +97,14 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('base-files', '/etc/motd', self.testfile, '', expectedlines, ['motd'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1183)
+    @OETestID(1183)
     def test_recipetool_appendfile_invalid(self):
         # Test some commands that should error
         self._try_recipetool_appendfile_fail('/etc/passwd', self.testfile, ['ERROR: /etc/passwd cannot be handled by this tool', 'useradd', 'extrausers'])
         self._try_recipetool_appendfile_fail('/etc/timestamp', self.testfile, ['ERROR: /etc/timestamp cannot be handled by this tool'])
         self._try_recipetool_appendfile_fail('/dev/console', self.testfile, ['ERROR: /dev/console cannot be handled by this tool'])
 
-    @testcase(1176)
+    @OETestID(1176)
     def test_recipetool_appendfile_alternatives(self):
         # Now try with a file we know should be an alternative
         # (this is very much a fake example, but one we know is reliably an alternative)
@@ -129,7 +128,7 @@ class RecipetoolTests(RecipetoolBase):
         result = runCmd('diff -q %s %s' % (testfile2, copiedfile), ignore_status=True)
         self.assertNotEqual(result.status, 0, 'New file should have been copied but was not %s' % result.output)
 
-    @testcase(1178)
+    @OETestID(1178)
     def test_recipetool_appendfile_binary(self):
         # Try appending a binary file
         # /bin/ls can be a symlink to /usr/bin/ls
@@ -138,7 +137,7 @@ class RecipetoolTests(RecipetoolBase):
         self.assertIn('WARNING: ', result.output)
         self.assertIn('is a binary', result.output)
 
-    @testcase(1173)
+    @OETestID(1173)
     def test_recipetool_appendfile_add(self):
         # Try arbitrary file add to a recipe
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -167,7 +166,7 @@ class RecipetoolTests(RecipetoolBase):
                          '}\n']
         self._try_recipetool_appendfile('netbase', '/usr/share/scriptname', testfile2, '-r netbase', expectedlines, ['testfile', testfile2name])
 
-    @testcase(1174)
+    @OETestID(1174)
     def test_recipetool_appendfile_add_bindir(self):
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -181,7 +180,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('netbase', '/usr/bin/selftest-recipetool-testbin', self.testfile, '-r netbase', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1175)
+    @OETestID(1175)
     def test_recipetool_appendfile_add_machine(self):
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -197,7 +196,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase -m mymachine', expectedlines, ['mymachine/testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1184)
+    @OETestID(1184)
     def test_recipetool_appendfile_orig(self):
         # A file that's in SRC_URI and in do_install with the same name
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -205,7 +204,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-orig', self.testfile, '', expectedlines, ['selftest-replaceme-orig'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1191)
+    @OETestID(1191)
     def test_recipetool_appendfile_todir(self):
         # A file that's in SRC_URI and in do_install with destination directory rather than file
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -213,7 +212,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-todir', self.testfile, '', expectedlines, ['selftest-replaceme-todir'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1187)
+    @OETestID(1187)
     def test_recipetool_appendfile_renamed(self):
         # A file that's in SRC_URI with a different name to the destination file
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -221,7 +220,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-renamed', self.testfile, '', expectedlines, ['file1'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1190)
+    @OETestID(1190)
     def test_recipetool_appendfile_subdir(self):
         # A file that's in SRC_URI in a subdir
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -235,7 +234,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-subdir', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1189)
+    @OETestID(1189)
     def test_recipetool_appendfile_src_glob(self):
         # A file that's in SRC_URI as a glob
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -249,7 +248,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-src-globfile', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1181)
+    @OETestID(1181)
     def test_recipetool_appendfile_inst_glob(self):
         # A file that's in do_install as a glob
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -257,7 +256,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-globfile', self.testfile, '', expectedlines, ['selftest-replaceme-inst-globfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1182)
+    @OETestID(1182)
     def test_recipetool_appendfile_inst_todir_glob(self):
         # A file that's in do_install as a glob with destination as a directory
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -265,7 +264,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-todir-globfile', self.testfile, '', expectedlines, ['selftest-replaceme-inst-todir-globfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1185)
+    @OETestID(1185)
     def test_recipetool_appendfile_patch(self):
         # A file that's added by a patch in SRC_URI
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -284,7 +283,7 @@ class RecipetoolTests(RecipetoolBase):
         else:
             self.fail('Patch warning not found in output:\n%s' % output)
 
-    @testcase(1188)
+    @OETestID(1188)
     def test_recipetool_appendfile_script(self):
         # Now, a file that's in SRC_URI but installed by a script (so no mention in do_install)
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -298,7 +297,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-scripted', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1180)
+    @OETestID(1180)
     def test_recipetool_appendfile_inst_func(self):
         # A file that's installed from a function called by do_install
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -306,7 +305,7 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-func', self.testfile, '', expectedlines, ['selftest-replaceme-inst-func'])
         self.assertNotIn('WARNING: ', output)
 
-    @testcase(1186)
+    @OETestID(1186)
     def test_recipetool_appendfile_postinstall(self):
         # A file that's created by a postinstall script (and explicitly mentioned in it)
         # First try without specifying recipe
@@ -322,7 +321,7 @@ class RecipetoolTests(RecipetoolBase):
                          '}\n']
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-postinst', self.testfile, '-r selftest-recipetool-appendfile', expectedlines, ['testfile'])
 
-    @testcase(1179)
+    @OETestID(1179)
     def test_recipetool_appendfile_extlayer(self):
         # Try creating a bbappend in a layer that's not in bblayers.conf and has a different structure
         exttemplayerdir = os.path.join(self.tempdir, 'extlayer')
@@ -338,7 +337,7 @@ class RecipetoolTests(RecipetoolBase):
                          'metadata/recipes/recipes-test/selftest-recipetool-appendfile/selftest-recipetool-appendfile/selftest-replaceme-orig']
         self.assertEqual(sorted(createdfiles), sorted(expectedfiles))
 
-    @testcase(1192)
+    @OETestID(1192)
     def test_recipetool_appendfile_wildcard(self):
 
         def try_appendfile_wc(options):
@@ -363,7 +362,7 @@ class RecipetoolTests(RecipetoolBase):
         filename = try_appendfile_wc('-w')
         self.assertEqual(filename, recipefn.split('_')[0] + '_%.bbappend')
 
-    @testcase(1193)
+    @OETestID(1193)
     def test_recipetool_create(self):
         # Try adding a recipe
         tempsrc = os.path.join(self.tempdir, 'srctree')
@@ -380,7 +379,7 @@ class RecipetoolTests(RecipetoolBase):
         checkvars['SRC_URI[sha256sum]'] = 'dece4bfeb9d8374a0ecafa34be139b5a697db5c926dcc69a9b8715431a22e733'
         self._test_recipe_contents(recipefile, checkvars, [])
 
-    @testcase(1194)
+    @OETestID(1194)
     def test_recipetool_create_git(self):
         if 'x11' not in get_bb_var('DISTRO_FEATURES'):
             self.skipTest('Test requires x11 as distro feature')
@@ -403,7 +402,7 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['autotools', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-    @testcase(1392)
+    @OETestID(1392)
     def test_recipetool_create_simple(self):
         # Try adding a recipe
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -426,7 +425,7 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['autotools']
         self._test_recipe_contents(os.path.join(temprecipe, dirlist[0]), checkvars, inherits)
 
-    @testcase(1418)
+    @OETestID(1418)
     def test_recipetool_create_cmake(self):
         # Try adding a recipe
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -621,11 +620,11 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
 
 class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
-    @testcase(1273)
+    @OETestID(1273)
     def test_recipetool_appendsrcfile_basic(self):
         self._test_appendsrcfile('base-files', 'a-file')
 
-    @testcase(1274)
+    @OETestID(1274)
     def test_recipetool_appendsrcfile_basic_wildcard(self):
         testrecipe = 'base-files'
         self._test_appendsrcfile(testrecipe, 'a-file', options='-w')
@@ -633,15 +632,15 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
         self.assertEqual(os.path.basename(bbappendfile), '%s_%%.bbappend' % testrecipe)
 
-    @testcase(1281)
+    @OETestID(1281)
     def test_recipetool_appendsrcfile_subdir_basic(self):
         self._test_appendsrcfile('base-files', 'a-file', 'tmp')
 
-    @testcase(1282)
+    @OETestID(1282)
     def test_recipetool_appendsrcfile_subdir_basic_dirdest(self):
         self._test_appendsrcfile('base-files', destdir='tmp')
 
-    @testcase(1280)
+    @OETestID(1280)
     def test_recipetool_appendsrcfile_srcdir_basic(self):
         testrecipe = 'bash'
         bb_vars = get_bb_vars(['S', 'WORKDIR'], testrecipe)
@@ -650,14 +649,14 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         subdir = os.path.relpath(srcdir, workdir)
         self._test_appendsrcfile(testrecipe, 'a-file', srcdir=subdir)
 
-    @testcase(1275)
+    @OETestID(1275)
     def test_recipetool_appendsrcfile_existing_in_src_uri(self):
         testrecipe = 'base-files'
         filepath = self._get_first_file_uri(testrecipe)
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
         self._test_appendsrcfile(testrecipe, filepath, has_src_uri=False)
 
-    @testcase(1276)
+    @OETestID(1276)
     def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(self):
         testrecipe = 'base-files'
         subdir = 'tmp'
@@ -667,7 +666,7 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         output = self._test_appendsrcfile(testrecipe, filepath, subdir, has_src_uri=False)
         self.assertTrue(any('with different parameters' in l for l in output))
 
-    @testcase(1277)
+    @OETestID(1277)
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
         filepath = 'Makefile.in'
@@ -680,7 +679,7 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         bitbake('%s:do_unpack' % testrecipe)
         self.assertEqual(open(self.testfile, 'r').read(), open(os.path.join(srcdir, filepath), 'r').read())
 
-    @testcase(1278)
+    @OETestID(1278)
     def test_recipetool_appendsrcfiles_basic(self, destdir=None):
         newfiles = [self.testfile]
         for i in range(1, 5):
@@ -690,6 +689,6 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
             newfiles.append(testfile)
         self._test_appendsrcfiles('gcc', newfiles, destdir=destdir, options='-W')
 
-    @testcase(1279)
+    @OETestID(1279)
     def test_recipetool_appendsrcfiles_basic_subdir(self):
         self.test_recipetool_appendsrcfiles_basic(destdir='testdir')
diff --git a/meta/lib/oeqa/selftest/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
similarity index 92%
rename from meta/lib/oeqa/selftest/runqemu.py
rename to meta/lib/oeqa/selftest/cases/runqemu.py
index 58c6f96..4050a41 100644
--- a/meta/lib/oeqa/selftest/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -5,17 +5,18 @@
 import re
 import logging
 
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
-class RunqemuTests(oeSelfTest):
+class RunqemuTests(OESelftestTestCase):
     """Runqemu test class"""
 
     image_is_ready = False
     deploy_dir_image = ''
 
     def setUpLocal(self):
+        super(RunqemuTests, self).setUpLocal()
         self.recipe = 'core-image-minimal'
         self.machine =  'qemux86-64'
         self.fstypes = "ext4 iso hddimg vmdk qcow2 vdi"
@@ -40,14 +41,14 @@ SYSLINUX_TIMEOUT = "10"
             bitbake(self.recipe)
             RunqemuTests.image_is_ready = True
 
-    @testcase(2001)
+    @OETestID(2001)
     def test_boot_machine(self):
         """Test runqemu machine"""
         cmd = "%s %s" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
 
-    @testcase(2002)
+    @OETestID(2002)
     def test_boot_machine_ext4(self):
         """Test runqemu machine ext4"""
         cmd = "%s %s ext4" % (self.cmd_common, self.machine)
@@ -55,7 +56,7 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue('rootfs.ext4' in f.read(), "Failed: %s" % cmd)
 
-    @testcase(2003)
+    @OETestID(2003)
     def test_boot_machine_iso(self):
         """Test runqemu machine iso"""
         cmd = "%s %s iso" % (self.cmd_common, self.machine)
@@ -63,14 +64,14 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(' -cdrom ' in f.read(), "Failed: %s" % cmd)
 
-    @testcase(2004)
+    @OETestID(2004)
     def test_boot_recipe_image(self):
         """Test runqemu recipe-image"""
         cmd = "%s %s" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
 
-    @testcase(2005)
+    @OETestID(2005)
     def test_boot_recipe_image_vmdk(self):
         """Test runqemu recipe-image vmdk"""
         cmd = "%s %s vmdk" % (self.cmd_common, self.recipe)
@@ -78,7 +79,7 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue('format=vmdk' in f.read(), "Failed: %s" % cmd)
 
-    @testcase(2006)
+    @OETestID(2006)
     def test_boot_recipe_image_vdi(self):
         """Test runqemu recipe-image vdi"""
         cmd = "%s %s vdi" % (self.cmd_common, self.recipe)
@@ -86,14 +87,14 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue('format=vdi' in f.read(), "Failed: %s" % cmd)
 
-    @testcase(2007)
+    @OETestID(2007)
     def test_boot_deploy(self):
         """Test runqemu deploy_dir_image"""
         cmd = "%s %s" % (self.cmd_common, self.deploy_dir_image)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
 
-    @testcase(2008)
+    @OETestID(2008)
     def test_boot_deploy_hddimg(self):
         """Test runqemu deploy_dir_image hddimg"""
         cmd = "%s %s hddimg" % (self.cmd_common, self.deploy_dir_image)
@@ -101,7 +102,7 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(re.search('file=.*.hddimg', f.read()), "Failed: %s" % cmd)
 
-    @testcase(2009)
+    @OETestID(2009)
     def test_boot_machine_slirp(self):
         """Test runqemu machine slirp"""
         cmd = "%s slirp %s" % (self.cmd_common, self.machine)
@@ -109,7 +110,7 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(' -netdev user' in f.read(), "Failed: %s" % cmd)
 
-    @testcase(2009)
+    @OETestID(2009)
     def test_boot_machine_slirp_qcow2(self):
         """Test runqemu machine slirp qcow2"""
         cmd = "%s slirp qcow2 %s" % (self.cmd_common, self.machine)
@@ -117,7 +118,7 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue('format=qcow2' in f.read(), "Failed: %s" % cmd)
 
-    @testcase(2010)
+    @OETestID(2010)
     def test_boot_qemu_boot(self):
         """Test runqemu /path/to/image.qemuboot.conf"""
         qemuboot_conf = "%s-%s.qemuboot.conf" % (self.recipe, self.machine)
@@ -128,7 +129,7 @@ SYSLINUX_TIMEOUT = "10"
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
 
-    @testcase(2011)
+    @OETestID(2011)
     def test_boot_rootfs(self):
         """Test runqemu /path/to/rootfs.ext4"""
         rootfs = "%s-%s.ext4" % (self.recipe, self.machine)
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
similarity index 97%
rename from meta/lib/oeqa/selftest/runtime-test.py
rename to meta/lib/oeqa/selftest/cases/runtime_test.py
index 13a4c03..9fec4d8 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -1,14 +1,15 @@
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 import os
 import re
 
-class TestExport(oeSelfTest):
+class TestExport(OESelftestTestCase):
 
     @classmethod
     def tearDownClass(cls):
         runCmd("rm -rf /tmp/sdk")
+        super(TestExport, cls).tearDownClass()
 
     def test_testexport_basic(self):
         """
@@ -101,7 +102,7 @@ class TestExport(oeSelfTest):
         self.assertEqual(0, result.status, "Couldn't run tar from SDK")
 
 
-class TestImage(oeSelfTest):
+class TestImage(OESelftestTestCase):
 
     def test_testimage_install(self):
         """
@@ -129,8 +130,8 @@ class TestImage(oeSelfTest):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
-class Postinst(oeSelfTest):
-    @testcase(1540)
+class Postinst(OESelftestTestCase):
+    @OETestID(1540)
     def test_verify_postinst(self):
         """
         Summary: The purpose of this test is to verify the execution order of postinst Bugzilla ID: [5319]
@@ -180,7 +181,7 @@ postinst-delayed-t \
                         self.assertEqual(idx, len(postinst_list), "Not found all postinsts")
                         break
 
-    @testcase(1545)
+    @OETestID(1545)
     def test_postinst_rootfs_and_boot(self):
         """
         Summary:        The purpose of this test case is to verify Post-installation
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
similarity index 96%
rename from meta/lib/oeqa/selftest/signing.py
rename to meta/lib/oeqa/selftest/cases/signing.py
index 0ac3d1f..edb5f65 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -1,15 +1,15 @@
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import os
 import glob
 import re
 import shutil
 import tempfile
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.ftools import write_file
 
 
-class Signing(oeSelfTest):
+class Signing(OESelftestTestCase):
 
     gpg_dir = ""
     pub_key_path = ""
@@ -17,6 +17,7 @@ class Signing(oeSelfTest):
 
     @classmethod
     def setUpClass(cls):
+        super(Signing, cls).setUpClass()
         # Check that we can find the gpg binary and fail early if we can't
         if not shutil.which("gpg"):
             raise AssertionError("This test needs GnuPG")
@@ -29,7 +30,7 @@ class Signing(oeSelfTest):
 
         runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
 
-    @testcase(1362)
+    @OETestID(1362)
     def test_signing_packages(self):
         """
         Summary:     Test that packages can be signed in the package feed
@@ -92,7 +93,7 @@ class Signing(oeSelfTest):
         bitbake('core-image-minimal')
 
 
-    @testcase(1382)
+    @OETestID(1382)
     def test_signing_sstate_archive(self):
         """
         Summary:     Test that sstate archives can be signed
@@ -135,9 +136,9 @@ class Signing(oeSelfTest):
         self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')
 
 
-class LockedSignatures(oeSelfTest):
+class LockedSignatures(OESelftestTestCase):
 
-    @testcase(1420)
+    @OETestID(1420)
     def test_locked_signatures(self):
         """
         Summary:     Test locked signature mechanism
diff --git a/meta/lib/oeqa/selftest/sstate.py b/meta/lib/oeqa/selftest/cases/sstate.py
similarity index 95%
rename from meta/lib/oeqa/selftest/sstate.py
rename to meta/lib/oeqa/selftest/cases/sstate.py
index f54bc41..bc2fdbd 100644
--- a/meta/lib/oeqa/selftest/sstate.py
+++ b/meta/lib/oeqa/selftest/cases/sstate.py
@@ -5,13 +5,14 @@ import re
 import shutil
 
 import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_test_layer
 
 
-class SStateBase(oeSelfTest):
+class SStateBase(OESelftestTestCase):
 
     def setUpLocal(self):
+        super(SStateBase, self).setUpLocal()
         self.temp_sstate_location = None
         needed_vars = ['SSTATE_DIR', 'NATIVELSBSTRING', 'TCLIBC', 'TUNE_ARCH',
                        'TOPDIR', 'TARGET_VENDOR', 'TARGET_OS']
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
similarity index 97%
rename from meta/lib/oeqa/selftest/sstatetests.py
rename to meta/lib/oeqa/selftest/cases/sstatetests.py
index e35ddff..8d05e30 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -1,16 +1,12 @@
-import datetime
-import unittest
 import os
-import re
 import shutil
 import glob
 import subprocess
 
-import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
-from oeqa.selftest.sstate import SStateBase
-from oeqa.utils.decorators import testcase
+from oeqa.selftest.cases.sstate import SStateBase
+from oeqa.core.decorator.oeid import OETestID
 
 class SStateTests(SStateBase):
 
@@ -39,19 +35,19 @@ class SStateTests(SStateBase):
         else:
             self.assertTrue(not file_tracker , msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(file_tracker)))
 
-    @testcase(975)
+    @OETestID(975)
     def test_sstate_creation_distro_specific_pass(self):
         self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
-    @testcase(1374)
+    @OETestID(1374)
     def test_sstate_creation_distro_specific_fail(self):
         self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
 
-    @testcase(976)
+    @OETestID(976)
     def test_sstate_creation_distro_nonspecific_pass(self):
         self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
-    @testcase(1375)
+    @OETestID(1375)
     def test_sstate_creation_distro_nonspecific_fail(self):
         self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
@@ -72,17 +68,17 @@ class SStateTests(SStateBase):
         tgz_removed = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_removed)))
 
-    @testcase(977)
+    @OETestID(977)
     def test_cleansstate_task_distro_specific_nonspecific(self):
         targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
         targets.append('linux-libc-headers')
         self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
-    @testcase(1376)
+    @OETestID(1376)
     def test_cleansstate_task_distro_nonspecific(self):
         self.run_test_cleansstate_task(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
-    @testcase(1377)
+    @OETestID(1377)
     def test_cleansstate_task_distro_specific(self):
         targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
         targets.append('linux-libc-headers')
@@ -121,15 +117,15 @@ class SStateTests(SStateBase):
         created_once = [x for x in file_tracker_2 if x not in file_tracker_1]
         self.assertTrue(created_once == [], msg="The following sstate files ware created only in the second run: %s" % ', '.join(map(str, created_once)))
 
-    @testcase(175)
+    @OETestID(175)
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch, 'binutils-native'], temp_sstate_location=True)
 
-    @testcase(1372)
+    @OETestID(1372)
     def test_rebuild_distro_specific_sstate_cross_target(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch], temp_sstate_location=True)
 
-    @testcase(1373)
+    @OETestID(1373)
     def test_rebuild_distro_specific_sstate_native_target(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-native'], temp_sstate_location=True)
 
@@ -176,7 +172,7 @@ class SStateTests(SStateBase):
         expected_not_actual = [x for x in expected_remaining_sstate if x not in actual_remaining_sstate]
         self.assertFalse(expected_not_actual, msg="Extra files ware removed: %s" ', '.join(map(str, expected_not_actual)))
 
-    @testcase(973)
+    @OETestID(973)
     def test_sstate_cache_management_script_using_pr_1(self):
         global_config = []
         target_config = []
@@ -184,7 +180,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "0"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    @testcase(978)
+    @OETestID(978)
     def test_sstate_cache_management_script_using_pr_2(self):
         global_config = []
         target_config = []
@@ -194,7 +190,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    @testcase(979)
+    @OETestID(979)
     def test_sstate_cache_management_script_using_pr_3(self):
         global_config = []
         target_config = []
@@ -206,7 +202,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    @testcase(974)
+    @OETestID(974)
     def test_sstate_cache_management_script_using_machine(self):
         global_config = []
         target_config = []
@@ -216,7 +212,7 @@ class SStateTests(SStateBase):
         target_config.append('')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    @testcase(1270)
+    @OETestID(1270)
     def test_sstate_32_64_same_hash(self):
         """
         The sstate checksums for both native and target should not vary whether
@@ -263,7 +259,7 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
         self.assertCountEqual(files1, files2)
 
 
-    @testcase(1271)
+    @OETestID(1271)
     def test_sstate_nativelsbstring_same_hash(self):
         """
         The sstate checksums should be independent of whichever NATIVELSBSTRING is
@@ -295,7 +291,7 @@ NATIVELSBSTRING = \"DistroB\"
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
-    @testcase(1368)
+    @OETestID(1368)
     def test_sstate_allarch_samesigs(self):
         """
         The sstate checksums of allarch packages should be independent of whichever
@@ -369,7 +365,7 @@ MULTILIBS = \"\"
         self.maxDiff = None
         self.assertEqual(files1, files2)
 
-    @testcase(1369)
+    @OETestID(1369)
     def test_sstate_sametune_samesigs(self):
         """
         The sstate checksums of two identical machines (using the same tune) should be the
diff --git a/meta/lib/oeqa/selftest/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
similarity index 96%
rename from meta/lib/oeqa/selftest/tinfoil.py
rename to meta/lib/oeqa/selftest/cases/tinfoil.py
index 73a0c3b..1394d42 100644
--- a/meta/lib/oeqa/selftest/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -1,16 +1,15 @@
-import unittest
 import os
 import re
 import bb.tinfoil
 
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
-class TinfoilTests(oeSelfTest):
+class TinfoilTests(OESelftestTestCase):
     """ Basic tests for the tinfoil API """
 
-    @testcase(1568)
+    @OETestID(1568)
     def test_getvar(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(True)
@@ -18,7 +17,7 @@ class TinfoilTests(oeSelfTest):
             if not machine:
                 self.fail('Unable to get MACHINE value - returned %s' % machine)
 
-    @testcase(1569)
+    @OETestID(1569)
     def test_expand(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(True)
@@ -27,7 +26,7 @@ class TinfoilTests(oeSelfTest):
             if not pid:
                 self.fail('Unable to expand "%s" - returned %s' % (expr, pid))
 
-    @testcase(1570)
+    @OETestID(1570)
     def test_getvar_bb_origenv(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(True)
@@ -36,7 +35,7 @@ class TinfoilTests(oeSelfTest):
                 self.fail('Unable to get BB_ORIGENV value - returned %s' % origenv)
             self.assertEqual(origenv.getVar('HOME', False), os.environ['HOME'])
 
-    @testcase(1571)
+    @OETestID(1571)
     def test_parse_recipe(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -47,7 +46,7 @@ class TinfoilTests(oeSelfTest):
             rd = tinfoil.parse_recipe_file(best[3])
             self.assertEqual(testrecipe, rd.getVar('PN'))
 
-    @testcase(1572)
+    @OETestID(1572)
     def test_parse_recipe_copy_expand(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -66,7 +65,7 @@ class TinfoilTests(oeSelfTest):
             localdata.setVar('PN', 'hello')
             self.assertEqual('hello', localdata.getVar('BPN'))
 
-    @testcase(1573)
+    @OETestID(1573)
     def test_parse_recipe_initial_datastore(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -80,7 +79,7 @@ class TinfoilTests(oeSelfTest):
             # Check we can get variable values
             self.assertEqual('somevalue', rd.getVar('MYVARIABLE'))
 
-    @testcase(1574)
+    @OETestID(1574)
     def test_list_recipes(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -99,7 +98,7 @@ class TinfoilTests(oeSelfTest):
             if checkpns:
                 self.fail('Unable to find pkg_fn entries for: %s' % ', '.join(checkpns))
 
-    @testcase(1575)
+    @OETestID(1575)
     def test_wait_event(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=True)
@@ -130,7 +129,7 @@ class TinfoilTests(oeSelfTest):
             self.assertNotEqual(waitcount, 0, 'Timed out waiting for CommandCompleted event from bitbake server')
             self.assertTrue(eventreceived, 'Did not receive FilesMatchingFound event from bitbake server')
 
-    @testcase(1576)
+    @OETestID(1576)
     def test_setvariable_clean(self):
         # First check that setVariable affects the datastore
         with bb.tinfoil.Tinfoil() as tinfoil:
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
similarity index 97%
rename from meta/lib/oeqa/selftest/wic.py
rename to meta/lib/oeqa/selftest/cases/wic.py
index cdec80c..4040cf7 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -32,9 +32,9 @@ from shutil import rmtree
 from functools import wraps, lru_cache
 from tempfile import NamedTemporaryFile
 
-from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
-from oeqa.utils.decorators import testcase
+from oeqa.core.decorator.oeid import OETestID
 
 
 @lru_cache(maxsize=32)
@@ -61,7 +61,7 @@ def only_for_arch(archs, image='core-image-minimal'):
     return wrapper
 
 
-class Wic(oeSelfTest):
+class Wic(OESelftestTestCase):
     """Wic test class."""
 
     resultdir = "/var/tmp/wic.oe-selftest/"
@@ -71,6 +71,7 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
+        super(Wic, self).setUpLocal()
         if not self.native_sysroot:
             Wic.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'wic-tools')
 
@@ -91,64 +92,65 @@ class Wic(oeSelfTest):
     def tearDownLocal(self):
         """Remove resultdir as it may contain images."""
         rmtree(self.resultdir, ignore_errors=True)
+        super(Wic, self).tearDownLocal()
 
-    @testcase(1552)
+    @OETestID(1552)
     def test_version(self):
         """Test wic --version"""
         self.assertEqual(0, runCmd('wic --version').status)
 
-    @testcase(1208)
+    @OETestID(1208)
     def test_help(self):
         """Test wic --help and wic -h"""
         self.assertEqual(0, runCmd('wic --help').status)
         self.assertEqual(0, runCmd('wic -h').status)
 
-    @testcase(1209)
+    @OETestID(1209)
     def test_createhelp(self):
         """Test wic create --help"""
         self.assertEqual(0, runCmd('wic create --help').status)
 
-    @testcase(1210)
+    @OETestID(1210)
     def test_listhelp(self):
         """Test wic list --help"""
         self.assertEqual(0, runCmd('wic list --help').status)
 
-    @testcase(1553)
+    @OETestID(1553)
     def test_help_create(self):
         """Test wic help create"""
         self.assertEqual(0, runCmd('wic help create').status)
 
-    @testcase(1554)
+    @OETestID(1554)
     def test_help_list(self):
         """Test wic help list"""
         self.assertEqual(0, runCmd('wic help list').status)
 
-    @testcase(1215)
+    @OETestID(1215)
     def test_help_overview(self):
         """Test wic help overview"""
         self.assertEqual(0, runCmd('wic help overview').status)
 
-    @testcase(1216)
+    @OETestID(1216)
     def test_help_plugins(self):
         """Test wic help plugins"""
         self.assertEqual(0, runCmd('wic help plugins').status)
 
-    @testcase(1217)
+    @OETestID(1217)
     def test_help_kickstart(self):
         """Test wic help kickstart"""
         self.assertEqual(0, runCmd('wic help kickstart').status)
 
-    @testcase(1555)
+    @OETestID(1555)
     def test_list_images(self):
         """Test wic list images"""
         self.assertEqual(0, runCmd('wic list images').status)
 
-    @testcase(1556)
+    @OETestID(1556)
     def test_list_source_plugins(self):
         """Test wic list source-plugins"""
         self.assertEqual(0, runCmd('wic list source-plugins').status)
 
-    @testcase(1557)
+    @OETestID(1557)
     def test_listed_images_help(self):
         """Test wic listed images help"""
         output = runCmd('wic list images').output
@@ -156,24 +158,24 @@ class Wic(oeSelfTest):
         for image in imagelist:
             self.assertEqual(0, runCmd('wic list %s help' % image).status)
 
-    @testcase(1213)
+    @OETestID(1213)
     def test_unsupported_subcommand(self):
         """Test unsupported subcommand"""
         self.assertNotEqual(0, runCmd('wic unsupported', ignore_status=True).status)
 
-    @testcase(1214)
+    @OETestID(1214)
     def test_no_command(self):
         """Test wic without command"""
         self.assertEqual(1, runCmd('wic', ignore_status=True).status)
 
-    @testcase(1211)
+    @OETestID(1211)
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=core-image-minimal"""
         cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @testcase(1157)
+    @OETestID(1157)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
@@ -181,7 +183,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
-    @testcase(1346)
+    @OETestID(1346)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
@@ -195,7 +197,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
-    @testcase(1348)
+    @OETestID(1348)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
@@ -203,7 +205,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
-    @testcase(1350)
+    @OETestID(1350)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
@@ -211,7 +213,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
 
-    @testcase(1385)
+    @OETestID(1385)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
@@ -219,7 +221,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
 
-    @testcase(1560)
+    @OETestID(1560)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
@@ -231,7 +233,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
 
-    @testcase(1561)
+    @OETestID(1561)
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
@@ -240,7 +242,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
-    @testcase(1562)
+    @OETestID(1562)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_default_output_dir(self):
         """Test default output location"""
@@ -250,7 +252,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob("directdisk-*.direct")))
 
-    @testcase(1212)
+    @OETestID(1212)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
@@ -269,7 +271,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
-    @testcase(1264)
+    @OETestID(1264)
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -277,7 +279,7 @@ class Wic(oeSelfTest):
                                    "-c gzip -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.gz")))
 
-    @testcase(1265)
+    @OETestID(1265)
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -285,7 +287,7 @@ class Wic(oeSelfTest):
                                    "-c bzip2 -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.bz2")))
 
-    @testcase(1266)
+    @OETestID(1266)
     def test_compress_xz(self):
         """Test compressing an image with xz"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -293,7 +295,7 @@ class Wic(oeSelfTest):
                                    "--compress-with=xz -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.xz")))
 
-    @testcase(1267)
+    @OETestID(1267)
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create wictestdisk "
@@ -301,7 +303,7 @@ class Wic(oeSelfTest):
                                    "-c wrong -o %s" % self.resultdir,
                                    ignore_status=True).status)
 
-    @testcase(1558)
+    @OETestID(1558)
     def test_debug_short(self):
         """Test -D option"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -316,7 +318,7 @@ class Wic(oeSelfTest):
                                    "--debug -o %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @testcase(1563)
+    @OETestID(1563)
     def test_skip_build_check_short(self):
         """Test -s option"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -332,7 +334,7 @@ class Wic(oeSelfTest):
                                    "--outdir %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @testcase(1564)
+    @OETestID(1564)
     def test_build_rootfs_short(self):
         """Test -f option"""
         self.assertEqual(0, runCmd("wic create wictestdisk "
@@ -348,7 +350,7 @@ class Wic(oeSelfTest):
                                    "--outdir %s" % self.resultdir).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @testcase(1268)
+    @OETestID(1268)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
@@ -360,7 +362,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-rootfs*.direct")))
 
-    @testcase(1269)
+    @OETestID(1269)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
@@ -506,7 +508,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
-    @testcase(1496)
+    @OETestID(1496)
     def test_bmap_short(self):
         """Test generation of .bmap file -m option"""
         cmd = "wic create wictestdisk -e core-image-minimal -m -o %s" % self.resultdir
@@ -533,7 +535,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
         return self.wicenv_cache[image]
 
-    @testcase(1347)
+    @OETestID(1347)
     def test_image_env(self):
         """Test generation of <image>.env files."""
         image = 'core-image-minimal'
@@ -556,7 +558,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                 self.assertTrue(var in content, "%s is not in .env file" % var)
                 self.assertTrue(content[var])
 
-    @testcase(1559)
+    @OETestID(1559)
     def test_image_vars_dir_short(self):
         """Test image vars directory selection -v option"""
         image = 'core-image-minimal'
@@ -578,7 +580,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                                    % (image, imgenvdir, self.resultdir)).status)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
-    @testcase(1351)
+    @OETestID(1351)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
@@ -599,7 +601,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertTrue(os.path.islink(path))
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
-    @testcase(1422)
+    @OETestID(1422)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
-- 
2.1.4


