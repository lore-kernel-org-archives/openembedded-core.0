Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB8478C11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:33:05 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id n11-v6so5889534wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=svavSVK3U/F1iBylg/rFXJIt8XcTdEXRDvt3JjaLVVw=;
	b=YOWLedGOaEzqiZgBV5G7RIFRGRSAGB3SxDtjW4uAunZjQA/1dGsvevhywv44VFo/Pw
	smd6xgE27gmfPgn6LAAjJpaDGD2okUq9/oskkeos9+t21YDckEF6JYMOSzY1DVs8KNw9
	hj+R7N0dK7UIaRXnRl+C/Qoy86AeVKDG6MCifCJWyt3XlT6VyqeRhhQd6v6uSsLEobxO
	d3A3PBXqNPqcpDJjpso1dM0WqYuVqD4DpE3NnrwR/AdFr5pXgtol5T6W7KZGl5nu19DJ
	pJ5VcxHHAyxXT43a2G/lb85roVTyT0SQ2e6uvaIy89P5q5t6PJ9Z4PKH06m+A9+YXYvW
	JxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=svavSVK3U/F1iBylg/rFXJIt8XcTdEXRDvt3JjaLVVw=;
	b=WFFaShd8fJ3N/DnH4ZynVH6y8IJcnWAhZXsc10R1IJg+gF0F+cc+h+NdGmOIvnJBNE
	xTkiGiX6akDzrzNZbKLl5pFhUd041nFzYc04jnhvSvcG7xVCCfs7sfIueiN7rQlxFGN7
	XPDRuCe0Uh83kmoYlTDGI/8jGuC0SMaMSOzD9D+2DzgEqzBJPWQkYtnjhQclsiOtfPf3
	XCuZXCn11I4UzLyp3r7/XXK02C3jaUVexIQxVSHQJ0ded7g1BKbbSVgVxBoQrJWjVMQF
	Yku1THW3hxZhwnTlfpoIXzvMf9ZfWqyThY0Xtpy9IYPEkjiP0vjTqGEsgwgzwRhegImN
	yxew==
X-Gm-Message-State: AOUpUlHJrQN70MUSV4BizR/3WfoNbJlquKHCGzxNYlBrYJSDnoNM2DTk
	54Qng/rn4p+8v4CE5h/DIT3oe2Aewr8=
X-Google-Smtp-Source: AAOMgpdAQeJI+VdPf3g6P3Kc5aC6GQSnqEsAAP/JorEZFq3aK9UeKmr/KLtQMHCo6U0vQsmihzRNlA==
X-Received: by 2002:a1c:b45:: with SMTP id 66-v6mr4588649wml.45.1532705585503; 
	Fri, 27 Jul 2018 08:33:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.33.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:33:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:44 +0100
Message-Id: <20180727153248.22838-12-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 12/16] libusb-compat: remove
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
X-List-Received-Date: Fri, 27 Jul 2018 15:33:05 -0000

Nothing in oe-core or meta-oe links to this now, so the recipe can finally be
removed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 meta/conf/distro/include/maintainers.inc           |  1 -
 .../0001-usb.h-Include-sys-types.h.patch           | 30 ----------------
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb | 42 ----------------------
 4 files changed, 74 deletions(-)
 delete mode 100644 meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
 delete mode 100644 meta/recipes-support/libusb/libusb-compat_0.1.5.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 1498e124413..793a1c2f09a 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -190,7 +190,6 @@ DISTRO_PN_ALIAS_pn-libtelepathy = "Debian=libtelepathy2 Ubuntu=libtelepathy2"
 DISTRO_PN_ALIAS_pn-libtimedate-perl = "Debian=libtimedate-perl Ubuntu=libtimedate-perl"
 DISTRO_PN_ALIAS_pn-liburcu = "Fedora=userspace-rcu Ubuntu=liburcu0"
 DISTRO_PN_ALIAS_pn-libusb1 = "Debian=libusb-1.0-0 Fedora=libusb1"
-DISTRO_PN_ALIAS_pn-libusb-compat = "OSPDT"
 DISTRO_PN_ALIAS_pn-libx11 = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 DISTRO_PN_ALIAS_pn-libxcalibrate = "OSPDT upstream=http://cgit.freedesktop.org/xorg/lib/libXCalibrate/"
 DISTRO_PN_ALIAS_pn-libxfont2 = "Fedora=libXfont2 Clear=libXfont2"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6e7efd12752..f80627c6710 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -364,7 +364,6 @@ RECIPE_MAINTAINER_pn-libunistring = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libunwind = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-libusb-compat = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch b/meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
deleted file mode 100644
index b88440dec93..00000000000
--- a/meta/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 340f911f9e3f4ff6b01682c5341c959060782af2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Apr 2015 19:18:45 -0700
-Subject: [PATCH] usb.h: Include sys/types.h
-
-We need the definitions for things like u_intX_t
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libusb/usb.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libusb/usb.h b/libusb/usb.h
-index 84e730f..caffae2 100644
---- a/libusb/usb.h
-+++ b/libusb/usb.h
-@@ -31,6 +31,8 @@
- 
- #include <dirent.h>
- 
-+#include <sys/types.h>
-+
- /*
-  * USB spec information
-  *
--- 
-2.1.4
-
diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
deleted file mode 100644
index 1ddbe238fc0..00000000000
--- a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "libusb-0.1 compatibility layer for libusb1"
-DESCRIPTION = "libusb-0.1 compatible layer for libusb1, a drop-in replacement \
-that aims to look, feel and behave exactly like libusb-0.1"
-HOMEPAGE = "http://www.libusb.org/"
-BUGTRACKER = "http://www.libusb.org/report"
-SECTION = "libs"
-
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f2ac5f3ac4835e8f91324a26a590a423"
-DEPENDS = "libusb1"
-
-# Few packages are known not to work with libusb-compat (e.g. libmtp-1.0.0),
-# so here libusb-0.1 is removed completely instead of adding virtual/libusb0.
-# Besides, libusb-0.1 uses a per 1ms polling that hurts a lot to power
-# consumption.
-PROVIDES = "libusb virtual/libusb0"
-BBCLASSEXTEND = "native nativesdk"
-
-PE = "1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
-           file://0001-usb.h-Include-sys-types.h.patch \
-          "
-
-SRC_URI[md5sum] = "2780b6a758a1e2c2943bdbf7faf740e4"
-SRC_URI[sha256sum] = "404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libusb/files/libusb-compat-0.1/"
-UPSTREAM_CHECK_REGEX = "/libusb-compat-(?P<pver>(\d+[\.\-_]*)+)/$"
-
-BINCONFIG = "${bindir}/libusb-config"
-
-inherit autotools pkgconfig binconfig-disabled lib_package
-
-EXTRA_OECONF = "--libdir=${base_libdir}"
-
-do_install_append() {
-	install -d ${D}${libdir}
-	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
-		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
-	fi
-}
-- 
2.11.0


