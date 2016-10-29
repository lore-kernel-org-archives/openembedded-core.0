Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 60EA2719A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 14:48:00 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id b75so75684835lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9ViTlXqS+FQ4+JPb9bM0P2AE1Jr/P+EAsGMPoG6pU9w=;
	b=E4vbHG5rXKUTmHhlko1dCOtLrwW9uPPt+WzH0h7pruNBJlLXvSOLhVamw3zta89nXR
	1SQifbiQHsoyL/xc4IFa1P6p5+MZMkDNjmPel5w0jvxKzrwWiJSqiko1ZO+j22N92hx7
	yVfWIkCxyYocnUUU1Y9H+Bi+oKaC+v2dE5U+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9ViTlXqS+FQ4+JPb9bM0P2AE1Jr/P+EAsGMPoG6pU9w=;
	b=YVCUdyMyv6gb5cKFjQIKHI6OEg1Yo+kjw+5fwkGvqIx9ZMBp7kV1QN0bzUqNc7lBeU
	P3Kg6mMllYgVqwYeLqw/mrrGQbl9Ke+XfNE8zgDfs5MQFMlg1lc9JZEGlXOwNdeBpNFI
	aQl+w3+muwjMxM/ax6+qSUjkdhJLc6d9HL6NI3H/O9dlFM4WPsbK69aygZsBlAuVvM5W
	jCRqhA1wIMbi0Me4pWGSv+HI16cWSuGowjhKjfmuYlhSF73t7FRXqjMCoRTWaogzB1+x
	CXS67FkjWoQkKdvZ6vsx2fhMRYEZlh9ogqJfTHMlHK+dI0k/BYkoziU5RacYajMaHCUg
	Q7bA==
X-Gm-Message-State: ABUngvdUpG9+LRnay2jkCova6Ie7HerOaC9dEjzlwWgTOCdRia3iYgCDOaANX10V/XS1vzzR
X-Received: by 10.25.158.144 with SMTP id h138mr1676697lfe.89.1477752480155;
	Sat, 29 Oct 2016 07:48:00 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id 94sm2897637lja.10.2016.10.29.07.47.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 29 Oct 2016 07:47:58 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Oct 2016 17:47:52 +0300
Message-Id: <20161029144752.25996-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [oe-core PATCH] weston: upgrade from 1.11.0 to 1.11.1
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
X-List-Received-Date: Sat, 29 Oct 2016 14:48:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Refresh patches to apply cleanly without hunk on 1.11.1 (no changes):
  - 0001-make-error-portable.patch
  - 0001-configure.ac-Fix-wayland-protocols-path.patch
  - 0001-shared-include-stdint.h-for-int32_t.patch
  - 0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
* Remove make-weston-launch-exit-for-unrecognized-option.patch
  applied upstream
  https://cgit.freedesktop.org/wayland/weston/commit/?h=1.11&id=fc3dd183
