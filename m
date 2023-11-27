Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6FCC07E97
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.91948.1701080286084166235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Va1sfiZt;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54af4f2838dso3700752a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080284; x=1701685084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNCNIBsF39wFTF2a++aDgLD2kjNpILGa2j3C9HGTbYw=;
        b=Va1sfiZtzqYTUVKE9UKxlC+/4Q0hgBRBYwAsWzjK2GY32/sFkZlWkdM1SoIWFHpC8j
         D3txKyDTLbffkojnbOg0ngcS6JhVoxIiyL0Fa1x3pl7rNQB/KVGaRwu3G5sBn4PxjSTz
         aHLFh+XgeKYAEke9V9imL/PuYNXgrQzO8cYHc+OPVZNG08JYTrkhDaqUigfv63hnG7y9
         y0OMQBkYDQp/+M/5kGxCXsxyOiLGiE3RJOp6A+6+hgelBhvluk6S6gpg2LXhix8BOihT
         a85Jw3vSpKayLtEY/ngFSfkFS9k2GgONQD4ZhzwcYNUTJhUo4J3DdSN7r/LYEFpRKnxq
         CIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080284; x=1701685084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNCNIBsF39wFTF2a++aDgLD2kjNpILGa2j3C9HGTbYw=;
        b=CEj15AHW68hu59AvkZmKuZskU3J2okM45jonnlHzx1envW/IGw4eT8mPjpOWFWYCQQ
         8j+DpjVULMSiqKEjDLWLFdYHZFduu2/2J9eVdpfb2UTQ5AYlvktymFXqq8nlmsLWEYeR
         0HcH8nYgXOEoYy+Fel6+/CiF8i76QyIfdbuOk6brsU6RlMCY6SlQPxNOQTlIivvJH6sk
         PxoQ74GT4Fo+0VUf8pcrMGWf+LL+e5bIzk27KlzvzUY59zchGgX2rbPwoF9nIhJrebay
         lcYAeuaMVr/bodr4BGlT0GfT5a8cMTaT9Lk4NoXsF8zTXk8+DnvLXSe8NVI03jwnoJ0M
         sbKg==
X-Gm-Message-State: AOJu0Yy3RReO/uu+daWy911LGKnnFIQnBaZQqs9cO/CGLX3wUeWVzDVo
	5FPyRdWzbQ4PKUg/VYk/rw7OzW4FEPg=
X-Google-Smtp-Source: AGHT+IERSo+znFz51FPE/eQhDIws0F1PGdlQWWiOwwrOVq3BdxbuLoSOkLo2vX59LcGzVErwOrTP/w==
X-Received: by 2002:a17:906:76d1:b0:a02:b4da:dc64 with SMTP id q17-20020a17090676d100b00a02b4dadc64mr8692216ejn.70.1701080284431;
        Mon, 27 Nov 2023 02:18:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/19] webkitgtk: update 2.40.5 -> 2.42.2
Date: Mon, 27 Nov 2023 11:17:41 +0100
Message-Id: <20231127101751.3187950-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191276

Drop check-GST_GL_HAVE_PLATFORM_GLX.patch as upstream removed the code.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...44e17d258106617b0e6d783d073b188a2548.patch | 15 +++++----
 .../check-GST_GL_HAVE_PLATFORM_GLX.patch      | 33 -------------------
 ...ebkitgtk_2.40.5.bb => webkitgtk_2.42.2.bb} |  4 +--
 3 files changed, 10 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.40.5.bb => webkitgtk_2.42.2.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
index 34e0ff9af38..e5ece82ed31 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
@@ -1,4 +1,4 @@
-From 647c93de99a0f71f478d76a4cc7714eba7ba1447 Mon Sep 17 00:00:00 2001
+From 95398982f4a120147a98a27e176facf6d95b2bf7 Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
 Date: Thu, 2 Jun 2022 11:19:06 +0300
 Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
@@ -33,6 +33,7 @@ left for a follow-up fix.
 
 Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
  .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
@@ -203,7 +204,7 @@ index b17c603d..e4629cda 100644
 -
 -#endif // FELightingNEON_h
 diff --git a/Source/WebCore/platform/graphics/filters/DistantLightSource.h b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
