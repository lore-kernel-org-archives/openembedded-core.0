Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id D108A7F938
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:37:06 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q13so5411151wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 02:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SImC+gj1M3ohV+FFNPjevgU3mXdKOxBvh/8s3dF3b7Y=;
	b=IkZthcV+PnBlxzuWm9ObZtxFKe+e1mhyWb7/RPhKqAvSjLOLh+AaHgCXAe9TtTScg5
	EYBVyLZC8EysnmUs8PVeGenpMVW8YEr6SVu1bskhSKUo395Qv+sMb/OpAOqoA4aEg0eq
	k0KYg024eGEcEB34nhVLzkI4mUt+Nju2YH+CYCS27hq11DXv6RyOVUuPlj0wxf42i2Sd
	+XMI+Sn/3xIqu7SDOAKxe2RQ5Vyx7cS6MLdW4i8arEsxg2PFqkA6VZ02ecsaeCy3VeZm
	7NCnnhSUuSTWdNl82hnR3RWn+i4Tuky5UZsgr3Z6UpG9mkFplr4mat2iMgApyR/LP76i
	38QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SImC+gj1M3ohV+FFNPjevgU3mXdKOxBvh/8s3dF3b7Y=;
	b=C9y1fctogKr7+N+fZROYow9ATv3/v8Oac4mavf7nOm/amLotAkaigGEkfvcM+7uOFz
	/yX/hvNpQ18f6GlCb0PEwa/MgsgcSKTlASx4YMI9kETfkal2XM9qrteTde4vJ+cAEIMw
	ohTLXFp/PMU+ksYuuuUzAtEYSdxTJoYNcgU5Mrw9eqLnDFZ9rAF0c4H5NYjyQKBWhaV/
	9Cy/oN6WrQ02hv6HeypJWyFhYAQNz59/xO+Q9iHN7B1hG27n1EzV3mjt3NflzJy+Dlpu
	rqBBf/7KiTdOvBev541yETu+nlyB8zZ3duLFp6OVRx2EOjApnxEaH0Xhxkq+ijwvlv1B
	8lgg==
X-Gm-Message-State: APjAAAURsCg3lMobVxalnOu8+DxOGkS978SyzxCMkCr/kXCCrlSbgNhG
	WLSUiLzqQPj2+QMHlXvpla0oqx30sM0=
X-Google-Smtp-Source: APXvYqzqnRcO1nqXPBQ4O5wAoTtkuyL2nmiqrA3WLOkGWOHdEmiNk5BQ8erfJ5ET6Exf2i5rPdn04A==
X-Received: by 2002:a5d:448f:: with SMTP id j15mr4399391wrq.70.1572514627349; 
	Thu, 31 Oct 2019 02:37:07 -0700 (PDT)
Received: from localhost.localdomain ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	b186sm2950263wmb.21.2019.10.31.02.37.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 02:37:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:36:52 +0100
Message-Id: <20191031093655.14852-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031093655.14852-1-alex.kanavin@gmail.com>
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/6] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Thu, 31 Oct 2019 09:37:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7d3922ce448..3632ae81ede 100644
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
@@ -183,18 +183,27 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Centos 7')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
+        sdl_packageconfig = get_bb_var('PACKAGECONFIG', 'libsdl2-native')
         features = 'INHERIT += "testimage"\n'
         if 'gtk+' not in qemu_packageconfig:
             features += 'PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"\n'
+        if 'sdl' not in qemu_packageconfig:
+            features += 'PACKAGECONFIG_append_pn-qemu-system-native = " sdl"\n'
         if 'virglrenderer' not in qemu_packageconfig:
             features += 'PACKAGECONFIG_append_pn-qemu-system-native = " virglrenderer"\n'
         if 'glx' not in qemu_packageconfig:
             features += 'PACKAGECONFIG_append_pn-qemu-system-native = " glx"\n'
+        if 'opengl' not in sdl_packageconfig:
+            features += 'PACKAGECONFIG_append_pn-libsdl2-native = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL_append = " kmscube"\n'
-        features += 'TEST_RUNQEMUPARAMS = "gtk gl"\n'
-        self.write_config(features)
+        features_gtk = features + 'TEST_RUNQEMUPARAMS = "gtk gl"\n'
+        self.write_config(features_gtk)
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
+        features_sdl = features + 'TEST_RUNQEMUPARAMS = "sdl gl"\n'
+        self.write_config(features_sdl)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
 
-- 
2.17.1


