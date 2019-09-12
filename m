Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id BBEE47E5F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:36:52 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id h7so27959090wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ACmx+v+h7b7T0t0ZfLKg+TNxuOymE0fjeebWz6SCJNk=;
	b=VPfP6Y4iNYYNZq+/WxAwFd/8s8vQ3rKKCxdOK4tcxxI269WzzfhmoDfRyqn4eIl71o
	WbHn4ftt4hjXvzgADgsIHDMpugDLRdZVbQNC4x3YetRoS3v/tJeyFY7CKmO3+OYmJIOC
	fMSteo9cjud6bBCLICLy8/MxEzWQZa9/M/K//7K4x83KDIsbQrCpUpO8JQ49FzRs0rkA
	gKwx3LST3d6w1J2YRd/OfFi2maNrsFOdZRPs4IqhwWejiQfrYKWTkU6ZLm7r+hzeTffp
	ot1+Y7RaalhD01jN56cwhfQKccOFZwHfMmyz9kXB8EYMJQasSlfw51mJWcRGeJoEND+n
	yHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ACmx+v+h7b7T0t0ZfLKg+TNxuOymE0fjeebWz6SCJNk=;
	b=qCT6niIBczEI2YsSFdP2AxzOCw6DwedN+8Ca3HEkmoVZfA5h38MdWJJ+gMQa1rrpMC
	5F6EAi4xvFHK1dB11ZKRqUE3KvY83dl3NijHXJu8L5TJFL4EUIwr5iwFShUC5+HdgxAt
	vP11KTsdEYVMPZ9n1Sck7Uyct/JXudDDRPkQ3MoOlX5bNUqQIGMuP7LFrNK9cXkPwKYv
	RAM0Wu5Mim54SSl8MLqGzMdGrF94x9A6fuX/f1olajFuM3JXnR9lUv7FtQXiEwS8Rg7u
	WcFBaxveLlIGMn3XQ3axphk6+goP2QTWh2+dKaCGivnpEbgCw4L1MDwffIcOgMbN6/09
	3cHg==
X-Gm-Message-State: APjAAAURJmxPioA2UoqfKmawpFrJx4H6ZW2nL1OChyj8yV6skvResngv
	Ead8Jx+VbZYY0EUvumjcjbw6oPAq
X-Google-Smtp-Source: APXvYqxonbvtBSvt9we6AZSIFlO1SXhxn66a0iLl/QTI2sjfs76YBwEr9ec7ENuubNwftSjwFIVTDA==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr1171314wrn.207.1568302612633; 
	Thu, 12 Sep 2019 08:36:52 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 189sm456447wmz.19.2019.09.12.08.36.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 08:36:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 17:36:44 +0200
Message-Id: <20190912153644.19473-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912153644.19473-1-alex.kanavin@gmail.com>
References: <20190912153644.19473-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Thu, 12 Sep 2019 15:36:54 -0000

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


