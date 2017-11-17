Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 286A778852
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 20:25:04 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id y42so3102484wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 12:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ApbkV0Vuf/6HfxDTfFn1QT44WA2WrbXYPu800uK2W7U=;
	b=gneAqWPJFbjWBOivfZrnPX3Wk6HbNlUsBFTUQmX1b18/p3u+F62wQbxzFwyrP9woZv
	hayRj/B6hXMJP4fQXAULbtYgfPMJbwA1m0Gu9zq3jIBdugMu5TAqiah5KqSq9aMGIqRJ
	QNpbjr+SfpLHNz4VxdB5iJKjhs1VcqiVCp1FTyqtsAGWm5PJRIc8KLcbBh7WUa5pJScP
	AlY77DNaGCfQbeduSgV2e2lY3oVzyw+LjPySrdtyaN880H72K5ljxcFq+MnyXmpzZCOb
	I6cFYTik9OXrp9y+npfajXl0tAuOQW0cIROKGAH4ENYGcC98m5Gwv+sOc7yU6DE7KgnR
	INrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ApbkV0Vuf/6HfxDTfFn1QT44WA2WrbXYPu800uK2W7U=;
	b=pLvHfvvDQmvK2whuSt7q91J/l2ER0sUzkmzNsJq1wU6XCVesESt1+fU7l8HKZJyVm7
	z0B2SYVReyTfI/bRsL5TkWqpkRb0ibVVAqhR5yTEisDG4ZvkEmeHL+P+AIbiSKPQBtef
	fhrTfdSh/vLS2yP36bD9jK64mBrMIYP3DrAbsCZWx/lSwO/YoxPXpQL7Reir3CjlwXTa
	FVmxkuArhm0VMnpZxh5hX951Dajps3U92f0mDu8vTbhAKCczUV9+mBEN2Bz236T42p5I
	qjHlYP9MKnZfaEwFLg9gYD5BoUlPjl2z4nkvntpWj2EQgLDaxLqH7yRmBecxyehUTgS0
	foSw==
X-Gm-Message-State: AJaThX4vktbOCoeP9F5nsv1EQfgUlRoW7ZTSsI3Px+MiziJ5Dt19CayL
	3gu4QBVKtIlDp/dkRRCB6IC1U4jD
X-Google-Smtp-Source: AGs4zMaei4xKw66azmtGnhTG0rp5onN7FfX8+r4PUIx1E/g+P7gMQLkFbr7QOf3DodNhtgXtSqZaIg==
X-Received: by 10.223.157.41 with SMTP id k41mr3575046wre.281.1510950305293;
	Fri, 17 Nov 2017 12:25:05 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p7sm4273943wmg.44.2017.11.17.12.25.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 12:25:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 20:25:02 +0000
Message-Id: <20171117202502.10262-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] usbutils: remove uclibc-specific patch
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
X-List-Received-Date: Fri, 17 Nov 2017 20:25:05 -0000

This patch is only needed for uclibc, which we don't support in oe-core anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/usbutils/usbutils/iconv.patch | 41 --------------------------
 meta/recipes-bsp/usbutils/usbutils_008.bb      |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta/recipes-bsp/usbutils/usbutils/iconv.patch

diff --git a/meta/recipes-bsp/usbutils/usbutils/iconv.patch b/meta/recipes-bsp/usbutils/usbutils/iconv.patch
deleted file mode 100644
index 6455567174b..00000000000
--- a/meta/recipes-bsp/usbutils/usbutils/iconv.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-This patch adds support for detecting iconv support using autotools
-uclibc does not have iconv implementation inside libc like glibc, therefore
-the existing checks were not sufficient, it worked for glibc but not for
-uclibc. The new patch portably detects the iconv support and adds the
-libiconv to linker cmdline
-
-This patch should be submitted upstream too
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: usbutils-008/configure.ac
-===================================================================
---- usbutils-008.orig/configure.ac
-+++ usbutils-008/configure.ac
-@@ -10,7 +10,9 @@ AC_USE_SYSTEM_EXTENSIONS
- AC_SYS_LARGEFILE
- 
- AC_CHECK_HEADERS([byteswap.h])
--AC_CHECK_FUNCS([nl_langinfo iconv])
-+
-+AM_GNU_GETTEXT
-+AM_ICONV
- 
- PKG_CHECK_MODULES(LIBUSB, libusb-1.0 >= 1.0.0)
- 
-Index: usbutils-008/Makefile.am
-===================================================================
---- usbutils-008.orig/Makefile.am
-+++ usbutils-008/Makefile.am
-@@ -29,7 +29,8 @@ lsusb_CPPFLAGS = \
- 
- lsusb_LDADD = \
- 	$(LIBUSB_LIBS) \
--	$(UDEV_LIBS)
-+	$(UDEV_LIBS) \
-+	$(LIBICONV)
- 
- man_MANS = \
- 	lsusb.8	\
diff --git a/meta/recipes-bsp/usbutils/usbutils_008.bb b/meta/recipes-bsp/usbutils/usbutils_008.bb
index d3c5bd52a43..3c821eac375 100644
--- a/meta/recipes-bsp/usbutils/usbutils_008.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_008.bb
@@ -11,13 +11,12 @@ DEPENDS = "libusb zlib virtual/libiconv udev"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://usb-devices-avoid-dependency-on-bash.patch \
            file://Fix-NULL-pointer-crash.patch \
-           file://iconv.patch \
           "
 
 SRC_URI[md5sum] = "cb20148c2e784577e924a7b4c560c8fb"
 SRC_URI[sha256sum] = "6d5f16c2961df37e22e492c736a3e162a8fde24480f23a40d85f79af80d3fe95"
 
-inherit autotools gettext pkgconfig distro_features_check
+inherit autotools pkgconfig distro_features_check
 
 FILES_${PN}-dev += "${datadir}/pkgconfig"
 
-- 
2.11.0


