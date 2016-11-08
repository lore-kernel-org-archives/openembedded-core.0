Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1D95071A76
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 13:54:58 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id t196so140266317lff.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 05:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZHpSgc4GtChE/uvAKcz1giSxUHhzNtVTSmPcIIb/bcA=;
	b=BJUKNDjLwcb6ApjAWrdmj1Ou9Ml7E2ac05W2DocnT3Y1DwcSqnuGGK17xo66pUVK5j
	/GTug/bOYPBdFh1iMGm7OG6C6sVeNdtTbdqBRkfZW14V2ZVdA7/0/7VYV5/OGnyq3T9v
	Q385/rYBO/FR2IYpi9DB9uMExOmMRF+HVlWfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZHpSgc4GtChE/uvAKcz1giSxUHhzNtVTSmPcIIb/bcA=;
	b=jVjZZdCezwP2w1OpzfyZHKVY5mdRPj6QiX5sCyjSROcV2W6UC9yPbi4uyMuOtE/Psw
	yx+h32F1YXdJ54Dowowgy1JjYprIs8mMAmkI8dlsqCqJbRhnPuce3FX6WISXs6JgS+Pq
	0rrP756w58rc7Gk3Ct/Ltm+i4vUQQr0HWss6f48GdhGK0I69mdlHd63VciwloHR+vYh7
	sfmB2mwEQ0dQJ+POkEshspPLp1zUAGK3ZokirXNz9XTA3wVWb5KXpqYQ3XIpqE4Q1RVZ
	1azysrvIgeOSbNLKKtjy6ksjdKNncRAxORX/b5Pfz/JTDSw3ZxWLytVGNRDPVA48dMGJ
	8dPw==
X-Gm-Message-State: ABUngvcwxb39+oH8xNzSmBL3368Q3bLRIgRz28nMsLqcD8zAGHV5bgTSRDzWnn/qJKvNNgYQ
X-Received: by 10.25.72.215 with SMTP id v206mr7379720lfa.12.1478613298912;
	Tue, 08 Nov 2016 05:54:58 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	204sm6124805ljj.47.2016.11.08.05.54.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Nov 2016 05:54:58 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 15:54:57 +0200
Message-Id: <20161108135457.13249-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] weston: upgrade from 1.11.1 to 1.12.0
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
X-List-Received-Date: Tue, 08 Nov 2016 13:54:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Daniel Díaz <daniel.diaz@linaro.org>

* Refresh patches to apply cleanly on 1.12.0 (no changes):
  - 0001-make-error-portable.patch
  - 0001-configure.ac-Fix-wayland-protocols-path.patch
  - 0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
  - 0001-Add-configuration-option-for-no-input-device.patch
* Remove 0001-shared-include-stdint.h-for-int32_t.patch applied
  upstream
  https://cgit.freedesktop.org/wayland/weston/commit/?id=649bbce6
* Update license files checksum, compositor.c location has changed.
  No license changes.
* Drop --disable-rpi-compositor from EXTRA_OE_CONF. Raspberry Pi backend
  and renderer have been removed upstream. The option doesn't exist
  anymore.