* Add 0001-Add-configuration-option-for-no-input-device.patch
  backported from upstream
  https://cgit.freedesktop.org/wayland/weston/commit/?id=75b7197f

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...-configuration-option-for-no-input-device.patch | 112 +++++++++++++++++++++
 ...1-configure.ac-Fix-wayland-protocols-path.patch |   9 +-
 .../wayland/weston/0001-make-error-portable.patch  |  24 ++---
 .../0001-shared-include-stdint.h-for-int32_t.patch |   7 +-
 ...ch-Provide-a-default-version-that-doesn-t.patch |  19 ++--
 ...eston-launch-exit-for-unrecognized-option.patch |  33 ------
 .../wayland/{weston_1.11.0.bb => weston_1.11.1.bb} |   6 +-
 7 files changed, 131 insertions(+), 79 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
 rename meta/recipes-graphics/wayland/{weston_1.11.0.bb => weston_1.11.1.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch b/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
new file mode 100644
index 0000000..c45f3ad
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-Add-configuration-option-for-no-input-device.patch
@@ -0,0 +1,112 @@
+From 75b7197f4e072a4e2de124ddbe93b85cffb1c0f8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
+Date: Fri, 21 Oct 2016 14:03:13 -0500
+Subject: [PATCH] Add configuration option for no input device.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+As it has been discussed in the past [1], running Weston
+without any input device at launch might be beneficial for
+some use cases.
+
+Certainly, it's best for the vast majority of users (and
+the project) to require an input device to be present, as
+to avoid frustration and hassle, but for those brave souls
+that so prefer, this patch lets them run without any input
+device at all.
+
+This introduces a simple configuration in weston.ini:
+  [core]
+  require-input=true
+
+True is the default, so no behavioral change is introduced.
+
+[1] https://lists.freedesktop.org/archives/wayland-devel/2015-November/025193.html
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Daniel Stone <daniels@collabora.com>
+
+Upstream-Status: backport from
+https://cgit.freedesktop.org/wayland/weston/commit/?id=75b7197f
+---
+ man/weston.ini.man  |    5 +++++
+ src/compositor.h    |    3 +++
+ src/libinput-seat.c |    6 ++++++
+ src/main.c          |    5 +++++
+ weston.ini.in       |    1 +
+ 5 files changed, 20 insertions(+)
+
+--- a/src/main.c
++++ b/src/main.c
+@@ -1298,6 +1298,7 @@ int main(int argc, char *argv[])
+ 	struct wl_client *primary_client;
+ 	struct wl_listener primary_client_destroyed;
+ 	struct weston_seat *seat;
++      int require_input;
+ 
+ 	const struct weston_option core_options[] = {
+ 		{ WESTON_OPTION_STRING, "backend", 'B', &backend },
+@@ -1373,6 +1374,10 @@ int main(int argc, char *argv[])
+ 	if (weston_compositor_init_config(ec, config) < 0)
+ 		goto out;
+ 
++	weston_config_section_get_bool(section, "require-input",
++				       &require_input, true);
++	ec->require_input = require_input;
++
+ 	if (load_backend(ec, backend, &argc, argv, config) < 0) {
+ 		weston_log("fatal: failed to create compositor backend\n");
+ 		goto out;
+--- a/src/compositor.h
++++ b/src/compositor.h
+@@ -803,6 +803,9 @@ struct weston_compositor {
+ 
+ 	void *user_data;
+ 	void (*exit)(struct weston_compositor *c);
++
++	/* Whether to let the compositor run without any input device. */
++	bool require_input;
+ };
+ 
+ struct weston_buffer {
+--- a/src/libinput-seat.c
++++ b/src/libinput-seat.c
+@@ -255,6 +255,12 @@ udev_input_enable(struct udev_input *inp
+ 			devices_found = 1;
+ 	}
+ 
++	if (devices_found == 0 && !c->require_input) {
++		weston_log("warning: no input devices found, but none required "
++			   "as per configuration.\n");
++		return 0;
++	}
++
+ 	if (devices_found == 0) {
+ 		weston_log(
+ 			"warning: no input devices on entering Weston. "
+--- a/man/weston.ini.man
++++ b/man/weston.ini.man
+@@ -169,6 +169,11 @@ time, the one specified in the command-l
+ hand, if none of these sets the value, default idle timeout will be
+ set to 300 seconds.
+ .RS
++.PP
++.RE
++.TP 7
++.BI "require-input=" true
++require an input device for launch
+ 
+ .SH "LIBINPUT SECTION"
+ The
+--- a/weston.ini.in
++++ b/weston.ini.in
+@@ -2,6 +2,7 @@
+ #modules=xwayland.so,cms-colord.so
+ #shell=desktop-shell.so
+ #gbm-format=xrgb2101010
++#require-input=true
+ 
+ [shell]
+ background-image=/usr/share/backgrounds/gnome/Aqua.jpg
diff --git a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
index 00118d7..edd3b91 100644
--- a/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
@@ -13,14 +13,12 @@ breaks multilib weston as it would point to multilib sysroot when the
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [embedded specific]
 ---
- configure.ac | 2 +-
+ configure.ac |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index bc7c329..15a05d3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -187,7 +187,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [libinput >= 0.8.0])
+@@ -187,7 +187,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [lib
  PKG_CHECK_MODULES(COMPOSITOR, [$COMPOSITOR_MODULES])
  
  PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.2],
@@ -29,6 +27,3 @@ index bc7c329..15a05d3 100644
  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, $ac_wayland_protocols_pkgdatadir)
  
  AC_ARG_ENABLE(wayland-compositor, [  --enable-wayland-compositor],,
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
index 148848d..f7b5284 100644
--- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
@@ -10,17 +10,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 Upstream-Status: Submitted
 
- configure.ac        |  2 ++
- src/weston-error.h  | 20 ++++++++++++++++++++
- src/weston-launch.c |  2 +-
+ configure.ac        |    2 ++
+ src/weston-error.h  |   20 ++++++++++++++++++++
+ src/weston-launch.c |    2 +-
  3 files changed, 23 insertions(+), 1 deletion(-)
  create mode 100644 src/weston-error.h
 
-diff --git a/configure.ac b/configure.ac
-index 263fc22..f52cd62 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -57,6 +57,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+@@ -60,6 +60,8 @@ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
  	      [[#include <time.h>]])
  AC_CHECK_HEADERS([execinfo.h])
  
@@ -28,10 +26,7 @@ index 263fc22..f52cd62 100644
 +
  AC_CHECK_FUNCS([mkostemp strchrnul initgroups posix_fallocate])
  
- COMPOSITOR_MODULES="wayland-server >= 1.7.93 pixman-1 >= 0.25.2"
-diff --git a/src/weston-error.h b/src/weston-error.h
-new file mode 100644
-index 0000000..2089d02
+ COMPOSITOR_MODULES="wayland-server >= $WAYLAND_PREREQ_VERSION pixman-1 >= 0.25.2"
 --- /dev/null
 +++ b/src/weston-error.h
 @@ -0,0 +1,20 @@
@@ -55,11 +50,9 @@ index 0000000..2089d02
 +
 +#endif
 +
-diff --git a/src/weston-launch.c b/src/weston-launch.c
-index 10c66de..3e6d30a 100644
 --- a/src/weston-launch.c
 +++ b/src/weston-launch.c
-@@ -30,7 +30,6 @@
+@@ -33,7 +33,6 @@
  #include <poll.h>
  #include <errno.h>
  
@@ -67,7 +60,7 @@ index 10c66de..3e6d30a 100644
  #include <getopt.h>
  
  #include <sys/types.h>
-@@ -56,6 +55,7 @@
+@@ -59,6 +58,7 @@
  #endif
  
  #include "weston-launch.h"
@@ -75,6 +68,3 @@ index 10c66de..3e6d30a 100644
  
  #define DRM_MAJOR 226
  
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch b/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
index 91ef727..ee66c20 100644
--- a/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-shared-include-stdint.h-for-int32_t.patch
@@ -8,11 +8,9 @@ This fixes build on musl.
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Submitted
 ---
- shared/xalloc.h | 1 +
+ shared/xalloc.h |    1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/shared/xalloc.h b/shared/xalloc.h
-index 85fccb4..484de2d 100644
 --- a/shared/xalloc.h
 +++ b/shared/xalloc.h
 @@ -30,6 +30,7 @@
@@ -23,6 +21,3 @@ index 85fccb4..484de2d 100644
  #include <stdlib.h>
  #include <string.h>
  
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index 5542036..d684b1c 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -14,12 +14,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 ---
- configure.ac        |  9 +++++++--
- src/weston-launch.c | 20 ++++++++++++++++++++
+ configure.ac        |    9 +++++++--
+ src/weston-launch.c |   20 ++++++++++++++++++++
  2 files changed, 27 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 32fdde7..240966f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -416,13 +416,17 @@ AC_ARG_ENABLE(resize-optimization,
@@ -50,8 +48,6 @@ index 32fdde7..240966f 100644
  	systemd-login support		${have_systemd_login}
  	systemd notify support		${enable_systemd_notify}
  
-diff --git a/src/weston-launch.c b/src/weston-launch.c
-index b8b2ba0..a865061 100644
 --- a/src/weston-launch.c
 +++ b/src/weston-launch.c
 @@ -51,7 +51,9 @@
@@ -75,7 +71,7 @@ index b8b2ba0..a865061 100644
  	int tty;
  	int ttynr;
  	int sock[2];
-@@ -181,6 +185,7 @@ weston_launch_allowed(struct weston_launch *wl)
+@@ -181,6 +185,7 @@ weston_launch_allowed(struct weston_laun
  	return false;
  }
  
@@ -91,7 +87,7 @@ index b8b2ba0..a865061 100644
  
  static int
  setup_launcher_socket(struct weston_launch *wl)
-@@ -414,6 +420,7 @@ quit(struct weston_launch *wl, int status)
+@@ -414,6 +420,7 @@ quit(struct weston_launch *wl, int statu
  	close(wl->signalfd);
  	close(wl->sock[0]);
  
@@ -99,7 +95,7 @@ index b8b2ba0..a865061 100644
  	if (wl->new_user) {
  		err = pam_close_session(wl->ph, 0);
  		if (err)
-@@ -421,6 +428,7 @@ quit(struct weston_launch *wl, int status)
+@@ -421,6 +428,7 @@ quit(struct weston_launch *wl, int statu
  				err, pam_strerror(wl->ph, err));
  		pam_end(wl->ph, err);
  	}
@@ -157,7 +153,7 @@ index b8b2ba0..a865061 100644
  			break;
  		case 't':
  			tty = optarg;
-@@ -730,8 +748,10 @@ main(int argc, char *argv[])
+@@ -732,8 +750,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
@@ -168,6 +164,3 @@ index b8b2ba0..a865061 100644
  
  	if (setup_launcher_socket(&wl) < 0)
  		exit(EXIT_FAILURE);
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch b/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
deleted file mode 100644
index 0c408a4..0000000
--- a/meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e8b615250f700f7854b423aaaf0a0aeea92c05a9 Mon Sep 17 00:00:00 2001
-From: Tom Hochstein <tom.hochstein@nxp.com>
-Date: Sat, 7 May 2016 08:51:58 -0300
-Subject: [PATCH] weston-launch: Handle invalid command line options
-Organization: O.S. Systems Software LTDA.
-
-Exit the program if an unrecognized command line option is found.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
-
- src/weston-launch.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/weston-launch.c b/src/weston-launch.c
-index b8dfb17..9987d8e 100644
---- a/src/weston-launch.c
-+++ b/src/weston-launch.c
-@@ -703,6 +703,8 @@ main(int argc, char *argv[])
- 		case 'h':
- 			help("weston-launch");
- 			exit(EXIT_FAILURE);
-+		default:
-+			exit(EXIT_FAILURE);
- 		}
- 	}
- 
--- 
-2.8.2
-
diff --git a/meta/recipes-graphics/wayland/weston_1.11.0.bb b/meta/recipes-graphics/wayland/weston_1.11.1.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/weston_1.11.0.bb
rename to meta/recipes-graphics/wayland/weston_1.11.1.bb
index 3ad309d..7e75cf7 100644
--- a/meta/recipes-graphics/wayland/weston_1.11.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.11.1.bb
@@ -12,11 +12,11 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-configure.ac-Fix-wayland-protocols-path.patch \
            file://0001-shared-include-stdint.h-for-int32_t.patch \
            file://xwayland.weston-start \
-           file://make-weston-launch-exit-for-unrecognized-option.patch \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
+           file://0001-Add-configuration-option-for-no-input-device.patch \
 "
-SRC_URI[md5sum] = "bc6f90a2039163804aecfa663b69c4c2"
-SRC_URI[sha256sum] = "05e086e9f186a06843b9f7a5e1abf19347b1a6e4be26d7e74927abc17b6b7125"
+SRC_URI[md5sum] = "c5fdc02ab67d33c0fca8f72d341facdf"
+SRC_URI[sha256sum] = "548973496a5c8613d6690f9120f21066946a544df65ce4fe0ef153a8dc0bf6de"
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
-- 
2.10.1


