Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 53C3161C32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:43:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m9so7785217wro.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BqyTGiRNuhChJzhf9NPAfgv+kp+ZzUrGLteQmEdp4Z0=;
	b=pkh2mcr9Dvg40B3phJHRFU+GpEfhyR8qbCXuUXtSKAr/ZCFarqIuA+WIdALbXAiErO
	zy1BDdCzffChmSYs6LFNApuBeSHSlWNvb4cGO9VxEE5cRoS2DvJecu8zNiGIJoSpWd9j
	vccMG9oqmiUX+uMwXTHcM0IqQ3lajVCptbs/4324Y6jGHuUqK+GCz9VS7qP6/J5/xOsq
	y/Y8+C1/rMsQErbjVvsFILDFl6ACeipa1BH5yJcBxFIyDIXL3tiyBJ27BE2pPWmECd2c
	5Xx4WWOj/2WPGUfVd5vTFZoubHyCWqBwF3t2EYSj8FY12Yavmycr67ThlH/7ovsST0Ze
	aNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BqyTGiRNuhChJzhf9NPAfgv+kp+ZzUrGLteQmEdp4Z0=;
	b=f9EpKhuuPxzTA7iNYZatcAfnl1S6f5BXYjvPNsbAYk++wqeJYgkS8fM2L7VKuFQNQz
	BHJa6rB+CZPzXb8CWPaUJjJ8qgFNvAmyAsH9USa4a8j+jLiAgKjLomKLhJsv1ChLFc12
	qsIEAyU8mq5r9ZbSYt5jrRbmep/ofSZVSCZL4UyRs7FKuxeEwK9NUscDC0P/cXhedi/K
	E07XQIKQkEjUQ46948Xql68vmGrdc7z77d1Ae/uMFeqKu45uGY4JKuMvRP7k0M8wzARo
	9KfR640nk8LerF6McQSB4nxABLIMvFmykXXyQCp2pU/wlG9+PrEAPCCiFpZmO4C9h3hH
	pkHw==
X-Gm-Message-State: ANhLgQ00sOQJfAJT3UQQmlBoVLWIz3cn64PDHYfEI+1cgutj4K/hIA46
	F2joLgV+GmgcNWmC00yFC9p9WHdR
X-Google-Smtp-Source: ADFU+vvB3lM1IPlCjSbDy+Y2FK0Zh/4ZbIvSwbWotu1i7sPN9Z+btQkJOY60KJo11/6ixXy6CcWYQw==
X-Received: by 2002:a5d:4141:: with SMTP id c1mr11242929wrq.411.1584024219384; 
	Thu, 12 Mar 2020 07:43:39 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F067F32CE0B3214CDB29793.dip0.t-ipconnect.de.
	[2003:f0:7f06:7f32:ce0b:3214:cdb2:9793])
	by smtp.gmail.com with ESMTPSA id
	i6sm43742166wra.42.2020.03.12.07.43.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 07:43:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2020 15:43:31 +0100
Message-Id: <20200312144331.6334-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH] libsdl2: upgrade 2.0.10 -> 2.0.12
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
X-List-Received-Date: Thu, 12 Mar 2020 14:43:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* checked all hunks: backported patches can go
* for machines with neon in TUNE_FEATURES enable new configure option
  --enable-arm-neon. If enabled, license must be extended to MIT
