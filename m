Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.18810.1603023029522193224
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MgFAC4OS;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id i1so8349770wro.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GZpVyFe3vy0wXQKecdJBsLnjcmHXuHNLWumEdKPwqrM=;
        b=MgFAC4OS58dvQS8coW31IRx4Z3bUSfZPyLqUAj4l5KimOyu7fKyLHK6EfGHYgOXS8m
         CObcZxEQAv/N3Dwp2pFoUdOIFr3SVvUqWHbMbahN+ff1erongBbZXZ2msKq2nIYPRuv1
         RnhaFna3Hz/BPxofxJSZJKd/YtoutXQDugI2wfMh+/An3d7zxfI94+F8/55Yo7izbLeU
         AhUKQRxkyk1VW6lGQ+gj2apqbGiNWcYqDurx2qFDJ3JFjbG7rinwiaCQxZJ/4UNxbWit
         YtVa7tf23PVi7MRNXZWzY5ZWCGSoCSQ9l7LPIYhFltu0IG+bOP19OrgOpDR0QkjAfq5+
         puHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GZpVyFe3vy0wXQKecdJBsLnjcmHXuHNLWumEdKPwqrM=;
        b=VC9IiMwKZYrC4KBVttI87s9Uej0AdK7ROHQ3WJJgtdzGbaV6ZqoOVRFIlOf8rY9qpL
         W3A/poD8easJClATt79dP/uPj3Dc6sNb/AdSCm9NidGzggTnG69s/KjTd9Y6aJ0lHQEW
         eZKFyh1nqI0H/1YNOOJAxl+zDuMMEZOjF7RN96ZnBeRGWT0TNlkuBNI08EjBUQNLrV/M
         s+ryLTFU8YjZhfI81jHk+f7oq3Ig+iUfE6OV7lc6AEku9Hk8DK1LeZsZlpWI4zx83ouO
         JhJM27qu8hdJpqwcxjiGwrrWdHGVQK/8meKn5CBKaGiGLJbA3LIIaZxfm8jFF06hK1/t
         VjVA==
X-Gm-Message-State: AOAM533bUfw0KMX2qHljCYapJaoWDhUjueoaNo2W+GD/s5keD/LYxYp2
	ylscNu7BXFbozj0pkQksOyyvhK3I7D9+vg==
X-Google-Smtp-Source: ABdhPJzZLfKyCxG2I3qi+HpL9P0M2s7lJw6mTdDO1wVE2uekQME95Ywb43YPuiUoRKnjR3g/ACC+ZA==
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr15442409wrl.124.1603023027369;
        Sun, 18 Oct 2020 05:10:27 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:26 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 08/20] gstreamer1.0-plugins-bad: upgrade to version 1.18.0
Date: Sun, 18 Oct 2020 13:09:50 +0100
Message-Id: <20201018121002.1417335-9-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
      Removed since these are included in 1.18.0

PACKAGECONFIG:
 - vdpau has been removed upstream
 - vulkan needs now needs shaderc-native to build

EXTRA_OEMESON:
 - yadif has been removed upstream
 - nvdec and nvenc has been replaced with nvcodec

