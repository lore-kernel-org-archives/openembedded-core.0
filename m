Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E2EE276F50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 13:12:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 20 Oct 2015 06:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,707,1437462000"; d="scan'208";a="830856459"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 20 Oct 2015 06:09:28 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id E4CC36A4005;
	Tue, 20 Oct 2015 06:08:26 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 16:11:09 +0300
Message-Id: <1445346669-21835-2-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1445346669-21835-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1445346669-21835-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 2/2] oeqa/selftest: Added/Updated docstring for each TC with TestopiaID
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
X-List-Received-Date: Tue, 20 Oct 2015 13:12:29 -0000

Also the TCs from meta-yocto-bsp/lib/oeqa/selftest/gummiboot were updated.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py |   2 +
 meta/lib/oeqa/selftest/archiver.py            |   1 +
 meta/lib/oeqa/selftest/bblayers.py            |  18 ++++
 meta/lib/oeqa/selftest/bbtests.py             |  66 +++++++++++++++
 meta/lib/oeqa/selftest/buildoptions.py        |  26 ++++++
 meta/lib/oeqa/selftest/devtool.py             |  67 ++++++++++++++-
 meta/lib/oeqa/selftest/imagefeatures.py       |   5 ++
 meta/lib/oeqa/selftest/layerappend.py         |   3 +
 meta/lib/oeqa/selftest/lic-checksum.py        |   3 +
 meta/lib/oeqa/selftest/oescripts.py           |   6 ++
 meta/lib/oeqa/selftest/pkgdata.py             |  24 ++++++
 meta/lib/oeqa/selftest/prservice.py           |  24 ++++++
 meta/lib/oeqa/selftest/recipetool.py          |  96 +++++++++++++++++++++
 meta/lib/oeqa/selftest/sstatetests.py         |  46 +++++++++++
 meta/lib/oeqa/selftest/wic.py                 | 115 ++++++++++++++++++++------
 15 files changed, 477 insertions(+), 25 deletions(-)

diff --git a/meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py b/meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
index 00aa36f..c3d48b5 100644
--- a/meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
+++ b/meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
@@ -37,6 +37,7 @@ class Gummiboot(oeSelfTest):
         Product:     oe-core
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1101
         """
 
         # We'd use DEPLOY_DIR_IMAGE here, except that we need its value for
@@ -63,6 +64,7 @@ class Gummiboot(oeSelfTest):
         Product:     oe-core
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1103
         """
 
         self._common_setup()
