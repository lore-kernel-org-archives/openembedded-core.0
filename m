Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id CDBA37D13A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 19:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E317240BA5;
	Mon,  1 Apr 2019 19:49:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bVG2wnqoAk48; Mon,  1 Apr 2019 19:49:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C51EE407E7;
	Mon,  1 Apr 2019 19:49:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1F5AB16D8CC;
	Mon,  1 Apr 2019 15:49:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 15:49:14 -0400
Message-Id: <1554148154-3948-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] weston: upgrade 5.0.0 -> 6.0.0
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
X-List-Received-Date: Mon, 01 Apr 2019 19:49:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

Refresh patches.

Note:
6.0.0 is the last one to support autotools (needs explicit configure option),
newer versions will only support meson.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - also refresh patches

 .../wayland/weston/0001-make-error-portable.patch  | 10 +++----
 ...ch-Provide-a-default-version-that-doesn-t.patch | 33 +++++++++++-----------
 .../wayland/{weston_5.0.0.bb => weston_6.0.0.bb}   |  5 ++--
 3 files changed, 25 insertions(+), 23 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_5.0.0.bb => weston_6.0.0.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
index 09ec155..0eb3d95 100644
--- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
@@ -1,4 +1,4 @@
-From ad1d2161c811cff25d1684c33611f300adb753bc Mon Sep 17 00:00:00 2001
+From c4677e155736062e75687f1a655732c8902e912b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 May 2015 20:56:00 -0700
 Subject: [PATCH] make error() portable
@@ -18,12 +18,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 libweston/weston-error.h
 
 diff --git a/configure.ac b/configure.ac
