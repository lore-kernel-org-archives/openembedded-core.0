Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB5F601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 12:50:58 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id v186so60500382lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 04:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ppJ3GyP/CLrFiDSKedu/tFWhzT8VOkHkKhuv2QoIAW4=;
	b=Ihnyn7MazwdDIv+bTd6TW98qCjLsfliF7D3poVTkfFCa76J1pwt+m5phD828f+wSfs
	M+72B+byXUbuBb+WUR60xCmz0pZKD8M8vwBtcgrlJlbOHSLo3PtFmB4/NemBdWBnGNzP
	f0sXmjCepIa8ioE45/Wt2ZnYr4+Zggbdi/7obqZ7453UP211mYCbZEX5aF+v/zWRhU+3
	gNzOHxVguG6Gdq2fMifJ2YNxQE65USprWZWb+YrakTUDYiIejt3WyKw4eV8hBuECQ7kM
	QouLRZEvYcb4Wc74xB/f8wmB54Dbz394gkpE2WiADYSTfDZ41aCsGoU8/Zufj1kyXq2E
	M5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ppJ3GyP/CLrFiDSKedu/tFWhzT8VOkHkKhuv2QoIAW4=;
	b=sfdnH2lPcwcAmBZfnJPf6sydIPHIuyOUBzXua/Fo0GtrRDJ2kvE8JPmyPeno7PFHqX
	WWpngl2Pf4SExx/1ypEcnuAaQm/I3bdRyaBmANRQNlDlYCNNkVATojZVXQw5GGKoWpQp
	EVjx7041fAb/O4VZTkfjI9v/LUx8db16UviZ4aFI1P365EboCRwMfF4OMLFAmkpmUWzX
	/izGAUXYRtYHNTwtGNE84o2ngaOEoRbOODjjeaob0MaXAYJToXvjTtUAL9/2Z8NQfkvf
	PmYo8rdV5inBFXkasEBc6er39vJN/e2q5wjocAzoO7pJuf4dIUOs0JqH4ApbqpsKhyQO
	rXzQ==
X-Gm-Message-State: AIkVDXJIBdEdflw7SLvR2Jhhoz/7Xneyxi/5mRZbvU6+1ebT3WvieAgadb+xh1nGTpNq2g==
X-Received: by 10.25.27.72 with SMTP id b69mr947526lfb.160.1484052658600;
	Tue, 10 Jan 2017 04:50:58 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c75sm450711lfe.28.2017.01.10.04.50.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 04:50:57 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 13:50:12 +0100
Message-Id: <07a2af90c66a697a34612ed28ec1595e9d00b153.1484051596.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 2/5] selftest: wic: replace directdisk with wictestdisk where possible
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
X-List-Received-Date: Tue, 10 Jan 2017 12:51:00 -0000

Use wictestdisk instead of directdisk thus allowing more tests to be run on
non-x86 compatible machines.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 66 +++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 49bbfe3bce78d4a93ef032949637ce9de7f0351a..1a5c6a7e88bf2c4194f2da87cfe36078848fa397 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -135,10 +135,10 @@ class Wic(oeSelfTest):
 
     @testcase(1211)
     def test_build_image_name(self):
-        """Test wic create directdisk --image-name=core-image-minimal"""
-        cmd = "wic create directdisk --image-name=core-image-minimal"
+        """Test wic create wictestdisk --image-name=core-image-minimal"""
+        cmd = "wic create wictestdisk --image-name=core-image-minimal"
         self.assertEqual(0, runCmd(cmd).status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1157)
     def test_gpt_image(self):
@@ -209,84 +209,84 @@ class Wic(oeSelfTest):
 
     @testcase(1212)
     def test_build_artifacts(self):
-        """Test wic create directdisk providing all artifacts."""
+        """Test wic create wictestdisk providing all artifacts."""
         bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal'))
                       for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
                                   'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
-        status = runCmd("wic create directdisk "
+        status = runCmd("wic create wictestdisk "
                         "-b %(staging_datadir)s "
                         "-k %(deploy_dir_image)s "
                         "-n %(staging_dir_native)s "
                         "-r %(image_rootfs)s" % bbvars).status
         self.assertEqual(0, status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1264)
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name core-image-minimal "
                                    "-c gzip").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.gz")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.gz")))
 
     @testcase(1265)
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-c bzip2").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.bz2")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.bz2")))
 
     @testcase(1266)
     def test_compress_xz(self):
         """Test compressing an image with xz"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--compress-with=xz").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct.xz")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.xz")))
 
     @testcase(1267)
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
-        self.assertEqual(2, runCmd("wic create directdisk "
+        self.assertEqual(2, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-c wrong", ignore_status=True).status)
 
     @testcase(1558)
     def test_debug(self):
         """Test debug"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-D").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--debug").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1563)
     def test_skip_build_check(self):
         """Test skip build check"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-s").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--skip-build-check").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1564)
     def test_build_rootfs(self):
         """Test build rootfs"""
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "-f").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=core-image-minimal "
                                    "--build-rootfs").status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1268)
     def test_rootfs_indirect_recipes(self):
@@ -318,16 +318,16 @@ class Wic(oeSelfTest):
     @testcase(1496)
     def test_bmap(self):
         """Test generation of .bmap file"""
-        cmd = "wic create directdisk -e core-image-minimal -m"
+        cmd = "wic create wictestdisk -e core-image-minimal -m"
         status = runCmd(cmd).status
         self.assertEqual(0, status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
-        cmd = "wic create directdisk -e core-image-minimal --bmap"
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
+        cmd = "wic create wictestdisk -e core-image-minimal --bmap"
         status = runCmd(cmd).status
         self.assertEqual(0, status)
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct")))
-        self.assertEqual(1, len(glob(self.resultdir + "directdisk-*direct.bmap")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
+        self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
 
     def _get_image_env_path(self, image):
         """Generate and obtain the path to <image>.env"""
@@ -365,11 +365,11 @@ class Wic(oeSelfTest):
         image = 'core-image-minimal'
         imgenvdir = self._get_image_env_path(image)
 
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=%s "
                                    "-v %s"
                                    % (image, imgenvdir)).status)
-        self.assertEqual(0, runCmd("wic create directdisk "
+        self.assertEqual(0, runCmd("wic create wictestdisk "
                                    "--image-name=%s "
                                    "--vars %s"
                                    % (image, imgenvdir)).status)
-- 
2.5.5


