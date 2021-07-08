Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.5493.1625703482618620306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 17:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jEaz1vSW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625703480; i=@fujitsu.com;
	bh=qNWsT2KbHWt2JNt0w0pyfXM4cbxPUm9YOUFJBYdhBBw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jEaz1vSWh+EO+Jtvbr3M2r3Jx4OiFubcaWPeqrGHC72KupYIevjyCcN65LVnjYwCK
	 4l1HHe3FhyC+A5tQxq+o3gx+85I71AiQSsswqrcxL/nrBazhHmsd2EpKEwGZmYpTRQ
	 0WTmgSNM/I9lvsxUnJAVQBLBwCqtJVX6/BdJUT59OEpxpe5pMNJuG+Ys2U//34jLXQ
	 F+F85kYc4fzO/qn3nQeOXFi3uzJaWm5WLbts65H4RiZ9bIKWPx6pNjGi/MVd7emUZP
	 jL3hmPoCZ8LrnT5RSPfxbOwILuMmbuirb2Bnd+TpHP+xfoM4J8si9jpGSvMY2IYo//
	 SB0ZZqQX+/6Cg==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id CF/F0-31114-73446E06; Thu, 08 Jul 2021 00:17:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8MRqmvu8iz
  B4OBlMYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPVi/3MBXMDKm6sCGhgvOHaxcjFISQwk0ni
  95+JbBDOcUaJp6sfMXcxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfPewgtrCAq8Tpt
  t+MIDYLUHzL9lksIDavgKPE5QkbwWokBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9QoSsy+3M
  wCYVdIvD58iXkCI+8sJC2zkLQsYGRaxWiRVJSZnlGSm5iZo2toYKBraGika2hppGtkYKKXWKW
  bqJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJERhcKQUHzuxgPPX6g94hRkkOJiVRXjnzZwlC
  fEn5KZUZicUZ8UWlOanFhxhlODiUJHhnOQHlBItS01Mr0jJzgIEOk5bg4FES4Y10BErzFhck5
  hZnpkOkTjHmc1y+Pm8RM8e7n4uB5MlVS4DkFTD5Zi2IfAsm2+7dBZLtYHLmgoOrmTlmgcn77Y
  eA5AMQKcSSl5+XKiXOmwZyhQDImozSPLgjYJF/iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5I
  wrw7IFJ7MvBK4W18BvcEE9AbD4acgb5QkIqSkGpi8Ok5KBKdtWaoms+Xw9Yq+eQlz2T3z82ts
  cmYufZkvlLyeM9PJe0Wg2q+bfMoiijbHLW5wiRu7ym3u1C9Y5sR6VSD5SM8hRjWJ9RYTYnlXb
  c0795b/q9TXp8c9nIQDNtvwd7V+3ZV+u9ze7SnjpPn739+du+u0aNCGoM1nViu/cZ8m3T5nj2
  9/RUJs8aR38rous/VXCp1df6PRwGXqSdmFLu6fcjSnnZatzKjtbOxRWp5oP116jV14isViTRm
  vG83Gbu/W7/PdpzrdUsCn6/SdvBVb7n0rctuhwx5r/ZPX/HHirvrup5sSHU5+zAg2XyPLt1DT
  4u3H6Ze2LiqfF3BVSa7zokhm8f5PXT9+NCmxFGckGmoxFxUnAgBmzfMndwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-271.messagelabs.com!1625703479!52714!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13536 invoked from network); 8 Jul 2021 00:17:59 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Jul 2021 00:17:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1680Hr2E009051
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jul 2021 01:17:58 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 8 Jul 2021 01:17:51 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xserver-xorg: upgrade 1.20.11 -> 21.0.99.1
Date: Thu, 8 Jul 2021 08:17:41 +0800
Message-ID: <1625703461-5016-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-test-xtest-Initialize-array-with-braces.patch
pkgconfig.patch
sdksyms-no-build-path.patch
removed since they're included in 21.0.99.1

refresh 0001-Avoid-duplicate-definitions-of-IOPortBase.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-xserver/xserver-xorg.inc             |  3 +-
 ...-duplicate-definitions-of-IOPortBase.patch | 16 +-----
 ...t-xtest-Initialize-array-with-braces.patch | 36 -------------
 .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 -------------
 .../xserver-xorg/sdksyms-no-build-path.patch  | 50 -------------------
 ...g_1.20.11.bb => xserver-xorg_21.0.99.1.bb} |  6 +--
 6 files changed, 4 insertions(+), 141 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.11.bb => xserver-xorg_21.0.99.1.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index da025171db..7bbff0073b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -65,6 +65,7 @@ PACKAGES =+ "${PN}-sdl \
              ${PN}-module-xaa \
              ${PN}-module-libxf1bpp \
              ${PN}-module-libxf4bpp \
+	     ${PN}-input-modules \
              xf86-video-modesetting"
 
 SUMMARY_xf86-video-modesetting = "X.Org X server -- modesetting display driver"
@@ -101,6 +102,7 @@ FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
 FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
 FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
 FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
+FILES_${PN}-input-modules = "${libdir}/xorg/modules/input/*drv*"
 FILES_xf86-video-modesetting = "${libdir}/xorg/modules/drivers/modesetting_drv.so"
 
 EXTRA_OECONF += "--with-fop=no \
@@ -116,7 +118,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
                  --with-xkb-output=/var/lib/xkb \
