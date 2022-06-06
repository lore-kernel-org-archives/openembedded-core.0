Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65540CCA487
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.31123.1654516896874581292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LzgtroG4;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id k19so19542506wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BI2TnIgo8ClZt6UJZ9Rhz5wXjFl+t+3TEdiGBjwtz04=;
        b=LzgtroG4GYKuTaqWdY/OgUU3EBobKdvYliaRXR3Wn25H9fWCGM0t/Spxby/N+sLYJo
         e7mfvWbYEXirpOHgol2W8+uKrZvkhgKxLGp9Eh61+9PHVuTQmIOztFfWwSDqq3FmkRaY
         DLRXvHlnCCaA+UdMEdBhDzFUJN2XHrfg2vsoIBAAHWotSngwepapwCYf88I3DfJ0hxb1
         mHkmkXXuthXQKmCMP16OFu0nfsRdjskOsN7rkm0GXy5iM5efZ3ve5vpw17eSnORFoZBO
         7/CwqbmvoMMmgXPQRTYoNt01vcXMEeB1oURbKNWO+RLknj37A96F5J9rWzErLyXcde2Z
         MRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BI2TnIgo8ClZt6UJZ9Rhz5wXjFl+t+3TEdiGBjwtz04=;
        b=g7uafrTfhoTFrqAxUU7ldH/eOGiSyS3dyJnA566TZqVOiGRv1ABQIdiiPA4p42qxwt
         Cdg+SM3OycfU75d4ZGXQ4epfwoczH2tPTctHkj6ujk/HiB1vIf9Hxxl55nHmlUxHhkYm
         0VRmbG6PXrSYJ0tPMbG7HOGkBP09aIEccDeg48r1XD/fyL7eym/qf0e+NKDZeiYcX/h1
         NoP51CMsErEycm3dgREEWhucbj7Ega3rgeV/pzZInW72BSMiIWEIkUAEEMCioE/sAxEH
         rN2+jMR8bkRuc+5nbnoblaUHdrGR1gnBa4NGU3jx1bMxpSmm+NCSCy2wVNDnomaQZ8sn
         EuSQ==
X-Gm-Message-State: AOAM530/SDZXXtm80Im5OS9MXUf3Xr7Er+uCi7ditSo9GO/na13Td37t
	WOJKuUbiOjHUYyPTzpMCfTOs1UHI0ZQKbA==
X-Google-Smtp-Source: 
 ABdhPJxo2fUxeoxqO4BtLru0TNHexEsNFGFJ77OUJCPYFjsxjKwK2USOVQgpiatXCtcnS5P3OgW+AA==
X-Received: by 2002:adf:f803:0:b0:217:d2cb:d6c7 with SMTP id
 s3-20020adff803000000b00217d2cbd6c7mr6416939wrp.215.1654516895099;
        Mon, 06 Jun 2022 05:01:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/21] mesa-demos: update 8.4.0 -> 8.5.0
Date: Mon,  6 Jun 2022 14:01:10 +0200
Message-Id: <20220606120126.3381438-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166597

Convert to meson, drop unsupported options.

Drop autotools-specific and glew-specific patches (glew support dropped upstream).
glu dependency is now x11-specific.
0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch dropped
as patched files removed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...to-disable-demos-which-require-GLEW-.patch | 382 ------------------
 .../0007-Install-few-more-test-programs.patch |  43 --
 ...w-missing-.glsl-.vert-.frag-files-to.patch |  99 -----
 ...perf-Install-.glsl-.vert-.frag-files.patch |  71 ----
 ...G-demos-with-single-frame-need-eglSw.patch |  44 --
 .../recipes-graphics/mesa/mesa-demos_8.4.0.bb |  57 ---
 .../recipes-graphics/mesa/mesa-demos_8.5.0.bb |  43 ++
 7 files changed, 43 insertions(+), 696 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