-index 7aebbdb..dc9c802 100644
+index c05ad01..6da6e04 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -109,6 +109,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+@@ -126,6 +126,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+ 	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile weston")],
  	      [[#include <time.h>]])
- AC_CHECK_HEADERS([execinfo.h])
  
 +AC_CHECK_HEADERS([error.h])
 +
@@ -57,7 +57,7 @@ index 0000000..2089d02
 +#endif
 +
 diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
-index 1adcf21..166bf3b 100644
+index bf73e0d..9064439 100644
 --- a/libweston/weston-launch.c
 +++ b/libweston/weston-launch.c
 @@ -33,7 +33,6 @@
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index d648538..a2f61bf 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -1,7 +1,8 @@
-From b98b9dbda902225cdd972b5bff6a641c36cc7e90 Mon Sep 17 00:00:00 2001
+From 7d2fea61a95e9498b5a19c8cffcb2ab5631d5685 Mon Sep 17 00:00:00 2001
 From: Tom Hochstein <tom.hochstein@nxp.com>
 Date: Wed, 22 Feb 2017 15:53:30 +0200
-Subject: [PATCH] weston-launch: Provide a default version that doesn't require PAM
+Subject: [PATCH] weston-launch: Provide a default version that doesn't require
+ PAM
 
 weston-launch requires PAM for starting weston as a non-root user.
 
@@ -21,10 +22,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  2 files changed, 27 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index dc9c802..48cf5cb 100644
+index 6da6e04..681f7c8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -451,13 +451,17 @@ AC_ARG_ENABLE(resize-optimization,
+@@ -515,13 +515,17 @@ AC_ARG_ENABLE(resize-optimization,
  AS_IF([test "x$enable_resize_optimization" = "xyes"],
        [AC_DEFINE([USE_RESIZE_POOL], [1], [Use resize memory pool as a performance optimization])])
  
@@ -44,7 +45,7 @@ index dc9c802..48cf5cb 100644
  fi
  
  AM_CONDITIONAL(HAVE_PANGO, test "x$have_pango" = "xyes")
-@@ -702,6 +706,7 @@ AC_MSG_RESULT([
+@@ -767,6 +771,7 @@ AC_MSG_RESULT([
  	Enable developer documentation	${enable_devdocs}
  
  	weston-launch utility		${enable_weston_launch}
@@ -53,7 +54,7 @@ index dc9c802..48cf5cb 100644
  	systemd notify support		${enable_systemd_notify}
  
 diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
-index 166bf3b..6fb9232 100644
+index 9064439..c6abe92 100644
 --- a/libweston/weston-launch.c
 +++ b/libweston/weston-launch.c
 @@ -51,7 +51,9 @@
@@ -77,7 +78,7 @@ index 166bf3b..6fb9232 100644
  	int tty;
  	int ttynr;
  	int sock[2];
-@@ -189,6 +193,7 @@ weston_launch_allowed(struct weston_launch *wl)
+@@ -191,6 +195,7 @@ weston_launch_allowed(struct weston_launch *wl)
  	return false;
  }
  
@@ -85,7 +86,7 @@ index 166bf3b..6fb9232 100644
  static int
  pam_conversation_fn(int msg_count,
  		    const struct pam_message **messages,
-@@ -229,6 +234,7 @@ setup_pam(struct weston_launch *wl)
+@@ -231,6 +236,7 @@ setup_pam(struct weston_launch *wl)
  
  	return 0;
  }
@@ -93,7 +94,7 @@ index 166bf3b..6fb9232 100644
  
  static int
  setup_launcher_socket(struct weston_launch *wl)
-@@ -422,6 +428,7 @@ quit(struct weston_launch *wl, int status)
+@@ -424,6 +430,7 @@ quit(struct weston_launch *wl, int status)
  	close(wl->signalfd);
  	close(wl->sock[0]);
  
@@ -101,7 +102,7 @@ index 166bf3b..6fb9232 100644
  	if (wl->new_user) {
  		err = pam_close_session(wl->ph, 0);
  		if (err)
-@@ -429,6 +436,7 @@ quit(struct weston_launch *wl, int status)
+@@ -431,6 +438,7 @@ quit(struct weston_launch *wl, int status)
  				err, pam_strerror(wl->ph, err));
  		pam_end(wl->ph, err);
  	}
@@ -109,7 +110,7 @@ index 166bf3b..6fb9232 100644
  
  	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
  	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
-@@ -608,6 +616,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -610,6 +618,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  	setenv("HOME", wl->pw->pw_dir, 1);
  	setenv("SHELL", wl->pw->pw_shell, 1);
  
@@ -117,7 +118,7 @@ index 166bf3b..6fb9232 100644
  	env = pam_getenvlist(wl->ph);
  	if (env) {
  		for (i = 0; env[i]; ++i) {
-@@ -616,6 +625,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -618,6 +627,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  		}
  		free(env);
  	}
@@ -125,7 +126,7 @@ index 166bf3b..6fb9232 100644
  
  	/*
  	 * We open a new session, so it makes sense
-@@ -683,8 +693,10 @@ static void
+@@ -685,8 +695,10 @@ static void
  help(const char *name)
  {
  	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
@@ -136,7 +137,7 @@ index 166bf3b..6fb9232 100644
  	fprintf(stderr, "  -t, --tty       Start session on alternative tty,\n"
  			"                  e.g. -t /dev/tty4, requires -u option.\n");
  	fprintf(stderr, "  -v, --verbose   Be verbose\n");
-@@ -698,7 +710,9 @@ main(int argc, char *argv[])
+@@ -700,7 +712,9 @@ main(int argc, char *argv[])
  	int i, c;
  	char *tty = NULL;
  	struct option opts[] = {
@@ -146,7 +147,7 @@ index 166bf3b..6fb9232 100644
  		{ "tty",     required_argument, NULL, 't' },
  		{ "verbose", no_argument,       NULL, 'v' },
  		{ "help",    no_argument,       NULL, 'h' },
-@@ -710,9 +724,13 @@ main(int argc, char *argv[])
+@@ -712,9 +726,13 @@ main(int argc, char *argv[])
  	while ((c = getopt_long(argc, argv, "u:t:vh", opts, &i)) != -1) {
  		switch (c) {
  		case 'u':
@@ -160,7 +161,7 @@ index 166bf3b..6fb9232 100644
  			break;
  		case 't':
  			tty = optarg;
-@@ -753,8 +771,10 @@ main(int argc, char *argv[])
+@@ -755,8 +773,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
diff --git a/meta/recipes-graphics/wayland/weston_5.0.0.bb b/meta/recipes-graphics/wayland/weston_6.0.0.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/weston_5.0.0.bb
rename to meta/recipes-graphics/wayland/weston_6.0.0.bb
index e517109..fa08dac 100644
--- a/meta/recipes-graphics/wayland/weston_5.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_6.0.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "752a04ce3c65af4884cfac4e57231bdb"
-SRC_URI[sha256sum] = "15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf"
+SRC_URI[md5sum] = "7c634e262f8a464a076c97fd50ad36b3"
+SRC_URI[sha256sum] = "546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
@@ -28,6 +28,7 @@ WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-rdp-compositor \
+                --enable-autotools \
                 "
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
-- 
2.7.4