-                 --with-os-name=Linux \
 "
 
 OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
index 4737040675..d876958898 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
@@ -11,23 +11,9 @@ compiler.h:528: multiple definition of `IOPortBase';
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- hw/xfree86/common/compiler.h            | 2 +-
  hw/xfree86/os-support/linux/lnx_video.c | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
+ 1 files changed, 1 insertions(+), 0 deletion(-)
 
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
-index 2b2008b..c7d617e 100644
---- a/hw/xfree86/common/compiler.h
-+++ b/hw/xfree86/common/compiler.h
-@@ -525,7 +525,7 @@ xf86WriteMmio32Le(__volatile__ void *base, const unsigned long offset,
- #define PORT_SIZE short
- #endif
- 
--_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
-+extern _X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
- 
- static __inline__ void
- outb(unsigned PORT_SIZE port, unsigned char val)
 diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-support/linux/lnx_video.c
 index 04e4509..9dc7316 100644
 --- a/hw/xfree86/os-support/linux/lnx_video.c
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
deleted file mode 100644
index c0c242814b..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8a382c015cd3c69fcfc146ef03dcbf30c77ff207 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 1 Mar 2019 09:47:57 -0800
-Subject: [PATCH] test/xtest: Initialize array with braces
-
-Fixes an error when extra warnings are enabled, this is caught with clang
-
-test/xtest.c:64:23: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
-    WindowRec root = {0};
-                      ^
-                      {}
-1 error generated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/xtest.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/xtest.c b/test/xtest.c
-index fc5e433..d7e6620 100644
---- a/test/xtest.c
-+++ b/test/xtest.c
-@@ -61,7 +61,7 @@ xtest_init_devices(void)
- {
-     ScreenRec screen = {0};
-     ClientRec server_client = {0};
--    WindowRec root = {0};
-+    WindowRec root = {{0}};
-     WindowOptRec optional = {0};
- 
-     /* random stuff that needs initialization */
--- 
-2.21.0
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
deleted file mode 100644
index 2ef9fa9fe4..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/xserver/merge_requests/22]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 5f65a6246fe752764045dd1e38912f1dccec71e4 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 20 Sep 2018 20:12:24 +0100
-Subject: [PATCH] xorg-server.m4: just all cflags instead of just sdkdir
-
-Instead of fetching just the sdkdir variable of xorg-server using pkg-config,
-simply get all of the CFLAGS.  Aside from completeness, this helps builds in
-sysroots as pkg-config knows what to do with --cflags but doesn't remap
-arbitrary variables.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- xorg-server.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xorg-server.m4 b/xorg-server.m4
-index 18255b91a..195bda5d8 100644
---- a/xorg-server.m4
-+++ b/xorg-server.m4
-@@ -31,7 +31,7 @@ dnl
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
- 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS `$PKG_CONFIG --cflags xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
deleted file mode 100644
index be198ece49..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/merge_requests/253]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From ca832598d38ba55a001088b57d73c6d7261dc9a7 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 1 Aug 2019 15:24:51 +0100
-Subject: [PATCH] sdksyms.sh: don't embed the build path
-
-This script generates a header that has a comment containing the build path for
-no real reason.  As this source can end up deployed on targets in debug packages
-this means there is both potentially sensitive information leakage about the
-build environment, and a source of change for reproducible builds.
----
- hw/xfree86/sdksyms.sh | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
-index 39e33711d..bdf47a71a 100755
---- a/hw/xfree86/sdksyms.sh
-+++ b/hw/xfree86/sdksyms.sh
-@@ -302,13 +302,16 @@ LC_ALL=C
- export LC_ALL
- ${CPP:-cpp} "$@" sdksyms.c > /dev/null || exit $?
- ${CPP:-cpp} "$@" sdksyms.c | ${AWK:-awk} -v topdir=$topdir '
-+function basename(file) {
-+    sub(".*/", "", file)
-+    return file
-+}
- BEGIN {
-     sdk = 0;
-     print("/*");
-     print(" * These symbols are referenced to ensure they");
-     print(" * will be available in the X Server binary.");
-     print(" */");
--    printf("/* topdir=%s */\n", topdir);
-     print("_X_HIDDEN void *xorg_symbols[] = {");
- 
-     printf("sdksyms.c:") > "sdksyms.dep";
-@@ -337,7 +340,7 @@ BEGIN {
- 	# remove quotes
- 	gsub(/"/, "", $3);
- 	line = $2;
--	header = $3;
-+	header = basename($3);
- 	if (! headers[$3]) {
- 	    printf(" \\\n  %s", $3) >> "sdksyms.dep";
- 	    headers[$3] = 1;
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.0.99.1.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.0.99.1.bb
index 1eb2056b8a..53b76af312 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.0.99.1.bb
@@ -1,14 +1,10 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-           file://pkgconfig.patch \
-           file://0001-test-xtest-Initialize-array-with-braces.patch \
-           file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            "
-SRC_URI[sha256sum] = "914c796e3ffabe1af48071d40ccc85e92117c97a9082ed1df29e4d64e3c34c49"
+SRC_URI[sha256sum] = "d928de01606958e20b668cba53c26818d595ba81805b4e19693bba795b71af20"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.25.1