FILES:
 - add new files for transcode plugin

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...alized-warnings-when-compiling-with.patch} |  8 ++--
 ...even-when-cross-compiling-if-introsp.patch | 36 ----------------
 ...avoid-including-sys-poll.h-directly.patch} |  8 ++--
 ...sentinals-for-gst_structure_get-etc.patch} | 43 ++++++++++---------
 ...ssing-opencv-data-dir-in-yocto-buil.patch} |  8 ++--
 ....bb => gstreamer1.0-plugins-bad_1.18.0.bb} | 28 ++++++------
 6 files changed, 48 insertions(+), 83 deletions(-)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch => 0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch} (80%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{avoid-including-sys-poll.h-directly.patch => 0002-avoid-including-sys-poll.h-directly.patch} (79%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{ensure-valid-sentinels-for-gst_structure_get-etc.patch => 0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch} (69%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch => 0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.18.0.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
similarity index 80%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 73681f1002..13a673cd50 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,7 +1,7 @@
-From a67781000e82bd9ae3813da29401e8c0c852328a Mon Sep 17 00:00:00 2001
+From f08ab3ac2ce43ac91d3bf65b26f26436690f499b Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
-Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
+Subject: [PATCH 1/4] fix maybe-uninitialized warnings when compiling with -Os
 
 Upstream-Status: Pending
 
@@ -11,7 +11,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codecparsers/gstvc1parser.c
-index fd16ee0..ddb890c 100644
+index 2c60ced..e8226d8 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
 @@ -1730,7 +1730,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
@@ -24,5 +24,5 @@ index fd16ee0..ddb890c 100644
    guint8 structB[12] = { 0, };
    GstBitReader br;
 -- 
-1.9.1
+2.28.0
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
deleted file mode 100644
index 1321852023..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Fri, 18 Oct 2019 00:39:12 +0100
-Subject: [PATCH 1/2] meson: build gir even when cross-compiling if
- introspection was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
-
-Upstream-Status: Backport [97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19]
-
-Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 67aeeb4d0..7b3314bd9 100644
---- a/meson.build
-+++ b/meson.build
-@@ -411,7 +411,7 @@ python3 = import('python').find_installation()
- 
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
-     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
similarity index 79%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 32261279a5..ead6897f67 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,7 +1,7 @@
-From 72561a0fca562d03567ace7b4cfc94992cd6525c Mon Sep 17 00:00:00 2001
+From 3b05e91720c10fcf6e0e408595b7217f6fa145c2 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
-Subject: [PATCH] avoid including <sys/poll.h> directly
+Subject: [PATCH 2/4] avoid including <sys/poll.h> directly
 
 musl libc generates warnings if <sys/poll.h> is included directly.
 
@@ -13,7 +13,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
-index b93255f..49f145a 100644
+index ca6b92a..b2772db 100644
 --- a/sys/dvb/gstdvbsrc.c
 +++ b/sys/dvb/gstdvbsrc.c
 @@ -97,7 +97,7 @@
@@ -26,5 +26,5 @@ index b93255f..49f145a 100644
  #include <errno.h>
  #include <stdio.h>
 -- 
-1.9.1
+2.28.0
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch
index 2d5389d953..88fbc40dcd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch
@@ -1,7 +1,7 @@
-From 2262ba4b686d5cc0d3e894707fe1d31619a3a8f1 Mon Sep 17 00:00:00 2001
+From 5ed27de9f662fe063b8b3d5d4335aa64cd4718c9 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 9 Feb 2016 14:00:00 -0800
-Subject: [PATCH] ensure valid sentinals for gst_structure_get() etc
+Subject: [PATCH 3/4] ensure valid sentinals for gst_structure_get() etc
 
 For GStreamer functions declared with G_GNUC_NULL_TERMINATED,
 ie __attribute__((__sentinel__)), gcc will generate a warning if the
@@ -23,20 +23,20 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  sys/decklink/gstdecklinkvideosink.cpp |  2 +-
  3 files changed, 7 insertions(+), 7 deletions(-)
 
-Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
-===================================================================
---- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklink.cpp
-+++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
-@@ -617,7 +617,7 @@ gst_decklink_mode_get_structure (GstDeck
+diff --git a/sys/decklink/gstdecklink.cpp b/sys/decklink/gstdecklink.cpp
+index 4dac7e1..43762ce 100644
+--- a/sys/decklink/gstdecklink.cpp
++++ b/sys/decklink/gstdecklink.cpp
+@@ -674,7 +674,7 @@ gst_decklink_mode_get_generic_structure (GstDecklinkModeEnum e)
        "pixel-aspect-ratio", GST_TYPE_FRACTION, mode->par_n, mode->par_d,
        "interlace-mode", G_TYPE_STRING,
        mode->interlaced ? "interleaved" : "progressive",
 -      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, NULL);
 +      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, (void*)NULL);
  
-   if (input && mode->interlaced) {
-     if (mode->tff)
-@@ -632,16 +632,16 @@ gst_decklink_mode_get_structure (GstDeck
+   return s;
+ }
+@@ -699,16 +699,16 @@ gst_decklink_mode_get_structure (GstDecklinkModeEnum e, BMDPixelFormat f,
      case bmdFormat8BitYUV:     /* '2vuy' */
        gst_structure_set (s, "format", G_TYPE_STRING, "UYVY",
            "colorimetry", G_TYPE_STRING, mode->colorimetry,
@@ -57,11 +57,11 @@ Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
        break;
      case bmdFormat10BitRGB:    /* 'r210' Big-endian RGB 10-bit per component with SMPTE video levels (64-960). Packed as 2:10:10:10 */
      case bmdFormat12BitRGB:    /* 'R12B' Big-endian RGB 12-bit per component with full range (0-4095). Packed as 12-bit per component */
-Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
-===================================================================
---- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklinkaudiosrc.cpp
-+++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
-@@ -387,7 +387,7 @@ gst_decklink_audio_src_set_caps (GstBase
+diff --git a/sys/decklink/gstdecklinkaudiosrc.cpp b/sys/decklink/gstdecklinkaudiosrc.cpp
+index 2fef934..c47229a 100644
+--- a/sys/decklink/gstdecklinkaudiosrc.cpp
++++ b/sys/decklink/gstdecklinkaudiosrc.cpp
+@@ -379,7 +379,7 @@ gst_decklink_audio_src_start (GstDecklinkAudioSrc * self)
        g_mutex_unlock (&self->input->lock);
  
        if (videosrc) {
@@ -70,11 +70,11 @@ Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
          gst_object_unref (videosrc);
  
          switch (vconn) {
-Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkvideosink.cpp
-===================================================================
---- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklinkvideosink.cpp
-+++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkvideosink.cpp
-@@ -285,7 +285,7 @@ reset_framerate (GstCapsFeatures * featu
+diff --git a/sys/decklink/gstdecklinkvideosink.cpp b/sys/decklink/gstdecklinkvideosink.cpp
+index e3a6775..f1a5aae 100644
+--- a/sys/decklink/gstdecklinkvideosink.cpp
++++ b/sys/decklink/gstdecklinkvideosink.cpp
+@@ -286,7 +286,7 @@ reset_framerate (GstCapsFeatures * features, GstStructure * structure,
      gpointer user_data)
  {
    gst_structure_set (structure, "framerate", GST_TYPE_FRACTION_RANGE, 0, 1,
@@ -83,3 +83,6 @@ Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkvideosink.cpp
  
    return TRUE;
  }
+-- 
+2.28.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 4b6591c0d8..b816709066 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,7 +1,7 @@
-From f41caae14b618ab815ede3c408e7482b00316e3e Mon Sep 17 00:00:00 2001
+From f19ff66640f2f472c4e9d9055253032d34e125c6 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
-Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
+Subject: [PATCH 4/4] opencv: resolve missing opencv data dir in yocto build
 
 When Yocto build is performed, opencv searches for data dir using simple
 'test' command, this fails because pkg-config provides an absolute
@@ -16,7 +16,7 @@ Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/ext/opencv/meson.build b/ext/opencv/meson.build
-index f38b55dfe..a26403482 100644
+index 0b0b3fc..0ed3344 100644
 --- a/ext/opencv/meson.build
 +++ b/ext/opencv/meson.build
 @@ -78,20 +78,21 @@ else
@@ -45,5 +45,5 @@ index f38b55dfe..a26403482 100644
          gstopencv_cargs += '-DOPENCV_PATH_NAME="opencv4"'
        else
 -- 
-2.17.1
+2.28.0
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index 99176b2571..d209107805 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -1,15 +1,13 @@
 require gstreamer1.0-plugins-common.inc
 
-SRC_URI = " \
-    https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
-    file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
-    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
-    file://avoid-including-sys-poll.h-directly.patch \
-    file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
-    file://opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
-"
-SRC_URI[md5sum] = "ccc7404230afddec723bbdb63c89feec"
-SRC_URI[sha256sum] = "f1cb7aa2389569a5343661aae473f0a940a90b872001824bc47fa8072a041e74"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
+           file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
+           file://0002-avoid-including-sys-poll.h-directly.patch \
+           file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
+           file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           "
+SRC_URI[md5sum] = "c1b5f2fb2d76ace6a3d04df73a8c72ea"
+SRC_URI[sha256sum] = "f382ab1caddd64aaa7acb7c4787487f63fd39bd0fde9c757655cbaa457c1185f"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
@@ -75,10 +73,9 @@ PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
 PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
 PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
 PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 libgudev"
-PACKAGECONFIG[vdpau]           = "-Dvdpau=enabled,-Dvdpau=disabled,libvdpau"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
-PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader"
+PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc-native"
 PACKAGECONFIG[wayland]         = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
@@ -93,6 +90,7 @@ PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 #   winscreencap wpe x265
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Ddecklink=enabled \
     -Ddvb=enabled \
     -Dfbdev=enabled \
@@ -118,8 +116,7 @@ EXTRA_OEMESON += " \
     -Dmpeg2enc=disabled \
     -Dmplex=disabled \
     -Dmusepack=disabled \
-    -Dnvdec=disabled \
-    -Dnvenc=disabled \
+    -Dnvcodec=disabled \
     -Dofa=disabled \
     -Dopenexr=disabled \
     -Dopenni2=disabled \
@@ -134,7 +131,6 @@ EXTRA_OEMESON += " \
     -Dwinscreencap=disabled \
     -Dwpe=disabled \
     -Dx265=disabled \
-    ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-Dyadif=disabled", "", d)} \
 "
 
 export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
@@ -144,4 +140,6 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 FILES_${PN}-freeverb += "${datadir}/gstreamer-1.0/presets/GstFreeverb.prs"
 FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
+FILES_${PN}-transcode += "${datadir}/gstreamer-1.0/encoding-profiles"
 FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-1.0/presets/GstVoAmrwbEnc.prs"
+
-- 
2.28.0

