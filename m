Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id E5C387E3A3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 11:07:05 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id B5C59A0160
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:07:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1558868808; bh=qK+sMIrNaTShuRk
	nSsuWNooyD95CcHK7RRnlxIoN4AI=; b=QJTr+dxssNhsC1YF888zGJKcykncC7k
	/y12w3RCSqOmBR52A7Sy/RK756mOMwZZxwD5vfZWEGnDX30eNlTU7L7k8xQ1u2ON
	5/uuAxqofX2tD8LQTxrIx4zaadhMBYZSMOOmRUcs1lpddK86hylvnC2PLuxpTfTG
	rQbWxAqKnwqJgUNGyOuN2qbyHC4IoPSxdj7hfbSbK2Yq/afncw0252g7WrEjBN1i
	su1MgfbaBEu7DmntVrxM/JeRIXVLb0nHIXmgdty161D/jNzpxcX43bvVZAXU7yt3
	lzEremiLv2VcegGol2zt9nuncheshmqP/wFawmn+4qCGoeQI+hm9YVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1558868823; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=TAIVQvxvOciL+IADvmDxnS+JSl5uC6zrgz0wEvdzsvo=;
	b=FYIPTXrHihrcSSl7TA8HdBAThds/Gr4UQG+RCRHTZvVK5kb5UuQk5X3OudiFTvMAHGUtbb
	4VqIlXIc8LxLY6hBMXr2LFV3rd6nK9BwwsDyo7LMHTDH5QWsfjXkvp40Qy4v+JtOtMPW1v
	dPV2SWiq1BP+wUCgMuf1SK0ypaMV1dfHiGPoVsU4gnQVYSVOQlTolo9LJ2B4gcEPP1l/Yo
	dkpLuHOn6jndF+qlmGjQZ26XycVzXBCJrp3oc4Nt3seM+lSY20zWMxth1tD6s5KIyQrMGg
	gnU/KkfkdRseY9XDYbdyxWtIzWnF2+w0Dc+tA9tyeqVxf1cHDgPja6eRqvDuOA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by gerste.heinlein-support.de (gerste.heinlein-support.de
	[91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id NJNSYZCI6a_6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:48 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2019 13:06:35 +0200
Message-Id: <20190526110642.5341-4-crg7475@mailbox.org>
In-Reply-To: <20190526110642.5341-1-crg7475@mailbox.org>
References: <20190526110642.5341-1-crg7475@mailbox.org>
Subject: [PATCH 04/11] gstreamer1.0-plugins-bad: upgrade to version 1.16.0
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
X-List-Received-Date: Sun, 26 May 2019 11:07:06 -0000

* 0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
  Removed since the https://bugzilla.gnome.org/show_bug.cgi?id=726571
  fix is included in 1.16.0

* SCTP plugin got added

* WPE plugin got added (but currently disabled due to build problems with
  meta-webkit; will be fixed in a separate commit)

* ACM, SPC, daala, VCD plugins got removed

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...t-hardcode-libtool-name-when-running.patch | 43 -------------------
 .../avoid-including-sys-poll.h-directly.patch |  2 +-
 .../configure-allow-to-disable-libssh2.patch  |  4 +-
 ...-sentinels-for-gst_structure_get-etc.patch |  8 ++--
 ...ized-warnings-when-compiling-with-Os.patch |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.16.0.bb} | 17 +++-----
 6 files changed, 15 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.14.4.bb => gstreamer1.0-plugins-bad_1.16.0.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
deleted file mode 100644
index 05b991a8f0..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7d8e8b8bcce34d01fc7ad7285b4eb17ad8949399 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Wed, 11 Apr 2018 11:06:39 +0800
-Subject: [PATCH] Makefile.am: don't hardcode libtool name when running 
- introspection tools
-
-Upstream-Status: Pending [review on oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- gst-libs/gst/insertbin/Makefile.am | 2 +-
- gst-libs/gst/mpegts/Makefile.am    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gst-libs/gst/insertbin/Makefile.am b/gst-libs/gst/insertbin/Makefile.am
-index 1f8ea30..4b98ef6 100644
---- a/gst-libs/gst/insertbin/Makefile.am
-+++ b/gst-libs/gst/insertbin/Makefile.am
-@@ -45,7 +45,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstinsertbin-@GS
- 		--library=libgstinsertbin-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-base-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-insertbin-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/mpegts/Makefile.am b/gst-libs/gst/mpegts/Makefile.am
-index f264e33..9934a4d 100644
---- a/gst-libs/gst/mpegts/Makefile.am
-+++ b/gst-libs/gst/mpegts/Makefile.am
-@@ -82,7 +82,7 @@ GstMpegts-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstmpegts-@GST_API_
- 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
- 		--library=libgstmpegts-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-video-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-mpegts-@GST_API_VERSION@ \
--- 
-2.7.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch
index 357fd78002..32261279a5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/avoid-including-sys-poll.h-directly.patch
@@ -16,7 +16,7 @@ diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
 index b93255f..49f145a 100644
 --- a/sys/dvb/gstdvbsrc.c
 +++ b/sys/dvb/gstdvbsrc.c
-@@ -93,7 +93,7 @@
+@@ -97,7 +97,7 @@
  #include <gst/gst.h>
  #include <gst/glib-compat-private.h>
  #include <sys/ioctl.h>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
index ad86329893..25861b6b9d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
@@ -22,7 +22,7 @@ Index: gst-plugins-bad-1.12.3/configure.ac
 ===================================================================
 --- gst-plugins-bad-1.12.3.orig/configure.ac
 +++ gst-plugins-bad-1.12.3/configure.ac
-@@ -2139,6 +2139,15 @@ AG_GST_CHECK_FEATURE(CHROMAPRINT, [chrom
+@@ -1202,6 +1202,15 @@ AG_GST_CHECK_FEATURE(CHROMAPRINT, [chrom
  ])
  
  dnl *** Curl ***
@@ -38,7 +38,7 @@ Index: gst-plugins-bad-1.12.3/configure.ac
  translit(dnm, m, l) AM_CONDITIONAL(USE_CURL, true)
  AG_GST_CHECK_FEATURE(CURL, [Curl plugin], curl, [
    PKG_CHECK_MODULES(CURL, libcurl >= 7.35.0, [
-@@ -2161,12 +2170,14 @@ AG_GST_CHECK_FEATURE(CURL, [Curl plugin]
+@@ -1224,12 +1233,14 @@ AG_GST_CHECK_FEATURE(CURL, [Curl plugin]
    ])
    AC_SUBST(CURL_CFLAGS)
    AC_SUBST(CURL_LIBS)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
index 20c9ffcd84..2d5389d953 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
@@ -27,7 +27,7 @@ Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
 ===================================================================
 --- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklink.cpp
 +++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
-@@ -476,7 +476,7 @@ gst_decklink_mode_get_structure (GstDeck
+@@ -617,7 +617,7 @@ gst_decklink_mode_get_structure (GstDeck
        "pixel-aspect-ratio", GST_TYPE_FRACTION, mode->par_n, mode->par_d,
        "interlace-mode", G_TYPE_STRING,
        mode->interlaced ? "interleaved" : "progressive",
@@ -36,7 +36,7 @@ Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
  
    if (input && mode->interlaced) {
      if (mode->tff)
-@@ -489,16 +489,16 @@ gst_decklink_mode_get_structure (GstDeck
+@@ -632,16 +632,16 @@ gst_decklink_mode_get_structure (GstDeck
      case bmdFormat8BitYUV:     /* '2vuy' */
        gst_structure_set (s, "format", G_TYPE_STRING, "UYVY",
            "colorimetry", G_TYPE_STRING, mode->colorimetry,
@@ -61,7 +61,7 @@ Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
 ===================================================================
 --- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklinkaudiosrc.cpp
 +++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
-@@ -322,7 +322,7 @@ gst_decklink_audio_src_set_caps (GstBase
+@@ -387,7 +387,7 @@ gst_decklink_audio_src_set_caps (GstBase
        g_mutex_unlock (&self->input->lock);
  
        if (videosrc) {
@@ -74,7 +74,7 @@ Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkvideosink.cpp
 ===================================================================
 --- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklinkvideosink.cpp
 +++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkvideosink.cpp
-@@ -163,7 +163,7 @@ reset_framerate (GstCapsFeatures * featu
+@@ -285,7 +285,7 @@ reset_framerate (GstCapsFeatures * featu
      gpointer user_data)
  {
    gst_structure_set (structure, "framerate", GST_TYPE_FRACTION_RANGE, 0, 1,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
index 5ce57714e7..73681f1002 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
@@ -14,7 +14,7 @@ diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codecparser
 index fd16ee0..ddb890c 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
-@@ -1729,7 +1729,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
+@@ -1730,7 +1730,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
      GstVC1SeqLayer * seqlayer)
  {
    guint32 tmp;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
index 23d093d47c..f676b1f6de 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
@@ -7,10 +7,9 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
 "
-SRC_URI[md5sum] = "5d20a91d027708abcf924f6c1279dd25"
-SRC_URI[sha256sum] = "910b4e0e2e897e8b6d06767af1779d70057c309f67292f485ff988d087aa0de5"
+SRC_URI[md5sum] = "e9e562d86c1527c44d904500dd35e326"
+SRC_URI[sha256sum] = "22139de35626ada6090bdfa3423b27b7fc15a0198331d25c95e6b12cb1072b05"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
@@ -69,6 +68,7 @@ PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdrea
 PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
 PACKAGECONFIG[sbc]             = "--enable-sbc,--disable-sbc,sbc"
+PACKAGECONFIG[sctp]            = "--enable-sctp,--disable-sctp,usrsctp"
 PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
 PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
@@ -84,10 +84,10 @@ PACKAGECONFIG[webrtc]          = "--enable-webrtc,--disable-webrtc,libnice"
 PACKAGECONFIG[webrtcdsp]       = "--enable-webrtcdsp,--disable-webrtcdsp,webrtc-audio-processing"
 
 # these plugins have no corresponding library in OE-core or meta-openembedded:
-#   openni2 winks direct3d directsound winscreencap acm apple_media iqa
-#   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate ladspa
+#   openni2 winks direct3d directsound winscreencap apple_media iqa
+#   android_media avc bs2b chromaprint dts fdkaac gme gsm kate ladspa
 #   lv2 mpeg2enc mplex musepack nvenc ofa opensles soundtouch
-#   spandsp spc teletextdec vdpau wasapi x265 zbar
+#   spandsp teletextdec vdpau wasapi wpe x265 zbar
 
 EXTRA_OECONF += " \
     --enable-decklink \
@@ -96,15 +96,12 @@ EXTRA_OECONF += " \
     --enable-ipcpipeline \
     --enable-netsim \
     --enable-shm \
-    --enable-vcd \
-    --disable-acm \
     --disable-android_media \
     --disable-aom \
     --disable-apple_media \
     --disable-avc \
     --disable-bs2b \
     --disable-chromaprint \
-    --disable-daala \
     --disable-direct3d \
     --disable-directsound \
     --disable-dts \
@@ -125,7 +122,6 @@ EXTRA_OECONF += " \
     --disable-opensles \
     --disable-soundtouch \
     --disable-spandsp \
-    --disable-spc \
     --disable-srt \
     --disable-teletextdec \
     --disable-vdpau \
@@ -133,6 +129,7 @@ EXTRA_OECONF += " \
     --disable-wildmidi \
     --disable-winks \
     --disable-winscreencap \
+    --disable-wpe \
     --disable-x265 \
     --disable-zbar \
     ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
-- 
2.17.1


