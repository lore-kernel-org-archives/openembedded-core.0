Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C53C433FE
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:18 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.2540.1633304537222425338
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LbddMKb+;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso6178572wms.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4pH1H/CDSCA58CUik4ROo7n4l0pqhGYybRP0GSOCmqU=;
        b=LbddMKb+vSHsoBlVQKZol3lrDSkT8ISw3gfVUbdpE+Wum0joKGpZXOta6HA5718Inq
         sJYw8LSQtjPqQ7AfKEJgVtqY2BVgPhFoAZlOGExIh3X5rOq88vCb2kjoLVCrEINlm9Wv
         ChUYve6dZ/jZH5K9KpPnMJC6WuLO46nP8jgB0NG0JXZ7QIerhpt6Yw+duE0eMnKPBqeI
         6wvIjzmTxum19GcL+z/RMyaja2pRwdK6OA3kPVUNXDSl+x5vbU5mcefYikAkE8IJ802n
         AcLT73cF1jioK23S2lROVjj8sn9rS1xuhSTCr0fjyfuWGK3RMdv50iHrempR8mPkAUO4
         V9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4pH1H/CDSCA58CUik4ROo7n4l0pqhGYybRP0GSOCmqU=;
        b=HCebr/TM8gzsmJtupFoiOOYGfpHH7mKRIWM1jpbmMNuGu63mgPphECyAJyYzZqqqZj
         jekVvlrLA30dcE6KcmypBcG9ZnvwTpBQD+6xddX/d0XiiVNOiDBy97K5uBdUxQL3m01I
         V3EsKofbXBp93OnEmV88Iuhjn/y2QAgnsgqciS192BGIeMkNNA8q0U7z13oLuInCWXm8
         D8MdABDtP6BXTrjo6MgMAER/7QQ/xycv4xC68DPQ75xenW1hJ0ZVoOqNqrvl+6b05Jnn
         OuITvz2zR+revaYDeX8K+i5394NqcZ3uIeGzfZWiIpGGue0Yb+0tVsr3+NgB41mDwbbR
         Crcg==
X-Gm-Message-State: AOAM532E7VZKeE/vpHthCJrYyt9FpGTpt8nuhE4R7NCRtj4z9AhAdqQz
	WxtlOGyIqqWdmmwfDdinXp9wJl8pdZQTwA==
X-Google-Smtp-Source: 
 ABdhPJzpGAUnnjvIVSnAqiOroI67T5seZeUTimPK7wfGBuAAc1OwEzKY8IFhQiB5CwsXIWi+KBV/gw==
X-Received: by 2002:a1c:411:: with SMTP id 17mr2733921wme.158.1633304535401;
        Sun, 03 Oct 2021 16:42:15 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:14 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 02/12] gstreamer1.0-plugins-base: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:41:56 +0100
Message-Id: <20211003234206.949967-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156566

Drop backport patches:
    * 4ef5c91697a141fea7317aff7f0f28e5a861db99.patch

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...c91697a141fea7317aff7f0f28e5a861db99.patch | 50 -------------------
 ...bb => gstreamer1.0-plugins-base_1.18.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.4.bb => gstreamer1.0-plugins-base_1.18.5.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch
deleted file mode 100644
index a2f5dff5e9..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 4ef5c91697a141fea7317aff7f0f28e5a861db99 Mon Sep 17 00:00:00 2001
-From: Xavier Claessens <xavier.claessens@collabora.com>
-Date: Mon, 26 Apr 2021 14:25:03 -0400
-Subject: [PATCH] gstgl: Fix build when Meson >= 0.58.0rc1
-
-"implicit_include_directories: false" now also means that current build
-directory is not added to include paths by default any more. We have to
-add it manually because we have some custom_target() that generate
-headers in current build directory.
-
-See https://github.com/mesonbuild/meson/issues/8700.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1125>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gst-libs/gst/gl/meson.build | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/gst-libs/gst/gl/meson.build b/gst-libs/gst/gl/meson.build
-index 66668644e..53891625a 100644
---- a/gst-libs/gst/gl/meson.build
-+++ b/gst-libs/gst/gl/meson.build
-@@ -1004,11 +1004,20 @@ if build_gstgl
-     command : [mkenums, glib_mkenums, '@OUTPUT@', '@INPUT@'])
-   gen_sources = [gl_enumtypes_h]
- 
-+  common_args = gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL']
-+
-+  # We have custom_target() that generate headers in the current build dir,
-+  # but with implicit_include_directories: false, meson >= 0.58.0 won't include
-+  # it by default. We cannot use include_directories('.') here because it would
-+  # also include current source dir which is what we want to avoid because
-+  # case-insensitive FS would include gst-libs/gl/egl/egl.h as EGL/egl.h.
-+  common_args += '-I@0@'.format(meson.current_build_dir())
-+
-   gstgl = library('gstgl-' + api_version,
-     gl_sources, gl_egl_sources, gl_x11_sources, gl_wayland_sources, gl_priv_sources, gl_enumtypes_c, gl_enumtypes_h,
--    c_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
--    cpp_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
--    objc_args : gst_plugins_base_args + gl_cpp_args + gl_objc_args + ['-DBUILDING_GST_GL'],
-+    c_args : common_args,
-+    cpp_args : common_args,
-+    objc_args : common_args + gl_objc_args,
-     include_directories : [configinc, libsinc, gl_includes],
-     version : libversion,
-     soversion : soversion,
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
index 90a8d7dfbb..5e2cca3864 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
@@ -11,9 +11,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
-           file://4ef5c91697a141fea7317aff7f0f28e5a861db99.patch \
            "
-SRC_URI[sha256sum] = "29e53229a84d01d722f6f6db13087231cdf6113dd85c25746b9b58c3d68e8323"
+SRC_URI[sha256sum] = "960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.33.0


