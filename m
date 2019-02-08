Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5331C7C5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v16so3802422wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JhTF8M79NNdWaJf+3HDEpkyIrwkX9BnCKBdCINNuB9g=;
	b=YhAzTrjY8TOcXvjwQ6P1P+Qm1em7+JrZIZOCAPoiIiJezKFYyt7eupHjMuttn0F92O
	scPDPr2aFIXllnpmMat7XwWAS356b9I1VzWRnHj3Jreazt+CKKk9Ed8qt04imaqGVlpn
	dh8FzDOfcTeFUf+tTbzSqh3/OeRe4zEW5vSz1ZXYk24rL84LlhkvwCqqrDfJUGc5rz7H
	E3tHRTmlLiduKRm3WqqiOQZ8KOtD8NVG0x90CYn562gsu1xjCvlSLvFEIu+NfGc7S67G
	Gg557XupBbr15J0QgZaUaz10bW16bUf2lYvJDaRX0IQ9cumo6nbULW930Z+f6IbSIgUA
	ocjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JhTF8M79NNdWaJf+3HDEpkyIrwkX9BnCKBdCINNuB9g=;
	b=Y98Rdd24VcdLXRqeeixgFV4MDxJd+qggApukWRfdcxzA7wILSsLDh9n3zIyoD7hQ7B
	4NGKvw2WclDgxQyFaNiRLqpxOO3FH0CpJKLEpSM5yxa6VReeXPloYJWLM1nhfxKEBbg8
	Jsf2kuPBkckT2X2r4ylLk9aC80RywoxrLIbrwYPB7ww1CPYrMx2qkCITcv9FfjVAhwLd
	NOuTW/Kpe/UBPFqa0DPfGYa4MzanX9UgRTMAmjgAl3w/4i8I3JQeaOtXtlAQHN8ra4YX
	8Y4AeT6eLbkOkalvbxvTndUEAeuFfnRApz+RkkNyFXSCRQebed54WTT7HhGVX9IsDUpe
	K8/Q==
X-Gm-Message-State: AHQUAubDtQFUv6WKpWsF61wEmLVUZRrIYfyTCDD/BpjOHq8T8EyDGZdD
	F/XEJTOqFdieHR42XU+zfhsFiPT5
X-Google-Smtp-Source: AHgI3IY7maZvbZmskoSnoE4xvQq0V0hNcOOly4nWN/qn1cj0vFzzz/MTB4ozNwlUwkU7QuCtlSgNgg==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr15179882wrx.99.1549637172657; 
	Fri, 08 Feb 2019 06:46:12 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:53 +0100
Message-Id: <30c85a9db0e12bcb76fde2681ed567860decb6a6.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
Subject: [PATCH 12/12] selftest: add tests for virgl GL acceleration
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:12 -0000

Note that the tests require that the host machine has a X display,
has mesa development files installed and is able to create OpenGL contexts.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 28 ++++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 52 +++++++++++++++++++
 2 files changed, 80 insertions(+)
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
index 906e460d4f8..3cecdc8e42b 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -168,6 +168,58 @@ class TestImage(OESelftestTestCase):
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
+        qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-native')
+        features = 'INHERIT += "testimage"\n'
+        if 'gtk+' not in qemu_packageconfig:
+            features += 'PACKAGECONFIG_append_pn-qemu-native = " gtk+"\n'
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


