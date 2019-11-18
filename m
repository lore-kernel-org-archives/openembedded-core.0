Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC5D7F9A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:31:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id z10so19719700wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GL900HdL4KDjprZStxha0EMiNgiUTPyGP5j+VSxMIiQ=;
	b=aWouj5uHtjb+Gu6E2uZfFUaKIAqqRH32ij7K44uPLeRFPx40i9axL0K1b+fE+T4pKY
	P3R1PCrhheTN6kGc5o4gIY9MkJrkqcpXHnx3tKbZtvYvzA6ylQeOJnuMXYQgmmDGfTJy
	dKGjh3vQ9Bj3gOHWmQ6X/fJpp7/uN5DSWkdpCp4LBJgNuiKkBf7RSzb21VBf9Kp58vLx
	HtLBv2r2UEZw/wjBG/Rnh3x/zHlPMCM5lNk72IJKbF5bniZ/lALcNMX4tXALq3gBXSO0
	ads5eupcY9xzrEyb+AYri8WTwanHXwX9gvZzIQPLnaw7LSWA8J5uJIrsV1aOLxeNTEg2
	WXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GL900HdL4KDjprZStxha0EMiNgiUTPyGP5j+VSxMIiQ=;
	b=fPZ3wnReIfvGBAuQOvF2CK0vQzGHMunyNW2XehIyZ3cNWmmKMUwgYD7jWEq7skHxa8
	GYx5CP5FBYQIc2XP0uOHuHLWqLARqI8bVYGDOk0CJBiieqsMIoZiO59wXmgaTqG2p32t
	dWT53OWXW/lOJlGE/mlDF5LvVzN/Q2tbaWa/hE40yCxElzNWR6yWXQ2Dn4eBteUOeBpQ
	6nrc65oLD8MegpVcQcA2sJNcBqpde2jFB4QktMK+AM4sxSo+TXHFJmom2schSrRTHNqD
	BzivD+j+GBlklU5KJV6iW+lBWf/a9ERJeTHq8wm1vNQ3fpTyw8SIeMb5tVYOS8cR7J4W
	hsmw==
X-Gm-Message-State: APjAAAWV/w+MlZQLMCNoABFnGGRFL+Y9xYOGFgucN98stb7bzua4l1k9
	psceyCnen7Y8QzYkcaReuoE8cOMn
X-Google-Smtp-Source: APXvYqxPvL57PYzJWG5HRDI1O+ipog5/jEYBErU8RkrukBYJHWXNH9xcMJVp40Nzjjl5dzaVnMkxQg==
X-Received: by 2002:adf:dd0a:: with SMTP id a10mr14827022wrm.299.1574087487633;
	Mon, 18 Nov 2019 06:31:27 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.31.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:31:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:42 +0100
Message-Id: <20191118142852.22981-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/13] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Mon, 18 Nov 2019 14:31:27 -0000

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


