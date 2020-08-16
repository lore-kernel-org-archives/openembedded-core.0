Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19869.1597558922752901487
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97232E02036; Sat, 15 Aug 2020 23:22:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23EEDE0206E
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:43 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Denys Dmytriyenko <denys@ti.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 8.0.92 FAILED
Message-Id: <20200816062202.97232E02036@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:02 -0700 (PDT)
X-Groupsio-MsgNum: 141507
Content-Type: multipart/mixed; boundary="===============4083914174762504278=="

--===============4083914174762504278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *8.0.92* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-weston-upgrade-8.0.0-8.0.92.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4083914174762504278==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-weston-upgrade-8.0.0-8.0.92.patch"

From 0480a45c40631dbb0f2279df804a3300ce783ae9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 01:53:47 +0000
Subject: [PATCH] weston: upgrade 8.0.0 -> 8.0.92

---
 ...ovide-a-default-version-that-doesn-t.patch | 34 +++++++++----------
 .../{weston_8.0.0.bb => weston_8.0.92.bb}     |  3 +-
 2 files changed, 18 insertions(+), 19 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_8.0.0.bb => weston_8.0.92.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index 62b864c134..eb7b1c74d8 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -1,4 +1,4 @@
-From 5f2d71998eb77068cbaee2d468cbb296a42d5739 Mon Sep 17 00:00:00 2001
+From 9a7f54f946b745da1607c0c360120f33991ea435 Mon Sep 17 00:00:00 2001
 From: Tom Hochstein <tom.hochstein@nxp.com>
 Date: Wed, 22 Feb 2017 15:53:30 +0200
 Subject: [PATCH] weston-launch: Provide a default version that doesn't require
@@ -57,7 +57,7 @@ index 08d23ec..cb9fd3f 100644
  		install: true
  	)
 diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
-index 8a711b4..54c567a 100644
+index 521cb2c..2d42d33 100644
 --- a/libweston/weston-launch.c
 +++ b/libweston/weston-launch.c
 @@ -51,7 +51,9 @@
@@ -97,7 +97,7 @@ index 8a711b4..54c567a 100644
  
  static int
  setup_launcher_socket(struct weston_launch *wl)
-@@ -431,6 +437,7 @@ quit(struct weston_launch *wl, int status)
+@@ -466,6 +472,7 @@ quit(struct weston_launch *wl, int status)
  	close(wl->signalfd);
  	close(wl->sock[0]);
  
@@ -105,15 +105,15 @@ index 8a711b4..54c567a 100644
  	if (wl->new_user) {
  		err = pam_close_session(wl->ph, 0);
  		if (err)
-@@ -438,6 +445,7 @@ quit(struct weston_launch *wl, int status)
+@@ -473,6 +480,7 @@ quit(struct weston_launch *wl, int status)
  				err, pam_strerror(wl->ph, err));
  		pam_end(wl->ph, err);
  	}
 +#endif
  
