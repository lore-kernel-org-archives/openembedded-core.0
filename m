Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 386D17F733
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:26 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id BB309A35EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1571756378; bh=+Wd/cRbYOd2q7bw
	AhAO9UDJxZkO5GGRTIxJbSgUg6lk=; b=KzKZVGxOspRGGvL5XWOL1yFU3Ai3sIj
	LSHYnlWX5CuqK25goZYu1ci2ZATOsJxfmWS+4QkwWtuImklY4vwBw/STlOXqUFVh
	WZbIYMjvCTznZqI/V5IHc2vNtHXllouAn5lzJE/l3HXZ+X1a1Qvhrc+TViOT2l0E
	hMoQ2K9qTJthmKfSsXa27Z7sIDM2cckklX9ervb6SAOlQxAAa+e1tbBNAuy8BVcE
	ejX5RPVrV79nfEsG+6FV2LrmcbSDOnQQJUDRt5K+m16B3RNCcH+YwBp1hMAJu/tW
	pSMxtiGI8N6v2CZOWY79LI/11EdB+IvqTI6Cl64MP3m3kySYM/DU33g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=GI9uZXleRwV9hdmEsKF14yKlUNNfJu6Uvr+kpAXyxR8=;
	b=dsEWskx3Y0Iu2JNa8r9D376d+AQVKVGTmPPS9a2ijJ7tzoFHs2EEAIXGANhRRjLdIO91e8
	axwY25k/2m4QxQRyG0+i64d8vScoyyr92+lozUBLIt3gUTexFiroNJSm2BuNOtl1HQrxLA
	SIzshvcO3BTPsJAFCjuhMbLoBZzGvAfvn6vkPxQehTzvwvcREWBItFireAyMHI/nxIGFgn
	jvOa5itAoMSMy6fTwVYpndO2aaQnCsb0gThaIn26Mnf9bf8Ayv9X57X6WXyF+ZuBmQd10c
	6QYvHOgJavJnKladBIDJvtuE8/3psQ3I3ncSE87nS53PGgRACkMqOef9/kIATA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
	[80.241.56.123]) (amavisd-new, port 10030) with ESMTP id 1yeBHz1ea6em
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:38 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:18 +0200
Message-Id: <20191022145927.1241-3-crg7475@mailbox.org>
In-Reply-To: <20191022145927.1241-1-crg7475@mailbox.org>
References: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 03/12] gstreamer1.0-plugins-good: upgrade to version 1.16.1
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
X-List-Received-Date: Tue, 22 Oct 2019 15:06:26 -0000

* 0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
* headerfix.patch
  Removed since these changes are already included in 1.16.1

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...tise-interleaved-layout-in-caps-temp.patch | 37 ----------------
 .../gstreamer1.0-plugins-good/headerfix.patch | 43 -------------------
 ...bb => gstreamer1.0-plugins-good_1.16.1.bb} |  6 +--
 3 files changed, 2 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.0.bb => gstreamer1.0-plugins-good_1.16.1.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
deleted file mode 100644
index caa080c8e7..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From aadfa5f20f53601785e417fe3fcbe6d574880988 Mon Sep 17 00:00:00 2001
-From: Philippe Normand <philn@igalia.com>
-Date: Tue, 23 Apr 2019 10:10:01 +0100
-Subject: [PATCH] scaletempo: Advertise interleaved layout in caps templates
-
-Scaletempo doesn't support non-interleaved layout. Not explicitely stating this
-would trigger critical warnings and a caps negotiation failure when scaletempo
-is used as playbin audio-filter.
-
-Patch suggested by George Kiagiadakis <george.kiagiadakis@collabora.com>.
-
-Fixes #591
-Upstream-Status: Backport [merged, on track for 1.16.1.]
----
- gst/audiofx/gstscaletempo.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/gst/audiofx/gstscaletempo.c b/gst/audiofx/gstscaletempo.c
-index 3a719719a..83ee8fe24 100644
---- a/gst/audiofx/gstscaletempo.c
-+++ b/gst/audiofx/gstscaletempo.c
-@@ -93,9 +93,9 @@ enum
- 
- #define SUPPORTED_CAPS \
- GST_STATIC_CAPS ( \
--    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (F32)) "; " \
--    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (F64)) "; " \
--    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (S16)) \
-+    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (F32)) ", layout=(string)interleaved; " \
-+    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (F64)) ", layout=(string)interleaved; " \
-+    GST_AUDIO_CAPS_MAKE (GST_AUDIO_NE (S16)) ", layout=(string)interleaved" \
- )
- 
- static GstStaticPadTemplate sink_template = GST_STATIC_PAD_TEMPLATE ("sink",
--- 
-2.20.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch
deleted file mode 100644
index 34d25a0a49..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Things break with overlapping defines between glib and gstreamer with glibc 2.30.
-
-Discussion in the link below, basically internal __ prefixed variables 
-shouldn't be redefined.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/issues/635]
-RP 2019/8/6
-
-Index: gst-plugins-good-1.16.0/sys/v4l2/ext/types-compat.h
-===================================================================
---- gst-plugins-good-1.16.0.orig/sys/v4l2/ext/types-compat.h
-+++ gst-plugins-good-1.16.0/sys/v4l2/ext/types-compat.h
-@@ -24,29 +24,6 @@
- #ifndef __TYPES_COMPAT_H__
- #define __TYPES_COMPAT_H__
- 
--/* From linux/types.h */
--#ifndef __bitwise__
--#  ifdef __CHECKER__
--#    define __bitwise__ __attribute__((bitwise))
--#  else
--#    define __bitwise__
--#  endif
--#endif
--
--#ifndef __bitwise
--#  ifdef __CHECK_ENDIAN__
--#    define __bitwise __bitwise__
--#  else
--#    define __bitwise
--#  endif
--#endif
--
--#define __u64 guint64
--#define __u32 guint32
--#define __u16 guint16
--#define __u8 guint8
--#define __s64 gint64
--#define __s32 gint32
--#define __le32 guint32 __bitwise
-+#include <linux/types.h>
- 
- #endif /* __TYPES_COMPAT_H__ */
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
index 5751467db1..21d2b2bb7f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
@@ -2,13 +2,11 @@ require gstreamer1.0-plugins.inc
 
 SRC_URI = " \
             http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
-            file://0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-            file://headerfix.patch \
             "
 
-SRC_URI[md5sum] = "d1a7b442994d9522418de4af4330e034"
-SRC_URI[sha256sum] = "654adef33380d604112f702c2927574cfc285e31307b79e584113858838bb0fd"
+SRC_URI[md5sum] = "515987ee763256840a11bd8ea098f2bf"
+SRC_URI[sha256sum] = "9fbabe69018fcec707df0b71150168776040cde6c1a26bb5a82a136755fa8f1f"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.17.1


