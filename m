Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E4F857C34B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t6so25494006wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L0uCqY6Fxf93C+jYF4Hy2/rXHp5Y7mq3AJdfJpdYNgI=;
	b=QN6VwUdgwtHYFtHR0SuwjWzLhgXIDConfaHg3r7uPPcKYUb+hr1GB7MUlcsAOu+hR9
	vFmGaat5YX1pQbyyp4+osdb4C5rE0FhOVBhyMojWCkxgQIL3LR47M9P0ytLQyv4rPF+K
	LlZQiDGeQhx2+d/wClCj5HkL6M2KmkVC9Sjt6h4jfVqfo6V4Oe+a7Jo6KNbZY9TgE9PR
	JENkVaAyXvaEqQPYlVCvspuVjng0CfzPfJIGQ0WMJRUQPvUWe+jBe/LW/pY8XCGggi3R
	T8ViB3xhPBIxovOjdrs5kXQmOkP9JHwid7Zd193QeCUmp8kYt1bSA5sAhSWx+GSXYhQb
	sFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L0uCqY6Fxf93C+jYF4Hy2/rXHp5Y7mq3AJdfJpdYNgI=;
	b=K1jY8l4sRhj1PBOJrbC2IVDTLFyc1VPagMm2+eeZD4DpELIDYNqQ6A6VOofw6q/696
	xhqp4tSD2gso9wygyofUzKvlcnLjlUK427cFFTDviIkEqO4vOagl4Mp152PddqZP534r
	m/3NWIm+4I67PNVQv8JSVVWA3JKHewsqJsG+bVvUVXcVISEuKjkDxLRD3ysL8XBVqg4Q
	FlhZh+JDd+ve8HWE1FosmkzFGZQOwB8iv+G47eHzKwXPJdjfee/zCAkGwc+0AXGlQg8R
	/TpeXoRRkfWDnaaMRljzRjBvtUMLMJKequ2rLfF8ZRjqZaaBwRFwAmzq3Rtj1ATajnjC
	o3lQ==
X-Gm-Message-State: AJcUukdv9htdbE6CIY7XMjx27MUo26l+MV5rrgFC+Rtpel+/8FY26mQZ
	cW6CAl5pG7ja5S9Abx+GRzM38Ald
X-Google-Smtp-Source: ALg8bN6RhBwwOTwfAaTwv69XdtZpH9RRwWI7wNg2IONIDPKBMOC/goS3mzL+IycOG/Hpo4l1axIR2g==
X-Received: by 2002:adf:81c4:: with SMTP id 62mr27789998wra.266.1548846011481; 
	Wed, 30 Jan 2019 03:00:11 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:42 +0100
Message-Id: <bd044cb2ccf44034331f35903d5da7d984647fc8.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 19/20] selftest: add tests for virgl GL acceleration
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:11 -0000

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


