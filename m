Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id E9B1D7F3F6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 20:36:47 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id q12so11895533wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 13:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=y3SZN7THwkJIePrIbY3jGDUopASWQFoRAYff8yK0mTw=;
	b=bOewnuagboMYLds00XOezkBzVN16Kc+qJWe0vRI8CLEhPQdusfczk5Wtc7ec8Mi7rz
	jik+9D+AxpfCaPESxmfx5gps8LW0OHrlUFOq13QItNY+x40cWnXjAPN/Hw+2hPpwNF2z
	x6cM1LY35tEMtRQ6I8x5Ij1M7iDfnOayNK5JhHra8c6ouvfwF45TEBJpz0hb9RgPTqtT
	IYgHVtQt5SKrLwcKQTtMapu5NddAS54QEWrbe2d0F2cdrc0g3gvHwnJ2WTKjyCTBfvWf
	r/yHlHbrgUQPPojNUeKxd3T7YcwRhomcV49I8g9vcUV3ikQE0pD1MDawAduK2QnlUU4G
	lQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=y3SZN7THwkJIePrIbY3jGDUopASWQFoRAYff8yK0mTw=;
	b=mm783cWIDU5DuGyFewFwqvtXeP3tN/IzTgfkBFR+o9vkObx15K2r5AELTREgPHgB7c
	OERggxP/nOUlfmZOKzp6piUZo6OxZnpCNEQqwOp4/4t2M+woqa2+rWw9Uk3KPOnauOU8
	tdm36z2c+6D4bIlMkJdzVM8sdhvRtXtnSO2FOW8TC3CEZbifbxmY1sjkh+laYdzqg0n8
	DWuZNklZzHQTiGitOYQbwKKdJu/UxNSxAUzotENiHcXJEv0hZqcWFrHKBJLhK0ndkDb3
	CK9dehEyKxNKuPK4eEpNEbW76Qd6DDE2bwKZ35VMCV9CqVNBPO+E/c1C3kajUELB74wq
	2JWg==
X-Gm-Message-State: APjAAAWMPGgggWC9D6O2AFptObXz9QrZt4CUQCfHe97H199yApjmUctM
	JIz21teYXCJAN9u2bUT8Jd1q6Ekk
X-Google-Smtp-Source: APXvYqyxrsS1JG3dq8n+SrxLQrVgkK6Wluf1v5+aht5QVSZny3171EuAuL0/N1nuDlyfXCDPYXfNXw==
X-Received: by 2002:a05:6000:1187:: with SMTP id
	g7mr29745051wrx.192.1567370207625; 
	Sun, 01 Sep 2019 13:36:47 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f6sm25876192wrh.30.2019.09.01.13.36.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 13:36:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 22:36:35 +0200
Message-Id: <44b5495e0c869362abb828bdabce0fb678a60c81.1567369258.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567369258.git.alex.kanavin@gmail.com>
References: <cover.1567369258.git.alex.kanavin@gmail.com>
Subject: [PATCH 5/5] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Sun, 01 Sep 2019 20:36:48 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7b48fe562ef..d8698f37375 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -166,9 +166,9 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
-    def test_testimage_virgl_gtk(self):
+    def test_testimage_virgl_gtk_sdl(self):
         """
-        Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk frontend
+        Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk and SDL frontends
         Expected: 1. Check that virgl kernel driver is loaded and 3d acceleration is enabled
                   2. Check that kmscube demo runs without crashing.
         Product: oe-core
@@ -185,13 +185,19 @@ class TestImage(OESelftestTestCase):
         features = 'INHERIT += "testimage"\n'
         if 'gtk+' not in qemu_packageconfig:
             features += 'PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"\n'
+        if 'sdl' not in qemu_packageconfig:
+            features += 'PACKAGECONFIG_append_pn-qemu-system-native = " sdl"\n'
         if 'opengl' not in qemu_distrofeatures:
             features += 'DISTRO_FEATURES_append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL_append = " kmscube"\n'
-        features += 'TEST_RUNQEMUPARAMS = "gtk-gl"\n'
-        self.write_config(features)
+        features_gtk = features + 'TEST_RUNQEMUPARAMS = "gtk-gl"\n'
+        self.write_config(features_gtk)
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
+        features_sdl = features + 'TEST_RUNQEMUPARAMS = "sdl-gl"\n'
+        self.write_config(features_sdl)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
 
-- 
2.17.1


