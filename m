Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id F19907F939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:18 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id t26so18762069wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GL900HdL4KDjprZStxha0EMiNgiUTPyGP5j+VSxMIiQ=;
	b=dwzoo1UvDcGyQWHT6R0vxJrLIZYzxHXIdhVXqSt3IBvASXz4Rt5kHaJz0CDkvPXrds
	x188FbFu69w+vh0W79g20eRDaY4K0zkqaEqOkURnjQV7TKPU+LPW1TH42cakswjLQrwb
	Sammmbg35/euTxIa7FrjvskYEcBX/hxnwqymBNzMWZYmlZWQKyaE8Ci4OcdCti9hH6Uo
	25GzKC9DmMS24vUzyGbUJHjRS61gWhlgVb5W0NbiCe6bmQmcn179bYiBWCidF4TmzB2K
	VT9uRKbVZMYp0QM+A8D8XGAIxtLc7FFCSXRJsT7humGGeYbaoniYFVqAIgJgdYKm8YBX
	whTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GL900HdL4KDjprZStxha0EMiNgiUTPyGP5j+VSxMIiQ=;
	b=rFyKlszvhRnsIhJGyZYMXlXuW2jbViq2s0NZX7oJAORia5MaM5i7H3o4ZyjgyIyijC
	EPmmPtKT0/k6pzcBOj5rKnq3oSfXOYklQqe4K/FZ3kjt487dLeYXa3Hrcg/KKT3fmK5+
	hyMbxh/sdLwsLjITPPSp/Ts/66pf11+xA5LMGmArW7XUvpFma28GWiaui7xagodqVOlM
	pFJ24I7/6pisFTXe5HWCcizUfd693mBAApjeUz859SsLLXbsl8ytx50aa4aoZYi/knIf
	cwNLH3Nj2fdJKzrrIA6TbVCT7ro4JGu6f0WmqYmk1f1P4/Ni7eGsbNSCH5ch3et4mn3K
	xCbA==
X-Gm-Message-State: APjAAAXPTHqdd1SYC1j3KOWTtTbEGFzwuNyQOnOmPEfgupWB8jPYni5g
	Pn427avo5r+paMbNOEx13b/X+KAM
X-Google-Smtp-Source: APXvYqyiz0LpT+EBV4zn3HPEg8JM3lDqbsUqzF4H8QKVuAoNwYaizvpXbdQ2xbXEaxKXNx6HkgYlcQ==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr30183347wmc.55.1574082498570; 
	Mon, 18 Nov 2019 05:08:18 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:51 +0100
Message-Id: <20191118130801.21860-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:19 -0000

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


