Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 342187FAA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:38:22 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y5so8281483wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GL900HdL4KDjprZStxha0EMiNgiUTPyGP5j+VSxMIiQ=;
	b=c53NdZVhKk4q3jbz+9FxNwjSz7Pliosvj3UY2o8mEQkS1JhH0b0ROVNmPeuEnpI0lV
	Y0Dfnozg4SijxE5At3chBWQwix7y8PPa3zO/StdQhrewv7rBRLsSWzNiNWe6IIEFb/tU
	xfSosqvzINgoeeihiohHWSe9w6E0J3thY80ZZx3PoddTZ7k7drUOuI3OyEsZP9mSCRGT
	b+vle/gPy1YQeJhe72RdkWyVUsbLDQ8Rv/REcgrKUcqOCb4spDt68uFlnBRXHR1aw4Zx
	yzgmc9mmkjoAG3v3HgY3095W1zOTjYWCbij03Ohx5hkIVxZtcuB+5usWkO0YgV5IWuIp
	E3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GL900HdL4KDjprZStxha0EMiNgiUTPyGP5j+VSxMIiQ=;
	b=H742vEscXUcbcJmGKHaFwYb2PQcf5xgkyw3aYv+NcdbA1njpp3GuFXrPOyG+hayy4O
	B2IDERekyUjni9RFdTLJjruSWpyLl72yMmp0ARmrtsVfpcZFSZPdQKCFlITqHHjVF/23
	Ii3ezkCllApYv7svTl0wZmAgZGBumH9bOPFYxlsdaaWKLJkd38yadmHZrMacbW636MGT
	i6xM0nyLVpVS0RdEvHg2Sa1OQVKrs0TzEh6bEbt8PAfyU5CCAI9W7GHlvGcyIHNYTFp0
	l1fRA/UKpj0XXViNezwA9t0tiEOrB+rRPuPmepliDn/4ecGcSPeSoOhXkFmwYUItsFsu
	v7kA==
X-Gm-Message-State: APjAAAUKwY1spXTiTcDA4/NiE6+v35geLlcM6PzdGDIHE6keIO2GRV9a
	p8Q9ni5Dttw5VGUpW3+/jVZkHDK1
X-Google-Smtp-Source: APXvYqyUe6ceVFjDXFmuWsSwI05IPCm0T1NJakq8K6L0Hxxzs3Sf3nmNeejCH5hu95Q14xIoALw+qQ==
X-Received: by 2002:a05:600c:3cd:: with SMTP id
	z13mr5254015wmd.105.1574872702727; 
	Wed, 27 Nov 2019 08:38:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	c1sm19170290wrs.24.2019.11.27.08.38.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:38:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:37:58 +0100
Message-Id: <20191127163811.115720-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127163811.115720-1-alex.kanavin@gmail.com>
References: <20191127163811.115720-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/16] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Wed, 27 Nov 2019 16:38:22 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 4b56e5beca2..ccd2c40aa3f 100644
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


