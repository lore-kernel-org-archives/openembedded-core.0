Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.1070.1603478640417631654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EuECfSYR;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id j7so3208796wrt.9
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XQLBirX5HFzRmVKtTPy+a90+cvk4dB4NeQVPPcVWeow=;
        b=EuECfSYRcj3CtS9xCKeaGEB/LWituEs3yDPx/3ACaOsIEu09Wg+ojDRMWRYjAi5QpJ
         5wvDSNnO1x8y3+NPgmgWn+GmJsQgCMPr0+WC8GXkfMuHAxaUsQADOCgO/D44ucOnCZgZ
         fF8Rml8iyzI4WMc8fvaQxkYvrYXnlKuFdm0K5NbpH4hHfDyY8tOuUzSyWuWAmOxERl5I
         mEFLYl9D7TF3gnDeFaS9nGUN1DPZ/nOQ/4D1X4tAPbQZKEnrWitoFKhsJrzuOyZRluaw
         4FSFiSNbAaLnTooKtCNWGZtWwvfeQsilbkW0DQ26sIoeBB1QLhgwQYiawdsgQRS57aJv
         fZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XQLBirX5HFzRmVKtTPy+a90+cvk4dB4NeQVPPcVWeow=;
        b=m8Hz4Y1k8a7ZJ6Q2HbYNEd9loNfAm548C6mWDtSbwcpeXgEI6U0+HiOua0rspNmSG+
         +INupWuZW6Ljj3eQZebL0ASbJIqzRli0OfGB2/iyHZtvg2l4UWfILoVECkKbpEMnsxn3
         GzsjzqbfMtmZQlcHtIOIYZa7NSM9J69R4kE1KOx3g7EBnXK2Gh/3oibHo6GZToexnaam
         W+srJIdaqB/eNXrU5xw6vadsJCLvFHpr9BaH36472xbkUi/V3nMvSwdWilj/ox4URdGR
         3x6ghIAelREWvb7CfD0vJvs5g+hbRwBjFg1k3CBmPkefCGuOuF//mbJ1O+7uh9rWl1n8
         lOtg==
X-Gm-Message-State: AOAM531QrjyeXf6TEj8wsSBxeDdo6gfBe3Sj7DNVRF/d9L842hKDmMnl
	LPkaxkmD/mZlg25pl3T9qsh5k+gMLjPrNA==
X-Google-Smtp-Source: ABdhPJyeCBn+w8d1DbQkFff4eHStdI0rjY+UfvsXQqbOmZL7uRHG+ABz+Dk/Ah628WJzE4sWNpsefQ==
X-Received: by 2002:adf:e88c:: with SMTP id d12mr4015972wrm.21.1603478638570;
        Fri, 23 Oct 2020 11:43:58 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:57 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 15/21] gstreamer1.0-vaapi: upgrade to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:26 +0100
Message-Id: <20201023184132.3208737-16-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
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
2.29.0

