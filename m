Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id EC01877214
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 02:53:32 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id gc3so123463104obb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 18:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1r4jZPsFFV2wrwJBHvIer0mSTZa/5N0V3QQYUFrds7k=;
	b=AzwOZ5W9yrNPaOcfBRgWveQOGICN/DdOgZR74bg60iWe6Bx3vxS1UtaIHehiuqnaEq
	4S9hI7UjyLNEMIK2pqeZ2y3D0DxpsaK8aWdTRB+R0syBfjw7eW3oxHkCrOBS/+GNyBK0
	GabgdIiLkLxQf3y7x25nl6hDYRZNBbmyR5IOHjV/IvN5F72vRXicMI/3Dbq8DLAPYfEv
	F5RbSba8YqvRJbCpcgU4e1KJxITBa8ZteJ1DgZbqi40bl29Oo6CgsLJhU5JL6ONHFMdZ
	1VadO3kZB+a3q+g6udW/MrPMtCQxb+pcClU3Zw2rUZz3ayfZXGb850/sTDHQAqGbgeRL
	9bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1r4jZPsFFV2wrwJBHvIer0mSTZa/5N0V3QQYUFrds7k=;
	b=BeQw9BTSRJAWrZj1WQ1Zx/drz6ghkksmJbgdvHXpYdJToL0hH2hOq6FHMN77joK0fo
	RkfVvqdNgzBYLfncP1UhLuFZCF0neLXuyEF8KfI0ab4svgDt5zITUbw2raiek86oHYm6
	P4bhsRYPyqg88wVKeXeNDp7di7UWItbC6VZ6MTNLmsOVJZT6Ft7wgWP84NaDMjuM6MwY
	bQUIqcbHE7pTiegJkvvAIizA+buhrBTltOvY9H8N6y/llcTblOkIIA0PeuzHV9ojkxyk
	S/FC/TdjnQPlovsqX7me49YAsQLLVjmYozpLrbCftYCZGkai4P71tGwGSdZf977XWQlc
	wZJQ==
X-Gm-Message-State: AG10YORso3Teve9bKYBSBJsrKWNgrVbdAtAiwbSd9ex0aBlUEJPdaSzHRlmnDzfZ+DYXow==
X-Received: by 10.60.226.163 with SMTP id rt3mr14266588oec.11.1455936813501;
	Fri, 19 Feb 2016 18:53:33 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wh4sm9192764obc.10.2016.02.19.18.53.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Feb 2016 18:53:32 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 18:53:15 -0800
Message-Id: <1455936797-13430-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
References: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/6] gstreamer1.0-plugins-bad_git: update 1.7.1 -> 1.7.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Feb 2016 02:53:33 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 -
 ...valid-sentinels-for-gst_structure_get-etc.patch | 51 +++++++++++++++-------
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    | 10 +++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      | 21 +++++++--
 4 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index c4199bd..cb6cbad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -37,7 +37,6 @@ PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,nettle"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
-PACKAGECONFIG[mpg123]          = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
 PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
@@ -93,7 +92,6 @@ EXTRA_OECONF += " \
     --disable-directsound \
     --disable-dts \
     --disable-gme \
-    --disable-gsettings \
     --disable-gsm \
     --disable-kate \
     --disable-ladspa \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
index 8ccaaa0..369ff93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
@@ -1,4 +1,4 @@
-From 3164f23cd6ae338d0e423fccb4e11539cd220e2f Mon Sep 17 00:00:00 2001
+From 2262ba4b686d5cc0d3e894707fe1d31619a3a8f1 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 9 Feb 2016 14:00:00 -0800
 Subject: [PATCH] ensure valid sentinals for gst_structure_get() etc
@@ -18,26 +18,45 @@ Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
- sys/decklink/gstdecklink.cpp          | 2 +-
- sys/decklink/gstdecklinkaudiosrc.cpp  | 2 +-
- sys/decklink/gstdecklinkvideosink.cpp | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
+ sys/decklink/gstdecklink.cpp          | 10 +++++-----
+ sys/decklink/gstdecklinkaudiosrc.cpp  |  2 +-
+ sys/decklink/gstdecklinkvideosink.cpp |  2 +-
+ 3 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/sys/decklink/gstdecklink.cpp b/sys/decklink/gstdecklink.cpp
-index c0d1128..6f2ef75 100644
+index 64637f1..bac956f 100644
 --- a/sys/decklink/gstdecklink.cpp
 +++ b/sys/decklink/gstdecklink.cpp
