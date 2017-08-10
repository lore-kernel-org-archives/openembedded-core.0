Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 880D771DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 09:38:03 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y43so195016wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3qID0Hee+iTD0wrCDmvQpWXCCdVp3LRH6HH1rdAIr7w=;
	b=DEquLtEtdZMz/WJNsLetD2YtnoYApAkFCQAwIi0m7+tP/QWYPFosmeEeWkgLXpcDRC
	cYXJcKNzIJzCdxckRtq6OK7lhyCJRU0ZDEZstkB7sUfBkIHL22BURBwStMJ0C9lX6F3m
	51noof3NcG17vysoo0GRmU0CJ/jiFoGshogdjDq1rMwZ0BbfhxZMBiWZcWo5ZyWFMDEy
	ZhEOB5lLEUYOGq1//NjHuvZ3qDBaS4ltSQFfqHb5nxzZ5AxcNDYWtMebG2NdE+VLPu/f
	nmfFNqJWt8MbzAyMNuYSqJt/4WmfP+exdQ096UTQ13hUXEwfgB5LjjkBHC4uuL+w8pY3
	6pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3qID0Hee+iTD0wrCDmvQpWXCCdVp3LRH6HH1rdAIr7w=;
	b=OuRb/Vi6mH6qzhRKJm7W0i5iEllnWYos1BbNCp0pFp2YYVsJm8LTuS1cdwBMs66rrd
	COGRzvjNgyX1QpIeh1oOLwrm98TuRKpQVGYA8/izGA4/PqwrbxZ5t899tOE+WroajjXm
	knOIiuLNXH87onoWwR3W2NIgVf/iHlXo2IWt98XgGlNGvghkaS/6okMnvxani1d3mGo7
	6GEoWC4VxfhOTnwFWBeYStSXPNRxRBv3GkJVo41hfm3WrwWsNpa1MZPaAYD8jOA4Rvan
	vhMaIDrguBcnjQpeuaD8aSNdxMVPHEJdkOjt1mc2/ZA5NGxnbr0ieNwS16VcWU8yO7O0
	adLg==
X-Gm-Message-State: AHYfb5jETsZPCe+c1epvEuV4iO4uOdrb0T6mCpsBlg8fM7uidHQLGGrC
	R8zN/Vxl/cigLlcw
X-Received: by 10.223.164.13 with SMTP id d13mr7513014wra.58.1502357883990;
	Thu, 10 Aug 2017 02:38:03 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-134.hsi12.unitymediagroup.de. [109.91.251.134])
	by smtp.googlemail.com with ESMTPSA id
	w65sm6152093wme.6.2017.08.10.02.38.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 02:38:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Aug 2017 11:37:55 +0200
Message-Id: <20170810093755.6342-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
MIME-Version: 1.0
Subject: [PATCH] mesa: update to 17.1.6
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
X-List-Received-Date: Thu, 10 Aug 2017 09:38:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Optional installation of khrplatform.h was implemented upstream by a slightly
different approach -> 0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
can be removed.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ly-install-khrplatform.h-with-EGL-or-GLES.patch | 52 ----------------------
 .../mesa/{mesa-gl_17.1.5.bb => mesa-gl_17.1.6.bb}  |  0
 .../mesa/{mesa_17.1.5.bb => mesa_17.1.6.bb}        |  5 +--
 3 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.5.bb => mesa-gl_17.1.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.5.bb => mesa_17.1.6.bb} (81%)

diff --git a/meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch b/meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
deleted file mode 100644
index be61e2e..0000000
--- a/meta/recipes-graphics/mesa/files/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 922cb47a5b950ee5545a7a3cb4cd9a88a8b15054 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 12 Jul 2017 12:21:29 +0300
-Subject: [PATCH] mapi: Only install khrplatform.h with EGL or GLES
-
-When mesa is built with "--disable-egl --disable-gles1
---disable-gles2" the KHR platform headers are not needed.
-
-Not installing the header when not needed allows using mesa for GL
-and another implementation for GLES+EGL (as is done in practice with
-userland on raspberrypi).
-
-Upstream-Status: Pending [waiting for test results before sending]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- src/mapi/Makefile.am | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/src/mapi/Makefile.am b/src/mapi/Makefile.am
-index 9ff70a14fd..94c77fb82c 100644
---- a/src/mapi/Makefile.am
-+++ b/src/mapi/Makefile.am
-@@ -188,6 +188,8 @@ es1api_libGLESv1_CM_la_LDFLAGS = \
- 	$(LD_NO_UNDEFINED)
- 
- es1api_libGLESv1_CM_la_LIBADD += shared-glapi/libglapi.la
-+
-+khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
- endif
- 
- es1api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml $(glapi_gen_mapi_deps)
-@@ -233,6 +235,12 @@ es2api_libGLESv2_la_LDFLAGS = \
- 	$(LD_NO_UNDEFINED)
- 
- es2api_libGLESv2_la_LIBADD += shared-glapi/libglapi.la
-+
-+khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
-+endif
-+
-+if HAVE_EGL
-+khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
- endif
- 
- es2api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml $(glapi_gen_mapi_deps)
-@@ -243,4 +251,3 @@ es2api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml $(glapi_gen_mapi_deps)
- include $(top_srcdir)/install-lib-links.mk
- 
- khrdir = $(includedir)/KHR
--khr_HEADERS = $(top_srcdir)/include/KHR/khrplatform.h
--- 
-2.13.2
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.5.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.1.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.1.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.5.bb b/meta/recipes-graphics/mesa/mesa_17.1.6.bb
similarity index 81%
rename from meta/recipes-graphics/mesa/mesa_17.1.5.bb
rename to meta/recipes-graphics/mesa/mesa_17.1.6.bb
index 36b0377..111c73a 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.6.bb
@@ -5,14 +5,13 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://disable-asm-on-non-gcc.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
            file://0002-hardware-gloat.patch \
-           file://0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch \
            file://vulkan-mkdir.patch \
            file://llvm-config-version.patch \
            file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
            file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch \
 "
-SRC_URI[md5sum] = "6cf936fbcaadd98924298a7009e8265d"
-SRC_URI[sha256sum] = "378516b171712687aace4c7ea8b37c85895231d7a6d61e1e27362cf6034fded9"
+SRC_URI[md5sum] = "54758bf842f9ea53c8b57cce4311b87e"
+SRC_URI[sha256sum] = "0686deadde1f126b20aa67e47e8c50502043eee4ecdf60d5009ffda3cebfee50"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.9.4


