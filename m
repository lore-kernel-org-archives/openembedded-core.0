Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3264D71A90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:47:22 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t79so10014632wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=XAvd8ziD2yTbjtEznMj9XGdZ/s5YYWyfgGU/UCmx6v8=;
	b=f8HGd1E6PjaYkN9DpAQa3ZYyHWJciTymxvSbrnLyImI2hxnUBgI+5rfdKGSaXNYptw
	f55HurxJzFgL3A1HEZrzffadCF/xm1T1EwnoHR4Lvv/HtNc5vpQ/gmJX7pi5rwBaAZo3
	5TFIVhYSrPJdU6yAGYY+RIIrAGndtq2Hlcrw28+y/yvQYSh6hzwWr5xTQqx4EHUjsg0b
	haumMz2VmZ8HwmACh3lazcMkjEkhFJxExzIWVpaQITocREKh8jJK0Fqd7ovlhnOAKVBk
	yUasEjQPuLwoEmwc6K+4GIvAsJWY1p1UksI4ob98ma6EdoA5PyL0ri8HJOPn6Kqw8d3i
	0M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XAvd8ziD2yTbjtEznMj9XGdZ/s5YYWyfgGU/UCmx6v8=;
	b=VIq5Hv8IsAmkI4CPeGlof9m32XLGBpK31NVaEBMYgOzwmen6gWs8XBfrQZHCY5PWC6
	H4j609ds9lexkLqGU28+qVPxMJ9uSlhsNhGhUwid+r5MaO9sebxRjOaHRUXQzfRuXpMu
	xtqi9GQIX+evYhrqjTev6vyqe27lxUtU2kRnKVmhAwGZ71EOf/JqYg2gJhLBmTLZmrP4
	oRfMFdnC6ir/PUmXaz46DqsHPFD08gHGXdwRltAnsstfQkhkD/f10seNvZhtVlGYaP9k
	ppYKukk0uZUlU3Hdypuqm/tAxNbSy8WIJ+cTeqYHXovxYPGo2PUcsBq7bqG4axWEp3lk
	IPpA==
X-Gm-Message-State: AKaTC032Yo7Ooz2P1MF5hNkrQADFKl8Bl1dCJvK9w8w8ivAV9YM2ZI/ffv5O7AhihFEwYg==
X-Received: by 10.46.71.77 with SMTP id u74mr560531lja.5.1479887243913;
	Tue, 22 Nov 2016 23:47:23 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	f25sm6988635lji.47.2016.11.22.23.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 23:47:23 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 08:46:31 +0100
Message-Id: <fd75ccfd4bbd3420f72b32c815feb92b06b2b9fb.1479887010.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 5/7] wic: selftest: do not repeat core-image-minimal
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
X-List-Received-Date: Wed, 23 Nov 2016 07:47:24 -0000

Replace repeated core-image-minimal with Wic class field.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 111 +++++++++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 2db14445956bc5adcf1e755844bbdb69edcb468f..37ed2c6de5a7f22f982f921476fa392304995b2e 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -57,6 +57,8 @@ class Wic(oeSelfTest):
     resultdir = "/var/tmp/wic/build/"
     image_is_ready = False
 
+    OE_IMAGE = "core-image-minimal"
+
     def setUpLocal(self):
         """This code is executed before each test method."""
         arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
@@ -75,7 +77,7 @@ class Wic(oeSelfTest):
                 tools += ' syslinux syslinux-native'
             bitbake(tools)
 
-            bitbake('core-image-minimal')
+            bitbake(self.OE_IMAGE)
             Wic.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)
@@ -100,14 +102,14 @@ class Wic(oeSelfTest):
     def test_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal").status)
+                                   "--image-name %s" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1212)
     @onlyForArch('i586', 'i686', 'x86_64')
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
+        bbvars = dict((var.lower(), get_bb_var(var, self.OE_IMAGE)) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
                                     'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
         status = runCmd("wic create directdisk "
@@ -123,7 +125,7 @@ class Wic(oeSelfTest):
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
-                                   "--image-name core-image-minimal").status)
+                                   "--image-name %s" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1213)
@@ -157,8 +159,8 @@ class Wic(oeSelfTest):
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c gzip").status)
+                                   "--image-name %s "
+                                   "-c gzip" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + \
                                          "directdisk-*.direct.gz")))
 
