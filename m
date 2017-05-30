Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id BA12871B50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 15:33:00 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id y201so71489569qka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=hhX58gEwlnezLcbjcK7gkVXwH7YZF/bTHqWg4UbyVo0=;
	b=Y0C2t5y4lqXFF2rgxB7gNalWyOXBwlplBMP9XPCIGVhWHtzCZOOD8Wgs4f+/dxI7Bm
	nPTLoCjeqVlnAoYbSKwh2Qsn1yiKzb4OVnxsRebOeylllzW40ZFVAhoB5zG1YYXNOL3B
	yxpKGZzfoPL3uJ7YgxQMXJ8XjfuccM9F6X3MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hhX58gEwlnezLcbjcK7gkVXwH7YZF/bTHqWg4UbyVo0=;
	b=WXZNXzjGxTvvQBWJ3S/vzZycK9vSK20MJBqfJq1nwsNOn8V2QkvJUth5Js6eq9FK+X
	FzpwDm+4t2GWBE7QgtWA6bfx9364VHr1X81iywVRuTazaOrYV4nb7ZdCPv6891cWYu5D
	LlpsjXGPbj0manMOtMyIRCFOzFprdgCjhnj9S7zwqyO1vA6IPcLVkk3/ltqWvoi119Z0
	E/qt0SWMSDXPDMjs+BCkkuwhNZJCya0jFyi9ROJYnP8ts+dPJrvMyIxzY9Cd8juqfQYi
	9FKKBJ5S7tFqsjnJxM/9r4EtxJ0ePoqeAdllTGKegrg5Kfi7cxCIBXBykx+Ey4anRHBq
	xvaA==
X-Gm-Message-State: AODbwcBzHVJUa61I89NlTmEcU35vBtEmAyuYbV9LrNsKeD9gdHqNv1Tv
	MAVdJhC3AFdVP5Kscn6uUw==
X-Received: by 10.55.178.5 with SMTP id b5mr24196926qkf.258.1496158381315;
	Tue, 30 May 2017 08:33:01 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	w17sm8680759qta.57.2017.05.30.08.33.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 May 2017 08:33:00 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 17:32:49 +0200
Message-Id: <20170530153249.7161-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] mesa: upgrade to 17.1.1
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
X-List-Received-Date: Tue, 30 May 2017 15:33:02 -0000

* Costmetic changes in license.html file required new MD5 hash
* Add PACKAGECONFIG option for libunwind support (new feature, disable by default)
* Rebased 0001-Use-wayland-scanner-in-the-path.patch
* Added zlib in DEPENDS, otherwise mesa no longer builds.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../mesa/files/0001-Use-wayland-scanner-in-the-path.patch    | 12 ++++++------
 .../mesa/{mesa-gl_17.0.6.bb => mesa-gl_17.1.1.bb}            |  0
 meta/recipes-graphics/mesa/mesa.inc                          |  6 ++++--
 .../recipes-graphics/mesa/{mesa_17.0.6.bb => mesa_17.1.1.bb} |  4 ++--
 4 files changed, 12 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.0.6.bb => mesa-gl_17.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.0.6.bb => mesa_17.1.1.bb} (83%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
index e49695bf85..eb6ff4ff04 100644
--- a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
@@ -1,4 +1,4 @@
-From 2f68fcaaf4964e7feeb383f5c26851965cda037c Mon Sep 17 00:00:00 2001
+From c908f0c13ac81a3a52140f129a13b2bc997ff4ee Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 15 Nov 2016 15:20:49 +0200
 Subject: [PATCH] Simplify wayland-scanner lookup
@@ -15,23 +15,23 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e56e35a..a92005a 100644
+index 2c7e636fac..d2b2350739 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2020,12 +2020,7 @@ if test "x$with_egl_platforms" != "x" -a "x$enable_egl" != xyes; then
-     AC_MSG_ERROR([cannot build egl state tracker without EGL library])
+@@ -2174,12 +2174,7 @@ if test "x$with_platforms" != xauto; then
+     with_egl_platforms=$with_platforms
  fi
  
 -PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
 -        WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
 -        WAYLAND_SCANNER='')
 -if test "x$WAYLAND_SCANNER" = x; then
--    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
+-    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
 -fi
 +AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
  
  # Do per-EGL platform setups and checks
  egl_platforms=`IFS=', '; echo $with_egl_platforms`
 -- 
-2.1.4
+2.13.0
 
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.0.6.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.0.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.1.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 447fd6d0df..67039a9962 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,11 +10,11 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=899fbe7e42d494c7c8c159c7001693d5"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
 
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
@@ -74,6 +74,8 @@ PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
 OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium-osmesa', 'osmesa', d)}"
 PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
 
+PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
diff --git a/meta/recipes-graphics/mesa/mesa_17.0.6.bb b/meta/recipes-graphics/mesa/mesa_17.1.1.bb
similarity index 83%
rename from meta/recipes-graphics/mesa/mesa_17.0.6.bb
rename to meta/recipes-graphics/mesa/mesa_17.1.1.bb
index 3f98271f21..ad5d2a7a20 100644
--- a/meta/recipes-graphics/mesa/mesa_17.0.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.1.bb
@@ -6,8 +6,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://0001-Use-wayland-scanner-in-the-path.patch \
 "
 
-SRC_URI[md5sum] = "77ea38dc0ab899864b06ea2941ac31a4"
-SRC_URI[sha256sum] = "89ecf3bcd0f18dcca5aaa42bf36bb52a2df33be89889f94aaaad91f7a504a69d"
+SRC_URI[md5sum] = "a4844bc6052578574f9629458bcbb749"
+SRC_URI[sha256sum] = "aed503f94c0c1630a162a3e276f4ee12a86764cee4cb92338ea2dea99a04e7ef"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.11.0


