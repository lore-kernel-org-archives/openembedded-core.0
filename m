Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 462FD7FC67
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:00 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id s5so6331434pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0Lc9SUzGdOcFXswgV2kMKYPPAD+5Uo4tXswuvW5dJsU=;
	b=j6ZSXKtkRu+eaw/yJIpibfjuO3w98yWmDUoDYFT3BzGsTAjLaS/4VmYFY5xgvW88BL
	xljchCpBIGA1aE/RchkgbIEsQKCI/N3wy7GmzkGbQfXe3k/jDbTOm05VWJGtp3wqg+U1
	Pag74getn/ky7mqt5OdxNiev0eoSOhng8RQnqCJF+HgR6CWPHGRmncT9SwyCXCxyibB4
	6yQziCftLeQX3982SsJ79rpAYI6PVpqWHK7HmISzo4mboLjGYcqlF6X0O1W2BCmDcZRZ
	FS8r9iUphFx7R2uz+i5wFmL5QPb+bzJNnJtldNZCFD2mwYABd75SyZgvOjfbAe2sT9QM
	CeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0Lc9SUzGdOcFXswgV2kMKYPPAD+5Uo4tXswuvW5dJsU=;
	b=XfVt/Ke5IFnUKZlMLzUCnhHLpZPXIFHkvvlCEn5s773bqKG5sDJPrCiH83j6PVR7bt
	+B4LeR3syw7s/PjVpbOHWhIhxia4JYnqeKDpSPLk1Fg6+nQ4JrvPZJ6Q7MbqDFTjrlRK
	65Lh86fr5M15d5dbA+KdPDLyROdZsiS2crBtYEhGDxcV7lv/KLCr/sZU/hkc26TqVnWq
	46zWFkv6E8RZTlRm1U4QN81GU8nJqU81RVmY3PU1vtRFPhs6R/DpGobqGOLrNxgwzazs
	i4rneeJq7g6uuDDr3vimpZ5fVmN2x0p9IOpu7KAjtSJYREjuXq2dGLplLSXXE0nHjYj9
	nsfg==
X-Gm-Message-State: APjAAAUos1vr7LWv6BdmzCAEeN7b9UrCpUvoOLhd3tC4oOA93QlavbaU
	Cmwu44cyNJC3f2njmgWFAR8tAhxB
X-Google-Smtp-Source: APXvYqyF55ZMS2F2XVTvTcpja1uhU6saqIbYM0LpNOdiV84AihT6YGp6fLWBKRiVYvZownbGUllSBQ==
X-Received: by 2002:a63:5725:: with SMTP id l37mr29953422pgb.247.1574639461212;
	Sun, 24 Nov 2019 15:51:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:23 -0800
Message-Id: <3dc8faa42603b2665ae08e311943e33c7aa28a6d.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 18/35] gstreamer1.0-plugins-good: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:00 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

* 0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
* headerfix.patch
  Removed since these changes are already included in 1.16.1

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...Advertise-interleaved-layout-in-caps-temp.patch | 37 -------------------
 .../gstreamer1.0-plugins-good/headerfix.patch      | 43 ----------------------
 ...16.0.bb => gstreamer1.0-plugins-good_1.16.1.bb} |  6 +--
 3 files changed, 2 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.0.bb => gstreamer1.0-plugins-good_1.16.1.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch
deleted file mode 100644
index caa080c..0000000
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
index 34d25a0..0000000
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
index 5751467..21d2b2b 100644
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
2.7.4


