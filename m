Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.18817.1603023036470827165
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GyK2w8aX;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id y12so8329862wrp.6
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qwVP9epTClDYiP0QGOKTVU8EW04YNG4MJkjFTj71d4U=;
        b=GyK2w8aXWF+igSuFz1WKmZ8M1qH5vcUiAAZPIP8GyHWAu8Ww5Xu/SokwLEE36FS8gs
         E0Vyk/1diptFIV8Bs/7wTlRp/z7IO0iH0nS8tnOkyCsBHZLGfw5a1mwSezDfxqmH5pYp
         sinGzcaeKR+yLk1XT2Ru3NMPBZFCaeg+uCtV9EKISb9zMsfgWGUWKeWIsDsa4pF2wwiT
         VyDp4YTk3QmV6NhpwIF0J3IVoioVRpJlyMsRK7a/dWz+KcM0UsgipC/iXT4H3rCeAfUq
         k4V4z+JyjtLiwjHIdQplAVCd+EWP9n4kzBvRzD1m6xs3CbvoZr3I53kIWodp0ZVQ7a7b
         yPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qwVP9epTClDYiP0QGOKTVU8EW04YNG4MJkjFTj71d4U=;
        b=icPzKGGJUOz6WjyEDDHX73o6QRVX61h/Y940xdlSpLlOAj1r3QC8HJ1eD09YWC6RRO
         297FcyOEBywWIEm16+IoeYQOTSIaxTw9h+euMX8MiaaLpjEmUHf33EYPJBBFuZYVPWcM
         52timHcrBejswKNN/SUFTl24axWd1ogOPOGXTwJivZaAj6cjcnRlz9IcGncgeDZ8t99C
         PaMCdOJvtC7JT9NctRoV+uK9sv8XE0caz46eFPunYAKqobPxDiLO6LoCKlklO5mfAXXI
         Ks/Sqm9G6z8Dvj683iMQpFLePAvnDvQm3LblTye15RyPmzuRVwRau9nbBT+LCrY2xVRI
         GTxA==
X-Gm-Message-State: AOAM531maSImjMSNRYGb6DcpK6gw4/uSkFghbEyYdbFDw+5Dd8+i4u1s
	uvGMyMsU0i2x1FwDq1OObIqEsuPqcdCj9w==
X-Google-Smtp-Source: ABdhPJzpxJlOrjG1FuHK3Bbe0Vss/qPAXwHcNQgNuI3FDHDA9amjSybOZwx4Xgf8kwgiF3lF/cel3A==
X-Received: by 2002:adf:e38e:: with SMTP id e14mr9234147wrm.168.1603023034632;
        Sun, 18 Oct 2020 05:10:34 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:34 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 15/20] gstreamer1.0-vaapi: upgrade to version 1.18.0
Date: Sun, 18 Oct 2020 13:09:57 +0100
Message-Id: <20201018121002.1417335-16-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-vaapsink-downgrade-to-marginal.patch
      Removed since these are included in 1.18.0
      https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/-/commit/13d090b5660a2e2e2c997db44ba9a391101e8bd6

    API and plugin documentation are no longer built with gtk_doc.
    The gtk_doc documentation has been removed in favour of a new unified
    documentation module built with hotdoc.
    Distributors should use the documentation release tarball instead of trying
    to package hotdoc and building the documentation from scratch.

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
index 1bedf25128..60a975bf4d 100644
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
+    -Dtests=enabled \
 "
 
-GTKDOC_MESON_OPTION = "gtk_doc"
-GTKDOC_MESON_ENABLE_FLAG = "enabled"
-GTKDOC_MESON_DISABLE_FLAG = "disabled"
-
 PACKAGES =+ "${PN}-tests"
 
 # OpenGL packageconfig factored out to make it easy for distros
-- 
2.28.0

