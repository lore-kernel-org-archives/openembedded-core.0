Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6387D731EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:21 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id x5so2017220obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kVFIOSalLxV9C9t2tzoWjCxFqvoaTdEV9naObIS2tR8=;
	b=R+DywhkRa2eh7paItxOyTZ2aIl1Ub127Yjfv9WJw7AvO8GshzwsOetYqrrznE/Zvru
	WeanzTQ9axyVOLq7bfUMknL7EMqdU03UnFFktwxC+XlNzaKwb+BpYlrGLuUBkaXI4p/Y
	u+aa/W6dNfT57qVlBsKHhDHd7UO/snaxa1RCwLLE1t8yDF0Ugx7a63zDvyNDijsYPIoO
	GmaSwWhGmB0cLV7GlEZHshEe/TVcfgAaWPCRGrncOSXnKLP3kiiUfPcFI7WBDnHWuX9/
	Q3XFzjjJKRoUDNe/IhXQvXraWRWTII6TQ+nxMXpCKiQtDaxivrKGbuwnMQuJ1T2GyvuA
	/ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kVFIOSalLxV9C9t2tzoWjCxFqvoaTdEV9naObIS2tR8=;
	b=Wp9vycE+zCkuQqVNncdgDTr1jsZkDxNSRDuWVQqxyKH38aHd1zkHOwKaI3alSW50bE
	Cs/fTf4nHuOc6Cv4hXKlcmGIXBsRWPLDfdv28RIuswH7AP1fkx7/x1h1VFoBVeV63/qs
	XCFeG0DfS+T+N1L0pBN82nN2tq8dV2v/MxwwimLNyY7tgOZLeEc8ubWJ992pJM2aK6tc
	yYfbGFqRdnA/yrp0D1ccsATKucbXEOWDYkOWjQACTax3JerwBCjyUBgjW9QN9jGXNedY
	YdOwa6IAoe6QEX6xt+zGuIfXAT9VB0KQeug3HDQP8JfM+FBDegyq7/CSOjdHZL/TX/Ek
	yV2g==
X-Gm-Message-State: ALoCoQlotdE1SmCg5auvegfPhDKoNejtG9LFBNCel4Elx+QkEPQnR+vCisEl/k1Vf9V+k1Mse3jIw6j0yLf9smTXlgItm40n0A==
X-Received: by 10.182.133.37 with SMTP id oz5mr30864167obb.16.1453354642316;
	Wed, 20 Jan 2016 21:37:22 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:21 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:27 -0800
Message-Id: <1453354610-19218-10-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 09/32] gstreamer1.0-libav: minor formatting improvements + update HOMEPAGE
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:21 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc  | 15 ++++++++-------
 .../gstreamer/gstreamer1.0-libav_1.6.2.bb                 |  5 +++--
 .../gstreamer/gstreamer1.0-libav_git.bb                   |  4 ++--
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 3948b40..c3c7d5b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -1,8 +1,10 @@
 SUMMARY = "Libav-based GStreamer 1.x plugin"
+HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
+
 LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
 LICENSE_FLAGS = "commercial"
-HOMEPAGE = "http://www.gstreamer.net/"
+
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2 xz"
 
 inherit autotools pkgconfig upstream-version-is-even
@@ -10,12 +12,12 @@ inherit autotools pkgconfig upstream-version-is-even
 # CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
 # compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
 # libav copy included in the gst-libav package.
-PACKAGECONFIG ??= " orc yasm "
-PACKAGECONFIG[libav] = "--with-system-libav,,libav"
-PACKAGECONFIG[gpl]  = "--enable-gpl,--disable-gpl,"
-PACKAGECONFIG[yasm]  = "--enable-yasm,--disable-yasm,yasm-native"
-PACKAGECONFIG[orc]  = "--enable-orc,--disable-orc,orc"
+PACKAGECONFIG ??= "orc yasm"
 
+PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl,"
+PACKAGECONFIG[libav] = "--with-system-libav,,libav"
+PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
+PACKAGECONFIG[yasm] = "--enable-yasm,--disable-yasm,yasm-native"
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
 
@@ -28,4 +30,3 @@ EXTRA_OECONF = "${LIBAV_EXTRA_CONFIGURE_COMMON}"
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb
index 1091b84..77e0655 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb
@@ -13,17 +13,18 @@ SRC_URI = " \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
+
 SRC_URI[md5sum] = "09644a38827d233f53edeac815dd0ec0"
 SRC_URI[sha256sum] = "2597acc00171006d49f0d300440a87df51b113d557466e532153abc740db3469"
 
+S = "${WORKDIR}/gst-libav-${PV}"
+
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   --ranlib='${RANLIB}' \
   ${GSTREAMER_1_0_DEBUG} \
   --cross-prefix='${HOST_PREFIX}'"
 
-S = "${WORKDIR}/gst-libav-${PV}"
-
 # http://errors.yoctoproject.org/Errors/Details/20493/
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index bf1b87e..32f4814 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -12,10 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=master"
-S = "${WORKDIR}/git"
 
 SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
 
+S = "${WORKDIR}/git"
+
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   ${GSTREAMER_1_0_DEBUG} \
@@ -26,4 +27,3 @@ do_configure_prepend() {
 	./autogen.sh --noconfigure
 	cd ${B}
 }
-
-- 
1.9.1


