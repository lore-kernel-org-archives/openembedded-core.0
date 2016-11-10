Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id E45C271A51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:57 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id t196so188557791lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+s85/j2hEyoL/v9161P1pS11lMYJGF7zfv1nxqn9mBs=;
	b=g7c59j7q6Eipp5craazly73EZZDzIZsEbMoCYEkY3eGmugfYmvQLXXJY2yr+n4yMby
	rYDj+aHYxsoJzW5Kp4iBS4QvCtFgchljsQSHwerSW3Kb9SUGcZSyzSDu9WRlrbHdU+qY
	VQYckG0A8L5cF8Xe6BlkPBbWx9CT0RYUI19ys/SFj1hK2b7fKu+/+r1bfFQoZoKLj/11
	HOWaJZ3d1FUC0+byvCtCl5iYYFyXqOaKRkDyfG98Pv9FTpHFMPP4T1BlZOErSOxPcUVC
	tf0xudzLpd9V5XbQMl2IGUA+BVrDG1m0sg3LsQQ0Qyl3gNPk5KzH3G2sHJrDuP4jRuBO
	VwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+s85/j2hEyoL/v9161P1pS11lMYJGF7zfv1nxqn9mBs=;
	b=FIyTdMQsJ5eHFzgDMuiKXwFrr/7iNHpYrpV5gDVrRMadfbfD0xQ2ML+3Agr82sJ9P4
	7ZEr4kuCoc7LDx9dDFojWynIA3fa9YkTaqabJDXQlo7sbasooK3MW7T6Q9B0dlAnXGNh
	799dvVmDIEPvZZq47aF+lLs7v3WV3+moXkvmjpBuIMzYv6qPKTFKarO66LjU3vZIS47c
	CMdcgPfwi4skyP1ASx+VO5AiQnxZB+KTUuew2IROaW0aBkCesEYbpbQVlIMH2zK4RMbD
	3ChJcmbPTcraWiRAJjktgC8WgnDdjsnVxH1KnCkU+DzOg5XCRzyAVrdPik1nqSbVOIo5
	fl4g==
X-Gm-Message-State: ABUngveF9CtXhzOMFdhbVQyDsyBrFOITUuQ7Ebw3x88lWvjlrQ4nZFcQ/kWLlbHJFpR/Og==
X-Received: by 10.25.76.3 with SMTP id z3mr707050lfa.84.1478780338957;
	Thu, 10 Nov 2016 04:18:58 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:58 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:41 +0100
Message-Id: <400cc811e597fe08f3c5383041755977e0671560.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 10/10] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:58 -0000

wic has a new flag for setting a fixed parition size --fixed-size. Add
tests that verify if partition is indeed sized properly and that errors
are signaled when there is not enough space to fit partition data.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 65 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 799886c164a734bcc3226baf97f20d789ae55b56..954f8911eff6da6880d25b4fcd2d82fe0a26c4ba 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -27,6 +27,7 @@ import os
 
 from glob import glob
 from shutil import rmtree
+from tempfile import NamedTemporaryFile
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
@@ -341,3 +342,67 @@ class Wic(oeSelfTest):
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
+        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg, ignore_status=True)
+        self.assertEqual(0, res.status)
+
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+        # 1:0,00MiB:200MiB:200MiB:ext4::;\n
+        partlns = res.output.splitlines()[2:]
+
+        self.assertEqual(1, len(partlns))
+        self.assertEqual("1:0,00MiB:200MiB:200MiB:ext4::;", partlns[0])
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


