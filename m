Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2D4C83F21
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.1430.1751386808115691791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aA4l7Cfj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SgjrBPB+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197c6ca2b7f-ed13c976-98c9-497f-a044-7c84b60194ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386827;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GtgQUwbKv9mHZgIf7x/P6v7kBumJq/VG8V/CBgaAZnI=;
	b=aA4l7Cfj47YpmlVfordTkkc4oxt3draN57QgPTeeQMiNBbb1pdaTjaHi64/li+J7
	p5s3YRSR/GXoeKW423nLK4O25kOGJHhp6oFx+CMpHJVbSfGwa11posZccTrGDn9jYZZ
	9eOKiVmz5dRkuKJVSb4vA4K1p+lefwKo1EJ8x8Bw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386827;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GtgQUwbKv9mHZgIf7x/P6v7kBumJq/VG8V/CBgaAZnI=;
	b=SgjrBPB+/Jwtlg6nS/6GcwuFVP6vrJwZzxHuvXvWxKaj9xPilCj00j2FUJRDyBW/
	i+0mpvZtPEn4N3qyO2fYYmtOIaKenLp60CAIg6Nz/byzoRlQI1gwtnHg0p1Zk0FFn1O
	OSj2qtfcc5gMLQhEZmt1dfwq2F15S1DGFAidIkvU=
Content-Type: multipart/mixed; boundary="===============2424516024504024064=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] virglrenderer: upgrading to 1.1.1 FAILED
Message-ID: <01010197c6ca2b7f-ed13c976-98c9-497f-a044-7c84b60194ff-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219681

--===============2424516024504024064==
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
From ab96a18b1a79ac48a499591e9ae35d4993000f27 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 14:38:16 +0000
Subject: [PATCH] virglrenderer: upgrade 1.1.0 -> 1.1.1