@@ -167,8 +169,8 @@ class Wic(oeSelfTest):
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c bzip2").status)
+                                   "--image-name %s "
+                                   "-c bzip2" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + \
                                          "directdisk-*.direct.bz2")))
 
@@ -177,8 +179,8 @@ class Wic(oeSelfTest):
     def test_compress_xz(self):
         """Test compressing an image with xz"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c xz").status)
+                                   "--image-name %s "
+                                   "-c xz" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + \
                                          "directdisk-*.direct.xz")))
 
@@ -187,26 +189,31 @@ class Wic(oeSelfTest):
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c wrong", ignore_status=True).status)
+                                   "--image-name %s "
+                                   "-c wrong" % self.OE_IMAGE,
+                                   ignore_status=True).status)
 
     @testcase(1268)
     @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         wks = "directdisk-multi-rootfs"
-        self.assertEqual(0, runCmd("wic create %s "
-                                   "--image-name core-image-minimal "
-                                   "--rootfs rootfs1=core-image-minimal "
-                                   "--rootfs rootfs2=core-image-minimal" \
-                                   % wks).status)
+        wic_cmd_vars = {
+            'wks': wks,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wks)s "
+                                   "--image-name %(image)s "
+                                   "--rootfs rootfs1=%(image)s "
+                                   "--rootfs rootfs2=%(image)s" \
+                                   % wic_cmd_vars).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
 
     @testcase(1269)
     @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
+        bbvars = dict((var.lower(), get_bb_var(var, self.OE_IMAGE)) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
                                     'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
         bbvars['wks'] = "directdisk-multi-rootfs"
@@ -226,24 +233,23 @@ class Wic(oeSelfTest):
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         self.assertEqual(0, runCmd("wic create mkhybridiso "
-                                   "--image-name core-image-minimal").status)
+                                   "--image-name %s" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
     @testcase(1347)
     def test_image_env(self):
         """Test generation of <image>.env files."""
-        image = 'core-image-minimal'
-        self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
-        stdir = get_bb_var('STAGING_DIR_TARGET', image)
+        self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % self.OE_IMAGE).status)
+        stdir = get_bb_var('STAGING_DIR_TARGET', self.OE_IMAGE)
         imgdatadir = os.path.join(stdir, 'imgdata')
 
-        basename = get_bb_var('IMAGE_BASENAME', image)
-        self.assertEqual(basename, image)
+        basename = get_bb_var('IMAGE_BASENAME', self.OE_IMAGE)
+        self.assertEqual(basename, self.OE_IMAGE)
         path = os.path.join(imgdatadir, basename) + '.env'
         self.assertTrue(os.path.isfile(path))
 
-        wicvars = set(get_bb_var('WICVARS', image).split())
+        wicvars = set(get_bb_var('WICVARS', self.OE_IMAGE).split())
         # filter out optional variables
         wicvars = wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',
                                       'INITRD', 'ISODIR'))
@@ -275,8 +281,12 @@ class Wic(oeSelfTest):
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         image = "qemux86-directdisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        wic_cmd_vars = {
+            'wks': image,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1349)
@@ -284,8 +294,12 @@ class Wic(oeSelfTest):
     def test_mkgummidisk(self):
         """Test creation of mkgummidisk image"""
         image = "mkgummidisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        wic_cmd_vars = {
+            'wks': image,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1350)
@@ -293,8 +307,12 @@ class Wic(oeSelfTest):
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         image = "mkefidisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        wic_cmd_vars = {
+            'wks': image,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1385)
@@ -302,8 +320,12 @@ class Wic(oeSelfTest):
     def test_directdisk_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
         image = "directdisk-bootloader-config"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        wic_cmd_vars = {
+            'wks': image,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1422)
@@ -322,7 +344,12 @@ class Wic(oeSelfTest):
     def test_bmap(self):
         """Test generation of .bmap file"""
         image = "directdisk"
-        status = runCmd("wic create %s -e core-image-minimal --bmap" % image).status
+        wic_cmd_vars = {
+            'wks': image,
+            'image': self.OE_IMAGE,
+        }
+        status = runCmd("wic create %(wks)s -e %(image)s --bmap" \
+                        % wic_cmd_vars).status
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap" % image)))
@@ -331,14 +358,22 @@ class Wic(oeSelfTest):
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         image = "systemd-bootdisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        wic_cmd_vars = {
+            'wks': image,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         image = "sdimage-bootpart"
         self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        wic_cmd_vars = {
+            'wks': image,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
-- 
2.5.0


