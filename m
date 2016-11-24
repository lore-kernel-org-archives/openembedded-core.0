Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6BA71AFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:09:42 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id c13so21322934lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 23:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Ju9I8NTYriG6JykD2gRiyJQk1HYYbUZgd5ndLWCYZrc=;
	b=jgiA3aRMOUlI7rWkSgVvdPycn5BdYELO0Qn1WpjT2sUCT1GWI4LXOUGGWgW4mwIXIy
	7gazdgLu2zLFiXXC1ngYLxyZzLU4sHqpLO+RvEi/iaUAxURPqGkfUyNFhBWZF34DG6Lo
	3qLdgDARA/0m2oyymEI4qX1ipunjCHIYix6EObiot5d7ty0oAWSqUYoAySKnBXtBd7tN
	6G8rQ4ajJhBJGj6cuYNmH0tHo9OA1mviER/vvKJwqT+5qVUASBUCsfasGLKwenIBRlWh
	FIzBCPcLG25kgAeU4OVPEPVfkk364BTbZnbZ9OEIKCV1wDLn7U0KmW4F81YLI0eibBap
	q+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Ju9I8NTYriG6JykD2gRiyJQk1HYYbUZgd5ndLWCYZrc=;
	b=IdcmlRtzehci6hYFs3yTzpU/tGbK9C/p5/ZnPxBr3rcZ8vUDBKJmyjiYxoyjsLjlq3
	De7eQK0EXoo1qasnQ8qkCXS69BM4SiQ+0gXv/8ramNHnlf7A9/v/hgaiTPJlwZlbC2fi
	hyeLSJDG5ZdKBbewvJjpVOwT3OR/QRmY4u0AA6m2oa4GjcRbVwkUQ2JZHv2NMZBCVJb6
	brobBMlwTz/6WEDnncqvEA1ds9oA2b5HQtNOP7WTrbYd2FL8owWFpRADO+y1/nhYCpv7
	dGI+HsDh2+tcTdWRtNl6dHXYRW0mbIFAHP8ZuUaSOG5lI1vPo21PGx3jM2j5CAbKm3FY
	yvHg==
X-Gm-Message-State: AKaTC03oAthlNDU3zFZVn6CcnWntnpQwk/koEzSVlwLeQ4hXv8ikOs3O6238XYOs5M/Ong==
X-Received: by 10.25.212.211 with SMTP id l202mr384895lfg.89.1479971383083;
	Wed, 23 Nov 2016 23:09:43 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id v9sm7780542lja.0.2016.11.23.23.09.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 23:09:42 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 08:08:33 +0100
Message-Id: <6e4cc83d9fa79087b041d1f21744d2a97761e541.1479971185.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479970230.git.maciej.borzecki@rndity.com>
References: <cover.1479970230.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479971185.git.maciej.borzecki@rndity.com>
References: <cover.1479971185.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v5 6/6] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Thu, 24 Nov 2016 07:09:42 -0000

wic has a new flag for setting a fixed parition size --fixed-size. Add
tests that verify if partition is indeed sized properly and that errors
are signaled when there is not enough space to fit partition data.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 61 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 84ba08675b2995812a858e78b3678b2ab325b15b..4cba61060cbd081b2288c970877d863ef42d9b7f 100644
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
@@ -343,3 +346,61 @@ class Wic(oeSelfTest):
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
2.5.0


