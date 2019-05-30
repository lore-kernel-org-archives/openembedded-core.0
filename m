Return-Path: <crg7475@mailbox.org>
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3D37E46F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 16:42:14 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx1.mailbox.org (Postfix) with ESMTPS id 4F203504A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1559234526; bh=igNWAkNGrhCexUN
	5L3Md+iir2Vw5+/1FfjOMDXIFDYM=; b=LbxZF6Zmk+9epHmHPqgb9wFkSYqyVnx
	E9faeXSKzXY58Lj3qaoXp27F9D90/6jzFFit7JrbGRJvvwWBHm5VvZhvmfZbWgrW
	wPE6Zm5V8R7WBV++Ug2++hs7PD6pTkJgxtXzZ6kLo1ZWysMjYNyRvvFiTVOQSP6p
	TOnbQeV8Q0F5pfqDc2fld4JjNJ2VdIUL9g67TyPoExIB1yZUbq/VAM8YlO5R1A9U
	50Mqz3HWwHbsgmZIgZI32lePddf1kzGBStjO6IeCn4iSVTIJ/1NFpqbgfCTfvh3G
	Zg/Qd+XUB2TNxxUcW+BQfAFSTdpIOKqs/hGPOUdZbcIIolGNUqey0ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559234535; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=GNqxdxdgkx+g+1eOdb+qHwWl889f/7hG9fJUOnWoqfk=;
	b=E3AF64UCSpZxEWQuHdkay6DYKCdDEXJtAQP1uS7xCaXUqTBPMHKyqH3EkcfoZeS2QA5o3e
	V4z6ck37asi1I1picxAbqy2uxCWJwiQ893kv8ypPZRCSuD1+QDaBFw6/YuVrsCTitjmc96
	1bAw69s9Mcl2iI3FRq4l7Y3K3IX26AuIrjuXa2NiZvpe6vHYNOVgHz0qyj1GnNhlzzbN0h
	ZG0RZDMtSR4FVQnkU2TG7uVP0wqUx++C/d5KCrWZl3LpHmm4DwlvRDmDg+ZFaSdCTqigBD
	M6iBaaSJRNEbivOG5I87wZu4VMpaY8Wgbh+UICmJPECO91dunud2AA4YHFLfzw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id lVgqyheoLO7P
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:06 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 18:41:46 +0200
Message-Id: <20190530164150.27038-7-crg7475@mailbox.org>
In-Reply-To: <20190530164150.27038-1-crg7475@mailbox.org>
References: <20190530164150.27038-1-crg7475@mailbox.org>
Subject: [PATCH v2 07/11] gstreamer1.0-libav: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 16:42:14 -0000

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../0001-Disable-yasm-for-libav-when-disable-yasm.patch       | 2 +-
 .../0001-configure-check-for-armv7ve-variant.patch            | 4 ++--
 .../gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch   | 2 +-
 .../workaround-to-build-gst-libav-for-i586-with-gcc.patch     | 2 +-
 ...reamer1.0-libav_1.14.4.bb => gstreamer1.0-libav_1.16.0.bb} | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.14.4.bb => gstreamer1.0-libav_1.16.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
index 1d99ad1251..11571aefa1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index 22ede88..ef3c050 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -305,6 +305,12 @@ else
+@@ -355,6 +355,12 @@ else
      emblibav_configure_args="$emblibav_configure_args --enable-gpl"
    fi
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch
index b80d073946..f182715bda 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch
@@ -22,8 +22,8 @@ diff --git a/gst-libs/ext/libav/configure b/gst-libs/ext/libav/configure
 index 4a5e477..727818e 100755
 --- a/gst-libs/ext/libav/configure
 +++ b/gst-libs/ext/libav/configure
-@@ -4295,6 +4295,7 @@ elif enabled arm; then
-         elif check_arm_arch 6Z;       then echo armv6z
+@@ -4745,6 +4745,7 @@ elif enabled arm; then
+         elif check_arm_arch 6KZ;      then echo armv6zk
          elif check_arm_arch 6ZK;      then echo armv6zk
          elif check_arm_arch 6T2;      then echo armv6t2
 +        elif check_arm_arch EXT_IDIV; then echo armv7ve
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
index 7a0b448888..90d042b313 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
@@ -17,7 +17,7 @@ Index: gst-libav-1.10.1/gst-libs/ext/libav/configure
 ===================================================================
 --- gst-libav-1.10.1.orig/gst-libs/ext/libav/configure
 +++ gst-libav-1.10.1/gst-libs/ext/libav/configure
-@@ -5269,12 +5269,9 @@ elif enabled mips; then
+@@ -5650,12 +5650,9 @@ elif enabled mips; then
  
      # Enable minimum ISA based on selected options
      if enabled mips64; then
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
index 36abf8607e..4b85356547 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
@@ -11,7 +11,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
 --- gst-libav-1.4.5.orig/gst-libs/ext/libav/libavcodec/h264_cabac.c
 +++ gst-libav-1.4.5/gst-libs/ext/libav/libavcodec/h264_cabac.c
-@@ -2020,7 +2020,11 @@ decode_intra_mb:
+@@ -2057,7 +2057,11 @@ decode_intra_mb:
          // In deblocking, the quantizer is 0
          h->cur_pic.qscale_table[mb_xy] = 0;
          // All coeffs are present
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
index 5c9c372f04..3f1ec99d95 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
            "
-SRC_URI[md5sum] = "58342db11dbb201a66a62577dcf7bab5"
-SRC_URI[sha256sum] = "dfd78591901df7853eab7e56a86c34a1b03635da0d3d56b89aa577f1897865da"
+SRC_URI[md5sum] = "e3a201a45985ddc1327cd496046ca818"
+SRC_URI[sha256sum] = "dfac119043a9cfdcacd7acde77f674ab172cf2537b5812be52f49e9cddc53d9a"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.17.1


