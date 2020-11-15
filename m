Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.19843.1605448882923947666
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 06:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qrkjtcep;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id a3so21235435wmb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2020 06:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhcBsKfrF0ZBJfNVrr3bMOzNjd7FNemjrzETrmVtWe0=;
        b=QrkjtcepmHHkT73Hl0/9wMdPJQRbKefH2KVucQ7PhUR3jTmEm6GxLCpJbgoBdXZOoI
         lnIT41VroEd0ejZD3G2Ux74KeefbX/NPD+Be2OuITyyfW48cc/fkG6iup9BDCveCi28L
         qxSRKxOKyqS+5BCqBEhDdxeHy1nzt6UxbnKGazNR53jSwjieRshmnZXHlBc3NiarXRjP
         9N4Q87d+GW8mREJoTiIt/Yqmg3r5EZoudRcgN8NYWIVRBp7/EwI7CiunwJoVnCpy79z1
         5xRe9UKVyuMFX4ElQtDeCFXCMw/9VJUogV7QZgGnkNWKWcAt32wdJLk9/XVS4yM0WpyU
         R90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhcBsKfrF0ZBJfNVrr3bMOzNjd7FNemjrzETrmVtWe0=;
        b=orMFbMqOHUJbfUEY2z08w/2xesfeFQPplKzuSwPl2vKclWw9oxBQxOkjxdoE+ioBVT
         EgqxaYz6DLTfmqFT9PW3fQoqcesk0oDJw46B1QtBsPyV7BWtMBaFDEI99K26JW6JS/8D
         uDnKjwiH+IHiqsM7jUCvAHYAOuK0XCVmqTo9sOzY14M4wPZ2RpK9JjeeGyYhi8Sygs1x
         OYAjJ0E/Gs73sGNrstHPw6e4KBZypXDe4olSKfqkQbhFRSZVRj2l8nrsXv3saXX0TjTX
         8LFNuZThHp2wKOGlgkBmoZLwF3KRAPpI5QZRjqIZuNaoHRoRRGcSKsgFXss+IrvkJkSg
         MWGA==
X-Gm-Message-State: AOAM530/s7kdcbctWcC8GmMeNhqCLylMXcVsrbjV7hjpqyvdDPyPYCve
	WFu6QPiWosUNrdq87+hNWOwOJWzYmlJQ4Q==
X-Google-Smtp-Source: ABdhPJxZMuHmNPAxXnG1QpPXQMTqpfVC6FrsmNqYSdXVGEIFH2BFEuYK+t2UGLkZ+ovEuizqGEdVLw==
X-Received: by 2002:a1c:e3d4:: with SMTP id a203mr11506452wmh.177.1605448881113;
        Sun, 15 Nov 2020 06:01:21 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 36sm2125900wrf.94.2020.11.15.06.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 06:01:20 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] gstreamer1.0-plugins-good: add package config knob for the Raspberry Pi
Date: Sun, 15 Nov 2020 14:01:07 +0000
Message-Id: <20201115140107.929770-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch
      Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/818]

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...hostif-library-as-it-is-required-to-.patch | 32 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.18.1.bb       |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch
new file mode 100644
index 0000000000..685ee08e50
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch
@@ -0,0 +1,32 @@
+From 3ec4fe5507a39383b161f1ab7687acb4a57c32f8 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sun, 15 Nov 2020 11:30:07 +0000
+Subject: [PATCH] rpicamsrc: add vchostif library as it is required to build
+ successful
+
+fix: undefined reference to `vc_gencmd'
+/usr/src/debug/gstreamer1.0-plugins-good/1.18.1-r0/build/../gst-plugins-good-1.18.1/sys/rpicamsrc/RaspiCamControl.c:1440: undefined reference to `vc_gencmd'
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/818]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ sys/rpicamsrc/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys/rpicamsrc/meson.build b/sys/rpicamsrc/meson.build
+index dc18a8345..48b2ceb66 100644
+--- a/sys/rpicamsrc/meson.build
++++ b/sys/rpicamsrc/meson.build
+@@ -34,7 +34,7 @@ if not cc.has_header('bcm_host.h', args: rpi_inc_args)
+ endif
+ 
+ mmal_deps = []
+-foreach rpi_lib : ['mmal_core', 'mmal_util', 'mmal_vc_client', 'vcos', 'bcm_host']
++foreach rpi_lib : ['mmal_core', 'mmal_util', 'mmal_vc_client', 'vcos', 'vchostif', 'bcm_host']
+   l = cc.find_library(rpi_lib, dirs: rpi_lib_path, required: false)
+   if not l.found()
+     if get_option('rpicamsrc').enabled()
+-- 
+2.29.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
index bc7550f40b..77e1333ddc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
@@ -2,6 +2,7 @@ require gstreamer1.0-plugins-common.inc
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
+           file://0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch \
            "
 
 SRC_URI[sha256sum] = "e210e91a5590ecb6accc9d06c949a58ca6897d8edb3b3d55828e424c624f626c"
@@ -47,6 +48,7 @@ PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
 PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
 PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,libsoup-2.4"
 PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
+PACKAGECONFIG[rpi]        = "-Drpicamsrc=enabled,-Drpicamsrc=disabled,userland"
 PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
 PACKAGECONFIG[v4l2]       = "-Dv4l2=enabled -Dv4l2-probe=true,-Dv4l2=disabled -Dv4l2-probe=false"
 PACKAGECONFIG[vpx]        = "-Dvpx=enabled,-Dvpx=disabled,libvpx"
@@ -63,7 +65,6 @@ EXTRA_OEMESON += " \
     -Doss4=disabled \
     -Dosxaudio=disabled \
     -Dosxvideo=disabled \
-    -Drpicamsrc=disabled \
     -Dshout2=disabled \
     -Dtwolame=disabled \
     -Dwaveform=disabled \
-- 
2.29.2

