Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 270DB731FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:38:09 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id oj9so2023426obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MMDxxJHI5GmXbL8fk44lrgdoWwQ6CJGo0HO3/s/F8QE=;
	b=xcq2eRIHfOMBWfljhlLnI2Dke54pdNNhNwrX/AGjAmz3hdK1lyKrb7Dlxlig5ZoYEh
	5PCNQOGtGA17LATESD2G7sfLDaDyZ5OpmJQ0igCs17w3PirhQeARMghQmeIPItGuVvci
	tntKrj8AMV9kOUjgMR/ScL6QTdWTl32mZ2aIFX7tFHjF0g9Ro22vuavb9ducN97g8a6X
	YW0Lth65+3OOFHwY/JtaTwV09JQG6GTsTGYjnswWhB9AM/EgerW34ir8YEsryudIuxFU
	Y3Ob4vzljQZzHSedKJ4Qze1S4nvvOLp9kRzQ8VLhOvw5MokmAbixDR+95zOKyUg1HFi1
	MKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MMDxxJHI5GmXbL8fk44lrgdoWwQ6CJGo0HO3/s/F8QE=;
	b=JudXQP7oFoVx8CsTmiQZScv8WXXU0/Kh7G9JvyNEgQ/gF1Xdt1Gj9YH1R/CCUg/xxG
	Lvx8RPWtmr9GdlzHb7pvoWMNSp+NvOZcs1RwKXYbiX/TVCP8TQurZ5LEZmvdT1A2fLOF
	VVHC4jkEFG+K37Es/uPscJJFkWjSQQFaQ2DO3b1YE/gEZsXl7iLrCGS/TTQGex01VHUD
	S7Lov9FNjI9iJak35bUgA7kqaJvtygOnG3f/Uj8A79zobZR6jRaYkf0/4VYLONKvbPq+
	YHvPCJ3aoPa4IN4qv8fKS/s9rUp/KgkQzn0gG0V2nIBQUGcGg5tL42ysaavdo7ooWyw/
	eDPA==
X-Gm-Message-State: ALoCoQnCiq86SlLy/eqXs1oC0nJqDoUbgcTLCx06TxuP1h3de5YD68+oCuNWRiec+frvNTrhQxqNsYFxeDWUX0dERAPeIQNDlA==
X-Received: by 10.60.40.39 with SMTP id u7mr30608376oek.54.1453354690073;
	Wed, 20 Jan 2016 21:38:10 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.38.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:38:08 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:50 -0800
Message-Id: <1453354610-19218-33-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 32/32] gstreamer1.0-libav: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 05:38:09 -0000

Move the ARM_INSTRUCTION_SET over-rides for armv4/armv5 out of the
1.6.3 recipe and into the common include, so that they also apply to
the git recipe.

The autogen.sh script takes care of cd'ing to the correct directory
before it does anything, so we don't need to cd on its behalf any more
in do_configure_prepend().

  http://cgit.freedesktop.org/gstreamer/gst-libav/tree/autogen.sh?id=1.7.1

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-libav.inc               |  4 ++++
 .../gstreamer/gstreamer1.0-libav_1.6.3.bb          |  4 ----
 .../gstreamer/gstreamer1.0-libav_git.bb            | 24 ++++++++++++++++------
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index c3c7d5b..c90af66 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -30,3 +30,7 @@ EXTRA_OECONF = "${LIBAV_EXTRA_CONFIGURE_COMMON}"
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
+
+# http://errors.yoctoproject.org/Errors/Details/20493/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
index 3439981..ba7ac7f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
@@ -24,7 +24,3 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --ranlib='${RANLIB}' \
   ${GSTREAMER_1_0_DEBUG} \
   --cross-prefix='${HOST_PREFIX}'"
-
-# http://errors.yoctoproject.org/Errors/Details/20493/
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index 32f4814..0937be2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -5,15 +5,29 @@ include gstreamer1.0-libav.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/LICENSE;md5=23a54f59b82572c203a559346e89ed57 \
+                    file://gst-libs/ext/libav/LICENSE.md;md5=5c6d1ed56d15ca87ddec48d0c3a2051d \
                     file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=master"
+# To build using the system libav/ffmpeg, append "libav" to PACKAGECONFIG
+# and remove the ffmpeg sources from SRC_URI below. However, first note the
+# warnings in gstreamer1.0-libav.inc
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gst-libav;name=base \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+    git://source.ffmpeg.org/ffmpeg;destsuffix=git/gst-libs/ext/libav;name=ffmpeg;branch=release/2.8 \
+    file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
+    file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
+"
 
-SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
+PV = "1.7.1+git${SRCPV}"
+
+SRCREV_base = "0993ec8fa5cf6b09e33741f268c938719a1534d5"
+SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_ffmpeg = "644179e0d4155ae8f5ddd5c3f6bd003e2e13cf94"
+SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
@@ -23,7 +37,5 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cross-prefix='${HOST_PREFIX}'"
 
 do_configure_prepend() {
-	cd ${S}
-	./autogen.sh --noconfigure
-	cd ${B}
+	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