deleted file mode 100644
index e31827d4a3..0000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
+++ /dev/null
@@ -1,382 +0,0 @@
-From 779438770bedf3d53e6ad8f7cd6889b7f50daf3b Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 9 Jul 2014 14:23:41 +0200
-Subject: [PATCH] configure: Allow to disable demos which require GLEW or GLU
-
-* in some systems without X11 support we don't have GLEW, but
-  mesa-demos are still useful
-
-This isn't currently appropriate for upstream submission as glew has
-been replaced with glad there; glu situation would need to be re-assesed
-when upstream makes a new release, requested here:
-https://gitlab.freedesktop.org/mesa/demos/-/issues/22
-
-Upstream-Status: Inappropriate [see above]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Port to 8.3.0
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac                  | 49 ++++++++++++++++++++---------
- src/Makefile.am               | 18 ++++++++---
- src/demos/Makefile.am         | 73 ++++++++++++++++++++++++-------------------
- src/egl/Makefile.am           |  8 +++--
- src/egl/opengles1/Makefile.am | 10 ++++--
- src/egl/opengles2/Makefile.am | 29 ++++++++---------
- 6 files changed, 117 insertions(+), 70 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0525b09..28834cd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -93,25 +93,44 @@ AC_EGREP_HEADER([glutInitContextProfile],
- 		[AC_DEFINE(HAVE_FREEGLUT)],
- 		[])
- 
--dnl Check for GLEW
--PKG_CHECK_MODULES(GLEW, [glew >= 1.5.4])
--DEMO_CFLAGS="$DEMO_CFLAGS $GLEW_CFLAGS"
--DEMO_LIBS="$DEMO_LIBS $GLEW_LIBS"
-+AC_ARG_ENABLE([glew],
-+    [AS_HELP_STRING([--enable-glew],
-+        [build demos which require glew @<:@default=yes@:>@])],
-+    [enable_glew="$enableval"],
-+    [enable_glew=yes]
-+)
-+
-+if test "x$enable_glew" = xyes; then
-+    dnl Check for GLEW
-+    PKG_CHECK_MODULES(GLEW, [glew >= 1.5.4], [glew_enabled=yes], [glew_enabled=no])
-+    DEMO_CFLAGS="$DEMO_CFLAGS $GLEW_CFLAGS"
-+    DEMO_LIBS="$DEMO_LIBS $GLEW_LIBS"
-+fi
- 
- # LIBS was set by AC_CHECK_LIB above
- LIBS=""
- 
--PKG_CHECK_MODULES(GLU, [glu], [],
--		  [AC_CHECK_HEADER([GL/glu.h],
--				   [],
--		  		   AC_MSG_ERROR([GLU not found]))
--		   AC_CHECK_LIB([GLU],
--				[gluBeginCurve],
--				[GLU_LIBS=-lGLU],
--				AC_MSG_ERROR([GLU required])) ])
-+AC_ARG_ENABLE([glu],
-+    [AS_HELP_STRING([--enable-glu],
-+        [build demos which require glu @<:@default=yes@:>@])],
-+    [enable_glu="$enableval"],
-+    [enable_glu=yes]
-+)
- 
--DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
--DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
-+if test "x$enable_glu" = xyes; then
-+    PKG_CHECK_MODULES(GLU, [glu], [glu_enabled=yes],
-+                     [AC_CHECK_HEADER([GL/glu.h],
-+                                      [],
-+                                      AC_MSG_ERROR([GLU not found]))
-+                      AC_CHECK_LIB([GLU],
-+                                   [gluBeginCurve],
-+                                   [GLU_LIBS=-lGLU
-+				    glu_enabled=yes],
-+                                   AC_MSG_ERROR([GLU required])) ])
-+
-+    DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
-+    DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
-+fi
- 
- AC_ARG_ENABLE([egl],
-     [AS_HELP_STRING([--enable-egl],
-@@ -304,6 +323,8 @@ AC_SUBST([WAYLAND_CFLAGS])
- AC_SUBST([WAYLAND_LIBS])
- 
- 
-+AM_CONDITIONAL(HAVE_GLU, test "x$glu_enabled" = "xyes")
-+AM_CONDITIONAL(HAVE_GLEW, test "x$glew_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_EGL, test "x$egl_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_GLESV1, test "x$glesv1_enabled" = "xyes")
- AM_CONDITIONAL(HAVE_GLESV2, test "x$glesv2_enabled" = "xyes")
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 1647d64..8b89dee 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -22,15 +22,19 @@
- # Authors:
- #    Eric Anholt <eric@anholt.net>
- 
-+if HAVE_GLEW
-+UTIL = util
-+endif
-+
- SUBDIRS = \
--	util \
-+	$(UTIL) \
- 	data \
- 	demos \
- 	egl \
- 	fp \
- 	fpglsl \
- 	glsl \
--        gs \
-+	gs \
- 	objviewer \
- 	osdemos \
- 	perf \
-@@ -40,8 +44,12 @@ SUBDIRS = \
- 	slang \
- 	tests \
- 	tools \
--	trivial \
--	vp \
--	vpglsl \
- 	wgl \
- 	xdemos
-+
-+if HAVE_GLEW
-+SUBDIRS += \
-+	vp \
-+	vpglsl \
-+	trivial
-+endif
-diff --git a/src/demos/Makefile.am b/src/demos/Makefile.am
-index 41603fa..ab1e3ab 100644
---- a/src/demos/Makefile.am
-+++ b/src/demos/Makefile.am
-@@ -30,91 +30,100 @@ AM_LDFLAGS = \
- 	$(DEMO_LIBS) \
- 	$(GLUT_LIBS)
- 
-+bin_PROGRAMS =
-+
- if HAVE_GLUT
--bin_PROGRAMS = \
-+if HAVE_GLEW
-+bin_PROGRAMS += \
- 	arbfplight \
- 	arbfslight \
- 	arbocclude \
- 	arbocclude2 \
--	bounce \
--	clearspd \
- 	copypix \
- 	cubemap \
- 	cuberender \
- 	dinoshade \
--	dissolve \
--	drawpix \
- 	engine \
- 	fbo_firecube \
- 	fbotexture \
--	fire \
- 	fogcoord \
- 	fplight \
- 	fslight \
-+	gloss \
-+	isosurf \
-+	multiarb \
-+	paltex \
-+	pointblast \
-+	projtex \
-+	shadowtex \
-+	spriteblast \
-+	stex3d \
-+	textures \
-+	vao_demo \
-+	winpos
-+
-+copypix_LDADD = ../util/libutil.la
-+cubemap_LDADD = ../util/libutil.la
-+cuberender_LDADD = ../util/libutil.la
-+engine_LDADD = ../util/libutil.la
-+fbo_firecube_LDADD = ../util/libutil.la
-+gloss_LDADD = ../util/libutil.la
-+isosurf_LDADD = ../util/libutil.la
-+multiarb_LDADD = ../util/libutil.la
-+projtex_LDADD = ../util/libutil.la
-+textures_LDADD = ../util/libutil.la
-+winpos_LDADD = ../util/libutil.la
-+endif
-+
-+if HAVE_GLU
-+bin_PROGRAMS += \
-+	bounce \
-+	clearspd \
-+	dissolve \
-+	drawpix \
-+	fire \
- 	gamma \
- 	gearbox \
- 	gears \
- 	geartrain \
- 	glinfo \
--	gloss \
- 	gltestperf \
- 	ipers \
--	isosurf \
- 	lodbias \
- 	morph3d \
--	multiarb \
--	paltex \
- 	pixeltest \
--	pointblast \
--	projtex \
- 	ray \
- 	readpix \
- 	reflect \
- 	renormal \
--	shadowtex \
- 	singlebuffer \
- 	spectex \
--	spriteblast \
--	stex3d \
- 	teapot \
- 	terrain \
- 	tessdemo \
- 	texcyl \
- 	texenv \
--	textures \
- 	trispd \
- 	tunnel2 \
--	tunnel \
--	vao_demo \
--	winpos
--endif
-+	tunnel
- 
- tunnel_SOURCES = \
- 	tunnel.c \
- 	tunneldat.h
- 
--copypix_LDADD = ../util/libutil.la
--cubemap_LDADD = ../util/libutil.la
--cuberender_LDADD = ../util/libutil.la
--drawpix_LDADD = ../util/libutil.la
- dissolve_LDADD = ../util/libutil.la
--engine_LDADD = ../util/libutil.la
--fbo_firecube_LDADD = ../util/libutil.la
-+drawpix_LDADD = ../util/libutil.la
- fire_LDADD = ../util/libutil.la
--gloss_LDADD = ../util/libutil.la
- ipers_LDADD = ../util/libutil.la
--isosurf_LDADD = ../util/libutil.la
- lodbias_LDADD = ../util/libutil.la
--multiarb_LDADD = ../util/libutil.la
--projtex_LDADD = ../util/libutil.la
- readpix_LDADD = ../util/libutil.la
- reflect_LDADD = ../util/libutil.la
- teapot_LDADD = ../util/libutil.la
- texcyl_LDADD = ../util/libutil.la
--textures_LDADD = ../util/libutil.la
- tunnel_LDADD = ../util/libutil.la
- tunnel2_LDADD = ../util/libutil.la
--winpos_LDADD = ../util/libutil.la
-+endif
-+endif
- 
- EXTRA_DIST = \
- 	README
-diff --git a/src/egl/Makefile.am b/src/egl/Makefile.am
-index d64a49e..4fe1ca8 100644
---- a/src/egl/Makefile.am
-+++ b/src/egl/Makefile.am
-@@ -24,8 +24,12 @@
- 
- SUBDIRS = \
- 	eglut \
--	opengl \
--	openvg \
- 	opengles1 \
- 	opengles2 \
- 	oes_vg
-+
-+if HAVE_GLU
-+SUBDIRS += \
-+	opengl \
-+	openvg
-+endif
-diff --git a/src/egl/opengles1/Makefile.am b/src/egl/opengles1/Makefile.am
-index fa397c2..21853e8 100644
---- a/src/egl/opengles1/Makefile.am
-+++ b/src/egl/opengles1/Makefile.am
-@@ -36,9 +36,12 @@ AM_LDFLAGS = \
- 	$(EGL_LIBS) \
- 	-lm
- 
-+noinst_PROGRAMS =
-+
- if HAVE_EGL
- if HAVE_GLESV1
--noinst_PROGRAMS = \
-+if HAVE_X11
-+bin_PROGRAMS = \
- 	bindtex \
- 	clear \
- 	drawtex_x11 \
-@@ -52,8 +55,6 @@ noinst_PROGRAMS = \
- 	torus_x11 \
- 	tri_x11 \
- 	two_win
--endif
--endif
- 
- bindtex_LDADD = $(X11_LIBS)
- es1_info_LDADD = $(X11_LIBS)
-@@ -76,3 +77,6 @@ drawtex_x11_LDADD = ../eglut/libeglut_x11.la
- gears_x11_LDADD = ../eglut/libeglut_x11.la
- torus_x11_LDADD = ../eglut/libeglut_x11.la
- tri_x11_LDADD = ../eglut/libeglut_x11.la
-+endif
-+endif
-+endif
-diff --git a/src/egl/opengles2/Makefile.am b/src/egl/opengles2/Makefile.am
-index b80ba50..17f8d49 100644
---- a/src/egl/opengles2/Makefile.am
-+++ b/src/egl/opengles2/Makefile.am
-@@ -33,27 +33,28 @@ AM_LDFLAGS = \
- 	$(EGL_LIBS) \
- 	-lm
- 
-+bin_PROGRAMS =
-+
- if HAVE_EGL
- if HAVE_GLESV2
--bin_PROGRAMS =
--if HAVE_X11
--bin_PROGRAMS += \
--	es2_info \
--	es2gears_x11 \
--	es2tri
--endif
- if HAVE_WAYLAND
- bin_PROGRAMS += es2gears_wayland
--endif
--endif
-+
-+es2gears_wayland_SOURCES = es2gears.c
-+es2gears_wayland_LDADD = ../eglut/libeglut_wayland.la
- endif
- 
--es2_info_LDADD = $(X11_LIBS)
--es2tri_LDADD = $(X11_LIBS)
-+if HAVE_X11
-+bin_PROGRAMS += \
-+	es2tri \
-+	es2_info \
-+	es2gears_x11
- 
-+es2_info_LDADD = $(X11_LIBS)
- es2gears_x11_SOURCES = es2gears.c
--
- es2gears_x11_LDADD = ../eglut/libeglut_x11.la
-+es2tri_LDADD = $(X11_LIBS)
-+endif
-+endif
-+endif
- 
--es2gears_wayland_SOURCES = es2gears.c
--es2gears_wayland_LDADD = ../eglut/libeglut_wayland.la
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch b/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch
deleted file mode 100644
index b27d9eafa5..0000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2e0367a941445a862ab99c54ec85d1357d0f73c0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 10 Jul 2014 14:30:52 +0200
-Subject: [PATCH] Install few more test programs
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- src/egl/opengl/Makefile.am | 3 +--
- src/egl/openvg/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/src/egl/opengl/Makefile.am b/src/egl/opengl/Makefile.am
-index 6d184ff6..ab09d028 100644
---- a/src/egl/opengl/Makefile.am
-+++ b/src/egl/opengl/Makefile.am
-@@ -57,8 +57,7 @@ endif
- 
- if HAVE_EGL
- bin_PROGRAMS = \
--	eglinfo
--noinst_PROGRAMS = \
-+	eglinfo \
- 	peglgears \
- 	$(EGL_DRM_DEMOS) \
- 	$(EGL_X11_DEMOS) \
-diff --git a/src/egl/openvg/Makefile.am b/src/egl/openvg/Makefile.am
-index b0f1212f..5fd1cf83 100644
---- a/src/egl/openvg/Makefile.am
-+++ b/src/egl/openvg/Makefile.am
-@@ -49,7 +49,7 @@ endif
- 
- if HAVE_EGL
- if HAVE_VG
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	$(EGL_X11_DEMOS)
- endif
- endif
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch b/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch
deleted file mode 100644
index a6d168175f..0000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 894add34c2b5e6b4ccc78996bf681d7ec7bc9e36 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 10 Jul 2014 14:29:27 +0200
-Subject: [PATCH] glsl, perf: Add few missing .glsl, .vert, .frag files to
- EXTRA_DATA
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- src/fpglsl/Makefile.am |  2 ++
- src/glsl/Makefile.am   | 10 ++++++++--
- src/perf/Makefile.am   |  6 ++++++
- src/vpglsl/Makefile.am |  1 +
- 4 files changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/src/fpglsl/Makefile.am b/src/fpglsl/Makefile.am
-index 47c1039f..fd43c919 100644
---- a/src/fpglsl/Makefile.am
-+++ b/src/fpglsl/Makefile.am
-@@ -39,10 +39,12 @@ noinst_PROGRAMS = \
- endif
- 
- EXTRA_DIST = \
-+	depth-read.glsl \
- 	dowhile2.glsl \
- 	dowhile.glsl \
- 	forbreak.glsl \
- 	for.glsl \
-+	infinite-loop.glsl \
- 	mov.glsl \
- 	mov-imm.glsl \
- 	simpleif.glsl \
-diff --git a/src/glsl/Makefile.am b/src/glsl/Makefile.am
-index 4faa8dbf..079a29d8 100644
---- a/src/glsl/Makefile.am
-+++ b/src/glsl/Makefile.am
-@@ -37,7 +37,7 @@ AM_LDFLAGS = \
- if HAVE_GLUT
- bin_PROGRAMS = \
- 	array \
--        bezier \
-+	bezier \
- 	bitmap \
- 	brick \
- 	bump \
-@@ -123,12 +123,16 @@ EXTRA_DIST = \
- 	CH06-brick.vert \
- 	CH11-bumpmap.frag \
- 	CH11-bumpmap.vert \
-+	CH11-bumpmaptex.frag \
- 	CH11-toyball.frag \
- 	CH11-toyball.vert \
- 	CH18-mandel.frag \
- 	CH18-mandel.vert \
--        bezier.geom \
-+	bezier.geom \
- 	brick.shtest \
-+	blinking-teapot.frag \
-+	blinking-teapot.vert \
-+	convolution.frag \
- 	convolution.vert \
- 	cubemap.frag \
- 	mandelbrot.shtest \
-@@ -138,5 +142,7 @@ EXTRA_DIST = \
- 	reflect.vert \
- 	shadowtex.frag \
- 	simple.vert \
-+	simplex-noise.glsl \
- 	skinning.frag \
-+	skinning.vert \
- 	toyball.shtest
-diff --git a/src/perf/Makefile.am b/src/perf/Makefile.am
-index f0031fea..60069396 100644
---- a/src/perf/Makefile.am
-+++ b/src/perf/Makefile.am
-@@ -59,3 +59,9 @@ endif
- 
- glslstateschange_LDADD = libperf.la ../util/libutil.la
- glsl_compile_time_LDADD = ../util/libutil.la
-+
-+EXTRA_DIST = \
-+	glslstateschange1.frag \
-+	glslstateschange1.vert \
-+	glslstateschange2.frag \
-+	glslstateschange2.vert
-diff --git a/src/vpglsl/Makefile.am b/src/vpglsl/Makefile.am
-index 4a85ed40..48b08f48 100644
---- a/src/vpglsl/Makefile.am
-+++ b/src/vpglsl/Makefile.am
-@@ -44,6 +44,7 @@ EXTRA_DIST = \
- 	func2.glsl \
- 	ifelse.glsl \
- 	if.glsl \
-+	infinite-loop.glsl \
- 	mov.glsl \
- 	nestedifs.glsl \
- 	nestedswizzle.glsl \
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch b/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch
deleted file mode 100644
index 8a98ba60d1..0000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 477ab6d90a17d8e4d3935be6ce8b8e154db0e3e5 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 10 Jul 2014 14:48:12 +0200
-Subject: [PATCH] glsl, perf: Install .glsl, .vert, .frag files
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- src/fpglsl/Makefile.am | 3 ++-
- src/glsl/Makefile.am   | 3 ++-
- src/perf/Makefile.am   | 3 ++-
- src/vpglsl/Makefile.am | 3 ++-
- 4 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/src/fpglsl/Makefile.am b/src/fpglsl/Makefile.am
-index fd43c919..2bf51de4 100644
---- a/src/fpglsl/Makefile.am
-+++ b/src/fpglsl/Makefile.am
-@@ -38,7 +38,8 @@ noinst_PROGRAMS = \
- 	fp-tri
- endif
- 
--EXTRA_DIST = \
-+demosdatadir=$(datadir)/$(PACKAGE)/
-+dist_demosdata_DATA= \
- 	depth-read.glsl \
- 	dowhile2.glsl \
- 	dowhile.glsl \
-diff --git a/src/glsl/Makefile.am b/src/glsl/Makefile.am
-index 079a29d8..f66ec299 100644
---- a/src/glsl/Makefile.am
-+++ b/src/glsl/Makefile.am
-@@ -118,7 +118,8 @@ vert_or_frag_only_LDADD = ../util/libutil.la
- vert_tex_LDADD = ../util/libutil.la
- vsraytrace_LDADD = ../util/libutil.la
- 
--EXTRA_DIST = \
-+demosdatadir=$(datadir)/$(PACKAGE)/
-+dist_demosdata_DATA= \
- 	CH06-brick.frag \
- 	CH06-brick.vert \
- 	CH11-bumpmap.frag \
-diff --git a/src/perf/Makefile.am b/src/perf/Makefile.am
-index 60069396..469bdf45 100644
---- a/src/perf/Makefile.am
-+++ b/src/perf/Makefile.am
-@@ -60,7 +60,8 @@ endif
- glslstateschange_LDADD = libperf.la ../util/libutil.la
- glsl_compile_time_LDADD = ../util/libutil.la
- 
--EXTRA_DIST = \
-+demosdatadir=$(datadir)/$(PACKAGE)/
-+dist_demosdata_DATA= \
- 	glslstateschange1.frag \
- 	glslstateschange1.vert \
- 	glslstateschange2.frag \
-diff --git a/src/vpglsl/Makefile.am b/src/vpglsl/Makefile.am
-index 48b08f48..55268675 100644
---- a/src/vpglsl/Makefile.am
-+++ b/src/vpglsl/Makefile.am
-@@ -38,7 +38,8 @@ noinst_PROGRAMS = \
- 	vp-tris
- endif
- 
--EXTRA_DIST = \
-+demosdatadir=$(datadir)/$(PACKAGE)/
-+dist_demosdata_DATA= \
- 	for.glsl \
- 	func.glsl \
- 	func2.glsl \
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch b/meta/recipes-graphics/mesa/mesa-demos/0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch
deleted file mode 100644
index c687647407..0000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 3aa84c47e88a4c38446ce1323abf6f2c77389104 Mon Sep 17 00:00:00 2001
-From: Prabhu <prabhu.sundararaj@freescale.com>
-Date: Mon, 16 Nov 2015 17:09:32 -0600
-Subject: [PATCH] mesa-demos: OpenVG demos with single frame need eglSwapBuffer
-
-sp and text demos rendering single frame. to display the
-single frame rendered needed a eglSwapBuffer to diplay to window.
-Hence added eglutPostRedisplay to display the frame
-
-Upstream-Status: Pending
-
-Signed-off-by: Prabhu <prabhu.sundararaj@freescale.com>
----
- src/egl/openvg/sp.c   | 1 +
- src/egl/openvg/text.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/egl/openvg/sp.c b/src/egl/openvg/sp.c
-index a20c0a3..468e91e 100644
---- a/src/egl/openvg/sp.c
-+++ b/src/egl/openvg/sp.c
-@@ -500,6 +500,7 @@ draw(void)
-    }
- 
-    vgFlush();
-+   eglutPostRedisplay();
- }
- 
- 
-diff --git a/src/egl/openvg/text.c b/src/egl/openvg/text.c
-index f5c6de8..492581c 100644
---- a/src/egl/openvg/text.c
-+++ b/src/egl/openvg/text.c
-@@ -360,6 +360,7 @@ display(void)
- {
-    vgClear(0, 0, width, height);
-    glyph_string_draw(10.0, 10.0);
-+   eglutPostRedisplay();
- }
- 
- 
--- 
-2.5.1
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
deleted file mode 100644
index 01e5b35d0e..0000000000
--- a/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-SUMMARY = "Mesa demo applications"
-DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
-These applications can be used for Mesa validation and benchmarking."
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
-
-LICENSE = "MIT & PD"
-LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
-                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
-
-SRC_URI = "https://mesa.freedesktop.org/archive/demos/${BPN}-${PV}.tar.bz2 \
-           file://0001-mesa-demos-Add-missing-data-files.patch \
-           file://0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch \
-           file://0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch \
-           file://0007-Install-few-more-test-programs.patch \
-           file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch \
-           file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
-           file://0012-mesa-demos-OpenVG-demos-with-single-frame-need-eglSw.patch \
-           "
-SRC_URI[md5sum] = "6b65a02622765522176d00f553086fa3"
-SRC_URI[sha256sum] = "01e99c94a0184e63e796728af89bfac559795fb2a0d6f506fa900455ca5fff7d"
-
-inherit autotools pkgconfig features_check
-# depends on virtual/egl, virtual/libgl ...
-REQUIRED_DISTRO_FEATURES = "opengl x11"
-
-PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
-                  x11 glew glu"
-
-# The Wayland code doesn't work with Wayland 1.0, so disable it for now
-#${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-
-EXTRA_OECONF = "--with-system-data-files"
-
-PACKAGECONFIG[drm] = "--enable-libdrm,--disable-libdrm,libdrm"
-PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
-PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
-PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgl"
-PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
-PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[glut] = "--with-glut=${STAGING_EXECPREFIXDIR},--without-glut,freeglut"
-PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
-PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libopenvg"
-PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
-PACKAGECONFIG[glew] = "--enable-glew,--disable-glew,glew"
-PACKAGECONFIG[glu] = "--enable-glu,--disable-glu,virtual/libgl"
-
-do_install:append() {
-	# it can be completely empty when all PACKAGECONFIG options are disabled
-	rmdir --ignore-fail-on-non-empty ${D}${bindir}
-
-	if [ -f ${D}${bindir}/clear ]; then
-        	mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
-	fi
-}
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
new file mode 100644
index 0000000000..6e9b95e1e2
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Mesa demo applications"
+DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
+These applications can be used for Mesa validation and benchmarking."
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+
+LICENSE = "MIT & PD"
+LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
+                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
+
+SRC_URI = "https://mesa.freedesktop.org/archive/demos/${PV}/${BPN}-${PV}.tar.bz2 \
+           file://0001-mesa-demos-Add-missing-data-files.patch \
+           file://0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch \
+           "
+SRC_URI[sha256sum] = "cea2df0a80f09a30f635c4eb1a672bf90c5ddee0b8e77f4d70041668ef71aac1"
+
+inherit meson pkgconfig features_check
+# depends on virtual/egl, virtual/libgl ...
+REQUIRED_DISTRO_FEATURES = "opengl x11"
+
+EXTRA_OEMESON = "-Dwith-system-data-files=true"
+
+PACKAGECONFIG ?= "drm egl gles1 gles2 \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
+
+PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
+PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
+PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
+PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
+PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},,freeglut"
+PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native"
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu"
+
+do_install:append() {
+	# it can be completely empty when all PACKAGECONFIG options are disabled
+	rmdir --ignore-fail-on-non-empty ${D}${bindir}
+
+	if [ -f ${D}${bindir}/clear ]; then
+		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
+	fi
+}
-- 
2.30.2


