Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5947F5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 01:15:15 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id s49so24078501edb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 18:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6a7FxBbk40vRM/Gn96h0jpDHNh3Wda5gb+LOhDJs/wc=;
	b=aQs4PuPnB4EgJW6l313ZserOGJhIUf/l8vGpqlKOjDTRt7Xq9wK96iYlias3NAzgeY
	d95+1vrGOzozkRp0VrPpG4dol9VBh0sdOLuHpwC1SzD5Tkb/CY6azYSenWSsg2d8IKuF
	B4anUOIh3cYSg8ok33t/9d6bSWsqibDY8f+E3z+I+xl2LDuUWmCq9J1n3Ae+58yZ58Dz
	ZVL6GDrqRC6bdWXLZ2KCNFpOjnW28BarN9r92UPWzjg8VDjwwA3e2mCJftmiKxhVnDG6
	x+nB1RcCLVdWEbyftYjwmkkrOQkPkdTTFzPPAQ2iOKTXblKayVUCukbNuAiubD8TckXb
	9GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6a7FxBbk40vRM/Gn96h0jpDHNh3Wda5gb+LOhDJs/wc=;
	b=pHHOFKCOSAIjxFrf5MLDKgfgDMk3WiSAPcWPgtlpGPyZN9aWPkBW2E7hxacf2puEmX
	l0+2aW26EPbKWJbMdeEYpZ4yJBLAnLeqsQSeF93JudU79evsnKOr8O6mzTAr5azlnQbp
	ACSa7SJcodZ2IAlbkY7+nlc8x7Bwbtn7vJaJE+BmTxpJ78kxwQdZn9jFtQ3zmUUp4CWq
	dpwHVHPKl6WhR+05YOjsYssetwt1R1s54vaYlmJmcIzL0L5zdvWPBpJlu4ej+00HKZ+e
	gn5/QbS8asdo52avp1IPCbmbZGUxIHP2AZW9azfoW2GWEoVGn4G+TMJ0jpQPFBALmo6H
	0xQw==
X-Gm-Message-State: APjAAAVL7sCABLFUGq/192wT2JQqF+aBV0DsXuDsbeFtNISdeEnyqyET
	cWb/ovJB7RV1foaT/3Z0Z2LXFwiPkWk=
X-Google-Smtp-Source: APXvYqySeK+Lfs5MtXTjx2Lap3QKYe3R3+vibjWwBQRqBWig4HdLPf9sN1fFESAqYnAiV4LsOEtfJA==
X-Received: by 2002:a17:906:191b:: with SMTP id
	a27mr14600019eje.84.1566782115857; 
	Sun, 25 Aug 2019 18:15:15 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.201.72])
	by smtp.gmail.com with ESMTPSA id
	v15sm2624034ejh.15.2019.08.25.18.15.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Aug 2019 18:15:15 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2019 09:14:04 +0800
Message-Id: <1566782044-23998-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] weston: uprev to 7.0.0
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
X-List-Received-Date: Mon, 26 Aug 2019 01:15:15 -0000

From: Ming Liu <liu.ming50@gmail.com>

