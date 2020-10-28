Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.3760.1603919183563692695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAZ70KVO;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id dn5so912270edb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=asFbty1SJslgKKCsIv38PlZEZRDLneu1Qnm7b2xbifI=;
        b=kAZ70KVOongo/aKmw3XlIiwjV+ERTh8S3/EKNb+lBlkm5tAX54tJ/7wF8gaVyte67p
         3rOGy77rT1cMmUl0GcJKxF/RRUsWgBakjKChksx+TeXr1Pg/cRctypVhCGeR6VIGVNzi
         5u2aX5etUjQl7pkhVDlObgtImNP3vIi5IiuWb+oG8OVLAake4SIBFc7bbPi0mJfWNztF
         A8yER+0Y+RlhRGcuUxDNAYmuYqE4q2uf4tO9E4H+ZZ5oolfsjoryGfRz4GytCe9ZA4SB
         cSqC/zSWVahRsRyCw0PBZplZ88BtzLveoXQMKaIyJ8CfpX++WcJ4YDNU9VaM7deQiqms
         gchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=asFbty1SJslgKKCsIv38PlZEZRDLneu1Qnm7b2xbifI=;
        b=DyEvwf031BLlDrQ6ykH46QfsNSKc+FN7isDvA6e8TgPmBRNSd76XSBMt8mNPQqOnjl
         GV1JRt6UsYzXCGuW8vIp2Udu9bo0BKPdAfNp/iKt1+v9TYQy9waZIxLPFW8NMYTAWtA0
         mTnArSPjzimt+RdJqWjUpzUesT4D+g5XCY3DmRV5TBK48KSOvgYhFtQDyYpk9oTTLQCA
         1Q7cyZtrU2LiMfFPiNeTGC83t/W0+5c6A8FOdJmp/sh+ik1vlPnhM2UFRue1stehb88X
         vvxomW4ZAy9SdWtu/lT1Mn6+jNvdJRasoVJvrk/3FU3VciB7CIQrQGYCPqVXVH0GeFHE
         Ga5w==
X-Gm-Message-State: AOAM531a3ulAn6c8L6apE0bT6jYAwi03REZ2w3qYh5AeZjLbF82hdwfW
	foUV/GBojwqiU38e6ALQSj5x7HyNqJ0Ajg==
X-Google-Smtp-Source: ABdhPJwfQwWUO3AqwTemdZi2/vvI7jaUWadCaYtVkgOMvKxdOvW/aBlWhd4Ckv5g4qF3UlEIaWK2EQ==
X-Received: by 2002:a05:6402:782:: with SMTP id d2mr828929edy.131.1603919181881;
        Wed, 28 Oct 2020 14:06:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/33] xf86-video-vesa: update 2.4.0 -> 2.5.0
Date: Wed, 28 Oct 2020 22:05:43 +0100
Message-Id: <20201028210558.21070-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Refuse-to-run-on-UEFI-machines.patch | 52 -------------------
 ...vesa_2.4.0.bb => xf86-video-vesa_2.5.0.bb} |  6 +--
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vesa/0001-Refuse-to-run-on-UEFI-machines.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.4.0.bb => xf86-video-vesa_2.5.0.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa/0001-Refuse-to-run-on-UEFI-machines.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vesa/0001-Refuse-to-run-on-UEFI-machines.patch
deleted file mode 100644
index 9e01770667..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa/0001-Refuse-to-run-on-UEFI-machines.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 2645e0aa9c17c2c966a0533e52ad00510311483e Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Wed, 29 Aug 2018 11:04:23 -0400
-Subject: [PATCH] Refuse to run on UEFI machines
-
-No possible good can come of this.
-
-v2: Check for .../efi-framebuffer.0 ("is there an EFI framebuffer")
-instead of /sys/firmware/efi ("is this an EFI machine"). Suggested by
-Peter Jones.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/driver/xf86-video-vesa]
-
-Reviewed-by: Peter Jones <pjones@redhat.com>
-Signed-off-by: Adam Jackson <ajax@redhat.com>
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- src/vesa.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/vesa.c b/src/vesa.c
-index 9b65b9b..af750e2 100644
---- a/src/vesa.c
-+++ b/src/vesa.c
-@@ -43,7 +43,7 @@
- #endif
- 
- #include <string.h>
--
-+#include <unistd.h>
- #include "vesa.h"
- 
- /* All drivers initialising the SW cursor need this */
-@@ -450,7 +450,14 @@ VESAPciProbe(DriverPtr drv, int entity_num, struct pci_device *dev,
- 	     intptr_t match_data)
- {
-     ScrnInfoPtr pScrn;
--    
-+
-+#ifdef __linux__
-+    if (access("/sys/devices/platform/efi-framebuffer.0", F_OK) == 0) {
-+        ErrorF("vesa: Refusing to run on UEFI\n");
-+        return FALSE;
-+    }
-+#endif
-+
-     pScrn = xf86ConfigPciEntity(NULL, 0, entity_num, NULL, 
- 				NULL, NULL, NULL, NULL, NULL);
-     if (pScrn != NULL) {
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.5.0.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.5.0.bb
index f6aa54456c..d313c8c6a8 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.5.0.bb
@@ -15,9 +15,5 @@ COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
 
-SRC_URI[md5sum] = "8134201beaf6f77150c7809c3cc802e6"
-SRC_URI[sha256sum] = "bf443c94d7bf6cd4e248f8a3147f4647be04dc4c80250d9405006263bbdee38c"
+SRC_URI[sha256sum] = "1f1624f3c73906801ad1bc98335a2cb5676a7a4d18e5374d9a1d18464e54c659"
 
-SRC_URI += " \
-    file://0001-Refuse-to-run-on-UEFI-machines.patch \
-    "
-- 
2.29.0