-index 70c6512f..b032c82e 100644
+index 70f583b3..7d5d27e5 100644
 --- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
 @@ -26,6 +26,10 @@
@@ -218,7 +219,7 @@ index 70c6512f..b032c82e 100644
  
  class DistantLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 53beb596..e78a9354 100644
+index 179edf6d..694d712d 100644
 --- a/Source/WebCore/platform/graphics/filters/FELighting.h
 +++ b/Source/WebCore/platform/graphics/filters/FELighting.h
 @@ -35,8 +35,6 @@
@@ -229,8 +230,8 @@ index 53beb596..e78a9354 100644
 -
  class FELighting : public FilterEffect {
  public:
-     const Color& lightingColor() const { return m_lightingColor; }
-@@ -64,11 +62,6 @@ protected:
+     bool operator==(const FELighting&) const;
+@@ -68,11 +66,6 @@ protected:
  
      std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
  
@@ -243,7 +244,7 @@ index 53beb596..e78a9354 100644
      float m_surfaceScale;
      float m_diffuseConstant;
 diff --git a/Source/WebCore/platform/graphics/filters/PointLightSource.h b/Source/WebCore/platform/graphics/filters/PointLightSource.h
-index 3a5723f0..675d63f5 100644
+index a8cfdab8..34f867bb 100644
 --- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
 @@ -26,6 +26,10 @@
@@ -258,7 +259,7 @@ index 3a5723f0..675d63f5 100644
  
  class PointLightSource : public LightSource {
 diff --git a/Source/WebCore/platform/graphics/filters/SpotLightSource.h b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
-index 684626f7..dea58389 100644
+index 6404467a..5cac38f2 100644
 --- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 +++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
 @@ -26,6 +26,10 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch b/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch
deleted file mode 100644
index ae99810cedb..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Add additional check on GST_GL_HAVE_PLATFORM_GLX before using gst_gl_display_x11_new_with_display
-
-This ensures that there is a compile time check for glx support in gstreamer as
-runtime check is not enough because gst_gl_display_x11_new_with_display() API comes from
-gst/gl/x11/gstgldisplay_x11.h which is only included when GST_GL_HAVE_PLATFORM_GLX is defined
-therefore make this check consistent to fix build with some platforms which use pvr gl drivers
-where this problem appear at compile time.
-
-
-/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/webkitgtk/2.40.2-r0/webkitgtk-2.40.2/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp:68:31: error: use of undeclared identifier 'gst_gl_display_x11_new_with_display'; did you mean 'gst_gl_display_egl_new_with_egl_display'?
-   68 |         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDisplayX11>(sharedDisplay).native()));
-      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-      |                               gst_gl_display_egl_new_with_egl_display
-
-This issue is 2.40 specific since GLX support is removed [1] from trunk upstream, therefore
-this patch wont be needed when upgrading to 2.42+
-
-[1] https://github.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005e0c75eb91abf
-
-Upstream-Status: Inappropriate [GLX support is gone in 2.41+]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-02-20 01:22:18.917743700 -0800
-+++ b/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-07-08 08:45:09.739177065 -0700
-@@ -63,7 +63,7 @@
-     if (glPlatform == GST_GL_PLATFORM_EGL)
-         return GST_GL_DISPLAY(gst_gl_display_egl_new_with_egl_display(sharedDisplay.eglDisplay()));
- #endif
--#if USE(GLX)
-+#if USE(GLX) && GST_GL_HAVE_PLATFORM_GLX
-     if (is<PlatformDisplayX11>(sharedDisplay) && glPlatform == GST_GL_PLATFORM_GLX)
-         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDisplayX11>(sharedDisplay).native()));
- #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
index 0c54f202ca5..2ba60eb65ba 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
@@ -13,10 +13,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
-           file://check-GST_GL_HAVE_PLATFORM_GLX.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
-SRC_URI[sha256sum] = "7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f"
+SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -75,6 +74,7 @@ PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
 PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
 PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
+PACKAGECONFIG[jpegxl] = "-DUSE_JPEGXL=ON,-DUSE_JPEGXL=OFF,libjxl"
 
 EXTRA_OECMAKE = " \
                  -DPORT=GTK \
-- 
2.39.2