* Adjust files names to the new naming: weston -> libweston-1.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...-configuration-option-for-no-input-device.patch | 39 +++++++++++-----------
 ...1-configure.ac-Fix-wayland-protocols-path.patch |  4 +--
 .../wayland/weston/0001-make-error-portable.patch  | 20 +++++------
 .../0001-shared-include-stdint.h-for-int32_t.patch | 23 -------------
 ...ch-Provide-a-default-version-that-doesn-t.patch | 28 ++++++++--------
 .../wayland/{weston_1.11.1.bb => weston_1.12.0.bb} | 12 +++----
 6 files changed, 51 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
 rename meta/recipes-graphics/wayland/{weston_1.11.1.bb => weston_1.12.0.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch b/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
index c45f3ad..a822d4a 100644
--- a/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
@@ -31,24 +31,24 @@ Reviewed-by: Daniel Stone <daniels@collabora.com>
 Upstream-Status: backport from
 https://cgit.freedesktop.org/wayland/weston/commit/?id=75b7197f
 ---
- man/weston.ini.man  |    5 +++++
- src/compositor.h    |    3 +++
- src/libinput-seat.c |    6 ++++++
- src/main.c          |    5 +++++
- weston.ini.in       |    1 +
- 5 files changed, 20 insertions(+)
+ compositor/main.c         |    5 +++++
+ libweston/compositor.h    |    4 ++++
+ libweston/libinput-seat.c |    6 ++++++
+ man/weston.ini.man        |    5 +++++
+ weston.ini.in             |    1 +
+ 5 files changed, 21 insertions(+)
 
---- a/src/main.c
-+++ b/src/main.c
-@@ -1298,6 +1298,7 @@ int main(int argc, char *argv[])
- 	struct wl_client *primary_client;
+--- a/compositor/main.c
++++ b/compositor/main.c
+@@ -1595,6 +1595,7 @@ int main(int argc, char *argv[])
  	struct wl_listener primary_client_destroyed;
  	struct weston_seat *seat;
-+      int require_input;
+ 	struct wet_compositor user_data;
++	int require_input;
  
  	const struct weston_option core_options[] = {
  		{ WESTON_OPTION_STRING, "backend", 'B', &backend },
-@@ -1373,6 +1374,10 @@ int main(int argc, char *argv[])
+@@ -1678,6 +1679,10 @@ int main(int argc, char *argv[])
  	if (weston_compositor_init_config(ec, config) < 0)
  		goto out;
  
@@ -59,21 +59,22 @@ https://cgit.freedesktop.org/wayland/weston/commit/?id=75b7197f
  	if (load_backend(ec, backend, &argc, argv, config) < 0) {
  		weston_log("fatal: failed to create compositor backend\n");
  		goto out;
---- a/src/compositor.h
-+++ b/src/compositor.h
-@@ -803,6 +803,9 @@ struct weston_compositor {
+--- a/libweston/compositor.h
++++ b/libweston/compositor.h
+@@ -836,6 +836,10 @@ struct weston_compositor {
  
  	void *user_data;
  	void (*exit)(struct weston_compositor *c);
 +
 +	/* Whether to let the compositor run without any input device. */
 +	bool require_input;
++
  };
  
  struct weston_buffer {
---- a/src/libinput-seat.c
-+++ b/src/libinput-seat.c
-@@ -255,6 +255,12 @@ udev_input_enable(struct udev_input *inp
+--- a/libweston/libinput-seat.c
++++ b/libweston/libinput-seat.c
+@@ -259,6 +259,12 @@ udev_input_enable(struct udev_input *inp
  			devices_found = 1;
  	}
  
@@ -88,7 +89,7 @@ https://cgit.freedesktop.org/wayland/weston/commit/?id=75b7197f
  			"warning: no input devices on entering Weston. "
 --- a/man/weston.ini.man
 +++ b/man/weston.ini.man
-@@ -169,6 +169,11 @@ time, the one specified in the command-l
+@@ -168,6 +168,11 @@ time, the one specified in the command-l
  hand, if none of these sets the value, default idle timeout will be
  set to 300 seconds.
  .RS
diff --git a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
index edd3b91..39000d4 100644
--- a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [embedded specific]
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -187,7 +187,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [lib
+@@ -229,7 +229,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [lib
  PKG_CHECK_MODULES(COMPOSITOR, [$COMPOSITOR_MODULES])
  
- PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.2],
+ PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.7],
 -		  [ac_wayland_protocols_pkgdatadir=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
 +		  [ac_wayland_protocols_pkgdatadir=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, $ac_wayland_protocols_pkgdatadir)
diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
index f7b5284..c41ea49 100644
--- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
@@ -7,18 +7,18 @@ error() is not posix but gnu extension so may not be available on all
 kind of systemsi e.g. musl.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
 
- configure.ac        |    2 ++
- src/weston-error.h  |   20 ++++++++++++++++++++
- src/weston-launch.c |    2 +-
+Upstream-Status: Submitted
+---
+ configure.ac              |    2 ++
+ libweston/weston-error.h  |   20 ++++++++++++++++++++
+ libweston/weston-launch.c |    2 +-
  3 files changed, 23 insertions(+), 1 deletion(-)
- create mode 100644 src/weston-error.h
+ create mode 100644 libweston/weston-error.h
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -60,6 +60,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+@@ -102,6 +102,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
  	      [[#include <time.h>]])
  AC_CHECK_HEADERS([execinfo.h])
  
@@ -28,7 +28,7 @@ Upstream-Status: Submitted
  
  COMPOSITOR_MODULES="wayland-server >= $WAYLAND_PREREQ_VERSION pixman-1 >= 0.25.2"
 --- /dev/null
-+++ b/src/weston-error.h
++++ b/libweston/weston-error.h
 @@ -0,0 +1,20 @@
 +#ifndef _WESTON_ERROR_H
 +#define _WESTON_ERROR_H
@@ -50,8 +50,8 @@ Upstream-Status: Submitted
 +
 +#endif
 +
---- a/src/weston-launch.c
-+++ b/src/weston-launch.c
+--- a/libweston/weston-launch.c
++++ b/libweston/weston-launch.c
 @@ -33,7 +33,6 @@
  #include <poll.h>
  #include <errno.h>
diff --git a/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch b/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
deleted file mode 100644
index ee66c20..0000000
--- a/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From ba02b8abe4e2afac2bfbf2559972d5059d75a041 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Sat, 16 Jul 2016 22:50:19 +0300
-Subject: [PATCH weston] shared: include stdint.h for int32_t
-
-This fixes build on musl.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted
----
- shared/xalloc.h |    1 +
- 1 file changed, 1 insertion(+)
-
---- a/shared/xalloc.h
-+++ b/shared/xalloc.h
-@@ -30,6 +30,7 @@
- extern "C" {
- #endif
- 
-+#include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- 
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index d684b1c..3d12d53 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -14,13 +14,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 ---
- configure.ac        |    9 +++++++--
- src/weston-launch.c |   20 ++++++++++++++++++++
+ configure.ac              |    9 +++++++--
+ libweston/weston-launch.c |   20 ++++++++++++++++++++
  2 files changed, 27 insertions(+), 2 deletions(-)
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -416,13 +416,17 @@ AC_ARG_ENABLE(resize-optimization,
+@@ -441,13 +441,17 @@ AC_ARG_ENABLE(resize-optimization,
  AS_IF([test "x$enable_resize_optimization" = "xyes"],
        [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
  
@@ -40,7 +40,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  fi
  
  AM_CONDITIONAL(HAVE_PANGO, test "x$have_pango" = "xyes")
-@@ -673,6 +677,7 @@ AC_MSG_RESULT([
+@@ -704,6 +708,7 @@ AC_MSG_RESULT([
  	Enable developer documentation	${enable_devdocs}
  
  	weston-launch utility		${enable_weston_launch}
@@ -48,8 +48,8 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  	systemd-login support		${have_systemd_login}
  	systemd notify support		${enable_systemd_notify}
  
---- a/src/weston-launch.c
-+++ b/src/weston-launch.c
+--- a/libweston/weston-launch.c
++++ b/libweston/weston-launch.c
 @@ -51,7 +51,9 @@
  
  #include <pwd.h>
@@ -103,7 +103,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  
  	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
  	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
-@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl)
+@@ -600,6 +608,7 @@ setup_session(struct weston_launch *wl,
  	setenv("HOME", wl->pw->pw_dir, 1);
  	setenv("SHELL", wl->pw->pw_shell, 1);
  
@@ -111,15 +111,15 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  	env = pam_getenvlist(wl->ph);
  	if (env) {
  		for (i = 0; env[i]; ++i) {
-@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl)
+@@ -608,6 +617,7 @@ setup_session(struct weston_launch *wl,
  		}
  		free(env);
  	}
 +#endif
- }
  
- static void
-@@ -665,7 +675,9 @@ static void
+ 	/*
+ 	 * We open a new session, so it makes sense
+@@ -675,7 +685,9 @@ static void
  help(const char *name)
  {
  	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
@@ -129,7 +129,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  	fprintf(stderr, "  -t, --tty       Start session on alternative tty\n");
  	fprintf(stderr, "  -v, --verbose   Be verbose\n");
  	fprintf(stderr, "  -h, --help      Display this help message\n");
-@@ -678,7 +690,9 @@ main(int argc, char *argv[])
+@@ -688,7 +700,9 @@ main(int argc, char *argv[])
  	int i, c;
  	char *tty = NULL;
  	struct option opts[] = {
@@ -139,7 +139,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  		{ "tty",     required_argument, NULL, 't' },
  		{ "verbose", no_argument,       NULL, 'v' },
  		{ "help",    no_argument,       NULL, 'h' },
-@@ -690,9 +704,13 @@ main(int argc, char *argv[])
+@@ -700,9 +714,13 @@ main(int argc, char *argv[])
  	while ((c = getopt_long(argc, argv, "u:t::vh", opts, &i)) != -1) {
  		switch (c) {
  		case 'u':
@@ -153,7 +153,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
  			break;
  		case 't':
  			tty = optarg;
-@@ -732,8 +750,10 @@ main(int argc, char *argv[])
+@@ -740,8 +758,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
diff --git a/meta/recipes-graphics/wayland/weston_1.11.1.bb b/meta/recipes-graphics/wayland/weston_1.12.0.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/weston_1.11.1.bb
rename to meta/recipes-graphics/wayland/weston_1.12.0.bb
index 7e75cf7..f944646 100644
--- a/meta/recipes-graphics/wayland/weston_1.11.1.bb
+++ b/meta/recipes-graphics/wayland/weston_1.12.0.bb
@@ -3,20 +3,19 @@ DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
-                    file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
+                    file://libweston/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://0001-make-error-portable.patch \
            file://0001-configure.ac-Fix-wayland-protocols-path.patch \
-           file://0001-shared-include-stdint.h-for-int32_t.patch \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
            file://0001-Add-configuration-option-for-no-input-device.patch \
 "
-SRC_URI[md5sum] = "c5fdc02ab67d33c0fca8f72d341facdf"
-SRC_URI[sha256sum] = "548973496a5c8613d6690f9120f21066946a544df65ce4fe0ef153a8dc0bf6de"
+SRC_URI[md5sum] = "310af6d7f8ba03c3418cec8ad72ea748"
+SRC_URI[sha256sum] = "ac7ac2a32e3b9f50131fccded5d2326bd36b2226712d90b61999118a09af5033"
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
@@ -26,7 +25,6 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --disable-rpi-compositor \
                 --disable-rdp-compositor \
                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE} \
                 "
@@ -84,7 +82,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-	rm -f ${D}/${libdir}/weston/*.la
+	rm -f ${D}/${libdir}/libweston-1/*.la
 
 	# If X11, ship a desktop file to launch it
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
@@ -103,7 +101,7 @@ do_install_append() {
 PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)}"
 PACKAGES += "${PN}-examples"
 
-FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/*${SOLIBS} ${libdir}/${BPN}/*.so ${libdir}/libweston-1/*.so ${datadir}"
 FILES_${PN}-examples = "${bindir}/*"
 
 FILES_${PN}-xwayland = "${libdir}/${BPN}/xwayland.so"
-- 
2.10.2


