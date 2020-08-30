Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web12.36665.1598811502160391475
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=2HwlgACk;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.194, mailfrom: steve@sakoman.com)
Received: by mail-il1-f194.google.com with SMTP id c6so4682269ilo.13
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FXiz0k+Svpm52CDvC5jbJWHA0b16M7Wthzd6zvt0CTQ=;
        b=2HwlgACkHPoLBhMqCH4l5L3DyzHaghyuOjJNZ6OlaXxIfek3MatQnIPo5IrFiwExAu
         T9KgB6EweM0WXtrkhO0z0/g0wYgKFYWX1Oo6Yp0TSR2J0pVN/pNP7O0czgnsIXPcMM6x
         3Yd2j7L/5fF8oG3rf2giyUqXxteqnrROXGXlOCXczYJZOFuK0BziweRDq/dxma0Gg1f7
         ZPFNmqVUOMxSLASXcCdklDo7QQ4FX/jwFAAgx0Bd5JH6VBeDOnIwBd5R8jd61uVBIyMy
         ELLIvwOjk4hRN7SE+gLHlBRKmCL1LHsDdSc0+isHCZcyj6aWh1EfJG6isRgMco5WxQ0+
         dKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FXiz0k+Svpm52CDvC5jbJWHA0b16M7Wthzd6zvt0CTQ=;
        b=Oh/nDIM7PDQpynmMj9+OqnIZM1dDpNFVuF0YQND/PVLAYWHvbPrBMkQSV7kh7QR1Bw
         MrxQk4B3hkNq9hUA31xtH1dyTNIVS6UMh/U3kleSI5fhoEHoIYtrQy/Kw5h+yBTED/DJ
         QjIvGx1JGCXH7Y2Gj1Qkp4zZX5f9+RiLrjLj5U2s9jYu19q98h3safetjYLbU5PlFBed
         7eSY5kJ3WAzRvcenznzZUWnadtx4JkKHk0zhDgTvU+AeJ7X6gkPDSNMQxK48w88JXPEa
         UnUYb+ais/OclSIF8dF4BR0jhJsmMb8dc0Bc/+LNFi7/2poAnMSq+pIXBVKuGjDyqHBN
         dWZw==
X-Gm-Message-State: AOAM531y2GmFKNk1ThaS6uQMUWabn9MdGf8gOCEcfgY5RgM8JStbDlLa
	0v9suT6Hxag+M8qs3criswqzWZ3Vs3CbbSxGjsM=
X-Google-Smtp-Source: ABdhPJwMpBmCweRY4X/ZyLtK/vzA8DKeXG+Nrf/rfS3va070OoZdxENbnImfvF3A0T1EYe8fM8EqtA==
X-Received: by 2002:a92:6f0a:: with SMTP id k10mr5879721ilc.5.1598811500948;
        Sun, 30 Aug 2020 11:18:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/25] image_types_wic: Add ASSUME_PROVIDED to WICVARS
Date: Sun, 30 Aug 2020 08:16:02 -1000
Message-Id: <9384a2e5516ff06ed8c9cded93c55bbf9882538f.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>

Add ASSUME_PROVIDED to WICVARS so that wic can use that
when running on bitbake environment.

This fixes the below build failure in do_image_wic
when --include-path is used in wks file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 04068ff19d2c18c3b915aab6832ad4b48affa07f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types_wic.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index b83308b45c..196c86814e 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -4,7 +4,8 @@ WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
            ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
-           KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND"
+           KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
+           ASSUME_PROVIDED"
 
 inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
 
-- 
2.17.1

