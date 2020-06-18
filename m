Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.10559.1592494959056027258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=H28ge8ER;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.66, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f66.google.com with SMTP id 97so4880685otg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pp45Hwy1CnLs4HEUFxS+PIo2ZOeFg+nCW1TrnkMu+1A=;
        b=H28ge8ERTKTSQpLDMCuMx77laPgjbWgkTqUOoMTXHsKtROw/2BI1F+fvwPAMqR/4iD
         qtWj0val0bKhXbtwEHgXsofGPWRKq9oDRwEsBG6AOe8og1LHd+g3r3VG5DMIcSPYtgDW
         /NDmUB04pJX9XCVNzrvjIu7c85oh4Uh/W5wdQ1UX2qSFMbVbw6SARuS/43NTVtQEqLLr
         PrVa7iwLTyM4hxN/6A+Y8bgf8a9AtLmy5h7i4F3LutC1Cy/qSMh9i50Igc0yv6csKG2I
         BmDe8UGoCLslSdA4gclEG5Om3XHFfseo04gv3wumFSdMzhCd8uKYqXNp75/XZPY+os+m
         VsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pp45Hwy1CnLs4HEUFxS+PIo2ZOeFg+nCW1TrnkMu+1A=;
        b=r34+fRsRc/bmNmas8d/FXIGsY0xF1ebvFLCgN4sewrBUNqdWG56YGAITvi7uZz6w48
         w4bynlf1Y+pVBHo2F+lgcO4waN8bFbL8u3ZNTif1GHn9qWBJ7rnspcUZhHwrhHQsV4hL
         Nr0IiwicHKJinJeU+eDizzK38omMiWw4BiyIetxhJDiTwu2vX/9aFrjLRMc3kvai3KVi
         j4fIkTRwSSB8GNTef+n974iUPNISPGB29dSJvE6ulD+MBI5HBxpGoLHzJUO5NfULQab0
         aTOE3b/IltEq6orEmymFDu6DrFTKP1OHeotwsc67MrH5VcNXVOygzkFJoz+TIcDD+HM3
         PaJQ==
X-Gm-Message-State: AOAM532ozoJxUnkgV3oh72EDSbE3n0oA3+PFrRcnRT9Nk+OE8rdmLQ5O
	9DjWfVa0/EuO3YFaK39Jk0rYphn1tenOvg==
X-Google-Smtp-Source: ABdhPJz/9/hNmOCKn2kcJMM0n7sf4qKWG1GB2gD9c8ufzYKhexmZk8g3q4iG52pmIA2Gckxtko3LEQ==
X-Received: by 2002:a9d:822:: with SMTP id 31mr3850360oty.137.1592494957900;
        Thu, 18 Jun 2020 08:42:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/21] matchbox-wm: Replace -fcommon with fix
Date: Thu, 18 Jun 2020 05:40:43 -1000
Message-Id: <9078c611dd86bf6bf8320402ed4751090d40cde2.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d69a05533048d0e50f5ee47b2c35675bc615728c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Fix-build-with-gcc-10.patch          | 41 +++++++++++++++++++
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |  3 +-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch b/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..541b5c9c84
--- /dev/null
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
@@ -0,0 +1,41 @@
+From 8a8f8446e803cad04d7bbceaab78ee45d9778c3c Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Tue, 12 May 2020 09:44:05 +0300
+Subject: Fix build with gcc 10
+
+Upstream-Status: Pending
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ src/mbtheme.h | 2 +-
+ src/structs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mbtheme.h b/src/mbtheme.h
+index aa9a7c5..ad03bde 100644
+--- a/src/mbtheme.h
++++ b/src/mbtheme.h
+@@ -46,7 +46,7 @@ typedef struct _mb_theme_param
+ 
+ } MBThemeParam;
+ 
+-enum {
++typedef enum {
+   LAYER_GRADIENT_HORIZ = 1,
+   LAYER_GRADIENT_VERT,
+   LAYER_LABEL,
+diff --git a/src/structs.h b/src/structs.h
+index 24985e7..8f53e72 100644
+--- a/src/structs.h
++++ b/src/structs.h
+@@ -148,7 +148,7 @@
+ 
+ /* Atoms, if you change these check ewmh_init() first */
+ 
+-enum {
++typedef enum {
+   WM_STATE = 0,
+   WM_CHANGE_STATE,
+   WM_PROTOCOLS,
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index 675ee40fa4..a08eb252ce 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -13,6 +13,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 # SRCREV tagged 1.2.2
 SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
+           file://0001-Fix-build-with-gcc-10.patch \
            file://kbdconfig"
 
 S = "${WORKDIR}/git"
@@ -21,8 +22,6 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-CFLAGS += "-fcommon"
-
 FILES_${PN} = "${bindir}/* \
                ${datadir}/matchbox \
                ${sysconfdir}/matchbox \
-- 
2.17.1

