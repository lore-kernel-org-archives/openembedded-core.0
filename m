Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CAEC83039
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8859.1749993278910107075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2mwcZNDq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qmskbfS/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019773baa126-1df91b31-60b3-4255-a892-273f73464726-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xF54yMt5GF7bMY7n1+RT2hWkxgGZj7y8ifc0dMGn8yQ=;
	b=2mwcZNDqniZv6doElPIelUnTODGwwvtN4o/sKkeFZX1UPE9v7QYp1IQQPAPt0hno
	SM2JeakcxI4G2gRIvO1/Yiuow7P2k8DpnWCACrA9Dt0PaEH7W9BuIQmC/sRzVswbwOB
	nR+VwXrMxkq5AQAzBGqzug28HWcORYyHukVEdPqo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xF54yMt5GF7bMY7n1+RT2hWkxgGZj7y8ifc0dMGn8yQ=;
	b=qmskbfS/vN2yqsreegScbjxFVvqu89VsefWYGIfwEfGct6IjII0sSe5HrcZN83Lh
	yWEYxe58ltFuC6ehfw6fJfBnMPx53Au2/PrFxAJsb/+8+HBFpM3eLx8QMg87xEdQ6KK
	Q19hPf6Ra2druB1xqPJ/HqnvTDJfNtqC65ihhO44=
Content-Type: multipart/mixed; boundary="===============1172718466198839308=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] virglrenderer: upgrading to 1.1.1 FAILED
Message-ID: <0101019773baa126-1df91b31-60b3-4255-a892-273f73464726-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218726

--===============1172718466198839308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *virglrenderer* to *1.1.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-1.1.0-1.1.1.patch
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

-- >8 --
From ddd478c4a9fa08934dd88957437df4729047e3bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 11:46:08 +0000
Subject: [PATCH] virglrenderer: upgrade 1.1.0 -> 1.1.1

