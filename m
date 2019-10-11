Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7B46C6C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5so10121810wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ACmx+v+h7b7T0t0ZfLKg+TNxuOymE0fjeebWz6SCJNk=;
	b=pxR5UAsgcv3sdKp9t9Ylvc8AkdD6hE9OXRZNsgmvwuS6NLUEXfnM6axe/m7lfxeaUV
	cX/WYF7uaX+6oBB6sESdc2ORp88UT13hJGW7ZZzCZi6zZ5bfxcW6qh07c5x4P20OiOZ9
	QZyqmHNFQiPnlPzG0Z6QU0oFP4jfCWo65zDLN4wB2iglN5dNHpnzCVjslaluZUwE/eNY
	miDKQJXrVcRa7uoOioQyvJQqoIw6gtDNYdlnmNtT+HeZTmJuin5aBYGB8jbLYvuowVk7
	zEcxk3HMe2g7+11F984Kl5JIkzlnHvi+x/oRGpQICctMYZ7vgvMDZ7aSSNvUEPPzTR9X
	oLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ACmx+v+h7b7T0t0ZfLKg+TNxuOymE0fjeebWz6SCJNk=;
	b=JneOVQOFULzReFn7s1ma3xmc+w2kfpcixIUIkdtiSuM1vK+EVuVz5GcUB27kN5RTqg
	AihKl9DL1WB+x9SXWELVWh8kSSTJcEJ7nd2KqPJkccr5D2iH7mAYG6o4otBhr5qOFlfu
	sZgSJGf8yuNnvHHSp6AiWodV9GWMOF+TFJ3+eZPIrTiNwNcAqdE8RLBcAHmpQQdbGC5y
	tXb339gXIwwxJPjwfqHOM1F/5S+AP/uXyLsXLpLjRxdWWgKJobNKl8AJ+JiDe6M0ezjM
	JlwxjSny92z+HYDPi94ukwK2OXk8FxC5zOwKGiATzvTLmRYIM8WMA9JZePlRntbGqH1d
	OdjA==
X-Gm-Message-State: APjAAAVq9BFx+IgiUzOR+xHLCf8pebjJpcRiPIhltvq91YSzckK+6ObC
	usO/FblMtpnm8b42sK1pylbT0z/q
X-Google-Smtp-Source: APXvYqypoTeHIkHPaeDwAKzjBo/2SI3lhkPm1v2ohLaaxpDGujxau/MMn75TzDo4ripBNsbGwWANaw==
X-Received: by 2002:a1c:1dcb:: with SMTP id d194mr3098450wmd.75.1570794481935; 
	Fri, 11 Oct 2019 04:48:01 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:37 +0200
Message-Id: <20191011114754.91740-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/19] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:01 -0000

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


