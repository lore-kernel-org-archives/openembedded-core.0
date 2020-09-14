Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.62221.1600092738286740334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oCe16inq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d6so12741578pfn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AWrwqEXkJlxRed/CBw9h9BJzkqVWGEbp2pwKDqilBkg=;
        b=oCe16inqkfkbhMlZ85+hIM2J81U7aDYkBRDT4d1Qu5Y/4JJBfq1uQWBW5j59IcQeq4
         sWOOLhVJL9lezgUYRW/KMHxeD//+ehRJsGO9nfP1ILBuSdHFMkpGrwmx0DrWkGi5MGrp
         qm/kiE8FdsiIV1Y3aX8/h2I5gKdvCJ1uJA8Z6c1//HuIVc3g77SZxGqPMNamxH/r8MFq
         R8KFy+WBrE3OzbsCJSf3r1L7d5ql5uuHprSM8Jlf1cWTobDpR6nGKvkI3LHrDifdM1+m
         Y/XsmN0srXhC3cPgBAN1uD41cRkX327Nr3ntzh9zaCAkc4jhdsGuX2aHzqdXqD+Kz/J1
         de3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AWrwqEXkJlxRed/CBw9h9BJzkqVWGEbp2pwKDqilBkg=;
        b=irMH3dRBuvJzc57PrXehhaXoY9uoo1gyMgsw01hEKz4Nde1RvEq32kqGMF05vjV31b
         nFyXQ3rChk0o6QlHxhhf54QI5T5QWs0cd0uxFdSTFoD5t7UffxgxFWOjpPSfftF02jum
         LBbt+DVZxW7CjCD1uoapVRv2UgTinOlN5IR37JZDs/SNVywq0SP8gGqOV1nSAvoZkbjt
         cX0UWG1iVv9/uPmXLEyKOt1YjiTHeiR2YonvTiXVyMo+lIdSgXMXyWvio4xO5kV30j5y
         ojeMvGQbTKhtV6BXN4LCtLg18wwS4vaJ3td87R8BbFXkJauxJcTxdxw01pq/Q0Z1x8VV
         eO5w==
X-Gm-Message-State: AOAM533Fo5VEILhj3XHGRw9kHl5ydLu2shncvB3FCVvw3jtryMXSZ9Hw
	3yaHNmclPEzJhr0z8bCVvS3B3LSqsuQDAhIC+tg=
X-Google-Smtp-Source: ABdhPJwD0Eli+xLuB6+BQzlcnKZl06fN4ghgLWeh3pNMiKfW/6imgknoZx+kIqxHOUHD/bFGNQL6bg==
X-Received: by 2002:a63:fc41:: with SMTP id r1mr10897583pgk.179.1600092737362;
        Mon, 14 Sep 2020 07:12:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/24] gdk-pixbuf: add tests PACKAGECONFIG
Date: Mon, 14 Sep 2020 04:11:24 -1000
Message-Id: <02a1d8edc42961a4d97e6cd8d6e7cc573e1c1486.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Convert the installed-tests toggle from simply respecting PTEST_ENABLED
to a PACKAGECONFIG, so that it can be turned on/off in the usual manner.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 08e61ffae6056055b56f93678bcbb9fd71f3303e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index d0df5015a5..0405fa78b5 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -40,20 +40,20 @@ inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even
 
 GIR_MESON_OPTION = 'gir'
 
-EXTRA_OEMESON_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dinstalled_tests=true', '-Dinstalled_tests=false', d)}"
-
 LIBV = "2.10.0"
 
 GDK_PIXBUF_LOADERS ?= "png jpeg"
 
-PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${GDK_PIXBUF_LOADERS}"
+PACKAGECONFIG = "${GDK_PIXBUF_LOADERS} \
+                 ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+                 ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
 
 PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
 PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
 PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
 PACKAGECONFIG[jpeg2000] = "-Djasper=true,-Djasper=false,jasper"
-
+PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
 PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,virtual/libx11"
 
 PACKAGES =+ "${PN}-xlib"
-- 
2.17.1

