Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5AF7FAB1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:08 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g7so6772970wrw.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GL900HdL4KDjprZStxha0EMiNgiUTPyGP5j+VSxMIiQ=;
	b=YAyiEFDgG6QLaiVX/EZ2Ky7c/Ln4rACNWgn2ghuxkAW9BtqrxWKQiEn7ZFtC22OWCT
	BUYFUAlmXpv5NKzjb1aNZH63ckFv51xec4oaGNIQd+s/UjI5bgfRor24Q7l1mcd0zV0/
	H+F0oU3LoxSyWuvBXfyeRlt2ro0NdWAg55GhjBA2MQcKyMN+p8fJv8Vd/t0JAWfXqtwa
	oOZrrYxbukjBsEHNKenCb73CiVW1kFnfbcog9UARbOIGXdNPK4S3cuzDgcBKF59IBDhK
	56jSbK5fqsnUbmwS6gPUgNTe/6w2xM+eYLL6USpziestHnNlusDaWCCnBfmuFm61dyVA
	tqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GL900HdL4KDjprZStxha0EMiNgiUTPyGP5j+VSxMIiQ=;
	b=dcTcJWlODMetbHmnPMOIlNoscSC1osoiQ1Th2KWPCNJATwKfEe+NmwfANwseJd5rx6
	C4gaQFf8Ng4vN0KIOCWdlO0Q8rjWBeRLPkse9IlHCtllioSXb9m8ymsMpd/drmkwMOMG
	6OT+LR7XGQLmi4/a87pFpKG0TUMIvtTiFESQZeAOuqH3VNLsVf76LkTA5Y7DfQ9hFoNX
	Po0w/lxthY2LJHfQUdJO8nfumw1IlExcowAaSc1U9yXVRcEwgLO48f/n2NBRNTV+cKce
	Lv+Zf7B6KzBdRbtioPl7xePoOHQTPaZzwXgfiSRQIyG+ifKZTfDZQsLNdun1N/nYiywc
	sFPQ==
X-Gm-Message-State: APjAAAVrVAh04py++PCWUyvVHmZAUiJpurqYyyEXOVzI72gCv/pO7cg3
	HNi9LCprwAkjDpM28p1w6meDjT9d
X-Google-Smtp-Source: APXvYqyX2m7W2ruyrAl38H+dVFG59QfXJsy3AbMbPW9Dm3OqpOfduvYrmyyfxqLgb2IiXkFtC9W3zg==
X-Received: by 2002:a05:6000:1181:: with SMTP id
	g1mr24998497wrx.131.1574872808852; 
	Wed, 27 Nov 2019 08:40:08 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:39:50 +0100
Message-Id: <20191127164003.115980-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/14] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:08 -0000

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