-@@ -328,7 +328,7 @@ gst_decklink_mode_get_structure (GstDecklinkModeEnum e)
-       "interlace-mode", G_TYPE_STRING,
-       mode->interlaced ? "interleaved" : "progressive", "pixel-aspect-ratio",
-       GST_TYPE_FRACTION, mode->par_n, mode->par_d, "colorimetry", G_TYPE_STRING,
--      mode->colorimetry, "chroma-site", G_TYPE_STRING, "mpeg2", NULL);
-+      mode->colorimetry, "chroma-site", G_TYPE_STRING, "mpeg2", (void *) NULL);
- }
+@@ -324,22 +324,22 @@ gst_decklink_mode_get_structure (GstDecklinkModeEnum e, BMDPixelFormat f)
+       "height", G_TYPE_INT, mode->height,
+       "pixel-aspect-ratio", GST_TYPE_FRACTION, mode->par_n, mode->par_d,
+       "interlace-mode", G_TYPE_STRING, mode->interlaced ? "interleaved" : "progressive",
+-      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, NULL);
++      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, (void *) NULL);
  
- GstCaps *
+   switch (f) {
+     case bmdFormat8BitYUV: /* '2vuy' */
+       gst_structure_set (s, "format", G_TYPE_STRING, "UYVY",
+           "colorimetry", G_TYPE_STRING, mode->colorimetry,
+-          "chroma-site", G_TYPE_STRING, "mpeg2", NULL);
++          "chroma-site", G_TYPE_STRING, "mpeg2", (void *) NULL);
+       break;
+     case bmdFormat10BitYUV: /* 'v210' */
+-      gst_structure_set (s, "format", G_TYPE_STRING, "v210", NULL);
++      gst_structure_set (s, "format", G_TYPE_STRING, "v210", (void *) NULL);
+       break;
+     case bmdFormat8BitARGB: /* 'ARGB' */
+-      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", NULL);
++      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", (void *) NULL);
+       break;
+     case bmdFormat8BitBGRA: /* 'BGRA' */
+-      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", NULL);
++      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", (void *) NULL);
+       break;
+     case bmdFormat10BitRGB: /* 'r210' Big-endian RGB 10-bit per component with SMPTE video levels (64-960). Packed as 2:10:10:10 */
+     case bmdFormat12BitRGB: /* 'R12B' Big-endian RGB 12-bit per component with full range (0-4095). Packed as 12-bit per component */
 diff --git a/sys/decklink/gstdecklinkaudiosrc.cpp b/sys/decklink/gstdecklinkaudiosrc.cpp
-index e5ac8ae..a153851 100644
+index 9a701ee..26fb7ec 100644
 --- a/sys/decklink/gstdecklinkaudiosrc.cpp
 +++ b/sys/decklink/gstdecklinkaudiosrc.cpp
 @@ -312,7 +312,7 @@ gst_decklink_audio_src_set_caps (GstBaseSrc * bsrc, GstCaps * caps)
@@ -50,7 +69,7 @@ index e5ac8ae..a153851 100644
  
          switch (vconn) {
 diff --git a/sys/decklink/gstdecklinkvideosink.cpp b/sys/decklink/gstdecklinkvideosink.cpp
-index 7111cb1..b958fda 100644
+index eebeff3..da6e486 100644
 --- a/sys/decklink/gstdecklinkvideosink.cpp
 +++ b/sys/decklink/gstdecklinkvideosink.cpp
 @@ -158,7 +158,7 @@ reset_framerate (GstCapsFeatures * features, GstStructure * structure,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
index c51a637..8eb47c2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
@@ -5,6 +5,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
 
+# Note: The mpg123 plugin was moved to gst-plugins-ugly prior to the 1.7.2
+# release, so this line should be removed during the update to 1.8.x
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=08d8aefcdaaf89ecb6dd53ec1e4f95cd42d01664
+PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
+
+# Note: The gsettings plug-in was dropped prior to the 1.7.2 release,
+# so this line should be removed during the update to 1.8.x
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=914291808ad10621d6a74031f3d46d45eef5a3a3
+EXTRA_OECONF += "--disable-gsettings"
+
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
     file://configure-allow-to-disable-libssh2.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index f9b5f3e..5be76db 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -16,11 +16,12 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
 "
 
-PV = "1.7.1+git${SRCPV}"
+PV = "1.7.2+git${SRCPV}"
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "3a088ecc9330d5cb8888ff43de0fe4f61c23a607"
-SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_base = "50ae46cc0f8827bf966920d9c221e5cf86e811ba"
+SRCREV_common = "a25397448942079002622be231e9ec49b985745a"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
@@ -31,6 +32,20 @@ S = "${WORKDIR}/git"
 # This should move back to the common .inc once the main recipe updates to 1.8.x
 PACKAGECONFIG[hls] = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
 
+# The tinyalsa plugin was added prior to the 1.7.2 release
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=c8bd74fa9a81398f57d976c478d2043f30188684
+PACKAGECONFIG[tinyalsa] = "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
+
+# The vulkan based video sink plugin was added prior to the 1.7.2 release
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=5de6dd9f40629562acf90e35e1fa58464d66617d
+PACKAGECONFIG[vulkan] = "--enable-vulkan,--disable-vulkan,libxcb"
+
+# The dependency-less netsim plugin was added prior to the 1.7.2 release
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=e3f9e854f08e82bfab11182c5a2aa6f9a0c73cd5
+EXTRA_OECONF += " \
+    --enable-netsim \
+"
+
 do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


