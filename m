Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id B1B1477161
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:45:16 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so14770952wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HNbkSTeAJZmwItoJOJpRtqkKTCP9epxhRTUAQmZozl0=;
	b=fvLXkHcUSiIcGoTsyRxaa1nqvJMrjlqly4E016HlI2al0A74UOvfOnu427HvqnDdc/
	V2XIK+iJgWi22HjI9k2yjqL5eDFU+ZOJBVkUDtojzrpsQs6yk60gP9+Yy+c9blyzszYX
	XQ2ry8Z9w0VuA0/A/U6rcBQSMec9zPlc5UY4z05jd4h/lFcGDBtpcd8jeXKhY/OG89PM
	bNwRpwGNpNOXj/zioVNX5qkF8TZL3mUJMpTClHnAzO3ysW/V6jal3Q7j4TEsASEKwf5b
	PjCHUpuBaGlTmjgCCcFTkxDzFolSBPmQjr1uEtASGYXqOiFlEhlitmWQuGnbklASU4Ve
	UBlQ==
X-Gm-Message-State: ALoCoQkoqEWuxNCKeG/FVLg2nQIg7IhB6yEU6DTDp0vm1PqvwgwgC5kUdlJ9uYOPzu3dE53wVAK7
X-Received: by 10.194.185.16 with SMTP id ey16mr19669156wjc.32.1445010315312; 
	Fri, 16 Oct 2015 08:45:15 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	it4sm23211577wjb.0.2015.10.16.08.45.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 08:45:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 16:37:40 +0100
Message-Id: <1445009861-5993-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445009861-5993-1-git-send-email-ross.burton@intel.com>
References: <1445009861-5993-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] oeqa/selftest/wic: remove numbers from test names
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
X-List-Received-Date: Fri, 16 Oct 2015 15:45:17 -0000

There isn't any required ordering of tests, and the numbers meant that the tests
didn't appear in oe-selftest --list-classes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 46 +++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index a0464ad..1abd192 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -57,29 +57,29 @@ class Wic(oeSelfTest):
         rmtree(self.resultdir, ignore_errors=True)
 
     @testcase(1208)
-    def test01_help(self):
+    def test_help(self):
         """Test wic --help"""
         self.assertEqual(0, runCmd('wic --help').status)
 
     @testcase(1209)
-    def test02_createhelp(self):
+    def test_createhelp(self):
         """Test wic create --help"""
         self.assertEqual(0, runCmd('wic create --help').status)
 
     @testcase(1210)
-    def test03_listhelp(self):
+    def test_listhelp(self):
         """Test wic list --help"""
         self.assertEqual(0, runCmd('wic list --help').status)
 
     @testcase(1211)
-    def test04_build_image_name(self):
+    def test_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1212)
-    def test05_build_artifacts(self):
+    def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         vars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
@@ -93,40 +93,40 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1157)
-    def test06_gpt_image(self):
+    def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1213)
-    def test07_unsupported_subcommand(self):
+    def test_unsupported_subcommand(self):
         """Test unsupported subcommand"""
         self.assertEqual(1, runCmd('wic unsupported',
                          ignore_status=True).status)
 
     @testcase(1214)
-    def test08_no_command(self):
+    def test_no_command(self):
         """Test wic without command"""
         self.assertEqual(1, runCmd('wic', ignore_status=True).status)
 
     @testcase(1215)
-    def test09_help_overview(self):
+    def test_help_overview(self):
         """Test wic help overview"""
         self.assertEqual(0, runCmd('wic help overview').status)
 
     @testcase(1216)
-    def test10_help_plugins(self):
+    def test_help_plugins(self):
         """Test wic help plugins"""
         self.assertEqual(0, runCmd('wic help plugins').status)
 
     @testcase(1217)
-    def test11_help_kickstart(self):
+    def test_help_kickstart(self):
         """Test wic help kickstart"""
         self.assertEqual(0, runCmd('wic help kickstart').status)
 
     @testcase(1264)
-    def test12_compress_gzip(self):
+    def test_compress_gzip(self):
         """Test compressing an image with gzip"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
@@ -135,7 +135,7 @@ class Wic(oeSelfTest):
                                          "directdisk-*.direct.gz")))
 
     @testcase(1265)
-    def test13_compress_bzip2(self):
+    def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
@@ -144,7 +144,7 @@ class Wic(oeSelfTest):
                                          "directdisk-*.direct.bz2")))
 
     @testcase(1266)
-    def test14_compress_xz(self):
+    def test_compress_xz(self):
         """Test compressing an image with xz"""
         self.assertEqual(0, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
@@ -153,14 +153,14 @@ class Wic(oeSelfTest):
                                          "directdisk-*.direct.xz")))
 
     @testcase(1267)
-    def test15_wrong_compressor(self):
+    def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create directdisk "
                                    "--image-name core-image-minimal "
                                    "-c wrong", ignore_status=True).status)
 
     @testcase(1268)
-    def test16_rootfs_indirect_recipes(self):
+    def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         wks = "directdisk-multi-rootfs"
         self.assertEqual(0, runCmd("wic create %s "
@@ -171,7 +171,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
 
     @testcase(1269)
-    def test17_rootfs_artifacts(self):
+    def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         vars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
@@ -189,7 +189,7 @@ class Wic(oeSelfTest):
                                      "%(wks)s-*.direct" % vars)))
 
     @testcase(1346)
-    def test18_iso_image(self):
+    def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         self.assertEqual(0, runCmd("wic create mkhybridiso "
                                    "--image-name core-image-minimal").status)
@@ -197,7 +197,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
     @testcase(1347)
-    def test19_image_env(self):
+    def test_image_env(self):
         """Test generation of <image>.env files."""
         image = 'core-image-minimal'
         stdir = get_bb_var('STAGING_DIR_TARGET', image)
@@ -220,7 +220,7 @@ class Wic(oeSelfTest):
                 self.assertTrue(content[var])
 
     @testcase(1351)
-    def test20_wic_image_type(self):
+    def test_wic_image_type(self):
         """Test building wic images by bitbake"""
         self.assertEqual(0, bitbake('wic-image-minimal').status)
 
@@ -235,7 +235,7 @@ class Wic(oeSelfTest):
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
     @testcase(1348)
-    def test21_qemux86_directdisk(self):
+    def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         image = "qemux86-directdisk"
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
@@ -243,7 +243,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1349)
-    def test22_mkgummidisk(self):
+    def test_mkgummidisk(self):
         """Test creation of mkgummidisk image"""
         image = "mkgummidisk"
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
@@ -251,7 +251,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1350)
-    def test23_mkefidisk(self):
+    def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         image = "mkefidisk"
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-- 
2.1.4


