Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.15106.1602947731769783168
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 08:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RSoBQUbT;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id n18so6712874wrs.5
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XiiCWx0MTtyPptjEbiPc9of01IhuRhSnPVZuyfrvMlE=;
        b=RSoBQUbTsGpbyl09LHKdyVI5oeXUKVHYG8frK5h2/q/n7k7YHkI00KFiT1y9CPCmhG
         FbjPupenZxyZ7o9cBDiOJn6LrfW5rhNeW7DP7za5yYT6sUKcVdYcqbhCV6T7+bjI8CGq
         jMsDpILcUGbWFX8l7J0PQjvxX91QtdllD4Mz/cYN1eKGII5fZ5wpXGxMG0wzgEHiVnjU
         Dap0/pK31kT/JsY7Wyr9hsr0OhYNSUBthcqnNyv2egaXEDyHvn4g7dypAdKfHgr3Uu0i
         2ajgAkBsPQ8z9u3dCXqhizD/lK9ENyBPBb6uZ692ai1lapXXvnGC0tZJQcnvacrGuWZR
         b0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XiiCWx0MTtyPptjEbiPc9of01IhuRhSnPVZuyfrvMlE=;
        b=PYMfx76mBTrkzXvJjxmEKGtW/kAGR/dzQ3yfvhGDx5VnHNYPDdUgPQ3gCThtKymUoI
         I0olPxwyet/H9KUq102pGyNQvbfxML/q+lYz474i5+lTQTn95uRdGzaVa2QUwSxf+zMV
         0x6APiXJvqWuqTKJNYVIec2X1AmcFDtTxIcv63JoGMKt0euIBwVRJy1uRevZ2/5cY0ud
         wAJwKUBw+Rantk5P7t2vtpAiRHZvfS4Gu7lR+wzPs6Ro5SKncgcJ30Q+DPnNpB9F8u1O
         emz+qzT9qAfXmGndy4ZMO///Ig4p+CH8KXcrgj+Czip0WtjVtOZLOHmhKGt15czRqJqR
         M8vQ==
X-Gm-Message-State: AOAM530PazqgDbozgczU8rCgdiPBgdFlF0Cw05k33fOiPMf1+BnUUn+9
	/S9jFGhsMn4g2MEJjaA9AZn/e867yClqTQ==
X-Google-Smtp-Source: ABdhPJwgejpuFgKAg92qKzcjHujr/Ts+18MogzXayFf/4bPExe3oqSiBUKf7+YpOYB5wMAVBo/kwgA==
X-Received: by 2002:adf:ecc1:: with SMTP id s1mr9957821wro.120.1602947729958;
        Sat, 17 Oct 2020 08:15:29 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id m1sm7637380wmm.34.2020.10.17.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 08:15:29 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 08/13] gstreamer1.0-vaapi: upgrade to version 1.18.0
Date: Sat, 17 Oct 2020 16:15:19 +0100
Message-Id: <20201017151524.31550-9-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017151524.31550-1-quaresma.jose@gmail.com>
References: <20201017151524.31550-1-quaresma.jose@gmail.com>
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

