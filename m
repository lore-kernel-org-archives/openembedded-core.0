Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7D75A7C53F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:16 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t6so6957164wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=L0uCqY6Fxf93C+jYF4Hy2/rXHp5Y7mq3AJdfJpdYNgI=;
	b=PVgGtsr05gxQ8uMB/GT6LBAIHIw4P9TJy9DAa+HkuElA3cK5uZPMuoJ3FVohIffo7J
	svEXl18CE2R6/JOvrCWOYAhtOhb2YWUHUY+DUj2atw7VXyHsUIKGARzPQcCIkdi/htx1
	tJICCNQnpjvZJWi2KrpZsR16MG7aTpPnIi7eTXb8DOFG51MlWMH+CwF67bbC0cgD/jIa
	u9ahn6y6NYu3el0PnVD7NSmlN+3XFCcRmOU37eJdfAt/zLLxSq+z1R4TpVmBrlEgrnpv
	c37V199T37+9h4PKVyCtS65cFL8Roz4UtNH+oJl1OpAgshLx0o1gLnyC8ez12WvhEk2P
	d6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=L0uCqY6Fxf93C+jYF4Hy2/rXHp5Y7mq3AJdfJpdYNgI=;
	b=KnMSTBKBXGUE1rfz7KXpjYeRafuxgcrN/Ydy8Wk6fiwdpqIxz8af31SwltNerdoHP4
	h+N2D4pIR20ZHmRhGRR94AsA0B8x9GlpBvCnmMuy9H1ArYZYQ1lsUHeX825GtnNFB99j
	KL5wZaycq0obLllwbZQztPIzXBJODTVMapwHQQ2xL3oLdYm/k72Yi5lKv4FKg4fntGxL
	pG6aoi60gE2ZoZKO29/yO14F53wqYVvB30dgmivtcwoWk2gvlR2t3zU4pPplQrFCJsrq
	MIlbMdJTF3pdRO/st55GfFhZ383Ioe2jXyOaIc+QM6ObQA/rYD81m5CRtl/hPVbQ0pVA
	c7lw==
X-Gm-Message-State: AHQUAubevgXEqL5KxRhJNu6zoXy3Vm8hwKTST+D4P3KyCygyJsOjZsI2
	5B3yo7DCc/ct6RkVh0Zmzzg9KiAS
X-Google-Smtp-Source: AHgI3IYg98zkYrPFhCfx74YiEmOJ4wN8j5sGvg5kZ9WOE6IKnKUo5onEQcQvI2geJqfDZSazwclvog==
X-Received: by 2002:a5d:5603:: with SMTP id l3mr1069586wrv.279.1549026376945; 
	Fri, 01 Feb 2019 05:06:16 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:54 +0100
Message-Id: <20190201130554.90094-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/13] selftest: add tests for virgl GL acceleration
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:16 -0000

Note that the tests require that the host machine has a X display,
has mesa development files installed and is able to create OpenGL contexts.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 28 +++++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 50 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta-selftest/lib/oeqa/runtime/cases/virgl.py

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
new file mode 100644
index 00000000000..cc25e77d9c0
--- /dev/null
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -0,0 +1,28 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+import subprocess
+import oe
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
+        from fnmatch import fnmatch
+
+        try:
+            distro = oe.lsb.distro_identifier()
+        except Exception:
+            distro = None
+
+        if distro and fnmatch(distro, 'centos-7'):
+            self.skipTest('kmscube is not working when centos 7 is the host OS')
+
+        status, output = self.target.run('kmscube', timeout=30)
+        self.assertEqual(status, 0, "kmscube exited with non-zero status %d and output:\n%s" %(status, output))
+        self.assertIn('renderer: "virgl"', output, "kmscube does not seem to use virgl:\n%s" %(output))
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 906e460d4f8..f43b1286ccf 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -168,6 +168,56 @@ class TestImage(OESelftestTestCase):
         # remove the oeqa-feed-sign temporal directory
         shutil.rmtree(self.gpg_home, ignore_errors=True)
 
+    @OETestID(1883)
+    def test_testimage_virgl_gtk(self):
+        """
+        Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk frontend
+        Expected: 1. Check that virgl kernel driver is loaded and 3d acceleration is enabled
+                  2. Check that kmscube demo runs without crashing.
+        Product: oe-core
+        Author: Alexander Kanavin <alex.kanavin@gmail.com>
+        """
+        if "DISPLAY" not in os.environ:
+            self.skipTest("virgl gtk test must be run inside a X session")
+        features = 'INHERIT += "testimage"\n'
+        features += 'PACKAGECONFIG_append_pn-qemu-native = " gtk+"\n'
+        features += 'TEST_SUITES = "ping ssh virgl"\n'
+        features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
+        features += 'IMAGE_INSTALL_append = " kmscube"\n'
+        features += 'TEST_RUNQEMUPARAMS = "gl"\n'
+        self.write_config(features)
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
+
+    @OETestID(1883)
+    def test_testimage_virgl_headless(self):
+        """
+        Summary: Check host-assisted accelerate OpenGL functionality in qemu with egl-headless frontend
+        Expected: 1. Check that virgl kernel driver is loaded and 3d acceleration is enabled
+                  2. Check that kmscube demo runs without crashing.
+        Product: oe-core
+        Author: Alexander Kanavin <alex.kanavin@gmail.com>
+        """
+        import subprocess, os
+        try:
+            content = os.listdir("/dev/dri")
+            if len([i for i in content if i.startswith('render')]) == 0:
+                self.skipTest("No render nodes found in /dev/dri: %s" %(content))
+        except FileNotFoundError:
+            self.skipTest("/dev/dri directory does not exist; no render nodes available on this machine.")
+        try:
+            dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
+        except subprocess.CalledProcessError as e:
+            self.skipTest("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
+        features = 'INHERIT += "testimage"\n'
+        features += 'TEST_SUITES = "ping ssh virgl"\n'
+        features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
+        features += 'IMAGE_INSTALL_append = " kmscube"\n'
+        features += 'TEST_RUNQEMUPARAMS = "egl-headless"\n'
+        self.write_config(features)
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
+
 class Postinst(OESelftestTestCase):
     @OETestID(1540)
     @OETestID(1545)
-- 
2.17.1