* license checksum changed by copyright year

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...alidate-image-size-when-loading-BMP-.patch | 34 ------------
 ...for-build-dir-when-building-version-.patch | 53 -------------------
 ...DL-fails-to-compile-with-Mesa-Master.patch | 41 --------------
 .../{libsdl2_2.0.10.bb => libsdl2_2.0.12.bb}  | 15 +++---
 4 files changed, 9 insertions(+), 134 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.10.bb => libsdl2_2.0.12.bb} (81%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch
deleted file mode 100644
index 674decccbb..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 85138c1ec673e05263ae666baf61f79384daf7e0 Mon Sep 17 00:00:00 2001
-From: Sam Lantinga <slouken@libsdl.org>
-Date: Tue, 30 Jul 2019 11:00:00 -0700
-Subject: [PATCH] Fixed bug 4538 - validate image size when loading BMP files
-
-Upstream-Status: Backport
-[https://hg.libsdl.org/SDL/rev/e7ba650a643a]
-
-CVE: CVE-2019-13616
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/video/SDL_bmp.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/video/SDL_bmp.c b/src/video/SDL_bmp.c
-index 0b68918..a06b0c9 100644
---- a/src/video/SDL_bmp.c
-+++ b/src/video/SDL_bmp.c
-@@ -226,6 +226,11 @@ SDL_LoadBMP_RW(SDL_RWops * src, int freesrc)
-             SDL_RWseek(src, (biSize - headerSize), RW_SEEK_CUR);
-         }
-     }
-+    if (biWidth <= 0 || biHeight == 0) {
-+        SDL_SetError("BMP file with bad dimensions (%dx%d)", biWidth, biHeight);
-+        was_error = SDL_TRUE;
-+        goto done;
-+    }
-     if (biHeight < 0) {
-         topDown = SDL_TRUE;
-         biHeight = -biHeight;
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch
deleted file mode 100644
index b383bd6548..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-# HG changeset patch
-# User Anuj Mittal <am.devel@gmail.com>
-# Date 1573631462 -10800
-# Node ID 1fb1880d5edfc7c5a370846e13f90b260263627c
-# Parent  007002587d5d34d781c2b628c05e992e0ac5f52d
-configure: check for build dir when building version res (fix bug #4858)
-Fixes a race where we try to build version res file in build directory
-before it has even been created. Prevents errors like:
-
-/bin/bash ../SDL2-2.0.10/build-scripts/updaterev.sh
-/bin/bash ../SDL2-2.0.10/build-scripts/mkinstalldirs build
-mkdir -p -- build
-x86_64-pokysdk-mingw32-windres --include-dir=/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-nativesdk-mingw32-pokysdk-mingw32/nativesdk-libsdl2/2.0.10-r0/recipe-sysroot/opt/poky/3.0/sysroots/x86_64-pokysdk-mingw32/usr/include ../SDL2-2.0.10/src/main/windows/version.rc build/version.o
-x86_64-pokysdk-mingw32-windres: build/version.o: No such file or directory
-Makefile:692: recipe for target 'build/version.o' failed
-make: *** [build/version.o] Error 1
-make: *** Waiting for unfinished jobs....
-touch build/.created
-WARNING: exit code 1 from a shell command.
-
-Extension of fix:
-https://hg.libsdl.org/SDL/rev/99d8b18acf8a
-
-Upstream-Status: Backport
-Signed-off-by: Anuj Mittal <am.devel@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff -r 007002587d5d -r 1fb1880d5edf configure
---- a/configure	Tue Nov 12 17:24:37 2019 -0500
-+++ b/configure	Wed Nov 13 10:51:02 2019 +0300
-@@ -25493,7 +25493,7 @@
- VERSION_DEPENDS=`echo $VERSION_SOURCES`
- VERSION_OBJECTS=`echo "$VERSION_OBJECTS" | sed 's,[^ ]*/\([^ ]*\)\.rc,$(objects)/\1.o,g'`
- VERSION_DEPENDS=`echo "$VERSION_DEPENDS" | sed "s,\\([^ ]*\\)/\\([^ ]*\\)\\.rc,\\\\
--\\$(objects)/\\2.o: \\1/\\2.rc\\\\
-+\\$(objects)/\\2.o: \\1/\\2.rc \\$(objects)/.created\\\\
- 	\\$(WINDRES) \\$< \\$@,g"`
- 
- SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
-diff -r 007002587d5d -r 1fb1880d5edf configure.ac
---- a/configure.ac	Tue Nov 12 17:24:37 2019 -0500
-+++ b/configure.ac	Wed Nov 13 10:51:02 2019 +0300
-@@ -4177,7 +4177,7 @@
- VERSION_DEPENDS=`echo $VERSION_SOURCES`
- VERSION_OBJECTS=`echo "$VERSION_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.rc,$(objects)/\1.o,g'`
- VERSION_DEPENDS=`echo "$VERSION_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.rc,\\\\
--\\$(objects)/\\2.o: \\1/\\2.rc\\\\
-+\\$(objects)/\\2.o: \\1/\\2.rc \\$(objects)/.created\\\\
- 	\\$(WINDRES) \\$< \\$@,g"`
- 
- SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch b/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch
deleted file mode 100644
index 8f5b6a0cef..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-# HG changeset patch
-# User Sylvain Becker <sylvain.becker@gmail.com>
-# Date 1570898876 -7200
-#      Sat Oct 12 18:47:56 2019 +0200
-# Node ID 369b01006eb2f6fd563f7c315d29ae3fe503c432
-# Parent  4cbaffd0083b8cd17070dbd9d4ab1ce0fa9fca2d
-Fixed bug 4797 - SDL fails to compile with Mesa Master (thanks Michael Olbrich!)
-
-fix building with Mesa 19.2
-
-With Mesa 19.2 building fails with:
-
-/include/GLES/gl.h:63:25: error: conflicting types for 'GLsizeiptr'
-
-The same type is defined in include/SDL_opengl.h for OpenGL and the two
-headers should not be included at the same time.
-This was just never noticed because the same header guard '__gl_h_' was
-used. This was changed in Mesa. The result is this error.
-
-Fix this the same way GLES2 already handles this: Don't include the GLES
-header when the OpenGL header was already included.
-(https://hg.libsdl.org/SDL/rev/a60b3c292f0f)
-
-Upstream-Status: Backport [https://hg.libsdl.org/SDL/rev/369b01006eb2]
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
-diff --git a/src/video/SDL_video.c b/src/video/SDL_video.c
---- a/src/video/SDL_video.c
-+++ b/src/video/SDL_video.c
-@@ -37,9 +37,9 @@
- #include "SDL_opengl.h"
- #endif /* SDL_VIDEO_OPENGL */
- 
--#if SDL_VIDEO_OPENGL_ES
-+#if SDL_VIDEO_OPENGL_ES && !SDL_VIDEO_OPENGL
- #include "SDL_opengles.h"
--#endif /* SDL_VIDEO_OPENGL_ES */
-+#endif /* SDL_VIDEO_OPENGL_ES && !SDL_VIDEO_OPENGL */
- 
- /* GL and GLES2 headers conflict on Linux 32 bits */
- #if SDL_VIDEO_OPENGL_ES2 && !SDL_VIDEO_OPENGL
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
similarity index 81%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 413f53476a..c1c941e452 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -8,21 +8,22 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=504a9454ceb89fd75a2583473b11409e"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=2d4af6adb4d89aad0cdedbcc18c9a32f"
+
+# arm-neon adds MIT license
+LICENSE_append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', '& MIT', '', d)}"
+LIC_FILES_CHKSUM_append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'file://src/video/arm/pixman-arm-neon-asm.h;md5=9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=1;endline=24', '', d)}"
 
 PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
-           file://0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch \
-           file://0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch \
-           file://0001-configure-check-for-build-dir-when-building-version-.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "5a2114f2a6f348bdab5bf52b994811db"
-SRC_URI[sha256sum] = "b4656c13a1f0d0023ae2f4a9cf08ec92fffb464e0f24238337784159b8b91d57"
+SRC_URI[md5sum] = "783b6f2df8ff02b19bb5ce492b99c8ff"
+SRC_URI[sha256sum] = "349268f695c02efbc9b9148a70b85e58cefbbf704abd3e91be654db7f1e2c863"
 
 inherit autotools lib_package binconfig-disabled pkgconfig
 
@@ -50,8 +51,10 @@ PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \
+    ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
 "
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
+PACKAGECONFIG[arm-neon]   = "--enable-arm-neon,--disable-arm-neon"
 PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb"
 PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
-- 
2.21.1