---
 ...uild-use-python3-directly-for-python.patch |  4 +-
 ...nversion-fatal-build-error-with-GCC-.patch | 37 -------------------
 ...nderer_1.1.0.bb => virglrenderer_1.1.1.bb} |  3 +-
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.1.0.bb => virglrenderer_1.1.1.bb} (90%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index f9080d53c5..6dcaa6189a 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 9677f66a240a0513623aa26b47233b49193d0402 Mon Sep 17 00:00:00 2001
+From 30fd01ba8a4ec78bab05c5e5a4aefddeafec0460 Mon Sep 17 00:00:00 2001
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
index 11c3c8c963..17884bdae7 100644
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
 
 inherit meson pkgconfig features_check
-- 
2.47.1


--===============2424516024504024064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1919 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-1306c507bd1e8e943cd6ba36d679c18670c4bd19"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1306c507bd1e8e943cd6ba36d679c18670c4bd19"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 369 Local 357 Mirrors 0 Missed 12 Current 589 (96% match, 98% complete)
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
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_populate_lic unihash changed to 7aa6713a2479eaa6f9ba85992732603ec3f0107410c133c4b3d60d3cc250ae97
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch unihash changed to 97518580e8f6b3a57889654ebf68a4754df721580af3ca3b353820263bde93e0
NOTE: Setscene tasks completed
NOTE: Running task 2677 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_configure)
NOTE: recipe virglrenderer-1.1.1-r0: task do_configure: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2678 of 2689 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_compile)
NOTE: recipe virglrenderer-1.1.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| [1/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_bitscan.c.o -MF src/mesa/libmesa.a.p/util_bitscan.c.o.d -o src/mesa/libmesa.a.p/util_bitscan.c.o -c ../sources/virglrenderer-1.1.1/src/mesa/util/bitscan.c
| [2/94] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/python3-native/python3 ../sources/virglrenderer-1.1.1/src/venus/vkr_device_object.py -o src ../sources/virglrenderer-1.1.1/src/venus/vkr_device_object.json
| [3/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_anon_file.c.o -MF src/mesa/libmesa.a.p/util_anon_file.c.o.d -o src/mesa/libmesa.a.p/util_anon_file.c.o -c ../sources/virglrenderer-1.1.1/src/mesa/util/anon_file.c
| [4/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_os_misc.c.o -MF src/mesa/libmesa.a.p/util_os_misc.c.o.d -o src/mesa/libmesa.a.p/util_os_misc.c.o -c ../sources/virglrenderer-1.1.1/src/mesa/util/os_misc.c
| [5/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decla
 ration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe 
 -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_texture.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_texture.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_texture.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_texture.c
| [6/94] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/meson.real --internal exe --capture src/gallium/u_format_table.c -- /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/python3-native/python3 -B ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_format_table.py ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_format.yaml
| FAILED: src/gallium/u_format_table.c
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/meson.real --internal exe --capture src/gallium/u_format_table.c -- /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/python3-native/python3 -B ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_format_table.py ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_format.yaml
| --- stderr ---
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_format_table.py", line 36, in <module>
|     from u_format_parse import *
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_format_parse.py", line 33, in <module>
|     import yaml
| ModuleNotFoundError: No module named 'yaml'
| 
| [7/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/buil
 d/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_os_file.c.o -MF src/mesa/libmesa.a.p/util_os_file.c.o.d -o src/mesa/libmesa.a.p/util_os_file.c.o -c ../sources/virglrenderer-1.1.1/src/mesa/util/os_file.c
| [8/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decla
 ration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe 
 -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_hash_table.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_hash_table.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_hash_table.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_hash_table.c
| [9/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decla
 ration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe 
 -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_debug_describe.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_debug_describe.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_debug_describe.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_debug_describe.c
| [10/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/bui
 ld/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_debug.c.o -MF src/mesa/libmesa.a.p/util_u_debug.c.o.d -o src/mesa/libmesa.a.p/util_u_debug.c.o -c ../sources/virglrenderer-1.1.1/src/mesa/util/u_debug.c
| [11/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decl
 aration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe
  -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_cache.c.o -MF src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_cache.c.o.d -o src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_cache.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/cso_cache/cso_cache.c
| [12/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/bui
 ld/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_math.c.o -MF src/mesa/libmesa.a.p/util_u_math.c.o.d -o src/mesa/libmesa.a.p/util_u_math.c.o -c ../sources/virglrenderer-1.1.1/src/mesa/util/u_math.c
| [13/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decl
 aration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe
  -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_format.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_format.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_format.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util/u_format.c
| [14/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decl
 aration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe
  -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_hash.c.o -MF src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_hash.c.o.d -o src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_hash.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/cso_cache/cso_hash.c
| [15/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decl
 aration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe
  -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_info.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_info.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_info.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/tgsi/tgsi_info.c
| [16/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/bui
 ld/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_cpu_detect.c.o -MF src/mesa/libmesa.a.p/util_u_cpu_detect.c.o.d -o src/mesa/libmesa.a.p/util_u_cpu_detect.c.o -c ../sources/virglrenderer-1.1.1/src/mesa/util/u_cpu_detect.c
| [17/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/bui
 ld/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_ralloc.c.o -MF src/mesa/libmesa.a.p/util_ralloc.c.o.d -o src/mesa/libmesa.a.p/util_ralloc.c.o -c ../sources/virglrenderer-1.1.1/src/mesa/util/ralloc.c
| [18/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decl
 aration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe
  -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_build.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_build.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_build.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/tgsi/tgsi_build.c
| [19/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decl
 aration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe
  -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_scan.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_scan.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_scan.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/tgsi/tgsi_scan.c
| [20/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../sources/virglrenderer-1.1.1/src/gallium -I../sources/virglrenderer-1.1.1/src/gallium/include -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary -I../sources/virglrenderer-1.1.1/src/gallium/auxiliary/util -I. -I../sources/virglrenderer-1.1.1 -Isrc -I../sources/virglrenderer-1.1.1/src -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-decl
 aration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe
  -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_dump.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_dump.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_dump.c.o -c ../sources/virglrenderer-1.1.1/src/gallium/auxiliary/tgsi/tgsi_dump.c
| [21/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../sources/virglrenderer-1.1.1/src/mesa -I../sources/virglrenderer-1.1.1/src/mesa/compat -I../sources/virglrenderer-1.1.1/src/mesa/pipe -I../sources/virglrenderer-1.1.1/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/bui
 ld/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/sources/virglrenderer-1.1.1=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_hash_table.c.o -MF src/mesa/libmesa.a.p/util_hash_table.c.o.d -o src/mesa/libmesa.a.p/util_hash_table.c.o -c ../sources/virglrenderer-1.1.1/src/mesa/util/hash_table.c
| ninja: build stopped: subcommand failed.
| INFO: autodetecting backend as ninja
| INFO: calculating backend command to run: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/ninja -j 16 -l 75.0 -v
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2947943:153 exit 1 from 'meson compile -v -j 16 -l 75'
| WARNING: Backtrace (BB generated script):
| 	#1: meson_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2947943, line 153
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2947943, line 148
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2947943, line 157
NOTE: recipe virglrenderer-1.1.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2678 tasks of which 2667 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701143757.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701143757.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/log.do_compile.2947943
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: virglrenderer-1.1.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2947943' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/log.do_compile.2947943
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_compile) failed with exit code '1'

--===============2424516024504024064==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.1.0-1.1.1.patch"

RnJvbSBhYjk2YTE4YjFhNzlhYzQ4YTQ5OTU5MWU5YWUzNWQ0OTkzMDAwZjI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNDozODoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZp
cmdscmVuZGVyZXI6IHVwZ3JhZGUgMS4xLjAgLT4gMS4xLjEKCi0tLQogLi4udWlsZC11c2UtcHl0
aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIHwgIDQgKy0KIC4uLm52ZXJzaW9uLWZhdGFs
LWJ1aWxkLWVycm9yLXdpdGgtR0NDLS5wYXRjaCB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
Lm5kZXJlcl8xLjEuMC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMS4xLmJifSB8ICAzICstCiAzIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJl
ci8wMDAxLXZyZW5kLUZpeC1pbnQtY29udmVyc2lvbi1mYXRhbC1idWlsZC1lcnJvci13aXRoLUdD
Qy0ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci97dmly
Z2xyZW5kZXJlcl8xLjEuMC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMS4xLmJifSAoOTAlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAx
LW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2gKaW5kZXgg
ZjkwODBkNTNjNS4uNmRjYWE2MTg5YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24z
LWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Zp
cmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRp
cmVjdGx5LWZvci1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk2NzdmNjZhMjQw
YTA1MTM2MjNhYTI2YjQ3MjMzYjQ5MTkzZDA0MDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDMwZmQwMWJhOGE0ZWM3OGJhYjA1YzVlNWE0YWVmZGRlYWZlYzA0NjAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4KIERhdGU6IE1vbiwgNiBKYW4gMjAyMCAxMjo0NDo0MiArMDEwMAogU3ViamVjdDogW1BB
VENIXSBtZXNvbi5idWlsZDogdXNlICdweXRob24zJyBkaXJlY3RseSBmb3IgcHl0aG9uCkBAIC0x
Myw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMTBi
ZTA5OWUuLjNiYjZlZWM3IDEwMDY0NAoraW5kZXggY2QxOTUzYzMuLjdhZjkyMGIxIDEwMDY0NAog
LS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtNzcsNyArNzcsNyBAQCBm
bGFncyA9IFsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVy
L3ZpcmdscmVuZGVyZXIvMDAwMS12cmVuZC1GaXgtaW50LWNvbnZlcnNpb24tZmF0YWwtYnVpbGQt
ZXJyb3Itd2l0aC1HQ0MtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVy
ZXIvdmlyZ2xyZW5kZXJlci8wMDAxLXZyZW5kLUZpeC1pbnQtY29udmVyc2lvbi1mYXRhbC1idWls
ZC1lcnJvci13aXRoLUdDQy0ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDY3
ZGM0OTg5YjUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLXZyZW5kLUZpeC1pbnQtY29udmVyc2lvbi1mYXRhbC1i
dWlsZC1lcnJvci13aXRoLUdDQy0ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNyArMCwwIEBA
Ci1Gcm9tIGJiMTI5YWFjMTJjNWFhNmUyZGQzNzEyNDRiMDQyYmFhODJhZmYwMTQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCi1Gcm9tOiBQdXJ1c2hvdHRhbSBDaG91ZGhhcnkgPHB1cnVzaG90dGFt
Mjcua3VtYXJAbGdlLmNvbT4KLURhdGU6IFR1ZSwgOCBPY3QgMjAyNCAxMTo0NzoyMSArMDUzMAot
U3ViamVjdDogW1BBVENIXSB2cmVuZDogRml4IGludC1jb252ZXJzaW9uIGZhdGFsIGJ1aWxkIGVy
cm9yIHdpdGggR0NDLTE0Ci0KLUdldHRpbmcgYmVsb3cgZXJyb3IgaW50IGNvbnZlcnNpb24gZHVy
aW5nIGNvbXBpbGF0aW9uIGFzIG9uZSB0aGUKLXBsYXRmb3JtcyB3aGVyZSBFR0xOYXRpdmVEaXNw
bGF5VHlwZSBpcyBhbiBpbnQgaW5zdGVhZCBvZiBhIHBvaW50ZXIuCi0KLXwgLi4vZ2l0L3NyYy92
cmVuZF93aW5zeXNfZWdsLmM6IEluIGZ1bmN0aW9uICd2aXJnbF9lZ2xfaW5pdCc6Ci18IC4uL2dp
dC9zcmMvdnJlbmRfd2luc3lzX2VnbC5jOjM2NDo2MjogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQg
MiBvZiAnZWdsLT5mdW5jcy5lcG94eV9lZ2xHZXRQbGF0Zm9ybURpc3BsYXknIG1ha2VzIHBvaW50
ZXIgZnJvbQotfCAgIDM2NCB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAoRUdMTmF0aXZlRGlzcGxheVR5cGUpZWdsLT5nYm0tPmRl
dmljZSwgTlVMTCk7Ci18ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+Ci18ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwKLXwgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50Ci18IC4uL2dpdC9z
cmMvdnJlbmRfd2luc3lzX2VnbC5jOjM2NDo2Mjogbm90ZTogZXhwZWN0ZWQgJ3ZvaWQgKicgYnV0
IGFyZ3VtZW50IGlzIG9mIHR5cGUgJ2ludCcKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBb
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVuZGVyZXIvLS9jb21t
aXQvNDY0ZGVhYmU0ZDFiZmNlNmI4ZjQxNGFiMDk0NWQ5YTYyYjY2ZGRkNF0KLQotU2lnbmVkLW9m
Zi1ieTogUHVydXNob3R0YW0gQ2hvdWRoYXJ5IDxwdXJ1c2hvdHRhbTI3Lmt1bWFyQGxnZS5jb20+
Ci1QYXJ0LW9mOiA8aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVu
ZGVyZXIvLS9tZXJnZV9yZXF1ZXN0cy8xNDQwPgotLS0tCi0gc3JjL3ZyZW5kX3dpbnN5c19lZ2wu
YyB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
LQotZGlmZiAtLWdpdCBhL3NyYy92cmVuZF93aW5zeXNfZWdsLmMgYi9zcmMvdnJlbmRfd2luc3lz
X2VnbC5jCi1pbmRleCA5ZDlmNDEwYy4uODc1MGY2YjIgMTAwNjQ0Ci0tLS0gYS9zcmMvdnJlbmRf
d2luc3lzX2VnbC5jCi0rKysgYi9zcmMvdnJlbmRfd2luc3lzX2VnbC5jCi1AQCAtMzYxLDcgKzM2
MSw3IEBAIHN0cnVjdCB2aXJnbF9lZ2wgKnZpcmdsX2VnbF9pbml0KEVHTE5hdGl2ZURpc3BsYXlU
eXBlIGRpc3BsYXlfaWQsIGJvb2wgc3VyZmFjZWxlCi0gI2lmZGVmIEVOQUJMRV9HQk0KLSAgICAg
ICBlbHNlCi0gICAgICAgICAgZWdsLT5lZ2xfZGlzcGxheSA9IGVnbC0+ZnVuY3MuZWdsR2V0UGxh
dGZvcm1EaXNwbGF5KEVHTF9QTEFURk9STV9HQk1fS0hSLAotLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoRUdMTmF0aXZlRGlzcGxh
eVR5cGUpZWdsLT5nYm0tPmRldmljZSwgTlVMTCk7Ci0rICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChFR0xOYXRpdmVEaXNwbGF5VHlw
ZSopZWdsLT5nYm0tPmRldmljZSwgTlVMTCk7Ci0gI2VuZGlmCi0gICAgfSBlbHNlIHsKLSAjaWZk
ZWYgRU5BQkxFX0dCTQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjEuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJn
bHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJl
cl8xLjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIv
dmlyZ2xyZW5kZXJlcl8xLjEuMS5iYgppbmRleCAxMWMzYzhjOTYzLi4xNzg4NGJkYWU3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVy
XzEuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zpcmds
cmVuZGVyZXJfMS4xLjEuYmIKQEAgLTksMTAgKzksOSBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZkOTQxOGZjYThmODgz
MDlhNzZkYjEwIgogCiBERVBFTkRTID0gImxpYmRybSBsaWJlcG94eSB2aXJ0dWFsL2VnbCB2aXJ0
dWFsL2xpYmdibSIKLVNSQ1JFViA9ICIxYWVhZjVlMTBhOWM4OTA5NmU5NmQwOTU5OWFhNDE5ZDVj
NTA3MTJmIgorU1JDUkVWID0gIjBmMWY0MzkyOTcyNGE2YTQxNGMwMWEyOWJjNTFmZWNjYjQ0NWMy
ZjAiCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdmlyZ2wvdmlyZ2xy
ZW5kZXJlci5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNo
IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtdnJlbmQtRml4LWludC1jb252ZXJzaW9uLWZhdGFs
LWJ1aWxkLWVycm9yLXdpdGgtR0NDLS5wYXRjaCBcCiAgICAgICAgICAgICIKIAogaW5oZXJpdCBt
ZXNvbiBwa2djb25maWcgZmVhdHVyZXNfY2hlY2sKLS0gCjIuNDcuMQoK

--===============2424516024504024064==--

