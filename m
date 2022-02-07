Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2890EC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.16542.1644196129986574700
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LhICDX63;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id n8so8772286wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lIsCXPisCvA0irO4gUh7bM2TsKw7dE6vH4FSX22mh9U=;
        b=LhICDX63aSx1VTAZYoZ0POru9SDzmJNGzw8K6yif0skVJrDmzEpclI1PTeqNrVDPqG
         oFp/pFN5QtS6cwFTzPht6WSDgRERjjxMC3x/QN7V0F1LVjSVXaJ0qXim5YBH9wM1rfmv
         cN5FOuBuxmso1DaE/YBt943rvCbF+1zCQuQQBq3XIKSSjkmvpcxdcoe1h4LnaPdC3wEE
         YFltGtZd3aSaIpGOwThRWDR86uogBM1VyfC4FJ0CzwX5TuHeGKINIfKPKoSpnlzCRkxu
         gM1cRJ6nzNsY+rMpYOG8F1oQUM6Q1p319NyeW1quswlHc0lPGbqXlY97N9L55CARxL7W
         gALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lIsCXPisCvA0irO4gUh7bM2TsKw7dE6vH4FSX22mh9U=;
        b=LmWE9eIxUDHLKr8XLpk9uXkt0iOR4zNl+iTK7cHkk8hxDSvZZsmPFhB3KHJM7mAVku
         6b1BmgqS/N5GpJO0WDXUQPDMW6gVTTR7E0I1bw/GV2dDZe32iXaNdM+F5LRrgy3lpqPV
         DXvfxHKywNec/kv+rBXVXn0Hj2SPBkj2UjJBwafrBvA6mcxLUV4/U+xpsPagmYZ1BZjR
         KmnQfpupvPD3J78+dt8J6qZvv05+4Bm7l7TvKRYoRrkw22reAYpyP3tRuKU+wHxYgNTF
         J8UF28PSgJkXpPYyRZvuhymVqzMJbbyiPHXkBp5h+UwLXJUbxzqZJs4wzedZ5PhFzele
         jkaA==
X-Gm-Message-State: AOAM530LzglBU7Mu3Z3Ap0W6wzY2TEgG3yvFYXoWAhi3+oq5BlfN9Zub
	sj20AcQEOHEz/0KqXmQcdHgg0Kb6sLg=
X-Google-Smtp-Source: 
 ABdhPJzZvIig/thVuB3V+7UKcriSfow97QDTSe07I0AKIpE7Lrstz7teLGoBhbdQ1FlIqqBUHutDhg==
X-Received: by 2002:a05:600c:1e84:: with SMTP id
 be4mr8706771wmb.147.1644196128200;
        Sun, 06 Feb 2022 17:08:48 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:47 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 10/17] gstreamer1.0-plugins-bad: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:16 +0000
Message-Id: <20220207010823.143664-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161430

- Remove meson options
  libmms
  ofa

- Add new meson options
  gpl: Allow build plugins that have GPL-licensed dependencies
   faad: Free AAC audio decoder plugin (GPL - only built if gpl option is also enabled!)
   resindvd: Resin DVD playback plugin (GPL - only built if gpl option is also enabled!)
   x265: HEVC/H.265 video encoder plugin (GPL - only built if gpl option is also enabled!)

- Add new meson options
  Feature options for plugins without external deps
   codecalpha
   aes: AES encryption/decryption plugin

  Feature options for plugins that need external deps
   asio: Steinberg Audio Streaming Input Output (ASIO) plugin
   gs: Google Cloud Storage source and sink plugin
   ldac: LDAC bluetooth audio codec plugin
   openaptx: Open Source implementation of Audio Processing Technology codec (aptX) plugin
   qroverlay: new elements that allow overlaying data on top of video in the form of a QR code
   onnx: ONNX neural network plugin

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ialized-warnings-when-compiling-with.patch |  8 ++--
 ...-avoid-including-sys-poll.h-directly.patch | 12 +++---
 ...-sentinals-for-gst_structure_get-etc.patch | 22 +++++-----
 ...issing-opencv-data-dir-in-yocto-buil.patch | 42 ++++++-------------
 .../0005-msdk-fix-includedir-path.patch       | 41 +++++++++++-------
 ....bb => gstreamer1.0-plugins-bad_1.20.0.bb} | 23 ++++++----
 6 files changed, 70 insertions(+), 78 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.5.bb => gstreamer1.0-plugins-bad_1.20.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 13a673cd50..4b3451d321 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,11 +1,12 @@
