Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.37087.1598811534506986122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=e+GtgUcT;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.45, mailfrom: steve@sakoman.com)
Received: by mail-io1-f45.google.com with SMTP id l8so3842295ios.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rOLu513vYPXovM82tFSNDJjza75FjSzM02AddMKKy8I=;
        b=e+GtgUcTtPVqO2JnFu6h8EIOws/hZGoF1mIryh0M/XkEAyxvQx1z/aeAQ3csgqhQjX
         VekiWqqYNcQ7t3Ir4m346o3FRZUDO1f6tUMfKPBmYpjTLgl6n695c5QZMyNMsNeTb/oI
         xR/Yj2JhC9jtnUTHd8FhUpir4nGSd4o5MK4W7GYD0ts5CQpGxhGw7J1Ud8rwzgYk3iw4
         +gum4AMpaBAt+CKNEGkKTEttut85ap1tfCy2kuQS8UgDwGtEo1QPwpyHaOrxbFAe0i+F
         LvVzPEJZzZ5FTt7CvJEc6FlzaiSsII6xVr1t0nzbKuXx8epX70YMieabWnakKgJJuoDE
         SBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rOLu513vYPXovM82tFSNDJjza75FjSzM02AddMKKy8I=;
        b=PRVtxZ30d0xuIc0IYoVKsxeJ89FmQL4CpkY5z8ne8Y+6po1ReDBJyXLTG8XB7WFV2g
         MaYhrK/xCJtKhkPrONnKA9VvCS/+oTuhAwgWCs63z7keqiXaUKcYwYxP2Y0hApE/UJV5
         B0ghOxz6WsX3BB0MJ5ganQzLigAX8k1573JCZGgxliRgwH7Rtz2G+hwKGj77GKdACCm6
         HnD0MHqBDbLyO9wdDGWc+j4bczS+tFLuHN7x5h0ne27Yji8bCW8kuqn9HG706yRZCIPl
         7fQvNIMwqriDK1DJ1b2+SyA37YQ3gzRKl1XFWcefjDykUNfwt9rfxAEvAqt4M+9OrxyI
         TeLQ==
X-Gm-Message-State: AOAM5329gmN+dE6iNSD3QTkxh5n9uhSKIziQhvZ0CjjOX5GoWAPgA+/S
	pryKHxPfRmFJhlA5pTSD38mszjkI0uF9R5+4W0Q=
X-Google-Smtp-Source: ABdhPJy83iflMPwoUfsvSh0GxhkPEX4lQFslhIT7wGkv1UVUGPmvvIsfRwZgp/Tv3LD7EHU9dNCRwA==
X-Received: by 2002:a6b:b513:: with SMTP id e19mr5919306iof.167.1598811533430;
        Sun, 30 Aug 2020 11:18:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/25] libubootenv: inherit uboot-config
Date: Sun, 30 Aug 2020 08:16:12 -1000
Message-Id: <0af5f1ad9754a5802a2181f2fae28ca3d180bbd2.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Ming Liu <liu.ming50@gmail.com>

This mainly aims to involve in the sanity check of UBOOT_CONFIG and
UBOOT_MACHINE, it will throw a error message at recipe parsing time if
neither of them is set, and libubootenv would be skipped.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
index 47e64f9114..07711484ac 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
@@ -15,7 +15,7 @@ SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
 
 S = "${WORKDIR}/git"
 
-inherit cmake lib_package
+inherit uboot-config cmake lib_package
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
-- 
2.17.1

