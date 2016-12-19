Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id F363A73214
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:21:34 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b14so51658116lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HfVWCrdryLg/lPNYi3ajBvt8S5lQRk/0DHIPQOaOCgs=;
	b=XFIdBh5oMYXm5UV38FGqYFdjPPqV4SCLIg9tK3YV/7bA6z4gSzI5n0MS1Ze4CNV+Oq
	wKNaf0EYRXUPXnvswwGONJEFNS5X8ecStSUfMV4ypY3IEBjkXfniHpqF2nWbg2IG8vQ0
	vF3WPgMRzfa2FgWiN8T2dg93qEY3PkHHwp4hKh0/3Kr0sbrmsipQ4d+CfZeImAXZvz1q
	Aslg3BrT/x9YIbUywWgKFkZFqQhZHMc8znV8tNmgbNB/heewq9d64SIkBka/7hfuaR7F
	thDPKlcC1HFab3NlaYDfLc01IEGCZRtWXuq29gJd3/nK7JjHX4S5RhbMO8iKhNM3ksXU
	cjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HfVWCrdryLg/lPNYi3ajBvt8S5lQRk/0DHIPQOaOCgs=;
	b=V1jQzgTXmmtY0QV2vQb7zCbMaoqXnwI0moM2iIWfI9Q0u/lnE0rnoLt4Wj2+0XCtaA
	HTvmLCL26tJ3j2YOvEmuBCxdsESG8Qw/ZrINb3HUeSUZ/AgY//ZMOOtpSWwMVga6aZk4
	2+Yp2tjeXArspAgjFGxkPojLEoIvsFlO8z/GihV17HN1XIPanUSFmgbdcFuLW75kbFKu
	u/5nVVWsI4b74e/jKco/hgIpIBYHfXlvFRKBwpRnYF+tWxvMGeX3UP70NJAajie1SClf
	7MIyY7/fX5PPAHRjCFxToDhgbAHA+mCe4eSkNyjtLF5QoHmppvVTl55t1IPnRf0MLnlE
	TAvQ==
X-Gm-Message-State: AIkVDXL16jdNDTrUjv+H6INzARvmWd8oO1/7EALB4L1JprhJoevDgUiz7dTxCeVVl9lE9w==
X-Received: by 10.46.7.18 with SMTP id 18mr6528547ljh.30.1482146495830;
	Mon, 19 Dec 2016 03:21:35 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c2sm3681892ljb.8.2016.12.19.03.21.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 03:21:34 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 12:21:01 +0100
Message-Id: <1b5033667e812d43731790e54c9d72872a9a8e6b.1482145354.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <20161213185317.GA6550@linux.intel.com>
	<cover.1482145354.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <cover.1482145354.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v6 5/5] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Mon, 19 Dec 2016 11:21:35 -0000

wic has a new flag for setting a fixed parition size --fixed-size. Add
tests that verify if partition is indeed sized properly and that errors
are signaled when there is not enough space to fit partition data.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 61 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 8efece3171db47ee622f2c0f712fff2c2fcf645b..9caf3b0b1e3d4b538fffd409b26f68f0101e78dc 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -29,6 +29,7 @@ import unittest
 from glob import glob
 from shutil import rmtree
 from functools import wraps
+from tempfile import NamedTemporaryFile
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
@@ -59,6 +60,8 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
+        self.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'core-image-minimal')
+
         arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
         is_x86 = arch in ['i586', 'i686', 'x86_64']
         if is_x86:
@@ -344,3 +347,61 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+
+    def _make_fixed_size_wks(self, size):
+        """
+        Create a wks of an image with a single partition. Size of the partition is set
+        using --fixed-size flag. Returns a tuple: (path to wks file, wks image name)
+        """
+        with NamedTemporaryFile("w", suffix=".wks", delete=False) as tf:
+            wkspath = tf.name
+            tf.write("part " \
+                     "--source rootfs --ondisk hda --align 4 --fixed-size %d "
+                     "--fstype=ext4\n" % size)
+        wksname = os.path.splitext(os.path.basename(wkspath))[0]
+
+        return wkspath, wksname
+
+    def test_fixed_size(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag
+        """
+        wkspath, wksname = self._make_fixed_size_wks(200)
+
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                   % wkspath).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(1, len(wicout))
+
+        wicimg = wicout[0]
+
+        # verify partition size with wic
+        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
+                     ignore_status=True,
+                     native_sysroot=self.native_sysroot)
+        self.assertEqual(0, res.status)
+
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+        # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+        partlns = res.output.splitlines()[2:]
+
+        self.assertEqual(1, len(partlns))
+        self.assertEqual("1:0.00MiB:200MiB:200MiB:ext4::;", partlns[0])
+
+    def test_fixed_size_error(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag. The size of partition is intentionally set to 1MiB
+        in order to trigger an error in wic.
+        """
+        wkspath, wksname = self._make_fixed_size_wks(1)
+
+        self.assertEqual(1, runCmd("wic create %s -e core-image-minimal" \
+                                   % wkspath, ignore_status=True).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(0, len(wicout))
-- 
2.5.5


