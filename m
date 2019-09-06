Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 099947F3D3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:18:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id o184so6628555wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 04:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=y3SZN7THwkJIePrIbY3jGDUopASWQFoRAYff8yK0mTw=;
	b=Mx/0fkoiwlBq21zAkZGQjLy+k+tcORAQbzu8+Jn77f6/ronVjBOROga1KWKlqO4eOm
	OWczKhGHU3Ny2rR26ZH3AEOd/aKSMo+6LqiJpmxfEl70pKu112POXECNozBfB/TUToRY
	+vBRAo/y7K1n8X2ApjRoaXQK0EZXmdMTSIVvHu+6u+BMW0eqHQ4dWD8dj3vDZIlejmz7
	duwuQJjSQH/y8vC2W6XPUzCr71cnQrkbwPXmlSf8OaVJhedzm4TfhMO1esHaAXOkhbYU
	KrQMRp8he9A03mJ7zx+7Jd+LworClolaN36tr/ogB5e4muoi9DvL9aETs2eiyaUEhMSN
	k5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=y3SZN7THwkJIePrIbY3jGDUopASWQFoRAYff8yK0mTw=;
	b=DQCo5toM0U0m1Ezg0HJMPkPrBas9Y2k+IbMtpHukP1v3+4/IBFQmtsh19en9sSSR+9
	2s11vYuGZXLjZql8ss5UnrurCdxlnJfK7S4xJgPvrG22rlnSurvaASQng+2Ec2TayEn9
	mwTa7OdLp9TAgOM7doCl89PZAL6wW3aGapfV5PGAo3df9fajUdStBelOe9ijyiqd1ECC
	XvJSx2NAe8gzx6HKUORh7L67eVr1oeQen6b/znUJIHbjsIvIN/iWx2K/BcndDTnZt/pz
	TMdw/Bc9B2QsJly9ul4kichi8JIJYzGpZyyKMKU3JVzUenMElFonoPGwMbR1y/tKi7vE
	mpBw==
X-Gm-Message-State: APjAAAVuj1EqDqkFmZgWzmzPqIQMO5HLbsKzUtsYf2GsmwD81SOmHfVD
	NXrxxFw57f6+o2CqRnlrRvf6N78A
X-Google-Smtp-Source: APXvYqz2BQJS/EEFXXvKRg6isy9A2T/wPTrOKepjcHhYGnN9Tj32ja4Wj0FfUBrgL2/B74FPJuSFrw==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr6679518wmg.25.1567768696425;
	Fri, 06 Sep 2019 04:18:16 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q15sm4659730wmb.28.2019.09.06.04.18.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 04:18:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:18:05 +0200
Message-Id: <6e02f0851f70fea87dc331562d4e10666886c97e.1567765705.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567765705.git.alex.kanavin@gmail.com>
References: <cover.1567765705.git.alex.kanavin@gmail.com>
Subject: [PATCH 5/5] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Fri, 06 Sep 2019 11:18:16 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7b48fe562ef..d8698f37375 100644
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
@@ -185,13 +185,19 @@ class TestImage(OESelftestTestCase):
         features = 'INHERIT += "testimage"\n'
         if 'gtk+' not in qemu_packageconfig:
             features += 'PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"\n'
+        if 'sdl' not in qemu_packageconfig:
+            features += 'PACKAGECONFIG_append_pn-qemu-system-native = " sdl"\n'
         if 'opengl' not in qemu_distrofeatures:
             features += 'DISTRO_FEATURES_append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL_append = " kmscube"\n'
-        features += 'TEST_RUNQEMUPARAMS = "gtk-gl"\n'
-        self.write_config(features)
+        features_gtk = features + 'TEST_RUNQEMUPARAMS = "gtk-gl"\n'
+        self.write_config(features_gtk)
+        bitbake('core-image-minimal')
+        bitbake('-c testimage core-image-minimal')
+        features_sdl = features + 'TEST_RUNQEMUPARAMS = "sdl-gl"\n'
+        self.write_config(features_sdl)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
 
-- 
2.17.1


