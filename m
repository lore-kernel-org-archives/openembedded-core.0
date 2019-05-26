Return-Path: <crg7475@mailbox.org>
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id 7C71C7E3A3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 11:07:07 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id 638794FDC1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1558868807; bh=uRuw9+Z3/1RNjkW
	tvL8CZd0TysZyJXg4LNYOu0EByBU=; b=s7QUAlVv0xu0zAPaaAkrwQxtmjsSHRw
	RcWZLcSXOmI9Gqqqm8JJgQUIsOm066c4nnMvGdx9H1ONdDJ/Uswyu6auueX2ef5i
	9Snr6H984oq08eAe+o+2DFvhp8OJjUsFsvHUL8v2B0yQ6hwdEtCt6DOWpbGhswb+
	sJme0NebJjKBSOLmo3nDf4EQ0JyKZFZwdbCNnYyHsvm7prg3e3f9YZlULOZGLHHE
	tM/iMlzzj8PbMObkuh71hOsftpBpl+M1C5LJ72y4FZiSXlcyeYNHD6R1QMcAIu4x
	bl0MnEamuxwkCmDEJe3GtxEjWgrFx4FTjLopbJQp+NmEQP96R5gy9BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1558868813; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=b8/dLQNlfLWMDrO7a9V5vBy5pZgwtjj63lRz2pvoarQ=;
	b=BkgO4/rn/ZbV7fWoHq+VT00/NXWtie3wOidL7DJnUnCDo2zvYQPY6qg4TWUGtAfxf1NmH3
	HQHO/njU0uIuDNOQwgsAKQ2FCDnlCLB/GkD4/BMLzSc9FEVqL+Wysgn0Y/CE4K5LIBcHl/
	04i1hBq491nFVLekD6UmPalFBUVdguvdVjNDvs4qneBcQHMkVyvadHivQ8jc8erLqyaGuI
	1xWMTQQJaUkowvcQE/0sZqAqLifeSvWZTG43Zun9x6yAkLWvuHV4GHkj3i8EpDtwtEIoIJ
	5GNV9MnLk09m5LzQ6ex0u5qMW+Jw54op/26fYA8vGZPunFIsGxl3hX5qwZH9lg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030) with ESMTP id LbPfWmXrhaEA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:47 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2019 13:06:34 +0200
Message-Id: <20190526110642.5341-3-crg7475@mailbox.org>
In-Reply-To: <20190526110642.5341-1-crg7475@mailbox.org>
References: <20190526110642.5341-1-crg7475@mailbox.org>
Subject: [PATCH 03/11] gstreamer1.0-plugins-good: upgrade to version 1.16.0
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
X-List-Received-Date: Sun, 26 May 2019 11:07:08 -0000

* 0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
  Added this patch that is on track for version 1.16.1 because
  it is needed for WebKit

* 0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
  Removed since it is not needed (using mpeg4videoparse fixes the issue)

* avoid-including-sys-poll.h-directly.patch
* ensure-valid-sentinel-for-gst_structure_get.patch
  Removed since these are included in 1.16.0

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...t-dafault-value-for-MPEG4-without-co.patch | 62 -------------------
 ...tise-interleaved-layout-in-caps-temp.patch | 37 +++++++++++
 .../avoid-including-sys-poll.h-directly.patch | 44 -------------
 ...valid-sentinel-for-gst_structure_get.patch | 40 ------------
 ...bb => gstreamer1.0-plugins-good_1.16.0.bb} |  8 +--
 5 files changed, 40 insertions(+), 151 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/ensure-valid-sentinel-for-gst_structure_get.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.14.4.bb => gstreamer1.0-plugins-good_1.16.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