-From f08ab3ac2ce43ac91d3bf65b26f26436690f499b Mon Sep 17 00:00:00 2001
+From 6c3eeaf6435608f744303c17d52245f926cd28ac Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
-Subject: [PATCH 1/4] fix maybe-uninitialized warnings when compiling with -Os
+Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
 
 Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  gst-libs/gst/codecparsers/gstvc1parser.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -23,6 +24,3 @@ index 2c60ced..e8226d8 100644
    guint8 structA[8] = { 0, };
    guint8 structB[12] = { 0, };
    GstBitReader br;
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index ead6897f67..e3e5d9fb60 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,22 +1,23 @@
-From 3b05e91720c10fcf6e0e408595b7217f6fa145c2 Mon Sep 17 00:00:00 2001
+From 701255c5797f222f0c47ace6437d213607b98d1e Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
-Subject: [PATCH 2/4] avoid including <sys/poll.h> directly
+Subject: [PATCH] avoid including <sys/poll.h> directly
 
 musl libc generates warnings if <sys/poll.h> is included directly.
 
 Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  sys/dvb/gstdvbsrc.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
-index ca6b92a..b2772db 100644
+index 92c918c..5e27871 100644
 --- a/sys/dvb/gstdvbsrc.c
 +++ b/sys/dvb/gstdvbsrc.c
-@@ -97,7 +97,7 @@
+@@ -98,7 +98,7 @@
  #include <gst/gst.h>
  #include <gst/glib-compat-private.h>
  #include <sys/ioctl.h>
@@ -25,6 +26,3 @@ index ca6b92a..b2772db 100644
  #include <fcntl.h>
  #include <errno.h>
  #include <stdio.h>
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch
index 88fbc40dcd..280cbf984a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch
@@ -1,7 +1,7 @@
-From 5ed27de9f662fe063b8b3d5d4335aa64cd4718c9 Mon Sep 17 00:00:00 2001
+From 001fa08542dd5fc79571f7c803b2d3dd59c04a06 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 9 Feb 2016 14:00:00 -0800
-Subject: [PATCH 3/4] ensure valid sentinals for gst_structure_get() etc
+Subject: [PATCH] ensure valid sentinals for gst_structure_get() etc
 
 For GStreamer functions declared with G_GNUC_NULL_TERMINATED,
 ie __attribute__((__sentinel__)), gcc will generate a warning if the
@@ -17,6 +17,7 @@ without an explicit cast to a pointer type.
 Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  sys/decklink/gstdecklink.cpp          | 10 +++++-----
  sys/decklink/gstdecklinkaudiosrc.cpp  |  2 +-
@@ -24,10 +25,10 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  3 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/sys/decklink/gstdecklink.cpp b/sys/decklink/gstdecklink.cpp
-index 4dac7e1..43762ce 100644
+index 3f79deb..96600c6 100644
 --- a/sys/decklink/gstdecklink.cpp
 +++ b/sys/decklink/gstdecklink.cpp
-@@ -674,7 +674,7 @@ gst_decklink_mode_get_generic_structure (GstDecklinkModeEnum e)
+@@ -680,7 +680,7 @@ gst_decklink_mode_get_generic_structure (GstDecklinkModeEnum e)
        "pixel-aspect-ratio", GST_TYPE_FRACTION, mode->par_n, mode->par_d,
        "interlace-mode", G_TYPE_STRING,
        mode->interlaced ? "interleaved" : "progressive",
@@ -36,7 +37,7 @@ index 4dac7e1..43762ce 100644
  
    return s;
  }