- 	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
- 	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
-@@ -666,6 +674,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+ 	/*
+ 	 * Get a fresh handle to the tty as the previous one is in
+@@ -710,6 +718,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  	setenv("HOME", wl->pw->pw_dir, 1);
  	setenv("SHELL", wl->pw->pw_shell, 1);
  
@@ -121,7 +121,7 @@ index 8a711b4..54c567a 100644
  	env = pam_getenvlist(wl->ph);
  	if (env) {
  		for (i = 0; env[i]; ++i) {
-@@ -674,6 +683,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -718,6 +727,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  		}
  		free(env);
  	}
@@ -129,7 +129,7 @@ index 8a711b4..54c567a 100644
  
  	/*
  	 * We open a new session, so it makes sense
-@@ -745,8 +755,10 @@ static void
+@@ -789,8 +799,10 @@ static void
  help(const char *name)
  {
  	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
@@ -140,7 +140,7 @@ index 8a711b4..54c567a 100644
  	fprintf(stderr, "  -t, --tty       Start session on alternative tty,\n"
  			"                  e.g. -t /dev/tty4, requires -u option.\n");
  	fprintf(stderr, "  -v, --verbose   Be verbose\n");
-@@ -760,7 +772,9 @@ main(int argc, char *argv[])
+@@ -804,7 +816,9 @@ main(int argc, char *argv[])
  	int i, c;
  	char *tty = NULL;
  	struct option opts[] = {
@@ -150,7 +150,7 @@ index 8a711b4..54c567a 100644
  		{ "tty",     required_argument, NULL, 't' },
  		{ "verbose", no_argument,       NULL, 'v' },
  		{ "help",    no_argument,       NULL, 'h' },
-@@ -772,11 +786,16 @@ main(int argc, char *argv[])
+@@ -816,11 +830,16 @@ main(int argc, char *argv[])
  	while ((c = getopt_long(argc, argv, "u:t:vh", opts, &i)) != -1) {
  		switch (c) {
  		case 'u':
@@ -167,7 +167,7 @@ index 8a711b4..54c567a 100644
  			break;
  		case 't':
  			tty = optarg;
-@@ -828,8 +847,10 @@ main(int argc, char *argv[])
+@@ -872,8 +891,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
@@ -179,20 +179,20 @@ index 8a711b4..54c567a 100644
  	if (setup_launcher_socket(&wl) < 0)
  		exit(EXIT_FAILURE);
 diff --git a/meson_options.txt b/meson_options.txt
-index c862ecc..73ef2c3 100644
+index 239bd2d..99e4ec3 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -73,6 +73,13 @@ option(
+@@ -72,6 +72,13 @@ option(
+ 	description: 'Weston launcher for systems without logind'
  )
  
- option(
++option(
 +	'pam',
 +	type: 'boolean',
 +	value: true,
 +	description: 'Define if PAM is available'
 +)
 +
-+option(
+ option(
  	'xwayland',
  	type: 'boolean',
- 	value: true,
diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.92.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_8.0.0.bb
rename to meta/recipes-graphics/wayland/weston_8.0.92.bb
index f8e9e15f84..a25d6e2227 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.92.bb
@@ -11,8 +11,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "53e4810d852df0601d01fd986a5b22b3"
-SRC_URI[sha256sum] = "7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51161927afa4329c027848"
+SRC_URI[sha256sum] = "c9df76c04ff7d0ba804313d82d9915ad32fad9cc5459f8e6afcc7511ef5f001d"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.17.1


--===============4083914174762504278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1342 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (777 cached, 1 parsed). 1342 targets, 33 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200816"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:805d8c098a57cf5fd4d098dac6356e7178afae0b"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 218 Found 210 Missed 8 Current 725 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2057 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_fetch)
NOTE: recipe weston-8.0.92-r0: task do_fetch: Started
NOTE: Running task 2319 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_write_config)
NOTE: recipe weston-8.0.92-r0: task do_fetch: Succeeded
NOTE: Running task 2347 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_unpack)
NOTE: Running task 2348 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-8.0.92-r0: task do_write_config: Started
NOTE: recipe weston-8.0.92-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-8.0.92-r0: task do_write_config: Succeeded
NOTE: recipe weston-8.0.92-r0: task do_unpack: Started
NOTE: recipe weston-8.0.92-r0: task do_unpack: Succeeded
NOTE: Running task 2872 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_patch)
NOTE: recipe weston-8.0.92-r0: task do_patch: Started
NOTE: recipe weston-8.0.92-r0: task do_patch: Succeeded
NOTE: Running task 2873 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_deploy_source_date_epoch)
NOTE: Running task 2874 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_populate_lic)
NOTE: recipe weston-8.0.92-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-8.0.92-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-8.0.92-r0: task do_populate_lic: Started
NOTE: recipe weston-8.0.92-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2875 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_configure)
NOTE: recipe weston-8.0.92-r0: task do_populate_lic: Succeeded
NOTE: recipe weston-8.0.92-r0: task do_configure: Started
NOTE: recipe weston-8.0.92-r0: task do_configure: Succeeded
NOTE: Running task 2876 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_compile)
NOTE: recipe weston-8.0.92-r0: task do_compile: Started
NOTE: recipe weston-8.0.92-r0: task do_compile: Succeeded
NOTE: Running task 2877 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_install)
NOTE: recipe weston-8.0.92-r0: task do_install: Started
NOTE: recipe weston-8.0.92-r0: task do_install: Succeeded
NOTE: Running task 2878 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_package)
NOTE: Running task 2879 of 2884 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_populate_sysroot)
NOTE: recipe weston-8.0.92-r0: task do_package: Started
NOTE: recipe weston-8.0.92-r0: task do_populate_sysroot: Started
NOTE: recipe weston-8.0.92-r0: task do_populate_sysroot: Succeeded
ERROR: weston-8.0.92-r0 do_package: QA Issue: weston: Files/directories were installed but not shipped in any package:
  /usr/lib/libweston-9/fbdev-backend.so
  /usr/lib/libweston-9/wayland-backend.so
  /usr/lib/libweston-9/xwayland.so
  /usr/lib/libweston-9/gl-renderer.so
  /usr/lib/libweston-9/drm-backend.so
  /usr/lib/libweston-9/x11-backend.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
weston: 6 installed and not shipped files. [installed-vs-shipped]
ERROR: weston-8.0.92-r0 do_package: Fatal QA errors found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/weston/8.0.92-r0/temp/log.do_package.14304
NOTE: recipe weston-8.0.92-r0: task do_package: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2879 tasks of which 2867 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_8.0.92.bb:do_package
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============4083914174762504278==--
