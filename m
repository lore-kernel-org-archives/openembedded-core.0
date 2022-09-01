Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B19ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:41 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.9357.1662016900208764891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mfvq25Ci;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id e13so20182150wrm.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=8SOn8W21hu9ca5zdLAaguxftbvg8O7CDwm7ttNusaM8=;
        b=Mfvq25CiqNf8ylsaUeHGkUM7VmzIbJy5wmmBi0q4WCGkmAT5sOOCzUkYk9ytfC2dtO
         VWpGO7S5GKMQlN3I5XOJiv3ve9I7al938WEGiioGjaNaft9pyJ7YzPwMlR/XJxolPX5Q
         SnwNflT5DbXb5+oR/cnYVWBiRIEYMoJMsqViyV8iSKqR9X3KyCNeqoruLTRO87PFw1De
         LHdRWXEE4VwQC6M7ZQg7AbUWwEbs9aeHkdfA4OoSTVzOjra/AG8VE6Ym4IPnffdjMnPO
         IhuNwSUjR62vj2ybSRtj0EA+XJynlz2hGRbBvXxxdLEViTAlbmEZxntQD8Bo05ytBAd0
         XJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=8SOn8W21hu9ca5zdLAaguxftbvg8O7CDwm7ttNusaM8=;
        b=SOaomN6XZx3kLs87tiDdGKGFoeyRfc5KICoiTSJBMV0VAl0yMz0G4PLaapoLpSphFi
         FxbAPYETRMUdv0kSu59icMgfpY+0gPeTuhwdvgr4O05E88vTfiKidqWjs4fXOf6L6QJg
         GC4+akVYmyyr/J6N0hptZyJg4Bs2fiawYj2sicMlaczZiqs9dT7Cx81vh4h9o9U4PEjW
         BcSQTX66yegaW5sr2bYd4xSxXnhFyn9W0j9uqIC9tFbaqBjIN+SKMOZKvrnxvw8WzizC
         x08gwOj/H+gy/ZA35TqcuZUQSvIKV7tHwmkyQqANiw8M62McrhTql/ztEn6twmEX/SQ+
         zOIQ==
X-Gm-Message-State: ACgBeo1a2AY1YCZDfk2w5aq+DVYrEuUm05+qL9J5OBkn8YKTXg1Gb3Se
	gmvEJ04gvPQLekSLLeFoUMcCgZErZbk=
X-Google-Smtp-Source: 
 AA6agR6RNusCRaECrmIgbluY//gg7BVoxAxJ5uyox0HmBR5SimXt+5YN+X3PpYPehqqo98VrE7N7Cg==
X-Received: by 2002:a5d:56cb:0:b0:225:4971:562 with SMTP id
 m11-20020a5d56cb000000b0022549710562mr13638795wrw.352.1662016898542;
        Thu, 01 Sep 2022 00:21:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/14] gstreamer1.0-plugins-bad: remove an unneeded patch
Date: Thu,  1 Sep 2022 09:21:15 +0200
Message-Id: <20220901072125.3366367-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170146

Latest gcc no longer produces the warnings that this patch was
fixing.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-sentinals-for-gst_structure_get-etc.patch | 86 -------------------
 .../gstreamer1.0-plugins-bad_1.20.3.bb        |  1 -
 2 files changed, 87 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch
deleted file mode 100644
index 280cbf984a..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 001fa08542dd5fc79571f7c803b2d3dd59c04a06 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 9 Feb 2016 14:00:00 -0800
-Subject: [PATCH] ensure valid sentinals for gst_structure_get() etc
-
-For GStreamer functions declared with G_GNUC_NULL_TERMINATED,
-ie __attribute__((__sentinel__)), gcc will generate a warning if the
-last parameter passed to the function is not NULL (where a valid NULL
-in this context is defined as zero with any pointer type).
-
-The C callers to such functions within gst-plugins-bad use the C NULL
-definition (ie ((void*)0)), which is a valid sentinel.
-
-However the C++ NULL definition (ie 0L), is not a valid sentinel
-without an explicit cast to a pointer type.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
----
- sys/decklink/gstdecklink.cpp          | 10 +++++-----
- sys/decklink/gstdecklinkaudiosrc.cpp  |  2 +-
- sys/decklink/gstdecklinkvideosink.cpp |  2 +-
- 3 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/sys/decklink/gstdecklink.cpp b/sys/decklink/gstdecklink.cpp
-index 3f79deb..96600c6 100644
---- a/sys/decklink/gstdecklink.cpp
-+++ b/sys/decklink/gstdecklink.cpp
-@@ -680,7 +680,7 @@ gst_decklink_mode_get_generic_structure (GstDecklinkModeEnum e)
-       "pixel-aspect-ratio", GST_TYPE_FRACTION, mode->par_n, mode->par_d,
-       "interlace-mode", G_TYPE_STRING,
-       mode->interlaced ? "interleaved" : "progressive",
--      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, NULL);
-+      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, (void*)NULL);
- 
-   return s;
- }
-@@ -705,16 +705,16 @@ gst_decklink_mode_get_structure (GstDecklinkModeEnum e, BMDPixelFormat f,
-     case bmdFormat8BitYUV:     /* '2vuy' */
-       gst_structure_set (s, "format", G_TYPE_STRING, "UYVY",
-           "colorimetry", G_TYPE_STRING, mode->colorimetry,
--          "chroma-site", G_TYPE_STRING, "mpeg2", NULL);
-+          "chroma-site", G_TYPE_STRING, "mpeg2", (void*)NULL);
-       break;
-     case bmdFormat10BitYUV:    /* 'v210' */
--      gst_structure_set (s, "format", G_TYPE_STRING, "v210", NULL);
-+      gst_structure_set (s, "format", G_TYPE_STRING, "v210", (void*)NULL);
-       break;
-     case bmdFormat8BitARGB:    /* 'ARGB' */
--      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", NULL);
-+      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", (void*)NULL);
-       break;
-     case bmdFormat8BitBGRA:    /* 'BGRA' */
--      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", NULL);
-+      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", (void*)NULL);
-       break;
-     case bmdFormat10BitRGB:    /* 'r210' Big-endian RGB 10-bit per component with SMPTE video levels (64-960). Packed as 2:10:10:10 */
-     case bmdFormat12BitRGB:    /* 'R12B' Big-endian RGB 12-bit per component with full range (0-4095). Packed as 12-bit per component */
-diff --git a/sys/decklink/gstdecklinkaudiosrc.cpp b/sys/decklink/gstdecklinkaudiosrc.cpp
-index 50ad5cc..d209180 100644
---- a/sys/decklink/gstdecklinkaudiosrc.cpp
-+++ b/sys/decklink/gstdecklinkaudiosrc.cpp
-@@ -388,7 +388,7 @@ gst_decklink_audio_src_start (GstDecklinkAudioSrc * self)
-       g_mutex_unlock (&self->input->lock);
- 
-       if (videosrc) {
--        g_object_get (videosrc, "connection", &vconn, NULL);
-+        g_object_get (videosrc, "connection", &vconn, (void *) NULL);
-         gst_object_unref (videosrc);
- 
-         switch (vconn) {
-diff --git a/sys/decklink/gstdecklinkvideosink.cpp b/sys/decklink/gstdecklinkvideosink.cpp
-index a64c046..07a09e8 100644
---- a/sys/decklink/gstdecklinkvideosink.cpp
-+++ b/sys/decklink/gstdecklinkvideosink.cpp
-@@ -288,7 +288,7 @@ reset_framerate (GstCapsFeatures * features, GstStructure * structure,
-     gpointer user_data)
- {
-   gst_structure_set (structure, "framerate", GST_TYPE_FRACTION_RANGE, 0, 1,
--      G_MAXINT, 1, NULL);
-+      G_MAXINT, 1, (void *) NULL);
- 
-   return TRUE;
- }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
index 2dd42395f7..39d5e08b21 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
@@ -8,7 +8,6 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues"
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
-           file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
 SRC_URI[sha256sum] = "7a11c13b55dd1d2386dd902219e41cbfcdda8e1e0aa3e738186c95074b35da4f"
-- 
2.30.2