-@@ -699,16 +699,16 @@ gst_decklink_mode_get_structure (GstDecklinkModeEnum e, BMDPixelFormat f,
+@@ -705,16 +705,16 @@ gst_decklink_mode_get_structure (GstDecklinkModeEnum e, BMDPixelFormat f,
      case bmdFormat8BitYUV:     /* '2vuy' */
        gst_structure_set (s, "format", G_TYPE_STRING, "UYVY",
            "colorimetry", G_TYPE_STRING, mode->colorimetry,
@@ -58,10 +59,10 @@ index 4dac7e1..43762ce 100644
      case bmdFormat10BitRGB:    /* 'r210' Big-endian RGB 10-bit per component with SMPTE video levels (64-960). Packed as 2:10:10:10 */
      case bmdFormat12BitRGB:    /* 'R12B' Big-endian RGB 12-bit per component with full range (0-4095). Packed as 12-bit per component */
 diff --git a/sys/decklink/gstdecklinkaudiosrc.cpp b/sys/decklink/gstdecklinkaudiosrc.cpp
-index 2fef934..c47229a 100644
+index 50ad5cc..d209180 100644
 --- a/sys/decklink/gstdecklinkaudiosrc.cpp
 +++ b/sys/decklink/gstdecklinkaudiosrc.cpp
-@@ -379,7 +379,7 @@ gst_decklink_audio_src_start (GstDecklinkAudioSrc * self)
+@@ -388,7 +388,7 @@ gst_decklink_audio_src_start (GstDecklinkAudioSrc * self)
        g_mutex_unlock (&self->input->lock);
  
        if (videosrc) {
@@ -71,10 +72,10 @@ index 2fef934..c47229a 100644
  
          switch (vconn) {
 diff --git a/sys/decklink/gstdecklinkvideosink.cpp b/sys/decklink/gstdecklinkvideosink.cpp
-index e3a6775..f1a5aae 100644
+index a64c046..07a09e8 100644
 --- a/sys/decklink/gstdecklinkvideosink.cpp
 +++ b/sys/decklink/gstdecklinkvideosink.cpp
-@@ -286,7 +286,7 @@ reset_framerate (GstCapsFeatures * features, GstStructure * structure,
+@@ -288,7 +288,7 @@ reset_framerate (GstCapsFeatures * features, GstStructure * structure,
      gpointer user_data)
  {
    gst_structure_set (structure, "framerate", GST_TYPE_FRACTION_RANGE, 0, 1,
@@ -83,6 +84,3 @@ index e3a6775..f1a5aae 100644
  
    return TRUE;
  }
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index b816709066..029b80e174 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,7 +1,7 @@
-From f19ff66640f2f472c4e9d9055253032d34e125c6 Mon Sep 17 00:00:00 2001
+From 3bc5d48257032b6bbee532aad15062fbbcc43bfe Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
-Subject: [PATCH 4/4] opencv: resolve missing opencv data dir in yocto build
+Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
 
 When Yocto build is performed, opencv searches for data dir using simple
 'test' command, this fails because pkg-config provides an absolute
@@ -11,39 +11,23 @@ in order for the 'test' utility to pick up the absolute path.
 Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
- ext/opencv/meson.build | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
+ ext/opencv/meson.build | 3 +++
+ 1 file changed, 3 insertions(+)
 
 diff --git a/ext/opencv/meson.build b/ext/opencv/meson.build
-index 0b0b3fc..0ed3344 100644
+index 1d86b90..b5c8b95 100644
 --- a/ext/opencv/meson.build
 +++ b/ext/opencv/meson.build
-@@ -78,20 +78,21 @@ else
- endif
- 
- if opencv_found
-+  pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-   opencv_prefix = opencv_dep.get_pkgconfig_variable('prefix')
+@@ -87,6 +87,9 @@ if opencv_found
+   opencv_prefix = opencv_dep.get_variable('prefix')
    gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
  
++  pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
++  opencv_prefix = pkgconf_sysroot + opencv_prefix
++
    # Check the data dir used by opencv for its xml data files
    # Use prefix from pkg-config to be compatible with cross-compilation
--  r = run_command('test', '-d', opencv_prefix + '/share/opencv')
-+  r = run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/share/opencv')
-   if r.returncode() == 0
-     gstopencv_cargs += '-DOPENCV_PATH_NAME="opencv"'
-   else
--    r = run_command('test', '-d', opencv_prefix + '/share/OpenCV')
-+    r = run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/share/OpenCV')
-     if r.returncode() == 0
-       gstopencv_cargs += '-DOPENCV_PATH_NAME="OpenCV"'
-     else
--      r = run_command('test', '-d', opencv_prefix + '/share/opencv4')
-+      r = run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/share/opencv4')
-       if r.returncode() == 0
-         gstopencv_cargs += '-DOPENCV_PATH_NAME="opencv4"'
-       else
--- 
-2.28.0
-
+   r = run_command('test', '-d', opencv_prefix + '/share/opencv', check: false)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
index cb3bb7d361..273b45bd49 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
@@ -1,4 +1,4 @@
-From 1f00d5026118ebd48e4ccf83d32d67155c4e7f60 Mon Sep 17 00:00:00 2001
+From e31f68c46ff0c29fa3c22755f18d5dde87b23bf2 Mon Sep 17 00:00:00 2001
 From: Naveen Saini <naveen.kumar.saini@intel.com>
 Date: Wed, 30 Dec 2020 16:37:47 +0800
 Subject: [PATCH] msdk: fix includedir path
@@ -8,24 +8,33 @@ In cross compilation, need to prepend PKG_CONFIG_SYSROOT_DIR to the dir path.
 Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
- sys/msdk/meson.build | 2 ++
- 1 file changed, 2 insertions(+)
+ sys/msdk/meson.build | 4 ++++
+ 1 file changed, 4 insertions(+)
 
 diff --git a/sys/msdk/meson.build b/sys/msdk/meson.build
-index 6346c9451..068f38548 100644
+index 24aabc7..6003bb7 100644
 --- a/sys/msdk/meson.build
 +++ b/sys/msdk/meson.build
-@@ -40,7 +40,9 @@ endif
+@@ -46,7 +46,9 @@ if mfx_api != 'oneVPL'
+   mfx_dep = dependency('libmfx', version: ['>= 1.0', '<= 1.99'], required: false)
  
- mfx_dep = dependency('libmfx', required: false)
- if mfx_dep.found()
-+  pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-   mfx_incdir = mfx_dep.get_pkgconfig_variable('includedir')
-+  mfx_incdir = pkgconf_sysroot +  mfx_incdir
-   mfx_inc = []
- else
-   # Old versions of MediaSDK don't provide a pkg-config file
--- 
-2.17.1
-
+   if mfx_dep.found()
++    pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
+     mfx_incdir = mfx_dep.get_variable('includedir')
++    mfx_incdir = pkgconf_sysroot +  mfx_incdir
+     mfx_inc = []
+     use_msdk = true
+   else
+@@ -75,7 +77,9 @@ if not use_msdk and mfx_api != 'MSDK'
+   mfx_dep = dependency('vpl', version: '>= 2.2', required: false)
+ 
+   if mfx_dep.found()
++    pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
+     mfx_incdir = mfx_dep.get_variable('includedir')
++    mfx_incdir = pkgconf_sysroot +  mfx_incdir
+     mfx_inc = []
+     use_onevpl = true
+   endif
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
index f90dff693d..915d4ec744 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
@@ -11,17 +11,13 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-msdk-fix-includedir-path.patch \
            "
-SRC_URI[sha256sum] = "a164923b94f0d08578a6fcaeaac6e0c05da788a46903a1086870e9ca45ad678e"
+SRC_URI[sha256sum] = "015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee71dc11d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
 LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-# remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
-
 DEPENDS += "gstreamer1.0-plugins-base"
 
 inherit gobject-introspection
@@ -48,7 +44,6 @@ PACKAGECONFIG[dc1394]          = "-Ddc1394=enabled,-Ddc1394=disabled,libdc1394"
 PACKAGECONFIG[directfb]        = "-Ddirectfb=enabled,-Ddirectfb=disabled,directfb"
 PACKAGECONFIG[dtls]            = "-Ddtls=enabled,-Ddtls=disabled,openssl"
 PACKAGECONFIG[faac]            = "-Dfaac=enabled,-Dfaac=disabled,faac"
-PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[fluidsynth]      = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
 PACKAGECONFIG[hls]             = "-Dhls=enabled,-Dhls=disabled,"
 # Pick atleast one crypto backend below when enabling hls
@@ -61,7 +56,6 @@ PACKAGECONFIG[gcrypt]          = "-Dhls-crypto=libgcrypt,,libgcrypt"
 PACKAGECONFIG[gl]              = "-Dgl=enabled,-Dgl=disabled,"
 PACKAGECONFIG[kms]             = "-Dkms=enabled,-Dkms=disabled,libdrm"
 PACKAGECONFIG[libde265]        = "-Dlibde265=enabled,-Dlibde265=disabled,libde265"
-PACKAGECONFIG[libmms]          = "-Dlibmms=enabled,-Dlibmms=disabled,libmms"
 PACKAGECONFIG[libssh2]         = "-Dcurl-ssh2=enabled,-Dcurl-ssh2=disabled,libssh2"
 PACKAGECONFIG[lcms2]           = "-Dcolormanagement=enabled,-Dcolormanagement=disabled,lcms"
 PACKAGECONFIG[modplug]         = "-Dmodplug=enabled,-Dmodplug=disabled,libmodplug"
@@ -75,7 +69,6 @@ PACKAGECONFIG[openmpt]         = "-Dopenmpt=enabled,-Dopenmpt=disabled,libopenmp
 # the opus encoder/decoder elements are now in the -base package,
 # but the opus parser remains in -bad
 PACKAGECONFIG[opusparse]       = "-Dopus=enabled,-Dopus=disabled,libopus"
-PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdread libdvdnav"
 PACKAGECONFIG[rsvg]            = "-Drsvg=enabled,-Drsvg=disabled,librsvg"
 PACKAGECONFIG[rtmp]            = "-Drtmp=enabled,-Drtmp=disabled,rtmpdump"
 PACKAGECONFIG[sbc]             = "-Dsbc=enabled,-Dsbc=disabled,sbc"
@@ -98,10 +91,17 @@ PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
 PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 PACKAGECONFIG[x11]             = "-Dx11=enabled,-Dx11=disabled,libxcb libxkbcommon"
+
+# GPL - only built if gpl option is also enabled!
+PACKAGECONFIG[gpl]             = "-Dgpl=enabled,-Dgpl=disabled"
+PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
+PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdread libdvdnav"
 PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
+    -Daes=enabled \
+    -Dcodecalpha=enabled \
     -Ddecklink=enabled \
     -Ddvb=enabled \
     -Dfbdev=enabled \
@@ -110,6 +110,7 @@ EXTRA_OEMESON += " \
     -Dtranscode=enabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
+    -Dasio=disabled \
     -Davtp=disabled \
     -Dbs2b=disabled \
     -Dchromaprint=disabled \
@@ -120,10 +121,12 @@ EXTRA_OEMESON += " \
     -Dfdkaac=disabled \
     -Dflite=disabled \
     -Dgme=disabled \
+    -Dgs=disabled \
     -Dgsm=disabled \
     -Diqa=disabled \
     -Dkate=disabled \
     -Dladspa=disabled \
+    -Dldac=disabled \
     -Dlv2=disabled \
     -Dmagicleap=disabled \
     -Dmediafoundation=disabled \
@@ -132,10 +135,12 @@ EXTRA_OEMESON += " \
     -Dmplex=disabled \
     -Dmusepack=disabled \
     -Dnvcodec=disabled \
-    -Dofa=disabled \
     -Dopenexr=disabled \
     -Dopenni2=disabled \
+    -Dopenaptx=disabled \
     -Dopensles=disabled \
+    -Donnx=disabled \
+    -Dqroverlay=disabled \
     -Dsoundtouch=disabled \
     -Dspandsp=disabled \
     -Dsvthevcenc=disabled \
-- 
2.35.1


