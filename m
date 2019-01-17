Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail.openembedded.org (Postfix) with ESMTP id D3DF07C1E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:51 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id a16so8303031lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Yuwp2O9GB0Uh9+PJgU/9pEVMegU7CqpKtd9fC+ASMwE=;
	b=XAkOUi2kQfSOZXNhKLEsDcqu3gJnRe9X+VR6/wuew3lJNNcn0MPa29KMWVqXg77UyU
	aPqzaAKOCHg6Y2m7B/xzPe/1+yXN+ZBevwJuHWD+B/uUKtTgs4Zi4cLNBHnL+wT+1Xjw
	NHB0mPgWelhPp7EZpw4XyzGbD9RWZpDa3JpGsvKMxS6pqLlWTx8wukdwbNoZN9rwCBpP
	lQ/Ohaawx7EDsTlhHBz7RxNlyo3SIPzzliyBz7bcAog7u2HaUYL+hEc42VKMXjI8rv8A
	47KCACpYgal/omfnd+eygDEPKHE+bjYbbEWkLdcd5rkocwaPwEzxhXHkxeqf5M9ZNoIY
	TnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Yuwp2O9GB0Uh9+PJgU/9pEVMegU7CqpKtd9fC+ASMwE=;
	b=VtNz3y3P4vy7G0MguVeT3O+glPvw5jUF5dzDJEiJAOsaG/QbtYRTzTn79xXWvaOrEg
	hPnAp8US3wct4/OispeahtZSmB0baS8gfMXP05twZ/Hso0XXW7mVjnV54Qmc1BgOjw8D
	zw72cpdu5im3HuBahJmGogF0Ubdu9N/rFEIixFcu8tRvggyXt44oQjfDdtgF49+vSu8s
	zoz9Xauz5jutBsUw7F74SbQ/40KzZ15JpzhydpigyuYW+FXvNd48FS94jQjtukWi6RiK
	KjtsHzJhT0PNDeU2vkXI6HiiHseAPlZ+BOWA5Bqumi+wG3LkewhVmotmEgI6ITLInDDr
	mL1Q==
X-Gm-Message-State: AJcUuke201D0sptAIQQXOduBRFTQY9m1sBcFK1jxTtvW/X0WcdZIvuJV
	xes/BdxHX8kxYoyNDOtL71DOrKxG
X-Google-Smtp-Source: ALg8bN74tTFm7f3yqJE1YoP+ml206IxCKnEa1JGbnKeseVz/mZpaCIaUUeb6GVDL3VwDNKEx82kt5A==
X-Received: by 2002:a19:1cb:: with SMTP id 194mr10659184lfb.61.1547743252009; 
	Thu, 17 Jan 2019 08:40:52 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:09 +0100
Message-Id: <d77fb0a8ce2001d4f9ca0c5a4445a2633464ca1a.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 24/27] selftest: add tests for virgl GL acceleration
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:52 -0000

Note that the tests require that the host machine has a X display,
has mesa development files installed and is able to create OpenGL contexts.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 17 +++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 44 +++++++++++++++++++
 2 files changed, 61 insertions(+)
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
index 906e460d4f8..d872544f7eb 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -168,6 +168,50 @@ class TestImage(OESelftestTestCase):
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
+        import subprocess
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


