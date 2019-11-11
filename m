Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 72ADC7FBA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:42:23 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id b17so5614979wmj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 08:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SImC+gj1M3ohV+FFNPjevgU3mXdKOxBvh/8s3dF3b7Y=;
	b=dcMtj4mtvJbTjTV35IuC6qShere5ZhVjkJJe0tX6BqputWQOw0gNw9eUI4WPUTUBnT
	HiN+RFxx7xOBeR9F1U/0q2M4ehI8DeKCaO0Y2YoTkxIlZZHIYBcTh7peFuQu219/rnSn
	dnFmRH8OUwu5RmQ5+xld8h6dQMLemVTg8sADsyEr2+TMKUhR5+ouNPhXYSIaoQHyyhp0
	ax8LLPMEArM14VLpwFiX/5l0BG1kclZGy7BTvvgw8mhZpYqo2VCLVC1fiJcD8rMjVcyP
	LseksgC8GpZaD1/kEu7ryp26VScVqTCugHT5bG8sEKG6H2abF65MjDjzicDETlty8qgo
	DVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SImC+gj1M3ohV+FFNPjevgU3mXdKOxBvh/8s3dF3b7Y=;
	b=ackdV5BEiNo88RAIJXEyk/VGPx8LNiy8lBkGwpK2mH7W6jf2a0ukCjb5NCunZhGNct
	yIzcR80CHCvNx7TNAzgW753kVRPDxfnU7ogRdhvbjdYtQZfFfd+q5QtS5am1wGfWxBKy
	Z22mXUwx+CPHFyySnrHfE5VDMmAwzGMFR9CG1RXLu3CWBGBgb9sSKaQH/uv648A2GEZO
	NJRqKgv5ps2a1oO3wcb2sIcv3zBa4YMQ8RSkKfrSSw/I0DhF80mYGDKikfLYl4199BGX
	CAJEHfMyv60O780+jH3wee+VU434s/nfdPctBbTevbVt1Cp6g8nnaq86zRwLYlhNF9PT
	rxwg==
X-Gm-Message-State: APjAAAVNoJhEymfYyg+KgLIxlD77kXgARiFQ7BPfEs73DxTjuNO+88Ge
	/BXMHLqRegmMeTEPZ4CwYXu9RmbWZI8=
X-Google-Smtp-Source: APXvYqwhTrdDn6gFNHMa/xB5wJ24bHy/89GJspFXSjLSfe8QFYbzYd+xBj4HwfGBlUJ+R4mdqVBsoQ==
X-Received: by 2002:a1c:bc89:: with SMTP id m131mr22424163wmf.14.1573490544197;
	Mon, 11 Nov 2019 08:42:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	h140sm21696810wme.22.2019.11.11.08.42.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 08:42:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 17:42:17 +0100
Message-Id: <20191111164217.68122-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191111164217.68122-1-alex.kanavin@gmail.com>
References: <20191111164217.68122-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Mon, 11 Nov 2019 16:42:24 -0000

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


