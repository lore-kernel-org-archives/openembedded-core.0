Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C24ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:24 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.51631.1661624775445698444
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lAwTUQrL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so538506pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=yPfNFF880vWcGG/+og4zaisuM9wDuTE51QtmhQgxA2c=;
        b=lAwTUQrLfKgo/0XA2nGQrWzkbOZKnEZ5hMC4XUB6jshQUICPoZQ46GabwbnZauu7gR
         9QcZwCGVWkCdBFOMmbqM4whSkUN1S6O5KHw0T/c86ZqOSBm5wCYz9c9LA3SCSc1K3Eg1
         B9H43yYZENGkhUzCoEfoCctYCriktGuYRcdf8zGua/Rou/LPqmtyDFbDfFylqkvA3svJ
         R8YpX97s2laE/zKdzmdZndHS/1dsV75i1pY+wg2o2Jhg6JQKlrPNpbq443Xnphwbt5HF
         0RwoZvp5yLxAGHLR/fYd3BM99D5j4qcogSQFLkvSmi94faOFhW+0J5c0rUzrJgPHuQ0p
         RD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=yPfNFF880vWcGG/+og4zaisuM9wDuTE51QtmhQgxA2c=;
        b=1ZjFaLq88Ld1wc/0y6CXdaKf+JsuhC40MBbZ1Hm4ZqceY5/fygqIp5nvjNEl1lW2Zm
         0VsbjTIQbOGn6D2nayb4OpfNOe+ZJVqxGLcpdccV5ax0La+9lDEpRBs10oI4XnB9IhOP
         yB05hIFuHMzwyipahcELll8LQKTQcJGpPZFa2nfkE9ymAn03oJhf9wZpAssRHwGck6Of
         KOFF+bkrntaMJ3vcKbKiKDfNQy7KfUDILBgJdYW1TI33N5id4/uYBF8V4tq4G6AGeSNu
         fFBNd46GBtJ4v5UKjhG5NZg+lU6177Upz33n67b5PsEeocluRgfYHp19pefra2Jyup1D
         A3Hg==
X-Gm-Message-State: ACgBeo3u6cmafk+fdTKNpCbrIPZ0Fush/Gc1kX9vALOTj6rKk0rZe19o
	owfw1ZS4UHz9+iBB+BDdQZ0FiywK9ABadl7x
X-Google-Smtp-Source: 
 AA6agR7bEfWI9wg+giIA4f0Xyx1cENu63IEwS++dP8aONWFajcHAtf8s0bu6v5ywONOXu4Kng98foQ==
X-Received: by 2002:a17:902:b08d:b0:172:e2f8:7f1f with SMTP id
 p13-20020a170902b08d00b00172e2f87f1fmr8714091plr.21.1661624774398;
        Sat, 27 Aug 2022 11:26:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/24] gdk-pixbuf: upgrade 2.42.6 -> 2.42.8
Date: Sat, 27 Aug 2022 08:25:29 -1000
Message-Id: 
 <11b736d546088d4d025870d68fcaa20f310f7e9a.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169946

From: Alexander Kanavin <alex.kanavin@gmail.com>

2.42.8 (stable)
===

- Clear the pixbuf's memory buffer to avoid returning uninitialized memory [#199]
- Turn GdkPixbufModule functions into typed callbacks [!123]
- tiff: Use non-deprecated C99 integer types [!124]
- gif: Check for overflow when compositing or clearing frames [#190]
- Change png/jpeg/tiff build options from boolean to feature [!118]
- jpeg: Do not rely on UB around setjmp/longjmp [#143]
- Build fixes [!114, #185, #182]
- Documentation fixes [!120, !125]
- Translation updates

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8398c88c6d950781709a112446d6a320e624346)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gdk-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.8.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.6.bb => gdk-pixbuf_2.42.8.bb} (94%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
similarity index 94%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
index 55c16e4d66..fb6829a7d1 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Add-use_prebuilt_tools-option.patch \
            "
 
-SRC_URI[sha256sum] = "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
+SRC_URI[sha256sum] = "84acea3acb2411b29134b32015a5b1aaa62844b19c4b1ef8b8971c6b0759f4c6"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
@@ -39,9 +39,9 @@ PACKAGECONFIG = "${GDK_PIXBUF_LOADERS} \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG:class-native = "${GDK_PIXBUF_LOADERS}"
 
-PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
-PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
-PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
+PACKAGECONFIG[png] = "-Dpng=enabled,-Dpng=disabled,libpng"
+PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
+PACKAGECONFIG[tiff] = "-Dtiff=enabled,-Dtiff=disabled,tiff"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
 
 EXTRA_OEMESON:class-target = " \
-- 
2.25.1


