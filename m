Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.11167.1599130483901466466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 03:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=eo/yP7pV;
 spf=pass (domain: burtonini.com, ip: 209.85.221.67, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f67.google.com with SMTP id g4so2711780wrs.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 03:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ft5gKt1UUwU8Ju2AIPaX+AbjpVYb7+rS2XwV4BXGcUE=;
        b=eo/yP7pVhoORF07/y9RSxJDeONEHOtRXOxBcaVQoOdNXRbrHuw7l8lURwonkFOJbDU
         ylxFKir9xlHQAhGNG7hvHm7RXFZAPOIQHZ42sfuhW93YI0aeOA17iyECA9Z5dAjsCzsc
         ng+mNHHtgm/WDzsVASj9uGpSNw0z5KjRdwgO6sBswadvRPz9Tjf0WirVJPmJ8S5Ekdcs
         XwVKJCzvnAu0fmirfDpx7pV3Vv+MoT+TmP1Cx2olQAkHzZNnJxPdIgJnz3uouatIzxN3
         HKWKvDz4TS1EVq1Hk2qlBq9nmvY5xm9E7OlLb2SRla/viDoQ72un/wj5ht+/YPrnEqXL
         jPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ft5gKt1UUwU8Ju2AIPaX+AbjpVYb7+rS2XwV4BXGcUE=;
        b=RhgsPP+lw3xtD3qQ+qy4oOERaQUAr/B0i/qGK29ooDU1/9iEBF+2/n/G8SmttR9LLj
         0wmHNGjCg7rvPFt4vz8VEj5hQb6m4fP0wAXIrKxFXuJ2nLqDrcESOQCc1FoTxfKa1PWz
         zk+8pEGww6k2rqztlsZZiJN2mli0PnOYdinYsMsr9SPwvT+VLbGg4TQNahKptZEuNL0D
         eZxYEi641eLkm6uqpufPjUbdku/plLt26nJFHWgl8iTh27WsoYqMeYbxcE39D9U+/ww/
         99LZitvSMZPNa3N6Y/OCUoZkHfu9CnseXEAL5/1gM/op16hp9GG5eyjI/8dcQodUvWaY
         6EfQ==
X-Gm-Message-State: AOAM532GMY1on18Sn+Jc6v0uJD7tWAiQWwDfu7cneWLpnrioQ9z/Yi5C
	8D6fF2A4SMOcQxIZkWn4wie4K+HyCKDWIQvF
X-Google-Smtp-Source: ABdhPJyKEsR2pi9HeoiZWXl6QDqNDtlIohOQnWHrk152VaSJJmM4AFLBAWuTuAO9E1ILlmPWjQOrHw==
X-Received: by 2002:adf:fbc3:: with SMTP id d3mr1794741wrs.331.1599130481923;
        Thu, 03 Sep 2020 03:54:41 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id t4sm3748764wre.30.2020.09.03.03.54.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 03:54:41 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
X-Google-Original-From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gdk-pixbuf: add tests PACKAGECONFIG
Date: Thu,  3 Sep 2020 11:54:39 +0100
Message-Id: <20200903105439.4668-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the installed-tests toggle from simply respecting PTEST_ENABLED
to a PACKAGECONFIG, so that it can be turned on/off in the usual manner.

Signed-off-by: Ross Burton <ross.burton@arm.com>
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
2.25.1