- Adjust patches to comply with weston-7.0.0.
- Also drop the obsolete patch 0001-make-error-portable.patch.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../wayland/weston/0001-make-error-portable.patch  | 80 ----------------------
 ...ch-Provide-a-default-version-that-doesn-t.patch | 38 +++++-----
 .../wayland/{weston_6.0.1.bb => weston_7.0.0.bb}   |  7 +-
 3 files changed, 23 insertions(+), 102 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
 rename meta/recipes-graphics/wayland/{weston_6.0.1.bb => weston_7.0.0.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch b/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
deleted file mode 100644
index acea9db..0000000
--- a/meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From c4677e155736062e75687f1a655732c8902e912b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 May 2015 20:56:00 -0700
-Subject: [PATCH] make error() portable
-
-error() is not posix but gnu extension so may not be available on all
-kind of systemsi e.g. musl.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Ming Liu <ming.liu@toradex.com>
----
- libweston/weston-error.h  | 20 ++++++++++++++++++++
- libweston/weston-launch.c |  2 +-
- meson.build               |  1 +
- 3 files changed, 22 insertions(+), 1 deletion(-)
- create mode 100644 libweston/weston-error.h
-
-diff --git a/libweston/weston-error.h b/libweston/weston-error.h
-new file mode 100644
-index 0000000..2089d02
---- /dev/null
-+++ b/libweston/weston-error.h
-@@ -0,0 +1,20 @@
-+#ifndef _WESTON_ERROR_H
-+#define _WESTON_ERROR_H
-+
-+#if defined(HAVE_ERROR_H)
-+#include <error.h>
-+#else
-+#include <err.h>
-+#include <string.h>
-+#define _weston_error(S, E, F, ...) do { \
-+	if (E) \
-+		err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
-+	else \
-+		err(S, F, ##__VA_ARGS__); \
-+} while(0)
-+
-+#define error _weston_error
-+#endif
-+
-+#endif
-+
-diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
-index bf73e0d..9064439 100644
---- a/libweston/weston-launch.c
-+++ b/libweston/weston-launch.c
-@@ -33,7 +33,6 @@
- #include <poll.h>
- #include <errno.h>
- 
--#include <error.h>
- #include <getopt.h>
- 
- #include <sys/types.h>
-@@ -59,6 +58,7 @@
- #endif
- 
- #include "weston-launch.h"
-+#include "weston-error.h"
- 
- #define DRM_MAJOR 226
- 
-diff --git a/meson.build b/meson.build
-index 2155b7b..baa52d9 100644
---- a/meson.build
-+++ b/meson.build
-@@ -94,6 +94,7 @@ foreach func : optional_libc_funcs
- endforeach
- 
- optional_system_headers = [
-+	'error.h',
- 	'linux/sync_file.h'
- ]
- foreach hdr : optional_system_headers
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index 81cc025..3d3bc9b 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -23,11 +23,11 @@ Signed-off-by: Ming Liu <ming.liu@toradex.com>
  3 files changed, 39 insertions(+), 4 deletions(-)
 
 diff --git a/libweston/meson.build b/libweston/meson.build
-index 33ab970..32f495a 100644
+index d8d3fc0..326683f 100644
 --- a/libweston/meson.build
 +++ b/libweston/meson.build
-@@ -472,16 +472,24 @@ if get_option('renderer-gl')
- endif
+@@ -199,16 +199,24 @@ dep_vertex_clipping = declare_dependency(
+ )
  
  if get_option('weston-launch')
 -	dep_pam = cc.find_library('pam')
@@ -56,7 +56,7 @@ index 33ab970..32f495a 100644
  		install: true
  	)
 diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
-index 9064439..c6abe92 100644
+index 4962bd6..03b6518 100644
 --- a/libweston/weston-launch.c
 +++ b/libweston/weston-launch.c
 @@ -51,7 +51,9 @@
@@ -69,7 +69,7 @@ index 9064439..c6abe92 100644
  
  #ifdef HAVE_SYSTEMD_LOGIN
  #include <systemd/sd-login.h>
-@@ -101,8 +103,10 @@ drmSetMaster(int drm_fd)
+@@ -100,8 +102,10 @@ drmSetMaster(int drm_fd)
  #endif
  
  struct weston_launch {
@@ -80,7 +80,7 @@ index 9064439..c6abe92 100644
  	int tty;
  	int ttynr;
  	int sock[2];
-@@ -191,6 +195,7 @@ weston_launch_allowed(struct weston_launch *wl)
+@@ -192,6 +196,7 @@ weston_launch_allowed(struct weston_launch *wl)
  	return false;
  }
  
@@ -88,7 +88,7 @@ index 9064439..c6abe92 100644
  static int
  pam_conversation_fn(int msg_count,
  		    const struct pam_message **messages,
-@@ -231,6 +236,7 @@ setup_pam(struct weston_launch *wl)
+@@ -232,6 +237,7 @@ setup_pam(struct weston_launch *wl)
  
  	return 0;
  }
@@ -96,7 +96,7 @@ index 9064439..c6abe92 100644
  
  static int
  setup_launcher_socket(struct weston_launch *wl)
-@@ -424,6 +430,7 @@ quit(struct weston_launch *wl, int status)
+@@ -431,6 +437,7 @@ quit(struct weston_launch *wl, int status)
  	close(wl->signalfd);
  	close(wl->sock[0]);
  
