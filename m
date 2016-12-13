Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id B5CCC719B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 09:09:13 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id j10so15333673wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 01:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2lYzwxa03+0nYuqkKF+N95Ok3Dbu8xZfRuV1UqHFVkQ=;
	b=GwmDGaLR4/WLLEoeuIB/GjghJ4iHSbPaSN/O4PB9O7Ype9dajWQjxCT1rA0gMa9UKn
	BaGlrqU3YdWaqb2w1fkiL6Io/Xq3dFkQd8Fg6daYH4A92eFXu2hHG96hHZ1G44otEV0f
	bJUEZJRsKcephfl0bSDj/Qb5GJsLXtgwlHQ5pLgAf/uYOyNhJ+dOyfZWnSIrmnKi/WlF
	ZX4yZdPLVrBjovJURfLn/jOwMxR/VBy+66Et1NSWgTQU3ILpxY/QOTdyH1ZJTcqP5j/A
	/yYwdCooAy5GUlM8U9fUUW5o730CBlmDTWGiQEUQyjOu9XhmfFNwDtQhrpa3ENNJ29wx
	3Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2lYzwxa03+0nYuqkKF+N95Ok3Dbu8xZfRuV1UqHFVkQ=;
	b=Lk3lK4nfmKZxddZRMXepMFvITIvf8OzALYBztfOseexTkv9hQliYCIt1ACddK+hyGe
	2YvKvZ2wgU6IzsOkgYqFscuFlUUIdKmFjLIFdvAes0oVlDcntEpvdHmjnEy7tEDQx3LP
	XNh3rYW7GteVKt2UuZoIok4kSntsXgaZR2RqZooPs80lFt6ejhqNaZexW5cOk5gdR/iE
	DDfzlygr0b3lmxAPrqGBgx9hqQUnWwFZ6ww7eaxAZWf/yteKzdrn6xpcyswKsqxciS4H
	OFYMVqGJGxDccnNr8KxleIxdUbXDq/hVHrJ/Lr3rMy/v+wXavQb2aaOeoxFucxiG3mdJ
	zGJg==
X-Gm-Message-State: AKaTC00IPmNcBhgLhReYu1h4weBSWUREE5oIIZaMrLONjkjSct1BikHEDEkV6WImjvkO0A==
X-Received: by 10.194.9.34 with SMTP id w2mr79999633wja.24.1481620154047;
	Tue, 13 Dec 2016 01:09:14 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-90-226-171.hsi11.unitymediagroup.de. [109.90.226.171])
	by smtp.googlemail.com with ESMTPSA id
	i132sm1575100wmf.14.2016.12.13.01.09.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 01:09:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 10:09:01 +0100
Message-Id: <1481620141-4369-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libepoxy: move to tip of Emmanuele Bassi's fork
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
X-List-Received-Date: Tue, 13 Dec 2016 09:09:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* fixes starting of kde-plasma for wayland:
  | No provider of glGenFramebuffers found.  Requires one of:
  |     Desktop OpenGL 3.0
  |     GL extension "GL_ARB_framebuffer_object"
  |     OpenGL ES 2.0
  |     GL extension "GL_EXT_framebuffer_object"
  | /usr/bin/startplasmacompositor: line 223:   787 Aborted                 (core dumped) /usr/bin/kwin_wayland --xwayland --libinput --exit-with-session=/usr/libexec/startplasma
* fixes some strange behavour on kde-plasma for x11: Black screen on logout /
  Lock screen does not return.
* Eric Anholt seems to have passed maintainership of libepoxy over to
  Yaron Cohen-Tal. I agree that things didn't really turn out well since then [1].
* 0001-select-platforms-based-on-configuration-results.patch and
  0002-add-an-option-to-disable-glx-support.patch wre replaced by
  0001-make-x11-support-optional.patch

