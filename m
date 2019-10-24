Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 068F97F971
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:11:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id r141so2163352wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ACmx+v+h7b7T0t0ZfLKg+TNxuOymE0fjeebWz6SCJNk=;
	b=aa/6JnnNVS6E72k2PdblYtxBp9N3OoPtw4pFD1CMrjk4AwlHAzdo36topz18kZUxER
	cvfxkEN/R3rSvR+hOUVSsPQ4LaXvtqWl6z5c6IEtbhkP4lQNFJS9FMYnDOHp7VPxM+YB
	RW39NqoK6z3S/ci4LA4kJzOT7Xa+h7RtQfZyjvViHK3ZnaqLdjqM4o9hNFwWbD0pMGcd
	4cex1uuAVCcyRh6tKvywQ61stWtq4eutG3SOkzUDpaBDBt4Cewc6qjqWUJEwQwhKZebh
	waXBHZhMIjfyRiYyUaQeB6KmPoh2w2dKn2RBCcoVJy/7f8HtgEuSwWn3uNC0WNwNbkJu
	8dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ACmx+v+h7b7T0t0ZfLKg+TNxuOymE0fjeebWz6SCJNk=;
	b=LP3/+7uBJF/jqX7Bw4gls1UY3/MRK8HZBq4TC45JujfAaUtpycplr62B+WhmGhDJjO
	YuiXnP9B4OJdXPvWPt1AisUiK0JlVlzdsK9A+YBdHsdl8C7r7yjz0520xHEW4GTS6alc
	msu8VSHNWoHE9U7iZgfUFDTue4HzpV1nUj+4PJYFU1nCnWDDh+HY6Kdi0UV4SWH0qlc5
	astX7Ka1hDaBrGqw+0+GmOHEwKdbZscYKhRMCamZln00Kl0RZ/cSPjZj5avwBE7S6F/9
	RDNiBFVIMS3wLU6RIhhZ9QXQaFPh6G0vThfdI9flXJUZKQ2dA/AAhVBWEWfLUR6x0BfQ
	nCxg==
X-Gm-Message-State: APjAAAXqouj4hlx+IjNe+ij8ih9NBEasxCLGOgja3Qs2Spd4YrZERNQP
	DU0VV9FKMy2mjZ+P/isX2smPDTS8s/U=
X-Google-Smtp-Source: APXvYqwxfmjba4KU2wBpNUO0IZSFtDN6mxz+EIj1iBC3T9diu1oQOix/5nHavEeVfD80MRLP6afmVQ==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr4563699wmh.7.1571915494466;
	Thu, 24 Oct 2019 04:11:34 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v81sm1073024wmg.4.2019.10.24.04.11.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 04:11:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 13:11:23 +0200
Message-Id: <20191024111126.41198-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191024111126.41198-1-alex.kanavin@gmail.com>
References: <20191024111126.41198-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/5] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Thu, 24 Oct 2019 11:11:34 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 3f212bd0eac..8f98a9ead46 100644
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
@@ -181,18 +181,27 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Debian 8')
 
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


