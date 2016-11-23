Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9348F71A8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:47:25 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f82so10036265wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9qVPSq7Sv3OI2pej4wjwK2I71xrAHHK36/D15Hq89yU=;
	b=TaaLjk6RNofcJq5VXo8F3B3aq5L6DjTo3RLi0q/7gPvFEo6Z1FH9v+sZiRC9iYtQAo
	bHD32naBmAgaYsQCUOdAGtI5YiEJ7uNmWmGhsnfBx6rPQpefhAh3CX+9yr7rL04ZFgJg
	xDGXubLlLhuirKTfro9VjpdK9ocEnvp09hd/dajRTrnFIBNmg68HZSJUiTxC/SsmXfxv
	WCwyVHY+fsBezRb1sWWSzsGbciiFArPU8/4+iSsfFN0U3uOgbfhkVD1YLfB21sUkDCn+
	ynB0LPOR26sKw5eV1lkxpdbhOpzN1DGY5nAnMPLhwgeWWk4OT0YnwLdo1onPWNGjE9l3
	vZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=9qVPSq7Sv3OI2pej4wjwK2I71xrAHHK36/D15Hq89yU=;
	b=EfXpA5r+KgPS2gXt2rOg+t6tmbP9YyoHXBu4KHvZMYuKeYx2K3enmL9YKzcerZz4PE
	I2Aod+9+LRIT9RL7jhI5Jt4ZypnUMX/vyAxuM3HllwZ9RpFQoqSYCfLA4qiIZhEmfry2
	cgREdVn0f8cFrYdHB1glRgMLQ5mbTlrCemyWiH00BrB1wIBQR1YDlWa5JosiMnJ9vZL3
	+qZih0+XqEpdhAianhnR9+vh+eA7x0udvITeK6THIK4Ol7nDKX3CdzPt4hScQcAyrXeN
	HoccqAXw4hAiM27Ai3bYM7fIXOO6E7gTJbXab2UZdRyzGx/feI9In2RNZ334R09F6fhz
	qCog==
X-Gm-Message-State: AKaTC00VJlnQ8TfrE1Cm2ieY6DJdGjVUSgwtN12fjr1Aa5m/pRBwromDo/8lPo8z5XMA2g==
X-Received: by 10.46.71.75 with SMTP id u72mr546398lja.43.1479887246286;
	Tue, 22 Nov 2016 23:47:26 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	f25sm6988635lji.47.2016.11.22.23.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 23:47:25 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 08:46:33 +0100
Message-Id: <7c765b6d3940a7b7dc9daeb32f712809a4b5464e.1479887010.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 7/7] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Wed, 23 Nov 2016 07:47:26 -0000

wic has a new flag for setting a fixed parition size --fixed-size. Add
tests that verify if partition is indeed sized properly and that errors
are signaled when there is not enough space to fit partition data.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 69 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index ad783043b92130a023fd70120becec479c6253a7..45f68df1e74828e11401f57dd732a88a50dd1f00 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -29,6 +29,7 @@ import unittest
 from glob import glob
 from shutil import rmtree
 from functools import wraps
+from tempfile import NamedTemporaryFile
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
@@ -61,6 +62,8 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
+        self.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'core-image-minimal')
+
         arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
         is_x86 = arch in ['i586', 'i686', 'x86_64']
         if is_x86:
@@ -378,3 +381,69 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
                                    % wic_cmd_vars).status)
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
+        return (wkspath, wksname)
+
+    def test_fixed_size(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag
+        """
+        wkspath, wksname = self._make_fixed_size_wks(200)
+
+        wic_cmd_vars = {
+            'wks': wkspath,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(0, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars).status)
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
+        wic_cmd_vars = {
+            'wks': wkspath,
+            'image': self.OE_IMAGE,
+        }
+        self.assertEqual(1, runCmd("wic create %(wks)s -e %(image)s" \
+                                   % wic_cmd_vars, ignore_status=True).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(0, len(wicout))
-- 
2.5.0