[1] https://github.com/ebassi/libepoxy/commit/8dead45cb366bf5c08539bef2ccaa36b80eb1483

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ....patch => 0001-make-x11-support-optional.patch} | 87 +++++++++-------------
 ...0002-add-an-option-to-disable-glx-support.patch | 42 -----------
 meta/recipes-graphics/libepoxy/libepoxy_git.bb     |  9 +--
 3 files changed, 40 insertions(+), 98 deletions(-)
 rename meta/recipes-graphics/libepoxy/libepoxy/{0001-select-platforms-based-on-configuration-results.patch => 0001-make-x11-support-optional.patch} (55%)
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch b/meta/recipes-graphics/libepoxy/libepoxy/0001-make-x11-support-optional.patch
similarity index 55%
rename from meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
rename to meta/recipes-graphics/libepoxy/libepoxy/0001-make-x11-support-optional.patch
index 674c8e8..7b08fd1 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
+++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-make-x11-support-optional.patch
@@ -1,38 +1,52 @@
-From 3a93150bc0aec86afdb7d053247dc2448925e09a Mon Sep 17 00:00:00 2001
+From f08cd639eb731c0d8fdbbba9e4beb1041c07e0c2 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 6 May 2015 10:45:22 +0200
-Subject: [PATCH 1/2] select platforms based on configuration results
+Date: Tue, 13 Dec 2016 00:01:47 +0100
+Subject: [PATCH] make x11 support optional
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream-Status: Submitted [1]
+X11 support is build by default if x11 libs are found. This can be disabled
+by --disable-glx.
+
+A similar (bit too overenthusiastic) pull request was sent long time ago [1]
+before we saw cmake trouble. There was a follow up PR in [2] but I cannot test
+it so took only very common parts.
+
+Upstream-Status: Submitted [3]
 
 [1] https://github.com/anholt/libepoxy/pull/52
+[2] https://github.com/anholt/libepoxy/pull/81
+[3] https://github.com/ebassi/libepoxy/pull/1
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- configure.ac          | 13 +++++--------
- src/dispatch_common.c |  9 ++++++---
- src/dispatch_common.h |  9 +++++----
- 3 files changed, 16 insertions(+), 15 deletions(-)
+ configure.ac          | 18 ++++++++++--------
+ src/dispatch_common.c |  5 ++++-
+ src/dispatch_common.h |  3 ++-
+ 3 files changed, 16 insertions(+), 10 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index a52fc58..bdd70da 100644
+index 2d67726..3df9966 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -58,6 +58,10 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
+@@ -58,6 +58,15 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
  # uintptr_t to a void *") by default.  Kill that.
  XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
  
-+PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
++AC_ARG_ENABLE([glx],
++                [AS_HELP_STRING([--disable-glx],
++                [disable if you do not want x11/glx support])],
++                [enable_glx=$enableval],
++                [enable_glx=yes]
++             )
 +
-+AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
++PKG_CHECK_MODULES(X11, [x11], [x11=$enable_glx], [x11=no])
 +
  has_znow=yes
  
  case $host_os in
-@@ -86,7 +90,7 @@ case $host_os in
+@@ -86,7 +95,7 @@ case $host_os in
          ;;
      *)
          build_egl=yes
@@ -41,7 +55,7 @@ index a52fc58..bdd70da 100644
          build_wgl=no
          # On platforms with dlopen, we load everything dynamically and
          # don't link against a specific window system or GL implementation.
-@@ -144,13 +148,6 @@ esac
+@@ -144,13 +153,6 @@ esac
  
  AC_SUBST([VISIBILITY_CFLAGS])
  
@@ -56,10 +70,10 @@ index a52fc58..bdd70da 100644
  
  AC_CONFIG_FILES([
 diff --git a/src/dispatch_common.c b/src/dispatch_common.c
-index 4e34d6e..2ab84ed 100644
+index c0c7156..a2699d2 100644
 --- a/src/dispatch_common.c
 +++ b/src/dispatch_common.c
-@@ -615,10 +615,13 @@ epoxy_get_proc_address(const char *name)
+@@ -643,9 +643,12 @@ epoxy_get_proc_address(const char *name)
  #elif defined(__APPLE__)
      return epoxy_gl_dlsym(name);
  #else
@@ -69,29 +83,15 @@ index 4e34d6e..2ab84ed 100644
 -    } else {
 +    } else
 +#endif /* PLATFORM_HAS_GLX */
- #if PLATFORM_HAS_EGL
 +    {
+ #if PLATFORM_HAS_EGL
          GLenum egl_api = epoxy_egl_get_current_gl_context_api();
  
-         switch (egl_api) {
-@@ -628,10 +631,10 @@ epoxy_get_proc_address(const char *name)
-         case EGL_NONE:
-             break;
-         }
--#endif
-     }
-+#endif /* PLATFORM_HAS_EGL */
-     errx(1, "Couldn't find current GLX or EGL context.\n");
--#endif
-+#endif /* _WIN32 | __APPLE__*/
- }
- 
- void
 diff --git a/src/dispatch_common.h b/src/dispatch_common.h