diff --git a/meta/lib/oeqa/selftest/archiver.py b/meta/lib/oeqa/selftest/archiver.py
index f2030c4..10f9ec7 100644
--- a/meta/lib/oeqa/selftest/archiver.py
+++ b/meta/lib/oeqa/selftest/archiver.py
@@ -17,6 +17,7 @@ class Archiver(oeSelfTest):
         Product:     oe-core
         Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1345
         """
 
         include_recipe = 'busybox'
diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 20c17e4..af6e434 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -13,26 +13,41 @@ class BitbakeLayers(oeSelfTest):
 
     @testcase(756)
     def test_bitbakelayers_showcrossdepends(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=756
+        """
         result = runCmd('bitbake-layers show-cross-depends')
         self.assertTrue('aspell' in result.output, msg = "No dependencies were shown. bitbake-layers show-cross-depends output: %s" % result.output)
 
     @testcase(83)
     def test_bitbakelayers_showlayers(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=83
+        """
         result = runCmd('bitbake-layers show-layers')
         self.assertTrue('meta-selftest' in result.output, msg = "No layers were shown. bitbake-layers show-layers output: %s" % result.output)
 
     @testcase(93)
     def test_bitbakelayers_showappends(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=93
+        """
         result = runCmd('bitbake-layers show-appends')
         self.assertTrue('xcursor-transparent-theme_0.1.1.bbappend' in result.output, msg="xcursor-transparent-theme_0.1.1.bbappend file was not recognised.  bitbake-layers show-appends output: %s" % result.output)
 
     @testcase(90)
     def test_bitbakelayers_showoverlayed(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=90
+        """
         result = runCmd('bitbake-layers show-overlayed')
         self.assertTrue('aspell' in result.output, msg="aspell overlayed recipe was not recognised bitbake-layers show-overlayed %s" % result.output)
 
     @testcase(95)
     def test_bitbakelayers_flatten(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=95
+        """
         testoutdir = os.path.join(self.builddir, 'test_bitbakelayers_flatten')
         self.assertFalse(os.path.isdir(testoutdir), msg = "test_bitbakelayers_flatten should not exist at this point in time")
         self.track_for_cleanup(testoutdir)
@@ -45,6 +60,9 @@ class BitbakeLayers(oeSelfTest):
 
     @testcase(1195)
     def test_bitbakelayers_add_remove(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1195
+        """
         test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, "This test cannot run with meta-skeleton in bblayers.conf. bitbake-layers show-layers output: %s" % result.output)
diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 3d6860f..0c8d5e1 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -13,11 +13,17 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(789)
     def test_run_bitbake_from_dir_1(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=789
+        """
         os.chdir(os.path.join(self.builddir, 'conf'))
         self.assertEqual(bitbake('-e').status, 0, msg = "bitbake couldn't run from \"conf\" dir")
 
     @testcase(790)
     def test_run_bitbake_from_dir_2(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=790
+        """
         my_env = os.environ.copy()
         my_env['BBPATH'] = my_env['BUILDDIR']
         os.chdir(os.path.dirname(os.environ['BUILDDIR']))
@@ -25,6 +31,9 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(806)
     def test_event_handler(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=806
+        """
         self.write_config("INHERIT += \"test_events\"")
         result = bitbake('m4-native')
         find_build_started = re.search("NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Preparing RunQueue", result.output)
@@ -35,6 +44,9 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(103)
     def test_local_sstate(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=103
+        """
         bitbake('m4-native -ccleansstate')
         bitbake('m4-native')
         bitbake('m4-native -cclean')
@@ -44,16 +56,25 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(105)
     def test_bitbake_invalid_recipe(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=105
+        """
         result = bitbake('-b asdf', ignore_status=True)
         self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
     @testcase(107)
     def test_bitbake_invalid_target(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=107
+        """
         result = bitbake('asdf', ignore_status=True)
         self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output, msg = "Though no 'asdf' target exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
     @testcase(106)
     def test_warnings_errors(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=106
+        """
         result = bitbake('-b asdf', ignore_status=True)
         find_warnings = re.search("Summary: There w.{2,3}? [1-9][0-9]* WARNING messages* shown", result.output)
         find_errors = re.search("Summary: There w.{2,3}? [1-9][0-9]* ERROR messages* shown", result.output)
@@ -62,6 +83,9 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(108)
     def test_invalid_patch(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=108
+        """
         self.write_recipeinc('man', 'SRC_URI += "file://man-1.5h1-make.patch"')
         result = bitbake('man -c patch', ignore_status=True)
         self.delete_recipeinc('man')
@@ -70,6 +94,9 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(163)
     def test_force_task(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=163
+        """
         bitbake('m4-native')
         self.add_command_to_tearDown('bitbake -c clean m4-native')
         result = bitbake('-C compile m4-native')
@@ -80,6 +107,9 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(167)
     def test_bitbake_g(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=167
+        """
         result = bitbake('-g core-image-full-cmdline')
         for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
             self.addCleanup(os.remove, f)
@@ -88,6 +118,9 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(899)
     def test_image_manifest(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=899
+        """
         bitbake('core-image-minimal')
         deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
         imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
@@ -96,6 +129,9 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(168)
     def test_invalid_recipe_src_uri(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=168
+        """
         data = 'SRC_URI = "file://invalid"'
         self.write_recipeinc('man', data)
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
@@ -113,6 +149,9 @@ doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result
 
     @testcase(171)
     def test_rename_downloaded_file(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=171
+        """
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
@@ -128,6 +167,9 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 
     @testcase(1028)
     def test_environment(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1028
+        """
         self.append_config("TEST_ENV=\"localconf\"")
         self.addCleanup(self.remove_config, "TEST_ENV=\"localconf\"")
         result = runCmd('bitbake -e | grep TEST_ENV=')
@@ -135,22 +177,34 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 
     @testcase(1029)
     def test_dry_run(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1029
+        """
         result = runCmd('bitbake -n m4-native')
         self.assertEqual(0, result.status, "bitbake dry run didn't run as expected. %s" % result.output)
 
     @testcase(1030)
     def test_just_parse(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1030
+        """
         result = runCmd('bitbake -p')
         self.assertEqual(0, result.status, "errors encountered when parsing recipes. %s" % result.output)
 
     @testcase(1031)
     def test_version(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1031
+        """
         result = runCmd('bitbake -s | grep wget')
         find = re.search("wget *:([0-9a-zA-Z\.\-]+)", result.output)
         self.assertTrue(find, "No version returned for searched recipe. bitbake output: %s" % result.output)
 
     @testcase(1032)
     def test_prefile(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1032
+        """
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
         ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
@@ -163,6 +217,9 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 
     @testcase(1033)
     def test_postfile(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1033
+        """
         postconf = os.path.join(self.builddir, 'conf/postfile.conf')
         self.track_for_cleanup(postconf)
         ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
@@ -173,11 +230,17 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 
     @testcase(1034)
     def test_checkuri(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1034
+        """
         result = runCmd('bitbake -c checkuri m4')
         self.assertEqual(0, result.status, msg = "\"checkuri\" task was not executed. bitbake output: %s" % result.output)
 
     @testcase(1035)
     def test_continue(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1035
+        """
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
@@ -191,6 +254,9 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 
     @testcase(1119)
     def test_non_gplv3(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1119
+        """
         data = 'INCOMPATIBLE_LICENSE = "GPLv3"'
         conf = os.path.join(self.builddir, 'conf/local.conf')
         ftools.append_file(conf ,data)
diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index d76aef1..291386d 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -12,6 +12,9 @@ class ImageOptionsTests(oeSelfTest):
 
     @testcase(761)
     def test_incremental_image_generation(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=761
+        """
         image_pkgtype = get_bb_var("IMAGE_PKGTYPE")
         if image_pkgtype != 'rpm':
             self.skipTest('Not using RPM as main package format')
@@ -31,6 +34,9 @@ class ImageOptionsTests(oeSelfTest):
 
     @testcase(925)
     def test_rm_old_image(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=925
+        """
         bitbake("core-image-minimal")
         deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
         imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
@@ -47,6 +53,9 @@ class ImageOptionsTests(oeSelfTest):
 
     @testcase(286)
     def test_ccache_tool(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=286
+        """
         bitbake("ccache-native")
         self.assertTrue(os.path.isfile(os.path.join(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native'), "ccache")), msg = "No ccache found under %s" % str(get_bb_var('STAGING_BINDIR_NATIVE', 'ccache-native')))
         self.write_config('INHERIT += "ccache"')
@@ -61,6 +70,9 @@ class DiskMonTest(oeSelfTest):
 
     @testcase(277)
     def test_stoptask_behavior(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=277
+        """
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
         res = bitbake("m4", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
@@ -77,6 +89,9 @@ class SanityOptionsTest(oeSelfTest):
 
     @testcase(927)
     def test_options_warnqa_errorqa_switch(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=927
+        """
         bitbake("xcursor-transparent-theme -ccleansstate")
 
         if "packages-list" not in get_bb_var("ERROR_QA"):
@@ -97,6 +112,9 @@ class SanityOptionsTest(oeSelfTest):
 
     @testcase(278)
     def test_sanity_userspace_dependency(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=278
+        """
         self.append_config('WARN_QA_append = " unsafe-references-in-binaries unsafe-references-in-scripts"')
         bitbake("-ccleansstate gzip nfs-utils")
         res = bitbake("gzip nfs-utils")
@@ -107,11 +125,17 @@ class BuildhistoryTests(BuildhistoryBase):
 
     @testcase(293)
     def test_buildhistory_basic(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=293
+        """
         self.run_buildhistory_operation('xcursor-transparent-theme')
         self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
 
     @testcase(294)
     def test_buildhistory_buildtime_pr_backwards(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=294
+        """
         self.add_command_to_tearDown('cleanup-workdir')
         target = 'xcursor-transparent-theme'
         error = "ERROR: QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1 to .*-r0)" % target
@@ -124,6 +148,7 @@ class BuildImagesTest(oeSelfTest):
         """
         This method is used to test the build of directfb image for arm arch.
         In essence we build a coreimagedirectfb and test the exitcode of bitbake that in case of success is 0.
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=563
         """
         self.add_command_to_tearDown('cleanupworkdir')
         self.write_config("DISTRO_FEATURES_remove = \"x11\"\nDISTRO_FEATURES_append = \" directfb\"\nMACHINE ??= \"qemuarm\"")
@@ -135,6 +160,7 @@ class ArchiverTest(oeSelfTest):
     def test_arch_work_dir_and_export_source(self):
         """
         Test for archiving the work directory and exporting the source files.
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=926
         """
         self.add_command_to_tearDown('cleanupworkdir')
         self.write_config("INHERIT = \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 18e2a9d..86c133c 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -121,6 +121,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1158)
     def test_create_workspace(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1158
+        """
         # Check preconditions
         result = runCmd('bitbake-layers show-layers')
         self.assertTrue('/workspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
@@ -142,6 +145,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1159)
     def test_devtool_add(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1159
+        """
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -174,6 +180,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1162)
     def test_devtool_add_library(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1162
+        """
         # We don't have the ability to pick up this dependency automatically yet...
         bitbake('libusb1')
         # Fetch source
@@ -212,6 +221,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1160)
     def test_devtool_add_fetch(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1160
+        """
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -256,6 +268,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1161)
     def test_devtool_add_fetch_git(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1161
+        """
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -305,6 +320,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1164)
     def test_devtool_modify(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1164
+        """
         # Clean up anything in the workdir/sysroot/sstate cache
         bitbake('mdadm -c cleansstate')
         # Try modifying a recipe
@@ -350,6 +368,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1166)
     def test_devtool_modify_invalid(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1166
+        """
         # Try modifying some recipes
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -380,6 +401,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1365)
     def test_devtool_modify_native(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1365
+        """
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         # Try modifying some recipes
@@ -410,6 +434,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1165)
     def test_devtool_modify_git(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1165
+        """
         # Check preconditions
         testrecipe = 'mkelfimage'
         src_uri = get_bb_var('SRC_URI', testrecipe)
@@ -438,6 +465,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1167)
     def test_devtool_modify_localfiles(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1167
+        """
         # Check preconditions
         testrecipe = 'lighttpd'
         src_uri = (get_bb_var('SRC_URI', testrecipe) or '').split()
@@ -469,6 +499,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1169)
     def test_devtool_update_recipe(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1169
+        """
         # Check preconditions
         testrecipe = 'minicom'
         recipefile = get_bb_var('FILE', testrecipe)
@@ -500,6 +533,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1172)
     def test_devtool_update_recipe_git(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1172
+        """
         # Check preconditions
         testrecipe = 'mtd-utils'
         recipefile = get_bb_var('FILE', testrecipe)
@@ -569,6 +605,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1170)
     def test_devtool_update_recipe_append(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1170
+        """
         # Check preconditions
         testrecipe = 'mdadm'
         recipefile = get_bb_var('FILE', testrecipe)
@@ -637,6 +676,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1171)
     def test_devtool_update_recipe_append_git(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1171
+        """
         # Check preconditions
         testrecipe = 'mtd-utils'
         recipefile = get_bb_var('FILE', testrecipe)
@@ -726,6 +768,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1370)
     def test_devtool_update_recipe_local_files(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1370
+        """
         """Check that local source files are copied over instead of patched"""
         testrecipe = 'makedevs'
         recipefile = get_bb_var('FILE', testrecipe)
@@ -756,7 +801,10 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1371)
     def test_devtool_update_recipe_local_files_2(self):
-        """Check local source files support when oe-local-files is in Git"""
+        """
+        Check local source files support when oe-local-files is in Git
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1371
+        """
         testrecipe = 'lzo'
         recipefile = get_bb_var('FILE', testrecipe)
         # Setup srctree for modifying the recipe
@@ -797,6 +845,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1163)
     def test_devtool_extract(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1163
+        """
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
@@ -808,6 +859,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1168)
     def test_devtool_reset_all(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1168
+        """
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         self.track_for_cleanup(self.workspacedir)
@@ -835,6 +889,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1272)
     def test_devtool_deploy_target(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1272
+        """
         # NOTE: Whilst this test would seemingly be better placed as a runtime test,
         # unfortunately the runtime tests run under bitbake and you can't run
         # devtool within bitbake (since devtool needs to run bitbake itself).
@@ -920,7 +977,10 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1366)
     def test_devtool_build_image(self):
-        """Test devtool build-image plugin"""
+        """
+        Test devtool build-image plugin
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1366
+        """
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         image = 'core-image-minimal'
@@ -954,6 +1014,9 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1367)
     def test_devtool_upgrade(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1367
+        """
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         # Check parameters
diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index fcffc42..317318b 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -20,6 +20,7 @@ class ImageFeatures(oeSelfTest):
         Product: oe-core
         Author: Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1107
         """
 
         features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
@@ -48,6 +49,7 @@ class ImageFeatures(oeSelfTest):
         Product:     oe-core
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1115
         """
 
         features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
@@ -79,6 +81,7 @@ class ImageFeatures(oeSelfTest):
         Product:     oe-core
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1114
         """
 
         features = 'PREFERRED_VERSION_rpm = "4.%"\n'
@@ -141,6 +144,7 @@ class ImageFeatures(oeSelfTest):
         Product:     oe-core
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1116
         """
 
         # Build a core-image-clutter
@@ -155,6 +159,7 @@ class ImageFeatures(oeSelfTest):
         Product:     oe-core
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1117
         """
 
         features = 'DISTRO_FEATURES_append = " wayland"\n'
diff --git a/meta/lib/oeqa/selftest/layerappend.py b/meta/lib/oeqa/selftest/layerappend.py
index a82a6c8..6e4808d 100644
--- a/meta/lib/oeqa/selftest/layerappend.py
+++ b/meta/lib/oeqa/selftest/layerappend.py
@@ -53,6 +53,9 @@ SRC_URI_append += "file://appendtest.txt"
 
     @testcase(1196)
     def test_layer_appends(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1196
+        """
         corebase = get_bb_var("COREBASE")
         stagingdir = get_bb_var("STAGING_DIR_TARGET")
         for l in ["0", "1", "2"]:
diff --git a/meta/lib/oeqa/selftest/lic-checksum.py b/meta/lib/oeqa/selftest/lic-checksum.py
index bd3b9a1..2b45f71 100644
--- a/meta/lib/oeqa/selftest/lic-checksum.py
+++ b/meta/lib/oeqa/selftest/lic-checksum.py
@@ -12,6 +12,9 @@ class LicenseTests(oeSelfTest):
     # the license qa to fail due to a mismatched md5sum.
     @testcase(1197)
     def test_nonmatching_checksum(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1197
+        """
         bitbake_cmd = '-c configure emptytest'
         error_msg = 'ERROR: emptytest: The new md5 checksum is 8d777f385d3dfec8815d20f7496026dc'
 
diff --git a/meta/lib/oeqa/selftest/oescripts.py b/meta/lib/oeqa/selftest/oescripts.py
index 31cd508..724b706 100644
--- a/meta/lib/oeqa/selftest/oescripts.py
+++ b/meta/lib/oeqa/selftest/oescripts.py
@@ -14,6 +14,9 @@ class TestScripts(oeSelfTest):
 
     @testcase(300)
     def test_cleanup_workdir(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=300
+        """
         path = os.path.dirname(get_bb_var('WORKDIR', 'gzip'))
         old_version_recipe = os.path.join(get_bb_var('COREBASE'), 'meta/recipes-extended/gzip/gzip_1.3.12.bb')
         old_version = '1.3.12'
@@ -45,6 +48,9 @@ class BuildhistoryDiffTests(BuildhistoryBase):
 
     @testcase(295)
     def test_buildhistory_diff(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=295
+        """
         self.add_command_to_tearDown('cleanup-workdir')
         target = 'xcursor-transparent-theme'
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index 138b03a..f39a374 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -20,6 +20,9 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1203)
     def test_lookup_pkg(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1203
+        """
         # Forward tests
         result = runCmd('oe-pkgdata-util lookup-pkg "glibc busybox"')
         self.assertEqual(result.output, 'libc6\nbusybox')
@@ -39,6 +42,9 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1205)
     def test_read_value(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1205
+        """
         result = runCmd('oe-pkgdata-util read-value PN libz1')
         self.assertEqual(result.output, 'zlib')
         result = runCmd('oe-pkgdata-util read-value PKGSIZE bash')
@@ -47,6 +53,9 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1198)
     def test_find_path(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1198
+        """
         result = runCmd('oe-pkgdata-util find-path /lib/libc.so.6')
         self.assertEqual(result.output, 'glibc: /lib/libc.so.6')
         result = runCmd('oe-pkgdata-util find-path /bin/bash')
@@ -57,6 +66,9 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1204)
     def test_lookup_recipe(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1204
+        """
         result = runCmd('oe-pkgdata-util lookup-recipe "libc6-staticdev busybox"')
         self.assertEqual(result.output, 'glibc\nbusybox')
         result = runCmd('oe-pkgdata-util lookup-recipe libz-dbg')
@@ -67,6 +79,9 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1202)
     def test_list_pkgs(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1202
+        """
         # No arguments
         result = runCmd('oe-pkgdata-util list-pkgs')
         pkglist = result.output.split()
@@ -112,6 +127,9 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1201)
     def test_list_pkg_files(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1201
+        """
         def splitoutput(output):
             files = {}
             curpkg = None
@@ -201,6 +219,9 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1200)
     def test_glob(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1200
+        """
         tempdir = tempfile.mkdtemp(prefix='pkgdataqa')
         self.track_for_cleanup(tempdir)
         pkglistfile = os.path.join(tempdir, 'pkglist')
@@ -222,5 +243,8 @@ class OePkgdataUtilTests(oeSelfTest):
 
     @testcase(1206)
     def test_specify_pkgdatadir(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1206
+        """
         result = runCmd('oe-pkgdata-util -p %s lookup-pkg glibc' % get_bb_var('PKGDATA_DIR'))
         self.assertEqual(result.output, 'libc6')
diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index 4187fbf..b17c4a1 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -90,32 +90,56 @@ class BitbakePrTests(oeSelfTest):
 
     @testcase(930)
     def test_import_export_replace_db(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=930
+        """
         self.run_test_pr_export_import('m4')
 
     @testcase(931)
     def test_import_export_override_db(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=931
+        """
         self.run_test_pr_export_import('m4', replace_current_db=False)
 
     @testcase(932)
     def test_pr_service_rpm_arch_dep(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=932
+        """
         self.run_test_pr_service('m4', 'rpm', 'do_package')
 
     @testcase(934)
     def test_pr_service_deb_arch_dep(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=934
+        """
         self.run_test_pr_service('m4', 'deb', 'do_package')
 
     @testcase(933)
     def test_pr_service_ipk_arch_dep(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=933
+        """
         self.run_test_pr_service('m4', 'ipk', 'do_package')
 
     @testcase(935)
     def test_pr_service_rpm_arch_indep(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=935
+        """
         self.run_test_pr_service('xcursor-transparent-theme', 'rpm', 'do_package')
 
     @testcase(937)
     def test_pr_service_deb_arch_indep(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=937
+        """
         self.run_test_pr_service('xcursor-transparent-theme', 'deb', 'do_package')
 
     @testcase(936)
     def test_pr_service_ipk_arch_indep(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=936
+        """
         self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_package')
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index b1f1d2a..c241aa9 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -90,6 +90,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1177)
     def test_recipetool_appendfile_basic(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1177
+        """
         # Basic test
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                         '\n']
@@ -98,6 +101,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1183)
     def test_recipetool_appendfile_invalid(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1183
+        """
         # Test some commands that should error
         self._try_recipetool_appendfile_fail('/etc/passwd', self.testfile, ['ERROR: /etc/passwd cannot be handled by this tool', 'useradd', 'extrausers'])
         self._try_recipetool_appendfile_fail('/etc/timestamp', self.testfile, ['ERROR: /etc/timestamp cannot be handled by this tool'])
@@ -105,6 +111,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1176)
     def test_recipetool_appendfile_alternatives(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1176
+        """
         # Now try with a file we know should be an alternative
         # (this is very much a fake example, but one we know is reliably an alternative)
         self._try_recipetool_appendfile_fail('/bin/ls', self.testfile, ['ERROR: File /bin/ls is an alternative possibly provided by the following recipes:', 'coreutils', 'busybox'])
@@ -130,6 +139,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1178)
     def test_recipetool_appendfile_binary(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1178
+        """
         # Try appending a binary file
         # /bin/ls can be a symlink to /usr/bin/ls
         ls = os.path.realpath("/bin/ls")
@@ -139,6 +151,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1173)
     def test_recipetool_appendfile_add(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1173
+        """
         corebase = get_bb_var('COREBASE')
         # Try arbitrary file add to a recipe
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -169,6 +184,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1174)
     def test_recipetool_appendfile_add_bindir(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1174
+        """
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -183,6 +201,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1175)
     def test_recipetool_appendfile_add_machine(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1175
+        """
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -199,6 +220,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1184)
     def test_recipetool_appendfile_orig(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1184
+        """
         # A file that's in SRC_URI and in do_install with the same name
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
@@ -207,6 +231,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1191)
     def test_recipetool_appendfile_todir(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1191
+        """
         # A file that's in SRC_URI and in do_install with destination directory rather than file
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
@@ -215,6 +242,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1187)
     def test_recipetool_appendfile_renamed(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1187
+        """
         # A file that's in SRC_URI with a different name to the destination file
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
@@ -223,6 +253,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1190)
     def test_recipetool_appendfile_subdir(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1190
+        """
         # A file that's in SRC_URI in a subdir
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -237,6 +270,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1189)
     def test_recipetool_appendfile_src_glob(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1189
+        """
         # A file that's in SRC_URI as a glob
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -251,6 +287,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1181)
     def test_recipetool_appendfile_inst_glob(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1181
+        """
         # A file that's in do_install as a glob
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
@@ -259,6 +298,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1182)
     def test_recipetool_appendfile_inst_todir_glob(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1182
+        """
         # A file that's in do_install as a glob with destination as a directory
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
@@ -267,6 +309,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1185)
     def test_recipetool_appendfile_patch(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1185
+        """
         # A file that's added by a patch in SRC_URI
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -286,6 +331,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1188)
     def test_recipetool_appendfile_script(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1188
+        """
         # Now, a file that's in SRC_URI but installed by a script (so no mention in do_install)
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n',
@@ -300,6 +348,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1180)
     def test_recipetool_appendfile_inst_func(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1180
+        """
         # A file that's installed from a function called by do_install
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
@@ -308,6 +359,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1186)
     def test_recipetool_appendfile_postinstall(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1186
+        """
         # A file that's created by a postinstall script (and explicitly mentioned in it)
         # First try without specifying recipe
         self._try_recipetool_appendfile_fail('/usr/share/selftest-replaceme-postinst', self.testfile, ['File /usr/share/selftest-replaceme-postinst may be written out in a pre/postinstall script of the following recipes:', 'selftest-recipetool-appendfile'])
@@ -324,6 +378,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1179)
     def test_recipetool_appendfile_extlayer(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1179
+        """
         # Try creating a bbappend in a layer that's not in bblayers.conf and has a different structure
         exttemplayerdir = os.path.join(self.tempdir, 'extlayer')
         self._create_temp_layer(exttemplayerdir, False, 'oeselftestextlayer', recipepathspec='metadata/recipes/recipes-*/*')
@@ -340,6 +397,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1192)
     def test_recipetool_appendfile_wildcard(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1192
+        """
 
         def try_appendfile_wc(options):
             result = runCmd('recipetool appendfile %s /etc/profile %s %s' % (self.templayerdir, self.testfile, options))
@@ -365,6 +425,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1193)
     def test_recipetool_create(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1193
+        """
         # Try adding a recipe
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
@@ -382,6 +445,9 @@ class RecipetoolTests(RecipetoolBase):
 
     @testcase(1194)
     def test_recipetool_create_git(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1194
+        """
         # Ensure we have the right data in shlibs/pkgdata
         bitbake('libpng pango libx11 libxext jpeg')
         # Try adding a recipe
@@ -495,10 +561,16 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     @testcase(1273)
     def test_recipetool_appendsrcfile_basic(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1273
+        """
         self._test_appendsrcfile('base-files', 'a-file')
 
     @testcase(1274)
     def test_recipetool_appendsrcfile_basic_wildcard(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1274
+        """
         testrecipe = 'base-files'
         self._test_appendsrcfile(testrecipe, 'a-file', options='-w')
         recipefile = get_bb_var('FILE', testrecipe)
@@ -507,14 +579,23 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     @testcase(1281)
     def test_recipetool_appendsrcfile_subdir_basic(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1281
+        """
         self._test_appendsrcfile('base-files', 'a-file', 'tmp')
 
     @testcase(1282)
     def test_recipetool_appendsrcfile_subdir_basic_dirdest(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1282
+        """
         self._test_appendsrcfile('base-files', destdir='tmp')
 
     @testcase(1280)
     def test_recipetool_appendsrcfile_srcdir_basic(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1280
+        """
         testrecipe = 'bash'
         srcdir = get_bb_var('S', testrecipe)
         workdir = get_bb_var('WORKDIR', testrecipe)
@@ -523,6 +604,9 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     @testcase(1275)
     def test_recipetool_appendsrcfile_existing_in_src_uri(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1275
+        """
         testrecipe = 'base-files'
         filepath = self._get_first_file_uri(testrecipe)
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
@@ -530,6 +614,9 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     @testcase(1276)
     def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1276
+        """
         testrecipe = 'base-files'
         subdir = 'tmp'
         filepath = self._get_first_file_uri(testrecipe)
@@ -540,6 +627,9 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     @testcase(1277)
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1277
+        """
         testrecipe = 'bash'
         filepath = 'Makefile.in'
         srcdir = get_bb_var('S', testrecipe)
@@ -552,6 +642,9 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     @testcase(1278)
     def test_recipetool_appendsrcfiles_basic(self, destdir=None):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1278
+        """
         newfiles = [self.testfile]
         for i in range(1, 5):
             testfile = os.path.join(self.tempdir, 'testfile%d' % i)
@@ -562,4 +655,7 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     @testcase(1279)
     def test_recipetool_appendsrcfiles_basic_subdir(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1279
+        """
         self.test_recipetool_appendsrcfiles_basic(destdir='testdir')
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 3c23062..bd64ced 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -31,20 +31,32 @@ class SStateTests(SStateBase):
 
     @testcase(975)
     def test_sstate_creation_distro_specific_pass(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=975
+        """
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
     @testcase(1374)
     def test_sstate_creation_distro_specific_fail(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1374
+        """
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
 
     @testcase(976)
     def test_sstate_creation_distro_nonspecific_pass(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=976
+        """
         self.run_test_sstate_creation(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1375)
     def test_sstate_creation_distro_nonspecific_fail(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1375
+        """
         self.run_test_sstate_creation(['glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
 
@@ -67,15 +79,24 @@ class SStateTests(SStateBase):
 
     @testcase(977)
     def test_cleansstate_task_distro_specific_nonspecific(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=977
+        """
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_cleansstate_task(['binutils-cross-' + targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1376)
     def test_cleansstate_task_distro_nonspecific(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1376
+        """
         self.run_test_cleansstate_task(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1377)
     def test_cleansstate_task_distro_specific(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1377
+        """
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_cleansstate_task(['binutils-cross-'+ targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
@@ -108,16 +129,25 @@ class SStateTests(SStateBase):
 
     @testcase(175)
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=175
+        """
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch, 'binutils-native'], temp_sstate_location=True)
 
     @testcase(1372)
     def test_rebuild_distro_specific_sstate_cross_target(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1372
+        """
         targetarch = get_bb_var('TUNE_ARCH')
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch], temp_sstate_location=True)
 
     @testcase(1373)
     def test_rebuild_distro_specific_sstate_native_target(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1373
+        """
         self.run_test_rebuild_distro_specific_sstate(['binutils-native'], temp_sstate_location=True)
 
 
@@ -166,6 +196,9 @@ class SStateTests(SStateBase):
 
     @testcase(973)
     def test_sstate_cache_management_script_using_pr_1(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=973
+        """
         global_config = []
         target_config = []
         global_config.append('')
@@ -174,6 +207,9 @@ class SStateTests(SStateBase):
 
     @testcase(978)
     def test_sstate_cache_management_script_using_pr_2(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=978
+        """
         global_config = []
         target_config = []
         global_config.append('')
@@ -184,6 +220,9 @@ class SStateTests(SStateBase):
 
     @testcase(979)
     def test_sstate_cache_management_script_using_pr_3(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=979
+        """
         global_config = []
         target_config = []
         global_config.append('MACHINE = "qemux86-64"')
@@ -196,6 +235,9 @@ class SStateTests(SStateBase):
 
     @testcase(974)
     def test_sstate_cache_management_script_using_machine(self):
+        """
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=974
+        """
         global_config = []
         target_config = []
         global_config.append('MACHINE = "qemux86-64"')
@@ -213,6 +255,7 @@ class SStateTests(SStateBase):
         manually and check using bitbake -S.
         
         Also check that SDKMACHINE changing doesn't change any of these stamps.
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1270
         """
 
         topdir = get_bb_var('TOPDIR')
@@ -256,6 +299,7 @@ SDKMACHINE = \"i686\"
         The sstate checksums should be independent of whichever NATIVELSBSTRING is
         detected. Rather than requiring two different build machines and running 
         builds, override the variables manually and check using bitbake -S.
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1271
         """
 
         topdir = get_bb_var('TOPDIR')
@@ -290,6 +334,7 @@ NATIVELSBSTRING = \"DistroB\"
         MACHINE is set. Check this using bitbake -S.
         Also, rather than duplicate the test, check nativesdk stamps are the same between
         the two MACHINE values.
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1368
         """
 
         topdir = get_bb_var('TOPDIR')
@@ -337,6 +382,7 @@ MACHINE = \"qemuarm\"
         The sstate checksums of two identical machines (using the same tune) should be the 
         same, apart from changes within the machine specific stamps directory. We use the
         qemux86copy machine to test this. Also include multilibs in the test.
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1369
         """
 
         topdir = get_bb_var('TOPDIR')
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index f4c22f7..480450d 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -60,29 +60,44 @@ class Wic(oeSelfTest):
 
     @testcase(1208)
     def test01_help(self):
-        """Test wic --help"""
+        """
+        Test wic --help
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1208
+        """
         self.assertEqual(0, runCmd('wic --help').status)
 
     @testcase(1209)
     def test02_createhelp(self):
-        """Test wic create --help"""
+        """
+        Test wic create --help
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1209
+        """
         self.assertEqual(0, runCmd('wic create --help').status)
 
     @testcase(1210)
     def test03_listhelp(self):
-        """Test wic list --help"""
+        """
+        Test wic list --help
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1210
+        """
         self.assertEqual(0, runCmd('wic list --help').status)
 
     @testcase(1211)
     def test04_build_image_name(self):
-        """Test wic create directdisk --image-name core-image-minimal"""
+        """
+        Test wic create directdisk --image-name core-image-minimal
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1211
+        """
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1212)
     def test05_build_artifacts(self):
-        """Test wic create directdisk providing all artifacts."""
+        """
+        Test wic create directdisk providing all artifacts.
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1212
+        """
         vars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
                                     'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
@@ -96,40 +111,61 @@ class Wic(oeSelfTest):
 
     @testcase(1157)
     def test06_gpt_image(self):
-        """Test creation of core-image-minimal with gpt table and UUID boot"""
+        """
+        Test creation of core-image-minimal with gpt table and UUID boot
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1157
+        """
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1213)
     def test07_unsupported_subcommand(self):
-        """Test unsupported subcommand"""
+        """
+        Test unsupported subcommand
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1213
+        """
         self.assertEqual(1, runCmd('wic unsupported',
                          ignore_status=True).status)
 
     @testcase(1214)
     def test08_no_command(self):
-        """Test wic without command"""
+        """
+        Test wic without command
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1214
+        """
         self.assertEqual(1, runCmd('wic', ignore_status=True).status)
 
     @testcase(1215)
     def test09_help_overview(self):
-        """Test wic help overview"""
+        """
+        Test wic help overview
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1215
+        """
         self.assertEqual(0, runCmd('wic help overview').status)
 
     @testcase(1216)
     def test10_help_plugins(self):
-        """Test wic help plugins"""
+        """
+        Test wic help plugins
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1216
+        """
         self.assertEqual(0, runCmd('wic help plugins').status)
 
     @testcase(1217)
     def test11_help_kickstart(self):
-        """Test wic help kickstart"""
+        """
+        Test wic help kickstart
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1217
+        """
         self.assertEqual(0, runCmd('wic help kickstart').status)
 
     @testcase(1264)
     def test12_compress_gzip(self):
-        """Test compressing an image with gzip"""
+        """
+        Test compressing an image with gzip
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1264
+        """
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c gzip").status)
@@ -138,7 +174,10 @@ class Wic(oeSelfTest):
 
     @testcase(1265)
     def test13_compress_bzip2(self):
-        """Test compressing an image with bzip2"""
+        """
+        Test compressing an image with bzip2
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1265
+        """
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c bzip2").status)
@@ -147,7 +186,10 @@ class Wic(oeSelfTest):
 
     @testcase(1266)
     def test14_compress_xz(self):
-        """Test compressing an image with xz"""
+        """
+        Test compressing an image with xz
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1266
+        """
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c xz").status)
@@ -156,14 +198,20 @@ class Wic(oeSelfTest):
 
     @testcase(1267)
     def test15_wrong_compressor(self):
-        """Test how wic breaks if wrong compressor is provided"""
+        """
+        Test how wic breaks if wrong compressor is provided
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1267
+        """
         self.assertEqual(2, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c wrong", ignore_status=True).status)
 
     @testcase(1268)
     def test16_rootfs_indirect_recipes(self):
-        """Test usage of rootfs plugin with rootfs recipes"""
+        """
+        Test usage of rootfs plugin with rootfs recipes
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1268
+        """
         wks = "directdisk-multi-rootfs"
         self.assertEqual(0, runCmd("wic create %s "
                                    "--image-name core-image-minimal "
@@ -174,7 +222,10 @@ class Wic(oeSelfTest):
 
     @testcase(1269)
     def test17_rootfs_artifacts(self):
-        """Test usage of rootfs plugin with rootfs paths"""
+        """
+        Test usage of rootfs plugin with rootfs paths
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1269
+        """
         vars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
                                     'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
@@ -192,7 +243,10 @@ class Wic(oeSelfTest):
 
     @testcase(1346)
     def test18_iso_image(self):
-        """Test creation of hybrid iso image with legacy and EFI boot"""
+        """
+        Test creation of hybrid iso image with legacy and EFI boot
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1346
+        """
         self.assertEqual(0, runCmd("wic create mkhybridiso "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
@@ -200,7 +254,10 @@ class Wic(oeSelfTest):
 
     @testcase(1347)
     def test19_image_env(self):
-        """Test generation of <image>.env files."""
+        """
+        Test generation of <image>.env files.
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1347
+        """
         image = 'core-image-minimal'
         stdir = get_bb_var('STAGING_DIR_TARGET', image)
         imgdatadir = os.path.join(stdir, 'imgdata')
@@ -223,7 +280,10 @@ class Wic(oeSelfTest):
 
     @testcase(1351)
     def test20_wic_image_type(self):
-        """Test building wic images by bitbake"""
+        """
+        Test building wic images by bitbake
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1351
+        """
         self.assertEqual(0, bitbake('wic-image-minimal').status)
 
         deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
@@ -238,7 +298,10 @@ class Wic(oeSelfTest):
 
     @testcase(1348)
     def test21_qemux86_directdisk(self):
-        """Test creation of qemux-86-directdisk image"""
+        """
+        Test creation of qemux-86-directdisk image
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1348
+        """
         image = "qemux86-directdisk"
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
@@ -246,7 +309,10 @@ class Wic(oeSelfTest):
 
     @testcase(1349)
     def test22_mkgummidisk(self):
-        """Test creation of mkgummidisk image"""
+        """
+        Test creation of mkgummidisk image
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1349
+        """
         image = "mkgummidisk"
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
@@ -254,7 +320,10 @@ class Wic(oeSelfTest):
 
     @testcase(1350)
     def test23_mkefidisk(self):
-        """Test creation of mkefidisk image"""
+        """
+        Test creation of mkefidisk image
+        TestopiaID:  https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=1350
+        """
         image = "mkefidisk"
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
-- 
2.1.0