---
 ...uild-use-python3-directly-for-python.patch |  4 +-
 ...nversion-fatal-build-error-with-GCC-.patch | 37 -------------------
 ...nderer_1.1.0.bb => virglrenderer_1.1.1.bb} |  3 +-
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.1.0.bb => virglrenderer_1.1.1.bb} (90%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index f9080d53c5..03a61a3535 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 9677f66a240a0513623aa26b47233b49193d0402 Mon Sep 17 00:00:00 2001
+From 93e25e4995503183f37f17631bad660691cfce7f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 10be099e..3bb6eec7 100644
+index cd1953c3..7af920b1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -77,7 +77,7 @@ flags = [
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
deleted file mode 100644
index 67dc4989b5..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From bb129aac12c5aa6e2dd371244b042baa82aff014 Mon Sep 17 00:00:00 2001
-From: Purushottam Choudhary <purushottam27.kumar@lge.com>
-Date: Tue, 8 Oct 2024 11:47:21 +0530
-Subject: [PATCH] vrend: Fix int-conversion fatal build error with GCC-14
-
-Getting below error int conversion during compilation as one the
-platforms where EGLNativeDisplayType is an int instead of a pointer.
-
-| ../git/src/vrend_winsys_egl.c: In function 'virgl_egl_init':
-| ../git/src/vrend_winsys_egl.c:364:62: error: passing argument 2 of 'egl->funcs.epoxy_eglGetPlatformDisplay' makes pointer from
-|   364 |                                                              (EGLNativeDisplayType)egl->gbm->device, NULL);
-|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-|       |                                                              |
-|       |                                                              int
-| ../git/src/vrend_winsys_egl.c:364:62: note: expected 'void *' but argument is of type 'int'
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/464deabe4d1bfce6b8f414ab0945d9a62b66ddd4]
-
-Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
-Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1440>
----
- src/vrend_winsys_egl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/vrend_winsys_egl.c b/src/vrend_winsys_egl.c
-index 9d9f410c..8750f6b2 100644
---- a/src/vrend_winsys_egl.c
-+++ b/src/vrend_winsys_egl.c
-@@ -361,7 +361,7 @@ struct virgl_egl *virgl_egl_init(EGLNativeDisplayType display_id, bool surfacele
- #ifdef ENABLE_GBM
-       else
-          egl->egl_display = egl->funcs.eglGetPlatformDisplay(EGL_PLATFORM_GBM_KHR,
--                                                             (EGLNativeDisplayType)egl->gbm->device, NULL);
-+                                                             (EGLNativeDisplayType*)egl->gbm->device, NULL);
- #endif
-    } else {
- #ifdef ENABLE_GBM
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
similarity index 90%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
index 07abde1c4f..d959de2ee3 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "1aeaf5e10a9c89096e96d09599aa419d5c50712f"
+SRCREV = "0f1f43929724a6a414c01a29bc51feccb445c2f0"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-           file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.47.1


--===============1172718466198839308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1912 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (934 cached, 1 parsed). 1910 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a49f3e8bd66af12a6fd930f29ac4d7f1a97f583f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 374 Local 362 Mirrors 0 Missed 12 Current 584 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2436 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_recipe_qa)
NOTE: Running task 2525 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_write_config)
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_recipe_qa unihash changed to 8eefb46a9620700bea12c70dfa609bce16c21d07fffb09524cb23dcce173e517
NOTE: Setscene tasks completed
NOTE: Running task 2670 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_fetch)
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 2671 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_unpack)
NOTE: Running task 2672 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2673 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_patch)
NOTE: Running task 2674 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2675 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2676 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_populate_lic)
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_populate_lic unihash changed to 7aa6713a2479eaa6f9ba85992732603ec3f0107410c133c4b3d60d3cc250ae97
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch unihash changed to 97518580e8f6b3a57889654ebf68a4754df721580af3ca3b353820263bde93e0
NOTE: Setscene tasks completed
NOTE: Running task 2677 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_configure)
NOTE: recipe virglrenderer-1.1.1-r0: task do_configure: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2678 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_compile)
NOTE: recipe virglrenderer-1.1.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| [1/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffil
 e-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_bitscan.c.o -MF src/mesa/libmesa.a.p/util_bitscan.c.o.d -o src/mesa/libmesa.a.p/util_bitscan.c.o -c ../git/src/mesa/util/bitscan.c
| [2/94] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/python3-native/python3 ../git/src/venus/vkr_device_object.py -o src ../git/src/venus/vkr_device_object.json
| [3/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffil
 e-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_anon_file.c.o -MF src/mesa/libmesa.a.p/util_anon_file.c.o.d -o src/mesa/libmesa.a.p/util_anon_file.c.o -c ../git/src/mesa/util/anon_file.c
| [4/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffil
 e-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_os_misc.c.o -MF src/mesa/libmesa.a.p/util_os_misc.c.o.d -o src/mesa/libmesa.a.p/util_os_misc.c.o -c ../git/src/mesa/util/os_misc.c
| [5/94] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/meson.real --internal exe --capture src/gallium/u_format_table.c -- /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/python3-native/python3 -B ../git/src/gallium/auxiliary/util/u_format_table.py ../git/src/gallium/auxiliary/util/u_format.yaml
| FAILED: src/gallium/u_format_table.c
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/meson.real --internal exe --capture src/gallium/u_format_table.c -- /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/python3-native/python3 -B ../git/src/gallium/auxiliary/util/u_format_table.py ../git/src/gallium/auxiliary/util/u_format.yaml
| --- stderr ---
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/../git/src/gallium/auxiliary/util/u_format_table.py", line 36, in <module>
|     from u_format_parse import *
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git/src/gallium/auxiliary/util/u_format_parse.py", line 33, in <module>
|     import yaml
| ModuleNotFoundError: No module named 'yaml'
| 
| [6/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden
  -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_texture.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_texture.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_texture.c.o -c ../git/src/gallium/auxiliary/util/u_texture.c
| [7/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffil
 e-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_os_file.c.o -MF src/mesa/libmesa.a.p/util_os_file.c.o.d -o src/mesa/libmesa.a.p/util_os_file.c.o -c ../git/src/mesa/util/os_file.c
| [8/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden
  -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_hash_table.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_hash_table.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_hash_table.c.o -c ../git/src/gallium/auxiliary/util/u_hash_table.c
| [9/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden
  -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_debug_describe.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_debug_describe.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_debug_describe.c.o -c ../git/src/gallium/auxiliary/util/u_debu
 g_describe.c
| [10/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_debug.c.o -MF src/mesa/libmesa.a.p/util_u_debug.c.o.d -o src/mesa/libmesa.a.p/util_u_debug.c.o -c ../git/src/mesa/util/u_debug.c
| [11/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_cache.c.o -MF src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_cache.c.o.d -o src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_cache.c.o -c ../git/src/gallium/auxiliary/cso_cache/cso_ca
 che.c
| [12/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_math.c.o -MF src/mesa/libmesa.a.p/util_u_math.c.o.d -o src/mesa/libmesa.a.p/util_u_math.c.o -c ../git/src/mesa/util/u_math.c
| [13/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_format.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_format.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_format.c.o -c ../git/src/gallium/auxiliary/util/u_format.c
| [14/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_hash.c.o -MF src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_hash.c.o.d -o src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_hash.c.o -c ../git/src/gallium/auxiliary/cso_cache/cso_hash.
 c
| [15/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_cpu_detect.c.o -MF src/mesa/libmesa.a.p/util_u_cpu_detect.c.o.d -o src/mesa/libmesa.a.p/util_u_cpu_detect.c.o -c ../git/src/mesa/util/u_cpu_detect.c
| [16/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_ralloc.c.o -MF src/mesa/libmesa.a.p/util_ralloc.c.o.d -o src/mesa/libmesa.a.p/util_ralloc.c.o -c ../git/src/mesa/util/ralloc.c
| [17/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_build.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_build.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_build.c.o -c ../git/src/gallium/auxiliary/tgsi/tgsi_build.c
| [18/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_scan.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_scan.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_scan.c.o -c ../git/src/gallium/auxiliary/tgsi/tgsi_scan.c
| [19/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_dump.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_dump.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_dump.c.o -c ../git/src/gallium/auxiliary/tgsi/tgsi_dump.c
| [20/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_hash_table.c.o -MF src/mesa/libmesa.a.p/util_hash_table.c.o.d -o src/mesa/libmesa.a.p/util_hash_table.c.o -c ../git/src/mesa/util/hash_table.c
| ninja: build stopped: subcommand failed.
| INFO: autodetecting backend as ninja
| INFO: calculating backend command to run: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/ninja -j 16 -l 75.0 -v
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.1972928:153 exit 1 from 'meson compile -v -j 16 -l 75'
| WARNING: Backtrace (BB generated script):
| 	#1: meson_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.1972928, line 153
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.1972928, line 148
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.1972928, line 157
NOTE: recipe virglrenderer-1.1.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2678 tasks of which 2667 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615114550.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615114550.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/log.do_compile.1972928
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: virglrenderer-1.1.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.1972928' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/log.do_compile.1972928
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_compile) failed with exit code '1'

--===============1172718466198839308==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.1.0-1.1.1.patch"

RnJvbSBkZGQ0NzhjNGE5ZmEwODkzNGRkODg5NTc0MzdkZjQ3MjkwNDdlM2JiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTE6NDY6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
aXJnbHJlbmRlcmVyOiB1cGdyYWRlIDEuMS4wIC0+IDEuMS4xCgotLS0KIC4uLnVpbGQtdXNlLXB5
dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCB8ICA0ICstCiAuLi5udmVyc2lvbi1mYXRh
bC1idWlsZC1lcnJvci13aXRoLUdDQy0ucGF0Y2ggfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5uZGVyZXJfMS4xLjAuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjEuMS5iYn0gfCAgMyArLQogMyBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXIvMDAwMS12cmVuZC1GaXgtaW50LWNvbnZlcnNpb24tZmF0YWwtYnVpbGQtZXJyb3Itd2l0aC1H
Q0MtLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIve3Zp
cmdscmVuZGVyZXJfMS4xLjAuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjEuMS5iYn0gKDkwJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRl
cmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAw
MS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCmluZGV4
IGY5MDgwZDUzYzUuLjAzYTYxYTM1MzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9u
My1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92
aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1k
aXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5Njc3ZjY2YTI0
MGEwNTEzNjIzYWEyNmI0NzIzM2I0OTE5M2QwNDAyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA5M2UyNWU0OTk1NTAzMTgzZjM3ZjE3NjMxYmFkNjYwNjkxY2ZjZTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiBEYXRlOiBNb24sIDYgSmFuIDIwMjAgMTI6NDQ6NDIgKzAxMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gbWVzb24uYnVpbGQ6IHVzZSAncHl0aG9uMycgZGlyZWN0bHkgZm9yIHB5dGhvbgpAQCAt
MTMsNyArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDEw
YmUwOTllLi4zYmI2ZWVjNyAxMDA2NDQKK2luZGV4IGNkMTk1M2MzLi43YWY5MjBiMSAxMDA2NDQK
IC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTc3LDcgKzc3LDcgQEAg
ZmxhZ3MgPSBbCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJl
ci92aXJnbHJlbmRlcmVyLzAwMDEtdnJlbmQtRml4LWludC1jb252ZXJzaW9uLWZhdGFsLWJ1aWxk
LWVycm9yLXdpdGgtR0NDLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRl
cmVyL3ZpcmdscmVuZGVyZXIvMDAwMS12cmVuZC1GaXgtaW50LWNvbnZlcnNpb24tZmF0YWwtYnVp
bGQtZXJyb3Itd2l0aC1HQ0MtLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2
N2RjNDk4OWI1Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJl
bmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS12cmVuZC1GaXgtaW50LWNvbnZlcnNpb24tZmF0YWwt
YnVpbGQtZXJyb3Itd2l0aC1HQ0MtLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzcgKzAsMCBA
QAotRnJvbSBiYjEyOWFhYzEyYzVhYTZlMmRkMzcxMjQ0YjA0MmJhYTgyYWZmMDE0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUHVydXNob3R0YW0gQ2hvdWRoYXJ5IDxwdXJ1c2hvdHRh
bTI3Lmt1bWFyQGxnZS5jb20+Ci1EYXRlOiBUdWUsIDggT2N0IDIwMjQgMTE6NDc6MjEgKzA1MzAK
LVN1YmplY3Q6IFtQQVRDSF0gdnJlbmQ6IEZpeCBpbnQtY29udmVyc2lvbiBmYXRhbCBidWlsZCBl
cnJvciB3aXRoIEdDQy0xNAotCi1HZXR0aW5nIGJlbG93IGVycm9yIGludCBjb252ZXJzaW9uIGR1
cmluZyBjb21waWxhdGlvbiBhcyBvbmUgdGhlCi1wbGF0Zm9ybXMgd2hlcmUgRUdMTmF0aXZlRGlz
cGxheVR5cGUgaXMgYW4gaW50IGluc3RlYWQgb2YgYSBwb2ludGVyLgotCi18IC4uL2dpdC9zcmMv
dnJlbmRfd2luc3lzX2VnbC5jOiBJbiBmdW5jdGlvbiAndmlyZ2xfZWdsX2luaXQnOgotfCAuLi9n
aXQvc3JjL3ZyZW5kX3dpbnN5c19lZ2wuYzozNjQ6NjI6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50
IDIgb2YgJ2VnbC0+ZnVuY3MuZXBveHlfZWdsR2V0UGxhdGZvcm1EaXNwbGF5JyBtYWtlcyBwb2lu
dGVyIGZyb20KLXwgICAzNjQgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKEVHTE5hdGl2ZURpc3BsYXlUeXBlKWVnbC0+Z2JtLT5k
ZXZpY2UsIE5VTEwpOwotfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgotfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8Ci18ICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludAotfCAuLi9naXQv
c3JjL3ZyZW5kX3dpbnN5c19lZ2wuYzozNjQ6NjI6IG5vdGU6IGV4cGVjdGVkICd2b2lkIConIGJ1
dCBhcmd1bWVudCBpcyBvZiB0eXBlICdpbnQnCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQg
W2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aXJnbC92aXJnbHJlbmRlcmVyLy0vY29t
bWl0LzQ2NGRlYWJlNGQxYmZjZTZiOGY0MTRhYjA5NDVkOWE2MmI2NmRkZDRdCi0KLVNpZ25lZC1v
ZmYtYnk6IFB1cnVzaG90dGFtIENob3VkaGFyeSA8cHVydXNob3R0YW0yNy5rdW1hckBsZ2UuY29t
PgotUGFydC1vZjogPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aXJnbC92aXJnbHJl
bmRlcmVyLy0vbWVyZ2VfcmVxdWVzdHMvMTQ0MD4KLS0tLQotIHNyYy92cmVuZF93aW5zeXNfZWds
LmMgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Ci0KLWRpZmYgLS1naXQgYS9zcmMvdnJlbmRfd2luc3lzX2VnbC5jIGIvc3JjL3ZyZW5kX3dpbnN5
c19lZ2wuYwotaW5kZXggOWQ5ZjQxMGMuLjg3NTBmNmIyIDEwMDY0NAotLS0tIGEvc3JjL3ZyZW5k
X3dpbnN5c19lZ2wuYwotKysrIGIvc3JjL3ZyZW5kX3dpbnN5c19lZ2wuYwotQEAgLTM2MSw3ICsz
NjEsNyBAQCBzdHJ1Y3QgdmlyZ2xfZWdsICp2aXJnbF9lZ2xfaW5pdChFR0xOYXRpdmVEaXNwbGF5
VHlwZSBkaXNwbGF5X2lkLCBib29sIHN1cmZhY2VsZQotICNpZmRlZiBFTkFCTEVfR0JNCi0gICAg
ICAgZWxzZQotICAgICAgICAgIGVnbC0+ZWdsX2Rpc3BsYXkgPSBlZ2wtPmZ1bmNzLmVnbEdldFBs
YXRmb3JtRGlzcGxheShFR0xfUExBVEZPUk1fR0JNX0tIUiwKLS0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKEVHTE5hdGl2ZURpc3Bs
YXlUeXBlKWVnbC0+Z2JtLT5kZXZpY2UsIE5VTEwpOwotKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoRUdMTmF0aXZlRGlzcGxheVR5
cGUqKWVnbC0+Z2JtLT5kZXZpY2UsIE5VTEwpOwotICNlbmRpZgotICAgIH0gZWxzZSB7Ci0gI2lm
ZGVmIEVOQUJMRV9HQk0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJl
bmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvdmly
Z2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzEuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXJfMS4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVy
L3ZpcmdscmVuZGVyZXJfMS4xLjEuYmIKaW5kZXggMDdhYmRlMWM0Zi4uZDk1OWRlMmVlMyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJl
cl8xLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJn
bHJlbmRlcmVyXzEuMS4xLmJiCkBAIC05LDEwICs5LDkgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jODFjMDhlZWVmZDk0MThmY2E4Zjg4
MzA5YTc2ZGIxMCIKIAogREVQRU5EUyA9ICJsaWJkcm0gbGliZXBveHkgdmlydHVhbC9lZ2wgdmly
dHVhbC9saWJnYm0iCi1TUkNSRVYgPSAiMWFlYWY1ZTEwYTljODkwOTZlOTZkMDk1OTlhYTQxOWQ1
YzUwNzEyZiIKK1NSQ1JFViA9ICIwZjFmNDM5Mjk3MjRhNmE0MTRjMDFhMjliYzUxZmVjY2I0NDVj
MmYwIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3Zpcmds
cmVuZGVyZXIuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRj
aCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXZyZW5kLUZpeC1pbnQtY29udmVyc2lvbi1mYXRh
bC1idWlsZC1lcnJvci13aXRoLUdDQy0ucGF0Y2ggXAogICAgICAgICAgICAiCiAKIFMgPSAiJHtX
T1JLRElSfS9naXQiCi0tIAoyLjQ3LjEKCg==

--===============1172718466198839308==--