-index 6b8503a..82681e4 100644
+index 676a4d5..1c487eb 100644
 --- a/src/dispatch_common.h
 +++ b/src/dispatch_common.h
-@@ -21,12 +21,13 @@
+@@ -21,6 +21,7 @@
   * IN THE SOFTWARE.
   */
  
@@ -99,30 +99,15 @@ index 6b8503a..82681e4 100644
  #include <stdbool.h>
  
  #ifdef _WIN32
- #define PLATFORM_HAS_EGL 0
- #define PLATFORM_HAS_GLX 0
--#define PLATFORM_HAS_WGL 1
-+#define PLATFORM_HAS_WGL BUILD_WGL
- #define EPOXY_IMPORTEXPORT __declspec(dllexport)
- #elif defined(__APPLE__)
- #define PLATFORM_HAS_EGL 0
-@@ -34,13 +35,13 @@
- #define PLATFORM_HAS_WGL 0
- #define EPOXY_IMPORTEXPORT
- #elif defined(ANDROID)
--#define PLATFORM_HAS_EGL 1
-+#define PLATFORM_HAS_EGL BUILD_EGL
- #define PLATFORM_HAS_GLX 0
- #define PLATFORM_HAS_WGL 0
+@@ -40,7 +41,7 @@
  #define EPOXY_IMPORTEXPORT
  #else
--#define PLATFORM_HAS_EGL 1
+ #define PLATFORM_HAS_EGL 1
 -#define PLATFORM_HAS_GLX 1
-+#define PLATFORM_HAS_EGL BUILD_EGL
 +#define PLATFORM_HAS_GLX BUILD_GLX
  #define PLATFORM_HAS_WGL 0
  #define EPOXY_IMPORTEXPORT
  #endif
 -- 
-1.9.3
+2.5.5
 
diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch b/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
deleted file mode 100644
index 262d684..0000000
--- a/meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 24868cbfb9dda5f6929dd277c47d35df016e8754 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 6 May 2015 11:05:48 +0200
-Subject: [PATCH 2/2] add an option to disable glx support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-this option would help us in yocto to get deterministic build results
-
-Upstream-Status: Submitted [1]
-
-[1] https://github.com/anholt/libepoxy/pull/52
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index bdd70da..6c7153d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,7 +58,14 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
- # uintptr_t to a void *") by default.  Kill that.
- XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
- 
--PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
-+AC_ARG_ENABLE([glx],
-+                [AS_HELP_STRING([--disable-glx],
-+				[disable if you don't want x11/glx support])],
-+                [],
-+                [enable_glx=yes]
-+             )
-+
-+PKG_CHECK_MODULES(X11, [x11], [x11=$enable_glx], [x11=no])
- 
- AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
- 
--- 
-1.9.3
-
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
index 6c247cc..54f9ef9 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
@@ -7,13 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 
 SRC_URI = " \
-    git://github.com/anholt/libepoxy.git \
-    file://0001-select-platforms-based-on-configuration-results.patch \
-    file://0002-add-an-option-to-disable-glx-support.patch \
+    git://github.com/ebassi/libepoxy.git \
+    file://0001-make-x11-support-optional.patch \
     file://no-need-for-python3.patch \
 "
-SRCREV="e2c33af5bfcfc9d168f9e776156dd47c33f428b3"
-PV = "1.3.1"
+SRCREV="269b4690b9222f53f24c3b97becebab8f8f6bbcb"
+PV = "1.3.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


