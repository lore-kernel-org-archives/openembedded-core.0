Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.61403.1600092728773570399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qpLNE3vB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id b17so5446728pji.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GaY7wbWtYuaa8Zzwgu++dvk6Ib5VEetNPqrDN/iWtb4=;
        b=qpLNE3vBoc0mmm/hTkDqE9FXl8gPc5MILVFJceZD5rUyEuUaP+eJgmghUIoxyGd1Gf
         RZe+aOThhmDB72OFkIS3sh7eseKcocuT7LNTRBUg9mtyE/Rb+6m5yq+TnUeLV/jT2iBc
         YsA6O57AGFvxT/3Ga/up29YpSHWev3qyJMAx+kUrQ3/kXZj45Ad5TmefVwiv5a7k+9wv
         IdflhTEbZHae+rVPOG2zfGf2VDYhLG0N9PNnEhnazrcFkYtzlUL83WHz8DqrXUHmfO2W
         auohPWvCPJvI6MbkmiBlfnGrDI10Zu6LDv55gw3bqFx8/fGC3W5SrTGPfHlvgDg2oC6d
         agPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GaY7wbWtYuaa8Zzwgu++dvk6Ib5VEetNPqrDN/iWtb4=;
        b=VA4oWiwkOEGT5YU2HJbhyqpbG90PMU7Y0FBSKQ4ft4seWX9OHY5348XkwA1I9YuoPU
         NalCMD4LrtI8sUBGj27si1k4sdWlEAgyC4SL7ykOm9dxy+5OmCJnMUmyZ7Or/f7pK6+S
         hGQsVZ4kyM9mxS+96uRkwuFffG+5EpnUFQrJ4Y06iC4F6df1HQi/zsr2nXrDYs5iICVf
         Htfpw+NcJ6f/eW9TzO9AnJVigYv8Xq3+EsVla2Y9F3cZjZglPJCuL1jwlFCDMz6cjVE9
         Y0s2utW/KHxPhOlIQjTb3tsGv2jfDNiEheHAFeHgYsKLpg/GTi6daH7KQpGOqoqmyy+W
         kbWg==
X-Gm-Message-State: AOAM53044GN7RXNEbpoQj/un1gUwdCEXPimnVHIYDCd2mpPry7ZAfZua
	tUI9TnB2YZw/rvfM3pcJqSBIxSYdQdXIPs49Tzg=
X-Google-Smtp-Source: ABdhPJzRRowJouKzArUekUtazMzmvxNAnXNTRDHlpWX18nuwISdi332vIZ3unEnjsVGke1pBWaOJBA==
X-Received: by 2002:a17:90a:9d82:: with SMTP id k2mr14319182pjp.197.1600092727767;
        Mon, 14 Sep 2020 07:12:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/24] xserver-xorg: fix CVE-2020-14347
Date: Mon, 14 Sep 2020 04:11:20 -1000
Message-Id: <02484c21042fcbd31d2982fc1cf60d565ae035e4.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2020-14347.patch         | 38 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
new file mode 100644
index 0000000000..cf3f5f9417
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
@@ -0,0 +1,38 @@
+From aac28e162e5108510065ad4c323affd6deffd816 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Sat, 25 Jul 2020 19:33:50 +0200
+Subject: [PATCH] fix for ZDI-11426
+
+Avoid leaking un-initalized memory to clients by zeroing the
+whole pixmap on initial allocation.
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/aac28e162e5108510065ad4c323affd6deffd816]
+CVE: CVE-2020-14347
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ dix/pixmap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dix/pixmap.c b/dix/pixmap.c
+index 1186d7dbbf..5a0146bbb6 100644
+--- a/dix/pixmap.c
++++ b/dix/pixmap.c
+@@ -116,7 +116,7 @@ AllocatePixmap(ScreenPtr pScreen, int pixDataSize)
+     if (pScreen->totalPixmapSize > ((size_t) - 1) - pixDataSize)
+         return NullPixmap;
+ 
+-    pPixmap = malloc(pScreen->totalPixmapSize + pixDataSize);
++    pPixmap = calloc(1, pScreen->totalPixmapSize + pixDataSize);
+     if (!pPixmap)
+         return NullPixmap;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 3f7fbe85b8..5101134538 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-test-xtest-Initialize-array-with-braces.patch \
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
+           file://CVE-2020-14347.patch \
            "
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
-- 
2.17.1

