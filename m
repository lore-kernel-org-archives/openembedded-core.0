Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 74517780D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:50 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id r74so4037985wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1MEqP4RXN4W7Da2CqWEs2Un7UKI4Eib16QL4a5YKh7M=;
	b=fFqwO+ne6Yke2Q9u+oDnAxL4ES7/50KkWr7JngxbsXQZGBg9Pla0xqndPtewveW7xJ
	EqWMy7ebtPJN5AFQLCV1R+H2mX5EBcczFeFeVpNwtsFb+ECof8aSjPjbvVNRgkrWFd71
	w7zcsijfxFxiopWg0negy95XzxoPwD9eBxx3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1MEqP4RXN4W7Da2CqWEs2Un7UKI4Eib16QL4a5YKh7M=;
	b=YnXm/jNeM1cKcMkeMti9meuipCRdrorB477xU2o8gtIuG+tFBpAKJ/8TURNVOAafB9
	c5/K6QFnCtSIljpcAygCA0Y9K/ZoK5wYwSCDjwTxVBtaFeppNisrcDg88POwmahWFzJf
	6O3b4EnGuQ9MDdsakXqlJ3BjP3lwWLjub+KEi4I8gA7kezbToh97CYFvU8hLlnMqItd/
	JJHi/ZGvJliwjqEfCgAdbcKu1Fj471dJ9sjLjbaMc6n7t/wePvAGDrGuxhOIFK+G+uYs
	2iWMO51+1nm2/Hy5BpDCIOiNRAsOagDCd4PgGFHOTqk8HIc+fJYoN8smXPT2S0KnBLgR
	6sOw==
X-Gm-Message-State: AHPjjUjEzT93Yz5KRJYLgNiaDSJI66x4dxglDjAZaeIkocfc4/GPs0Ot
	IZOoKAYMx+wievYEWa+PbfM92aufltA=
X-Google-Smtp-Source: AOwi7QCP49xn0QeVdfwzT+T0w/Vw3bV/7X78GvnODFLBx9YiTBwxjauU4r8i3ZzD5xd95dXkv3B7XA==
X-Received: by 10.223.136.170 with SMTP id f39mr1310894wrf.164.1505985710790; 
	Thu, 21 Sep 2017 02:21:50 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:49 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:24 +0200
Message-Id: <20170921092131.25537-4-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 03/10] gstreamer1.0-plugins-good: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:50 -0000

Patch removed since it is already upstream now.

Bugfixes release only.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../0001-v4l2-Fix-4K-colorimetry.patch             | 48 ----------------------
 ...12.2.bb => gstreamer1.0-plugins-good_1.12.3.bb} |  5 +--
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.2.bb => gstreamer1.0-plugins-good_1.12.3.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch
deleted file mode 100644
index f78818aa17..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 545646cccba243236e10362fe7325f89be57da1f Mon Sep 17 00:00:00 2001
-From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
-Date: Tue, 18 Jul 2017 11:28:37 -0400
-Subject: [PATCH] v4l2: Fix 4K colorimetry
-
-Since 1.6, the transfer function for BT2020 has been changed from BT709
-to BT2020_12. It's the same function, but with more precision. As a side
-effect, the V4L2 colorpsace didn't match GStreamer colorspace. When
-GStreamer ended up making a guess, it would not match anything supported
-by V4L2 anymore. This this by using BT2020_12 for BT2020 colorspace and
-BT2020 transfer function in replacement of BT709 whenever a 4K
-resolution is detected.
-
-Upstream-Status: Backport
-Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
-
----
- sys/v4l2/gstv4l2object.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index 61244455f..aae2c55e7 100644
---- a/sys/v4l2/gstv4l2object.c
-+++ b/sys/v4l2/gstv4l2object.c
-@@ -1960,7 +1960,7 @@ gst_v4l2_object_get_colorspace (struct v4l2_format *fmt,
-     case V4L2_COLORSPACE_BT2020:
-       cinfo->range = GST_VIDEO_COLOR_RANGE_16_235;
-       cinfo->matrix = GST_VIDEO_COLOR_MATRIX_BT2020;
--      cinfo->transfer = GST_VIDEO_TRANSFER_BT709;
-+      cinfo->transfer = GST_VIDEO_TRANSFER_BT2020_12;
-       cinfo->primaries = GST_VIDEO_COLOR_PRIMARIES_BT2020;
-       break;
-     case V4L2_COLORSPACE_SMPTE240M:
-@@ -2062,7 +2062,10 @@ gst_v4l2_object_get_colorspace (struct v4l2_format *fmt,
- 
-   switch (transfer) {
-     case V4L2_XFER_FUNC_709:
--      cinfo->transfer = GST_VIDEO_TRANSFER_BT709;
-+      if (fmt->fmt.pix.height > 2160)
-+        cinfo->transfer = GST_VIDEO_TRANSFER_BT2020_12;
-+      else
-+        cinfo->transfer = GST_VIDEO_TRANSFER_BT709;
-       break;
-     case V4L2_XFER_FUNC_SRGB:
-       cinfo->transfer = GST_VIDEO_TRANSFER_SRGB;
--- 
-2.14.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.3.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.3.bb
index f9593c99aa..afcb333cb7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.3.bb
@@ -10,10 +10,9 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://0001-v4l2-Fix-4K-colorimetry.patch \
 "
-SRC_URI[md5sum] = "20254217d9805484532e08ff1c3aa296"
-SRC_URI[sha256sum] = "5591ee7208ab30289a30658a82b76bf87169c927572d9b794f3a41ed48e1ee96"
+SRC_URI[md5sum] = "6b56a7cc6c5fd031a9596ec123b2f285"
+SRC_URI[sha256sum] = "13e7f479296891fef5a686438f20ba7d534680becf2269ecc5ee24aa83b45f03"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.11.0


