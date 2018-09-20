Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4B49E7458F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 16:16:43 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e1-v6so10026318wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 09:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=D3z53UU8kIXTjRQBdgS0xJL5qwH5CgXwSI49tG9UCmA=;
	b=ZpO2i5EBBnsMtq7h7olR+CfPlUz09TfEitSWanBKTm7naCj3Jh2j2bumwhe82kX9iv
	rlEP13NuGTc9SsGalVynouV+dB03jUi9awAw89PTvBNCJjWneEmFJyJxQTFu0P4lRqD2
	T8dyq1sPg2JTvEyBxhACTMH/RoqweAhJKKzO44HP/HPo83T6u0Y921YpqW8NimJirBmp
	TD2e8KoqYbMClq/qmNwSPYRFogYLYXjlOvzfgG+3mrWtcynydVIE09KI5XMiJGhKY5q+
	pm0Co6eyga0owSOpjZxZWUvbaKE3/Hc58TE2kXtR7Bpjo/KR4FfKi5reOGlDCu3wyuUL
	hpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=D3z53UU8kIXTjRQBdgS0xJL5qwH5CgXwSI49tG9UCmA=;
	b=N3bnyM3EgIReeJg7sF/s7kJ1Yd8vUyRkjiaPEedwdbsLSNO56i7w1taIroGfH14EGu
	LkihzQgi7Y0Bgl+HkAdidFjKlaOTwer82+p8Uk2O8aoK4SyaCn8/fR6i0oHK2vsNxyF7
	XG2DPdf/X49wcNbcLajLf6vsrMH6O4ZaQI63XSPU6zbwRVx95gz/SaKWvOZcSk1gof4w
	7wsQenMvz527BEG7JMG2o6T73zeroCq1ddxu1b7YVue8Xa6cjpnPCXeMIJBhVuGvGP17
	zrFnXG064mcQrrnPe2SERZ0c73Ouzesp4csjcEt6x5jLvScUv37IRh8ujLigAzsS5AoF
	Dmqw==
X-Gm-Message-State: ABuFfohZ22Ow73CCjj+1ks1nsB9tcnC3dzQhR2myaKlXQ+gYU/9AHFHg
	0ReSJN6dCj0bPOwOz1DfBNxSoCRSF7E=
X-Google-Smtp-Source: ACcGV60xQJi1VqfgBjqE3y49kS9vUk5vewGQEl8/IM3vyHyJhYKVCnhFrUU+UH6Z8BO69CjCw/rbkA==
X-Received: by 2002:adf:e30e:: with SMTP id
	b14-v6mr4372418wrj.158.1537460203386; 
	Thu, 20 Sep 2018 09:16:43 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	144-v6sm3740162wma.45.2018.09.20.09.16.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Sep 2018 09:16:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 17:16:41 +0100
Message-Id: <20180920161641.14727-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xserver-xorg: remove obsolete patch
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
X-List-Received-Date: Thu, 20 Sep 2018 16:16:43 -0000

This patch is forcing input to use SIGIO, despite the fact that since 2015
xserver has used an input thread.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0003-Remove-check-for-useSIGIO-option.patch    | 47 ----------------------
 .../xorg-xserver/xserver-xorg_1.20.1.bb            |  1 -
 2 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
deleted file mode 100644
index beed6cb4a43..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From cf407b16cd65ad6e26a9c8e5984e163409a5c0f7 Mon Sep 17 00:00:00 2001
-From: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
-Date: Mon, 30 Jan 2017 16:32:06 -0600
-Subject: [PATCH] Remove check for useSIGIO option
-
-Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of useSIGIO
-option.
-
-As the xfree86 SIGIO support is reworked to use internal versions of OsBlockSIGIO
-and OsReleaseSIGIO.
-
-No longer the check for useSIGIO is needed
-
-Upstream-Status: Pending
-
-Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
----
- hw/xfree86/os-support/shared/sigio.c | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/hw/xfree86/os-support/shared/sigio.c b/hw/xfree86/os-support/shared/sigio.c
-index 884a71c..be76498 100644
---- a/hw/xfree86/os-support/shared/sigio.c
-+++ b/hw/xfree86/os-support/shared/sigio.c
-@@ -185,9 +185,6 @@ xf86InstallSIGIOHandler(int fd, void (*f) (int, void *), void *closure)
-     int i;
-     int installed = FALSE;
- 
--    if (!xf86Info.useSIGIO)
--        return 0;
--
-     for (i = 0; i < MAX_FUNCS; i++) {
-         if (!xf86SigIOFuncs[i].f) {
-             if (xf86IsPipe(fd))
-@@ -256,9 +253,6 @@ xf86RemoveSIGIOHandler(int fd)
-     int max;
-     int ret;
- 
--    if (!xf86Info.useSIGIO)
--        return 0;
--
-     max = 0;
-     ret = 0;
-     for (i = 0; i < MAX_FUNCS; i++) {
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
index 69be3c73850..05e909febd5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
@@ -1,7 +1,6 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://musl-arm-inb-outb.patch \
-            file://0003-Remove-check-for-useSIGIO-option.patch \
             file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             "
 SRC_URI[md5sum] = "e525846d1d0af5732ba835f2e2ec066d"
-- 
2.11.0


