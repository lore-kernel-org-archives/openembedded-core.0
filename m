Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2D47C049
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a62so9254065wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3JNQneQ4VTEMMhEJtnAxlCMbHwytZzXHNF+Uy3BPT/w=;
	b=oqoidVwgk1Po9cemBx0t8lQD/GBV8J6ddf7dgnvxWBDCpM4jCGDdUfM7M4kULUupB5
	2byb1S8AdPghHnuIwv51hY+zm0+UHBZUKjFvoKi5lGauL480TufTfxalCnY8IC5XwZBW
	IzUcydlGnRy8Tllx2bACTumzWWxefhfoEBiIQ3DeX//PClaRfP3BgVmj2/APOIBDoqql
	r8pbMgVmjXCfu4e68h1rK/9gGAytgC6nx6e6XNfhd222O1NHzxpSivNA3RoOLNMspAM2
	Y3hjhXTlmAsv/4gNIC5Ypz6AK3IVWtQTYuVeoZDY2avMio1eiWapA+7uv0/c3hzjiTft
	hXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3JNQneQ4VTEMMhEJtnAxlCMbHwytZzXHNF+Uy3BPT/w=;
	b=W/OHD9AMBlAnxzdpbO4/ruOHOLzIYleKuh1jXWk9f0pf3Y+DgUSQrQ8JiTEiT1eJUi
	591yDKIcbRhlp8DzewlWUSvhGRVWmWiaBs9mbZvm+U1JjXprH4tSBb1eY1ALgveV9fIi
	p9lQXNtN29ifqb+DYAI7oD/2ph3YpmsOZ/Jh7su5ALNE0uIiBE9QO/bACULRPElD+ZB0
	WYoqW4Mxj8DuVlVIjeagcqDAOE4i87Z0Jqk7FHdtPV2EW8v1wM2ysZx4CM4Sf1G5Euzp
	sTbrtvscAsNZNEtJTOn1gtjeSffgvI0y5B04hzcFRJNH+zOBuIMifZDDIWLxBZzmIiYY
	z7jQ==
X-Gm-Message-State: AJcUukcJI3pVCFRZVGl3S1v3CG8l52xeQoeGHxcePWZMu81dk0KOEiYL
	iMFTnWbVzmFyCXqv7wVzUkZnCwDr
X-Google-Smtp-Source: ALg8bN7JMDCd7LJ8bBgdWajSbIW/PJflpQAO1V6u0NtOMH2Y2pkU4nGmFwJYdBfkH/depCF2kvr8lQ==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr12342164wmi.140.1547478226833; 
	Mon, 14 Jan 2019 07:03:46 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:19 +0100
Message-Id: <1f1307fa4633eb9691288ababe53acf67d47177e.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 23/23] selftest: add a test for virgl GL acceleration
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:46 -0000

Note that the test requires that the host machine has a X display
and is able to create OpenGL contexts.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 17 +++++++++++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 19 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-selftest/lib/oeqa/runtime/cases/virgl.py

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
new file mode 100644
index 00000000000..3894962eaaf
--- /dev/null
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -0,0 +1,17 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+import subprocess
+
+class VirglTest(OERuntimeTestCase):
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_kernel_driver(self):
+        status, output = self.target.run('dmesg|grep virgl')
+        self.assertEqual(status, 0, "Checking for virgl driver in dmesg returned non-zero: %d\n%s" % (status, output))
+        self.assertIn("virgl 3d acceleration enabled", output, "virgl acceleration seems to be disabled:\n%s" %(output))
+
+    @OETestDepends(['virgl.VirglTest.test_kernel_driver'])
+    def test_kmscube(self):
+        status, output = self.target.run('kmscube')
+        self.assertEqual(status, 0, "kmscube exited with non-zero status %d and output:\n%s" %(status, output))
+        self.assertIn('renderer: "virgl"', output, "kmscube does not seem to use virgl:\n%s" %(output))
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 906e460d4f8..14837fcdd68 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -168,6 +168,25 @@ class TestImage(OESelftestTestCase):
         # remove the oeqa-feed-sign temporal directory
         shutil.rmtree(self.gpg_home, ignore_errors=True)
 
+    @OETestID(1883)
+    def test_testimage_virgl(self):
+        """
+        Summary: Check host-assisted accelerate OpenGL functionality in qemu
+        Expected: 1. Check that virgl kernel driver is loaded and 3d acceleration is enabled
+                  2. Check that kmscube demo runs without crashing.
+        Product: oe-core
+        Author: Alexander Kanavin <alex.kanavin@gmail.com>
+        """
+        features = 'INHERIT += "testimage"\n'
+        features += 'PACKAGECONFIG_append_pn-qemu-native = " gtk+"\n'
+        features += 'TEST_SUITES = "ping ssh virgl"\n'
+        features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
+        features += 'IMAGE_INSTALL_append = " kmscube"\n'
+        features += 'TEST_QEMUPARAMS = "-vga virtio -display gtk,gl=on"\n'
+        self.write_config(features)
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
+
 class Postinst(OESelftestTestCase):
     @OETestID(1540)
     @OETestID(1545)
-- 
2.17.1


