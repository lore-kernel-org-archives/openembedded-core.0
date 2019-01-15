Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 02AEA7C124
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:24 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id y8so3877880wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3JNQneQ4VTEMMhEJtnAxlCMbHwytZzXHNF+Uy3BPT/w=;
	b=TiN4XbjAjpmgG7Swt61p1uCddbmat4ImNnjC3wA5Ow3lmBPk7sD3F9BFN44XuGbbZt
	hPYPPFYpCYNGz+xjQIDbqxot7BaftPdWZWwnOj2rDJz73ljCPJm1Cb4lIomBV7DhpYe5
	uU89cK+D4ePz74c8vPoKwKtzxmvBpRwcQP+P92uuBm9EbuwTU0jkBnkA60l4GozIDYJB
	Cmd+l3Cywvxp86F4gBcaMD1gAaA66T1G+qaquS1q7b8Z/D4DuQhwBxrXHecK/U641EUK
	VR/fS4Jgz7N7jykuL8BH3P1ruME3MhF5vidy7SQqdzX8kUwyMqWE7ppYBIvCjeqVKgJC
	iGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3JNQneQ4VTEMMhEJtnAxlCMbHwytZzXHNF+Uy3BPT/w=;
	b=DeeNyODIfzX11BMFIQUqsq35t58/3YeEirucpHfxl9Jb9bEduDyiS/3ycTb5zTkDsy
	te/k/N0635/7+unODNJzPB/hqBCYFCwwMmKbV6czSwAGuNQZ9ps7mgqp/drbknMMrztn
	QLglvA5uDpB1Cj4BgBDwDu7JlIyKLP1sn56Mgxu/CEYr/KkkLTZdXM44x9DzHCOU5nc7
	XHNRwt4IhXtNyM5UXiKiJ2HfwxdIxuBYXsYzOH7Z52ThKnuvWw2q23V0jHOurDHShZDg
	DELPQaE+CMA2JA5uUaCpW19mIgWRr1vy5tqw5UV2iFC/Q/eQiSLvfAzacq8UXuL95nfH
	pRQA==
X-Gm-Message-State: AJcUukczVKa17KcH1FrVYW8cK7bg+qzKb49x3lywyDLDCLElb2LodlRb
	G6hpxfDl7+js30d7exNFtI+K3iACif8=
X-Google-Smtp-Source: ALg8bN7xz/WOE5Z3B9sVVRGjgHljLe+FvCkCWgir87kx0eG3/Jh5YnWZ+jwwjKEODi0Ddx1ihLEVgQ==
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr3821647wmf.17.1547570365474; 
	Tue, 15 Jan 2019 08:39:25 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:57 +0100
Message-Id: <8984461743cb9e7a23d85f4a926fbdbad676d07a.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 22/22] selftest: add a test for virgl GL acceleration
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:25 -0000

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


