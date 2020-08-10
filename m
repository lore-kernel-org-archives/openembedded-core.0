Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.37636.1597028408580099541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=x3uextzG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id l60so4044107pjb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xm2NZRov2Z0DZHUVUNuxZU3RdrU9u+uy5Cz8VRxL95o=;
        b=x3uextzGLxQkl5q3njMHU45BtHRq6OdYTdgEnNdaR/oagLPFKF0eSLT8mTs5cIaq+P
         j35j4z3D/xjGg1KHmDRVJ6az3KCNNqqrNv1zoPFSTF3GCm3mvph57g9G5az6cxF13pvB
         dCRC5MV2uvBnHsZPFHthXXWZDanwxCZHMeR+XumOTKsLCdEETLETi4JFByf28NGDGDZx
         T726b+o+uSHv2nYSI9Ov1g8f2iOfk2twuVZj7lPuxdaowv03T16kC4khuHblv5DaW6of
         lqZ1L/19pP99d2SaUr5MrUrswDM0AWxqyJll1kCXNWj8WVxqpQHd8B0BByCzsmpOfeWl
         IEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xm2NZRov2Z0DZHUVUNuxZU3RdrU9u+uy5Cz8VRxL95o=;
        b=T6VM6CC3HDl8Hq5tSRqd0p5Mx1gH9GlEkd4CmtGEr8xFyNzWDm8lhwI3HmEf5JX+xf
         nzZMRgux5dRjKWiTDcOp3Je+v+Jnb6luwOkXlioBd/ukkXBeKojnZAqF3FNXg/M0DbTo
         /NN+qtfzkVQT3GegWYVpFRbf3BaGMevGqO2ywMBrOiRPyWtscYzOx6Vu9tUj+69tXPyM
         hQ/uZktGp3dhW5x4reova+YwMzqPGJ++OUcCuGgUEyOz/VCd9Ho0Fr5WxrxhuZ57xDdT
         qVhzytmn3wI0K5iL1+qEANOH3SAm9Fpdc3txhjHCNN0/hHcOe4+LZoKsPwJOUQy/KmQv
         xv4Q==
X-Gm-Message-State: AOAM532XxaW+yeaWmJ2hdRmyp4RXKyfKdiouZ15vWRUTHPuHimc97Wx0
	g0etJqgHmUVf2aeNsRA1SD1jsltmBVtGhA==
X-Google-Smtp-Source: ABdhPJyhzWmq5UuS+3UyHoUMBDMoWyS+P9NtUgy3xjVkLV/ItIBs5U7DFtjb74NkcD27iQzuOdlMSQ==
X-Received: by 2002:a17:90b:349:: with SMTP id fh9mr24171716pjb.73.1597028407703;
        Sun, 09 Aug 2020 20:00:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/19] allarch: Add missing allarch ttf-bitstream-vera
Date: Sun,  9 Aug 2020 16:59:17 -1000
Message-Id: <0d4e96b444931f84f93ca08fe238b5a3b35ce7b1.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Daniel Gomez <daniel@qtec.com>

allarch is missing in ttf-bitstream-vera recipe. Add it and include the
recipe in the SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS list.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31c02477a4fb91f19f8c3ef3f8bc9a20e416c859)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/layer.conf                                       | 1 +
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 43917d4c3c..0249f21d07 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -71,6 +71,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   grub-efi->grub-bootconf \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
+  ttf-bitstream-vera->fontconfig \
   gnome-icon-theme->librsvg \
   font-alias->font-util \
   systemd-boot->systemd-bootconf \
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 70b32cf8f1..3e1ba196b5 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -9,7 +9,7 @@ LICENSE = "BitstreamVera"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
 PR = "r7"
 
-inherit fontcache
+inherit allarch fontcache
 
 FONT_PACKAGES = "${PN}"
 
-- 
2.17.1