deleted file mode 100644
index a2cbb70fe9..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From c782a30482908a4b4dd9cd4abff9f9bc4016698f Mon Sep 17 00:00:00 2001
-From: Song Bing <b06498@freescale.com>
-Date: Tue, 5 Aug 2014 14:40:46 +0800
-Subject: [PATCH] gstrtpmp4gpay: set dafault value for MPEG4 without codec
- data in caps.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=734263
-
-Upstream-Status: Submitted
-
-Signed-off-by: Song Bing <b06498@freescale.com>
----
- gst/rtp/gstrtpmp4gpay.c |   19 ++++++++++++++++++-
- 1 file changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/gst/rtp/gstrtpmp4gpay.c b/gst/rtp/gstrtpmp4gpay.c
-index 7913d9a..1749d39 100644
---- a/gst/rtp/gstrtpmp4gpay.c
-+++ b/gst/rtp/gstrtpmp4gpay.c
-@@ -391,6 +391,7 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
-   const GValue *codec_data;
-   const gchar *media_type = NULL;
-   gboolean res;
-+  const gchar *name;
- 
-   rtpmp4gpay = GST_RTP_MP4G_PAY (payload);
- 
-@@ -401,7 +402,6 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
-     GST_LOG_OBJECT (rtpmp4gpay, "got codec_data");
-     if (G_VALUE_TYPE (codec_data) == GST_TYPE_BUFFER) {
-       GstBuffer *buffer;
--      const gchar *name;
- 
-       buffer = gst_value_get_buffer (codec_data);
-       GST_LOG_OBJECT (rtpmp4gpay, "configuring codec_data");
-@@ -427,6 +427,23 @@ gst_rtp_mp4g_pay_setcaps (GstRTPBasePayload * payload, GstCaps * caps)
- 
-       rtpmp4gpay->config = gst_buffer_copy (buffer);
-     }
-+  } else {
-+    name = gst_structure_get_name (structure);
-+
-+    if (!strcmp (name, "video/mpeg")) {
-+      rtpmp4gpay->profile = g_strdup ("1");
-+
-+      /* fixed rate */
-+      rtpmp4gpay->rate = 90000;
-+      /* video stream type */
-+      rtpmp4gpay->streamtype = "4";
-+      /* no params for video */
-+      rtpmp4gpay->params = NULL;
-+      /* mode */
-+      rtpmp4gpay->mode = "generic";
-+
-+      media_type = "video";
-+    }
-   }
-   if (media_type == NULL)
-     goto config_failed;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
new file mode 100644
index 0000000000..844042a334
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
@@ -0,0 +1,37 @@
+From aadfa5f20f53601785e417fe3fcbe6d574880988 Mon Sep 17 00:00:00 2001
+From: Philippe Normand <philn@igalia.com>
+Date: Tue, 23 Apr 2019 10:10:01 +0100
+Subject: [PATCH] scaletempo: Advertise interleaved layout in caps templates
+
+Scaletempo doesn't support non-interleaved layout. Not explicitely stating this
+would trigger critical warnings and a caps negotiation failure when scaletempo
+is used as playbin audio-filter.
+
+Patch suggested by George Kiagiadakis <george.kiagiadakis@collabora.com>.
+
+Fixes #591
+Upstream status: merged, on track for 1.16.1.
+---
+ gst/audiofx/gstscaletempo.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gst/audiofx/gstscaletempo.c b/gst/audiofx/gstscaletempo.c
+index 3a719719a..83ee8fe24 100644
+--- a/gst/audiofx/gstscaletempo.c
++++ b/gst/audiofx/gstscaletempo.c
+@@ -93,9 +93,9 @@ enum
+ 
+ #define SUPPORTED_CAPS \
+ GST_STATIC_CAPS ( \
+-    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (F32)) "; " \
+-    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (F64)) "; " \
+-    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (S16)) \
++    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (F32)) ", layout=(string)interleaved; " \
++    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (F64)) ", layout=(string)interleaved; " \
++    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (S16)) ", layout=(string)interleaved" \
+ )
+ 
+ static GstStaticPadTemplate sink_template = GST_STATIC_PAD_TEMPLATE ("sink",
+-- 
+2.20.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch
deleted file mode 100644
index c7f3630eca..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4bfe2c8570a4a7080ec662504882969054d8a072 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Wed, 3 Feb 2016 18:12:38 -0800
-Subject: [PATCH] avoid including <sys/poll.h> directly
-
-musl libc generates warnings if <sys/poll.h> is included directly.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- ext/raw1394/gstdv1394src.c  | 2 +-
- ext/raw1394/gsthdv1394src.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ext/raw1394/gstdv1394src.c b/ext/raw1394/gstdv1394src.c
-index dbc7607..3c42b41 100644
---- a/ext/raw1394/gstdv1394src.c
-+++ b/ext/raw1394/gstdv1394src.c
-@@ -37,7 +37,7 @@
- #include "config.h"
- #endif
- #include <unistd.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/socket.h>
- #include <errno.h>
- #include <fcntl.h>
-diff --git a/ext/raw1394/gsthdv1394src.c b/ext/raw1394/gsthdv1394src.c
-index 0b07a37..9785a15 100644
---- a/ext/raw1394/gsthdv1394src.c
-+++ b/ext/raw1394/gsthdv1394src.c
-@@ -36,7 +36,7 @@
- #include "config.h"
- #endif
- #include <unistd.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/socket.h>
- #include <errno.h>
- #include <fcntl.h>
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/ensure-valid-sentinel-for-gst_structure_get.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/ensure-valid-sentinel-for-gst_structure_get.patch
deleted file mode 100644
index bc7ac0b6a1..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/ensure-valid-sentinel-for-gst_structure_get.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2169f2205c0205a220d826d7573e5a863bd36e0a Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 9 Feb 2016 14:00:00 -0800
-Subject: [PATCH] ensure valid sentinal for gst_structure_get()
-
-gst_structure_get() is declared with G_GNUC_NULL_TERMINATED, ie
-__attribute__((__sentinel__)), which means gcc will generate a
-warning if the last parameter passed to the function is not NULL
-(where a valid NULL in this context is defined as zero with any
-pointer type).
-
-The C code callers to gst_structure_get() within gst-plugins-good
-use the C NULL definition (ie ((void*)0)), which is a valid sentinel.
-
-However gstid3v2mux.cc uses the C++ NULL definition (ie 0L), which
-is not a valid sentinel without an explicit cast to a pointer type.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- ext/taglib/gstid3v2mux.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/taglib/gstid3v2mux.cc b/ext/taglib/gstid3v2mux.cc
-index 8651e77..a87234f 100644
---- a/ext/taglib/gstid3v2mux.cc
-+++ b/ext/taglib/gstid3v2mux.cc
-@@ -465,7 +465,7 @@ add_image_tag (ID3v2::Tag * id3v2tag, const GstTagList * list,
- 
-           if (info_struct) {
-             if (gst_structure_get (info_struct, "image-type",
--                    GST_TYPE_TAG_IMAGE_TYPE, &image_type, NULL)) {
-+                    GST_TYPE_TAG_IMAGE_TYPE, &image_type, (void *) NULL)) {
-               if (image_type > 0 && image_type <= 18) {
-                 image_type += 2;
-               } else {
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb
index 8306605796..ad831ed25c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb
@@ -2,14 +2,12 @@ require gstreamer1.0-plugins.inc
 
 SRC_URI = " \
             http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
-            file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
-            file://avoid-including-sys-poll.h-directly.patch \
-            file://ensure-valid-sentinel-for-gst_structure_get.patch \
+            file://0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 
-SRC_URI[md5sum] = "6e3b247097366cf2639f22abfece7113"
-SRC_URI[sha256sum] = "5f8b553260cb0aac56890053d8511db1528d53cae10f0287cfce2cb2acc70979"
+SRC_URI[md5sum] = "d1a7b442994d9522418de4af4330e034"
+SRC_URI[sha256sum] = "654adef33380d604112f702c2927574cfc285e31307b79e584113858838bb0fd"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.17.1


