Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4837C482
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p7so17950156wru.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L0uCqY6Fxf93C+jYF4Hy2/rXHp5Y7mq3AJdfJpdYNgI=;
	b=aEj5FGWzWBgVXLrbOR7GKXGudOou2vJsOXCSnTWqM7b7FdwXYUDSt9zdmJT1DHX2lS
	weMRdL269RgcbRQn6Lp4sbIQhgsh1KEEVxfMQ+HLWERtcQlmhh0KS9Y38UPqHr/pLbvO
	Nu+eS3CdtywZ1vhwxCxN8NVn7ZNdUwO1vlCW46HvMp9SXI9z+2cGP1GX54BeJ7GNycLs
	K/Hh9DH/yNQ5aG+iDYnGAbWS+scSzUKYTiH4VOAHrD1kZ/PyHPPd65L7ZSnO9het/o9y
	WWYul6AnVPyS8lvlHN25fPfkoCnFKhRMXkkNwqsT8vmCwI4SFgSwFWknO+H4ivjMiU76
	fieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L0uCqY6Fxf93C+jYF4Hy2/rXHp5Y7mq3AJdfJpdYNgI=;
	b=XFGdULAwHeIc61dfMDrf/4jWYQy7q787yFqonPKV43ikt6/wVMHw9H7um946JSGHqj
	BZpfmMf1VWLfMrlpJPfd3L2hro+dbWt9mtc7GT6Jdivr0FBeLRU9mzujAKSiemXGI3q6
	d4Ogaqc+CglMOB+uJv2fSEDo/VZ2Ho+kZxb6IuLQ70u5Jq1XjN1zhwWeY8FRNg0r4QQW
	EeNS8mX/s9iyRvF9wYBiYF2oGvOy8RMQT+hMJIeIOMrZvQJ2L+rPwb4tvmLPbB29h/vp
	xbiBYARCHyO8xVQUPY13FN6meaeRm6vDprc3b6bRDR62aQwP+msypMllsnT739lTxasv
	c3gQ==
X-Gm-Message-State: AJcUukeJVig8A95XhnOJOwh58iGjs4IZc19zYM0y8/b0BL0vA73bLaLO
	mv/EP7mF/zMFmyFzcL+/dhmLh1qK
X-Google-Smtp-Source: ALg8bN5u7cJjUMBVutY+pkrdUcbm/CNXUutFdk7LNz9LIkvjmvMWR6XlGxTVf8MFW+cItK3uERGTnA==
X-Received: by 2002:a5d:5607:: with SMTP id l7mr21885238wrv.25.1548679651717; 
	Mon, 28 Jan 2019 04:47:31 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:54 +0100
Message-Id: <4dcb4fa27c49003dad0adf207300333ad4b2f7ad.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 23/24] selftest: add tests for virgl GL acceleration
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:32 -0000

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


