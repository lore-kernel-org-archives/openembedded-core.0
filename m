Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6519A7F502
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 14:45:14 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id u3so3087317lfl.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ACmx+v+h7b7T0t0ZfLKg+TNxuOymE0fjeebWz6SCJNk=;
	b=PkOb3t+FvYK/AMH2q8YvqAxoj5f1L5IDg+lfsSzUz7T8R84xENtYdyHgFLK/KaNbYk
	VT5Mz64gAKm1COtpdZ4KPiq8YHBpnTygo6lUZHKZX/MVtQ+sUIgYqeE4LNOy6Pj7uNEY
	ZYVqAGAmZogsaMI2/hhYZ87rn8UFbn60YbPdJxsqCd+yHK21c9DVkq8qe3oR2pO7AIBa
	SRjnspJuNY4uDg2qE+oiqPMpsBQ0+aTze/upEWG/gCT/DESK5ZLiIWq0KCylE726sWhP
	NzstMk0V6ZcdR4SYJzWQ7UaQEiBfI62vTkJapwR4Niz5C3pyZ2Xw72EFIA2TS9MmVHHT
	q5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ACmx+v+h7b7T0t0ZfLKg+TNxuOymE0fjeebWz6SCJNk=;
	b=ry/LYLfCz63MxTEtKkZY7VHc6LxvQ/mhua7A9cSzY7lmC3GoLIEJleaTiH4ad2QEsy
	NQ5X6spGV4PbazVo1ubu440Aq7Nm+r6PzD3UXTvqP1eNCie9RVlETLjH7tIZK+EoXYyc
	IpDY8o16jknygX3Bvaj48Te2EEdEzjxq7xwfZSDhIG36/SldH93SAiCFGLbRoC5o++pM
	avN+je2sghYc0uzCqMa8zjRiEI1QHv3LZw82ik1SnNtOO/GlJvaOvjbuzy5sU9ki4BXB
	VLSJlvHZeizLtq0CK6n3lkAEVz3KCnFiK+kHuCW33ahdc3JiQ240KqikBdp+trtvLHnz
	sngA==
X-Gm-Message-State: APjAAAUPvPCj4Ncuc7nvvzhxb6oVpNWNoIfFDvf6f3RedgNz13C6gOP7
	c0DxxEj5SyJ3MTaluzOhVb2erPnQ
X-Google-Smtp-Source: APXvYqzkd5pm2w3EWzSNFncNiHzgTt5A9/QuoyObdZVDwuYIo38tscvX0hmNweynWkYPe5t13vV+2A==
X-Received: by 2002:ac2:5ec1:: with SMTP id d1mr2252884lfq.83.1568731514706;
	Tue, 17 Sep 2019 07:45:14 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id a14sm479022lfg.74.2019.09.17.07.45.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 07:45:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 16:45:04 +0200
Message-Id: <20190917144506.43003-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917144506.43003-1-alex.kanavin@gmail.com>
References: <20190917144506.43003-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/4] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Tue, 17 Sep 2019 14:45:14 -0000

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


