Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.39516.1602506210244143724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GHbkXbPv;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id y12so13630585wrp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XiiCWx0MTtyPptjEbiPc9of01IhuRhSnPVZuyfrvMlE=;
        b=GHbkXbPvVYmcTSqyA9vIyAicMOpSy2og2T2hcNQk+9hp9LHcq4p/mN4W6M2FZ19cSM
         v4lD4c2LZxTTsddI2gBJY0WzZgFMCM1FODyIgly38tcJG9lCPvDpg74LI68/Br/wxRCM
         n/ij4mYN04em1Li/yJfyOPdZsDAOErEl7XAFITBtumlrkHNWI28E6DBH0pHez40n3hRY
         DS+K81ffuWMZ7XKWpZ6HET1WuElA23Grx9BaIzboByeu0Llc07fM+uxPV8THjzdRxSti
         5MV/0I5IMTn2MLHPt6y3z8j7mhh19UbX4Poum/5FCL98e97OeOyOKOUWIYlENKnSjs8p
         /aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XiiCWx0MTtyPptjEbiPc9of01IhuRhSnPVZuyfrvMlE=;
        b=m3zNC1gGUHIdDiqV9NghrITCRqEw/iZL463vI8Ar7vMYYrGNLk7KL9mYpz92eLfB6p
         twoSzP86KZ2V1VrxmlJAnROEZoMSo+LU4VJF4azutYAX2gCFCCqQqGVCycTW0GEZu00o
         sW1RnV00x4iH9OeRRxo+XRBYbHccA0bvu4vIZPVP+BhqJ1iqTvcNVWvoYtaLSVXlUb+I
         QgOxJM5LsIPXUG1yleQcbaAz5qtsAzi3qPdEjwznUzGL3ipyM08dCrJQb+BmOIZt+Tif
         7l5+00V7UmTy29V2TQ6G7xeuQOHRY84HMdyKNVJ8UfXICKGEbEyg7GrQlN2FfFMeCgTS
         TQ3A==
X-Gm-Message-State: AOAM532MoPaSZpau8jeWuQUvYX/Vgl2lEWLuEi3oR0qXHDwJcU3Xw05I
	+Ufs7eJiXuyC+9Y1872rFnvbVH6IVtn54A==
X-Google-Smtp-Source: ABdhPJwMnH3wP1LdD0bnJhNy/9g1rWm7CcwKiJL82TvHXcO8DbANJCOAAIUai8KDXKIGKisFWwktAA==
X-Received: by 2002:adf:8484:: with SMTP id 4mr30884928wrg.334.1602506208378;
        Mon, 12 Oct 2020 05:36:48 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id i14sm23076089wml.24.2020.10.12.05.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:36:47 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 09/13] gstreamer1.0-vaapi: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:36:16 +0100
Message-Id: <20201012123620.2095778-9-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123620.2095778-1-quaresma.jose@gmail.com>
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-vaapsink-downgrade-to-marginal.patch
      Removed since these are included in 1.18.0
      https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/-/commit/13d090b5660a2e2e2c997db44ba9a391101e8bd6

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../0001-vaapsink-downgrade-to-marginal.patch | 46 -------------------
 ...1.16.2.bb => gstreamer1.0-vaapi_1.18.0.bb} | 16 +++----
 2 files changed, 6 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.18.0.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
deleted file mode 100644
index 7945a923c9..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0c28cf7bfa90f8947833722cddf23d513490c6c3 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Wed, 28 Nov 2018 15:08:48 +0800
-Subject: [PATCH] vaapsink: downgrade to marginal
-
-Using vaapisink with default poky configuration results in an
-unresponsive display as of today because DRI2 rendering is currently broken
-in non composited environments [1] and libva doesn't support DRI3 [2].
-
-Downgrade vaapisink to marginal for now so playbin (and in turn gst-play
-and gtk-play examples) use xvimagesink or others out of box.
-
-[1] https://gitlab.freedesktop.org/xorg/xserver/issues/13
-[2] https://github.com/intel/libva/issues/122
-
-Upstream-Status: Pending
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- gst/vaapi/gstvaapi.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/gst/vaapi/gstvaapi.c b/gst/vaapi/gstvaapi.c
-index 9a82454..4d94f2b 100644
---- a/gst/vaapi/gstvaapi.c
-+++ b/gst/vaapi/gstvaapi.c
-@@ -195,7 +195,6 @@ plugin_init (GstPlugin * plugin)
- {
-   GstVaapiDisplay *display;
-   GArray *decoders;
--  guint rank;
- 
-   plugin_add_dependencies (plugin);
- 
-@@ -220,10 +219,7 @@ plugin_init (GstPlugin * plugin)
-   gst_element_register (plugin, "vaapidecodebin",
-       GST_RANK_PRIMARY + 2, GST_TYPE_VAAPI_DECODE_BIN);
- 
--  rank = GST_RANK_PRIMARY;
--  if (g_getenv ("WAYLAND_DISPLAY"))
--    rank = GST_RANK_MARGINAL;
--  gst_element_register (plugin, "vaapisink", rank, GST_TYPE_VAAPISINK);
-+  gst_element_register (plugin, "vaapisink", GST_RANK_MARGINAL, GST_TYPE_VAAPISINK);
- 
- #if USE_ENCODERS
-   gst_vaapiencode_register (plugin, display);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb
index 1bedf25128..a32da85c4d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb
@@ -8,28 +8,24 @@ REALPN = "gstreamer-vaapi"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
-           file://0001-vaapsink-downgrade-to-marginal.patch \
-           "
+SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "13f7cb6a64bde24e67f563377487dcce"
-SRC_URI[sha256sum] = "191de7b0ab64a85dd0875c990721e7be95518f60e2a9106beca162004ed7c601"
+SRC_URI[md5sum] = "079a3739857e0cf4904afe92659d8a18"
+SRC_URI[sha256sum] = "c6efeb8c736f75bb1b53ab18413c60c4321300e7aee66641bcc07d59c2fe9e31"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 
-inherit meson pkgconfig gtk-doc features_check upstream-version-is-even
+inherit meson pkgconfig features_check upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Dexamples=disabled \
+    -Dtests=enable \
 "
 
-GTKDOC_MESON_OPTION = "gtk_doc"
-GTKDOC_MESON_ENABLE_FLAG = "enabled"
-GTKDOC_MESON_DISABLE_FLAG = "disabled"
-
 PACKAGES =+ "${PN}-tests"
 
 # OpenGL packageconfig factored out to make it easy for distros
-- 
2.28.0