@@ -104,7 +104,7 @@ index 9064439..c6abe92 100644
  	if (wl->new_user) {
  		err = pam_close_session(wl->ph, 0);
  		if (err)
-@@ -431,6 +438,7 @@ quit(struct weston_launch *wl, int status)
+@@ -438,6 +445,7 @@ quit(struct weston_launch *wl, int status)
  				err, pam_strerror(wl->ph, err));
  		pam_end(wl->ph, err);
  	}
@@ -112,7 +112,7 @@ index 9064439..c6abe92 100644
  
  	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
  	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
-@@ -610,6 +618,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -660,6 +668,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  	setenv("HOME", wl->pw->pw_dir, 1);
  	setenv("SHELL", wl->pw->pw_shell, 1);
  
@@ -120,7 +120,7 @@ index 9064439..c6abe92 100644
  	env = pam_getenvlist(wl->ph);
  	if (env) {
  		for (i = 0; env[i]; ++i) {
-@@ -618,6 +627,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -668,6 +677,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  		}
  		free(env);
  	}
@@ -128,7 +128,7 @@ index 9064439..c6abe92 100644
  
  	/*
  	 * We open a new session, so it makes sense
-@@ -685,8 +695,10 @@ static void
+@@ -739,8 +749,10 @@ static void
  help(const char *name)
  {
  	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
@@ -139,7 +139,7 @@ index 9064439..c6abe92 100644
  	fprintf(stderr, "  -t, --tty       Start session on alternative tty,\n"
  			"                  e.g. -t /dev/tty4, requires -u option.\n");
  	fprintf(stderr, "  -v, --verbose   Be verbose\n");
-@@ -700,7 +712,9 @@ main(int argc, char *argv[])
+@@ -754,7 +766,9 @@ main(int argc, char *argv[])
  	int i, c;
  	char *tty = NULL;
  	struct option opts[] = {
@@ -149,21 +149,23 @@ index 9064439..c6abe92 100644
  		{ "tty",     required_argument, NULL, 't' },
  		{ "verbose", no_argument,       NULL, 'v' },
  		{ "help",    no_argument,       NULL, 'h' },
-@@ -712,9 +726,13 @@ main(int argc, char *argv[])
+@@ -766,11 +780,15 @@ main(int argc, char *argv[])
  	while ((c = getopt_long(argc, argv, "u:t:vh", opts, &i)) != -1) {
  		switch (c) {
  		case 'u':
 +#ifdef HAVE_PAM
  			wl.new_user = optarg;
- 			if (getuid() != 0)
- 				error(1, 0, "Permission denied. -u allowed for root only");
+ 			if (getuid() != 0) {
+ 				fprintf(stderr, "weston: Permission denied. -u allowed for root only\n");
+ 				exit(EXIT_FAILURE);
+ 			}
 +#else
 +			error(1, 0, "-u is unsupported in this weston-launch build");
 +#endif
  			break;
  		case 't':
  			tty = optarg;
-@@ -755,8 +773,10 @@ main(int argc, char *argv[])
+@@ -822,8 +840,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
@@ -175,7 +177,7 @@ index 9064439..c6abe92 100644
  	if (setup_launcher_socket(&wl) < 0)
  		exit(EXIT_FAILURE);
 diff --git a/meson_options.txt b/meson_options.txt
-index 0e1d183..9a5c3d5 100644
+index d5bf1d5..254eb2b 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -73,6 +73,13 @@ option(
diff --git a/meta/recipes-graphics/wayland/weston_6.0.1.bb b/meta/recipes-graphics/wayland/weston_7.0.0.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/weston_6.0.1.bb
rename to meta/recipes-graphics/wayland/weston_7.0.0.bb
index fe8f1b8..5d2a933 100644
--- a/meta/recipes-graphics/wayland/weston_6.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
@@ -9,11 +9,10 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
-           file://0001-make-error-portable.patch \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "e7b10710ef1eac82258f97bfd41fe534"
-SRC_URI[sha256sum] = "bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a513155b4"
+SRC_URI[md5sum] = "cbfda483bc2501d0831af3f33c707850"
+SRC_URI[sha256sum] = "a00a6d207b6a45f95f4401c604772a307c3767e5e2beecf3d879110c43909a64"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
@@ -26,7 +25,7 @@ DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 
-EXTRA_OEMESON += "-Dbackend-default=auto -Dbackend-rdp=false"
+EXTRA_OEMESON += "-Dbackend-default=auto -Dbackend-rdp=false -Dpipewire=false"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
-- 
2.7.4


