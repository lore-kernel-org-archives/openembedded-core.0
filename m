Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.8992.1618733801215547229
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 01:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MheRVaQb;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id h11so3518987pfn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 01:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+anTLplYgOQ/5SGsabVSMWoqWG4+dnKi0EHXSiZIE+U=;
        b=MheRVaQbmspcY8RraC62oH/bPAt3veC7/AxGvOHADWYuNpo5bkbqF/BlPQInCecFBG
         W1lVTKmgv5RNUzT6EtKLYro/TD6tcNeQGsK4Jw783LvvM7b4UXLypwU/zbgdpd4AjEcH
         F51BIFXY+E7GGcpYqbeewr4595sp8riPqgTmcM26GR8xJ11LeG0DNHKpAL30siNO/1do
         OiITeaX2r4D1z9TXreivmCaROOt5U+y/gEoR9e8x9ZVnIIQoIfqHjWlA2kgkb8UEi451
         rNnK/nDXJW0C0zOOxwntIfhZoHPnzd1IyO/4uy0fiI7ikdhCAjueDoXP9BFDEFNu8rL8
         zG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+anTLplYgOQ/5SGsabVSMWoqWG4+dnKi0EHXSiZIE+U=;
        b=sON2sPeLCpJSyPTiOg2K3epnjtoFwY8WwQYV0HhPd8fjByUovWDs8HSDGDaKbTLggV
         +AdvMg2Vu8xFbL1vSZAmaaUoix0vM3r4CTY80VN1x1t5pXp0khNAUWHaEHvBA/loc+Fr
         VkL1tJ3KQ/HGJvifxvqp3RWpak5uvbS6oAUralx4vagE56bwj9+k355RWuyyIB/n2xx9
         GLVkNJ3lBIcAovZ4PAxQdKZcCoOzJZhzDAf3LcDMoLRVityXaTvfw1NSILx6HIJ089kM
         Y/GWtIu/aFBIbMYtqM7QXhLtPy28tvBcYdlA7+GEb3wpbT7NdT8U3MBoYz8P/pi2l8M2
         Z5xQ==
X-Gm-Message-State: AOAM532bBXM1eST+WkkOl4R9y3vaCaprSHU+Re0+wKwHJM9bBB5FqHrX
	q/XoyNl4Qu8kYWUMJlaZVTTM4waJ/lvO6w==
X-Google-Smtp-Source: ABdhPJz0ex6xnH4hVoQ5yRXuHLbG5v1QJOG21rOsO9b1Sitn0FUr3QWV5iYmepTKh6DlZO57HWNAAA==
X-Received: by 2002:a63:f212:: with SMTP id v18mr6600174pgh.343.1618733800559;
        Sun, 18 Apr 2021 01:16:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id g2sm2339211pju.18.2021.04.18.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 01:16:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/6] gstreamer1.0-plugins-bad: Add packageconfigs for hls crypto backends
Date: Sun, 18 Apr 2021 01:16:33 -0700
Message-Id: <20210418081634.3169548-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210418081634.3169548-1-raj.khem@gmail.com>
References: <20210418081634.3169548-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use openssl by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb      | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
index ce2082ee32..96f01391b4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
@@ -28,8 +28,8 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
-    bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming sndfile \
-    ttml uvch264 webp \
+    bz2 closedcaption curl dash dtls hls openssl rsvg sbc smoothstreaming \
+    sndfile ttml uvch264 webp \
 "
 
 PACKAGECONFIG[aom]             = "-Daom=enabled,-Daom=disabled,aom"
@@ -45,7 +45,11 @@ PACKAGECONFIG[dtls]            = "-Ddtls=enabled,-Ddtls=disabled,openssl"
 PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
 PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[fluidsynth]      = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
-PACKAGECONFIG[hls]             = "-Dhls=enabled -Dhls-crypto=nettle,-Dhls=disabled,nettle"
+PACKAGECONFIG[hls]             = "-Dhls=enabled,-Dhls=disabled,"
+# Pick atleast one crypto backend below when enabling hls
+PACKAGECONFIG[nettle]          = "-Dhls-crypto=nettle,,nettle"
+PACKAGECONFIG[openssl]         = "-Dhls-crypto=openssl,,openssl"
+PACKAGECONFIG[gcrypt]          = "-Dhls-crypto=libgcrypt,,libgcrypt"
 # the gl packageconfig enables OpenGL elements that haven't been ported
 # to -base yet. They depend on the gstgl library in -base, so we do
 # not add GL dependencies here, since these are taken care of in -base.
@@ -148,4 +152,3 @@ FILES_${PN}-freeverb += "${datadir}/gstreamer-1.0/presets/GstFreeverb.prs"
 FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
 FILES_${PN}-transcode += "${datadir}/gstreamer-1.0/encoding-profiles"
 FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-1.0/presets/GstVoAmrwbEnc.prs"
-
-- 
2.31.1

