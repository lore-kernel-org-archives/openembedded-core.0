Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 807A671A51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:56 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id t196so188557121lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5qqqZYzBOeMaEnlweSxlR3yZZ3bof2MK3MH77oXv/Rw=;
	b=KiWjXvm0en3qmeaCAYk5f+HaDKo4smrX/pFpFPYvy9kg+p7nCJaTa11o6F/wwGAF/Y
	2bbE0WesoXFEz+aefVnf7VyS8RQ32pgAZ3YT+UB3XYoPPiM2xCS3ZgyTMYOFxfF1abu6
	1eEkrzj8sS3zQeCUgSWmwPviBjaFsQbD6vdpNsqWAJqhDTdAfajCfyDxKVogkrAmYlUB
	TdHhx72qumO0pbjEDCsl+zsqEhEn9aG38hwwTG23poGnfCbibH7z7TzNW9wSktTDXsGo
	2jVONAFbD35yJMHNEI/py0o/b50i7mTTK6iGlFSxJCdYZEypT+YKSSy1AO9c0aETHJQz
	4Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=5qqqZYzBOeMaEnlweSxlR3yZZ3bof2MK3MH77oXv/Rw=;
	b=Jxdcz0Q6M1Rlgpma0AAignOnbZqAdE5wi9plA9axsWNrYNcBTDSUxGCXG+I8Tub4Pl
	sWnrDr1SZg9aqZMUp678RGiXsVkuORzoqgMnYvg4ipmJfAkV5TWLD/UxEgfcaj+r78Y3
	5dtTnGwcfwB7rMVJLtUP8CTW6yhoOpRJhPR0oZ92Xzlr65gbIGnOl2otZwliHyHGMaus
	qCtmzJ0saBoaPxy8dslJ+z6x4CsjfoiFxACPXJw5euIR/5AgMbrUAOmhCZtp/6aT2DLv
	FHAoFshgt8fJbAZWb/C8WB2r5TXbDWyzjnQUf0TK26+pqUOe0x5aPfIrYzZTSYxpzhWY
	I7FA==
X-Gm-Message-State: ABUngvfGgPmkZpNhv3ZRwZ1Lpit5F6gcOQ/80kY+2jIG9F/2a3WVehWKZJ0roclS+G3Y4A==
X-Received: by 10.25.216.28 with SMTP id p28mr2638612lfg.16.1478780337031;
	Thu, 10 Nov 2016 04:18:57 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:56 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:39 +0100
Message-Id: <504135c9082216ff89af282dfcb686a50b22f578.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 08/10] wic: selftest: do not repeat core-image-minimal
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:56 -0000

Replace repeated core-image-minimal with Wic class field.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 111 +++++++++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 60e31de5825c84fca21d4dbe946e5cc7af8df511..8b86acb917134b389e38c8215a8dff6c7f91c005 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -39,6 +39,8 @@ class Wic(oeSelfTest):
     resultdir = "/var/tmp/wic/build/"
     image_is_ready = False
 
+    OE_IMAGE = "core-image-minimal"
+
     def setUpLocal(self):
         """This code is executed before each test method."""
         targetarch = get_bb_var('TARGET_ARCH', 'core-image-minimal')
@@ -56,7 +58,7 @@ class Wic(oeSelfTest):
                 tools += 'syslinux syslinux-native'
             bitbake(tools)
 
-            bitbake('core-image-minimal')
+            bitbake(self.OE_IMAGE)
             Wic.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)
@@ -80,13 +82,13 @@ class Wic(oeSelfTest):
     def test_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal").status)
+                                   "--image-name %s" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1212)
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
+        bbvars = dict((var.lower(), get_bb_var(var, self.OE_IMAGE)) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
                                     'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
         status = runCmd("wic create directdisk "
@@ -101,7 +103,7 @@ class Wic(oeSelfTest):
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
-                                   "--image-name core-image-minimal").status)
+                                   "--image-name %s" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1213)
@@ -134,8 +136,8 @@ class Wic(oeSelfTest):
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c gzip").status)
+                                   "--image-name %s "
+                                   "-c gzip" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + \
                                          "directdisk-*.direct.gz")))
 
@@ -143,8 +145,8 @@ class Wic(oeSelfTest):
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c bzip2").status)
+                                   "--image-name %s "
+                                   "-c bzip2" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + \
                                          "directdisk-*.direct.bz2")))
 
@@ -152,8 +154,8 @@ class Wic(oeSelfTest):
     def test_compress_xz(self):
         """Test compressing an image with xz"""
         self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c xz").status)
+                                   "--image-name %s "
+                                   "-c xz" % self.OE_IMAGE).status)
         self.assertEqual(1, len(glob(self.resultdir + \
                                          "directdisk-*.direct.xz")))
 
@@ -161,24 +163,29 @@ class Wic(oeSelfTest):
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal "
-                                   "-c wrong", ignore_status=True).status)
+                                   "--image-name %s "
+                                   "-c wrong" % self.OE_IMAGE,
+                                   ignore_status=True).status)
 
     @testcase(1268)
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
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
+        bbvars = dict((var.lower(), get_bb_var(var, self.OE_IMAGE)) \
                         for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
                                     'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
         bbvars['wks'] = "directdisk-multi-rootfs"
@@ -197,24 +204,23 @@ class Wic(oeSelfTest):
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
@@ -244,32 +250,48 @@ class Wic(oeSelfTest):
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
@@ -286,7 +308,12 @@ class Wic(oeSelfTest):
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
@@ -294,14 +321,22 @@ class Wic(oeSelfTest):
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         image = "systemd-bootdisk"
-        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
-                                   % image).status)
+        wic_cmd_vars = {
+            'wks': image,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wic)s -e %(image)s" \
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


