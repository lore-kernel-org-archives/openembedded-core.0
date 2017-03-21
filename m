Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id E78827795C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 11:35:34 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id a6so66034827lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 04:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Wi4rYaigD9OVtFUcMgwGA8bt5uG/mPrLbAKlCGM9fVI=;
	b=qhRlaweIDh3cKFQ3QXV3gLYiIsiSE0g/rIuligPB7oMccQ2lsHnHiPe5kxeNkt7Y9+
	TLx+PckMXizIR6LBSJ9jq6qKkvgjrm0ShWpnhx+lQUJuW9wcRW98nntHHJ0x6009gP4P
	/jM9DH6am+U7WN+V/V5/IiAbiuQlzJeOiSUDnGxHVY4sbN/ZRnT6493JBVCYOxMtRr2g
	bMzBSnBwpUCDFSTx+/4O4aaCsUlT4fOf3pCwIaIFEn3sSEtkH+bRxWQhtyUfeHbLZUER
	b9v4czjifDLnM2bhsUkE8W8DvNpSfLas+stAgNqIO2o6VWXICt+RsunrrvV2wZBK+Jg+
	Kklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Wi4rYaigD9OVtFUcMgwGA8bt5uG/mPrLbAKlCGM9fVI=;
	b=POP9PjVDGv317wr6Qy1s2NcqxyRCo3e+rD3PPnwcE+rl9o33vw/PB7zxsdPZCRVh/v
	mnEp0Y/SKcIfJtcRkAK2Vvx/dKX1XdM7aFK1FFyi/9tjMeMgkgVKKUBPVier49I5IcQU
	Gqj5SZFd16rRSHlt06BOAxTD1UNuaod/kTMggCZS62m/TjhRxGjzIcUMVfDRvCPpTWKR
	g5ntxHgGnb/Lbrq8yCp9uiEzDgbfUJ0lJly9y/dX4JoonXDm92bqL2bvy+JcjS/rd/+D
	IgmTPHF47XeoiNECa6yv4ryuNqcoYRE4UPlAG5aAmSL/cVbNjKe4Ymae+VIDPyzJyrWk
	NY5w==
X-Gm-Message-State: AFeK/H2TP1vvIHwGgN5Nzn35w0bvaab9xdAqdAVMdJdfr34uelqpiJC+hFsPTimM/pVpfg==
X-Received: by 10.25.202.29 with SMTP id a29mr9247260lfg.23.1490096135572;
	Tue, 21 Mar 2017 04:35:35 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238]) by smtp.gmail.com with ESMTPSA id
	f28sm3516079lfi.52.2017.03.21.04.35.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Mar 2017 04:35:34 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 12:35:02 +0100
Message-Id: <3f75ed0991befc74ca07d75013aa2b24c426de3c.1490095649.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <20170317144027.GA22297@linux.intel.com>
	<cover.1490095649.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <cover.1490095649.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 2/5] selftest: wic: replace directdisk with wictestdisk where possible
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
X-List-Received-Date: Tue, 21 Mar 2017 11:35:35 -0000

Use wictestdisk instead of directdisk thus allowing more tests to be run on
non-x86 compatible machines.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 64 +++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 825312e5a55639129d88246e7335174484260fc1..0fdd0e65eb4e5d6a2dc72c38a9597c187d82575c 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -135,10 +135,10 @@ class Wic(oeSelfTest):
 
     @testcase(1211)
     def test_build_image_name(self):
-        """Test wic create directdisk --image-name=core-image-minimal"""
-        cmd = "wic create directdisk --image-name=core-image-minimal -o %s" % self.resultdir
+        """Test wic create wictestdisk --image-name=core-image-minimal"""
+        cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
         self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1157)
     def test_gpt_image(self):
@@ -230,31 +230,31 @@ class Wic(oeSelfTest):
     @testcase(1264)
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name core-image-minimal "
                                    "-c gzip -o %s" % self.resultdir).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.gz")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.gz")))
 
     @testcase(1265)
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-c bzip2 -o %s" % self.resultdir).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.bz2")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.bz2")))
 
     @testcase(1266)
     def test_compress_xz(self):
         """Test compressing an image with xz"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--compress-with=xz -o %s" % self.resultdir).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.xz")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.xz")))
 
     @testcase(1267)
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
-        self.assertEqual(2, runCmd("wic create directdisk "
+        self.assertEqual(2, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-c wrong -o %s" % self.resultdir,
                                    ignore_status=True).status)
@@ -262,49 +262,49 @@ class Wic(oeSelfTest):
     @testcase(1558)
     def test_debug_short(self):
         """Test -D option"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-D -o %s" % self.resultdir).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     def test_debug_long(self):
         """Test --debug option"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--debug -o %s" % self.resultdir).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1563)
     def test_skip_build_check_short(self):
         """Test -s option"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-s -o %s" % self.resultdir).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     def test_skip_build_check_long(self):
         """Test --skip-build-check option"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--skip-build-check "
                                    "--outdir %s" % self.resultdir).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1564)
     def test_build_rootfs_short(self):
         """Test -f option"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-f -o %s" % self.resultdir).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     def test_build_rootfs_long(self):
         """Test --build-rootfs option"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--build-rootfs "
                                    "--outdir %s" % self.resultdir).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1268)
     def test_rootfs_indirect_recipes(self):
@@ -461,19 +461,19 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
     @testcase(1496)
     def test_bmap_short(self):
         """Test generation of .bmap file -m option"""
-        cmd = "wic create directdisk -e core-image-minimal -m -o %s" % self.resultdir
+        cmd = "wic create wictestdisk -e core-image-minimal -m -o %s" % self.resultdir
         status = runCmd(cmd).status
         self.assertEqual(0, status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
 
     def test_bmap_long(self):
         """Test generation of .bmap file --bmap option"""
-        cmd = "wic create directdisk -e core-image-minimal --bmap -o %s" % self.resultdir
+        cmd = "wic create wictestdisk -e core-image-minimal --bmap -o %s" % self.resultdir
         status = runCmd(cmd).status
         self.assertEqual(0, status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
 
     def _get_image_env_path(self, image):
         """Generate and obtain the path to <image>.env"""
@@ -514,21 +514,21 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         image = 'core-image-minimal'
         imgenvdir = self._get_image_env_path(image)
 
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=%s -v %s -o %s"
                                    % (image, imgenvdir, self.resultdir)).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
     def test_image_vars_dir_long(self):
         """Test image vars directory selection --vars option"""
         image = 'core-image-minimal'
         imgenvdir = self._get_image_env_path(image)
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=%s "
                                    "--vars %s "
                                    "--outdir %s"
                                    % (image, imgenvdir, self.resultdir)).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
     @testcase(1351)
     def test_wic_image_type(self):
-- 
2.9.3


