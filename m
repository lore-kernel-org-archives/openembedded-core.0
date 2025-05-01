Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3468FC3ABC2
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1791.1746113617290699320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fxkBVHVP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HHc643HK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7b8891-a6d210ba-a60c-465e-82e8-4d7188eb07aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dPyL4t/WA7hFXCYIFPl1dSlBOIXcxfc05vYgFWoUS2E=;
	b=fxkBVHVPhRcTszrOb+WAR0ZT9M+4iKDqh4hMDzbR6A+qVqg/ITWRCweFOJaZ1yje
	gZEN+txEyv8feVdykNULukuTEWGCtddCu1yVQ0bU6vK6qmZfCjn3l6igU7a4tHWhSgc
	pNEWFmNFLl2WVCRUhk6Xob+Rx8ZKcVIDl4VlLDr4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dPyL4t/WA7hFXCYIFPl1dSlBOIXcxfc05vYgFWoUS2E=;
	b=HHc643HKNDbUY3zlmqUPKSriP2FLKoX4fa+FPMK8HIYBNVft8uqBA2MVW+p+K5vk
	GbQ1xrQVDF3fQT7oJfCbFScU/9pRV1IM6T/MvvMVh4iAdUy3QdY/cizhYFIC1Y9mcTh
	Zu/gTOe+YuS0jLamXn7Z6YLHLrHk6hnAIo/FDa1c=
Content-Type: multipart/mixed; boundary="===============5872557756189594273=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.05.1 SUCCEEDED
Message-ID: <010101968c7b8891-a6d210ba-a60c-465e-82e8-4d7188eb07aa-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215849

--===============5872557756189594273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ghostscript* to *10.05.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-10.05.0-10.05.1.patch
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
From 90c8c753a527cedf070188cae7181f88ccb8eff8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 10:40:36 +0000
Subject: [PATCH] ghostscript: upgrade 10.05.0 -> 10.05.1

---
 ...Fix-compatibility-with-C23-compilers.patch | 43 ++++++++++---------
 .../avoid-host-contamination.patch            |  2 +-
 .../ghostscript-9.16-Werror-return-type.patch |  2 +-
 ...ript_10.05.0.bb => ghostscript_10.05.1.bb} |  2 +-
 4 files changed, 25 insertions(+), 24 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
index 78f3fc1c34..8d6f2f7ced 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
@@ -1,4 +1,4 @@
-From c595086bfe206776676e290df98cd09e91210e27 Mon Sep 17 00:00:00 2001
+From 2c33689b2176c06c1991b40dcc336b6069b29d1a Mon Sep 17 00:00:00 2001
 From: Alex Cherepanov <alex@coscript.biz>
 Date: Thu, 3 Apr 2025 17:19:41 +0100
 Subject: [PATCH] Bug 708160: Fix compatibility with C23 compilers
@@ -22,9 +22,29 @@ Upstream-Status: Backport [Partial backport of https://cgit.ghostscript.com/cgi-
 
 Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 ---
+ base/gp.h     | 4 ++--
  base/stdpre.h | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
+ 2 files changed, 6 insertions(+), 4 deletions(-)
 
+diff --git a/base/gp.h b/base/gp.h
+index ad5bb61..cf2c9cf 100644
+--- a/base/gp.h
++++ b/base/gp.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2025 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -646,7 +646,7 @@ int gp_fseek_impl(FILE *strm, gs_offset_t offset, int origin);
+ /* Create a second open gp_file on the basis of a given one */
+ FILE *gp_fdup_impl(FILE *f, const char *mode);
+ 
+-int gp_fseekable_impl(FILE *f);
++bool gp_fseekable_impl(FILE *f);
+ 
+ /* Force given file into binary mode (no eol translations, etc) */
+ /* if 2nd param true, text mode if 2nd param false */
 diff --git a/base/stdpre.h b/base/stdpre.h
 index dda30b6..2f9c84e 100644
 --- a/base/stdpre.h
@@ -46,22 +66,3 @@ index dda30b6..2f9c84e 100644
  #ifdef __BEOS__
  typedef unsigned char bool;
  #else
-diff --git a/base/gp.h b/base/gp.h
-index ad5bb61..cf2c9cf 100644
---- a/base/gp.h
-+++ b/base/gp.h
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2023 Artifex Software, Inc.
-+/* Copyright (C) 2001-2025 Artifex Software, Inc.
-    All Rights Reserved.
- 
-    This software is provided AS-IS with no warranty, either express or
-@@ -646,7 +646,7 @@ int gp_fseek_impl(FILE *strm, gs_offset_t offset, int origin);
- /* Create a second open gp_file on the basis of a given one */
- FILE *gp_fdup_impl(FILE *f, const char *mode);
- 
--int gp_fseekable_impl(FILE *f);
-+bool gp_fseekable_impl(FILE *f);
- 
- /* Force given file into binary mode (no eol translations, etc) */
- /* if 2nd param true, text mode if 2nd param false */
diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index d191231c7b..37affdc06f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From 85905ce3b1bc63f0be9eda9888e40d8e7a803d21 Mon Sep 17 00:00:00 2001
+From a655d78c2cec62e768e102fdd037e03970b32ad1 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
 Subject: [PATCH] avoid host contamination
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
index 0598c3dcd2..2bb65e18f8 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
@@ -1,4 +1,4 @@
-From c23b787f9a38be2cdc57133915c402b69acedd1a Mon Sep 17 00:00:00 2001
+From f07ee308f8368278b8127d58ef600cb126fe1c59 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Mon, 4 May 2015 22:31:48 -0700
 Subject: [PATCH] base/gendev.c: fix for -Werror=return-type
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index c0e2654701..8f132d55c6 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch \
            "
 
-SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"
+SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.47.1


--===============5872557756189594273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (0 cached, 928 parsed). 1898 targets, 50 skipped, 0 masked, 0 errors.
Removing 70 recipes from the core2-64 sysroot...done.
Removing 72 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:332a1a3a1cc3dc5b90d60553cc66d0a83ea3b6df"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 471 Local 455 Mirrors 0 Missed 16 Current 258 (96% match, 97% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 339 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 342 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.28-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 354 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 367 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cups-2.4.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 372 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 402 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 412 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 421 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 423 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe cups-2.4.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 426 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 427 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 429 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe cups-2.4.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 435 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 447 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 448 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 450 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 481 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 487 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 488 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 489 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 495 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 500 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 516 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 526 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 530 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 534 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 538 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 553 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 562 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 567 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1093 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 577 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1140 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_unpack)
NOTE: Running task 1145 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb:do_recipe_qa)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ghostscript-10.05.1-r0: task do_recipe_qa: Started
NOTE: recipe cups-2.4.11-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 595 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe ghostscript-10.05.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1206 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb:do_fetch)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cups-2.4.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1212 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_patch)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ghostscript-10.05.1-r0: task do_fetch: Started
NOTE: recipe ghostscript-10.05.1-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb:do_unpack)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cups-2.4.11-r0: task do_patch: Started
NOTE: recipe ghostscript-10.05.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 606 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 612 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 619 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 624 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cups-2.4.11-r0: task do_patch: Succeeded
NOTE: Running setscene task 632 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 637 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 653 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 659 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 660 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 663 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 664 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 665 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 675 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 680 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 682 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe ghostscript-10.05.1-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ghostscript-10.05.1-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 705 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ghostscript-10.05.1-r0: task do_patch: Succeeded
NOTE: Running task 1366 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1367 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb:do_populate_lic)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe ghostscript-10.05.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ghostscript-10.05.1-r0: task do_populate_lic: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe ghostscript-10.05.1-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb:do_populate_lic unihash changed to cdc16bd744a49f7caa7a7ad39f927075f64df43f22d6475f653301e831e9c4d9
NOTE: recipe ghostscript-10.05.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 729 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1879 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1990 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_collect_spdx_deps)
NOTE: recipe cups-2.4.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cups-2.4.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe cups-2.4.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cups-2.4.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1994 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_configure)
NOTE: recipe cups-2.4.11-r0: task do_configure: Started
NOTE: recipe cups-2.4.11-r0: task do_configure: Succeeded
NOTE: Running task 1995 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_compile)
NOTE: recipe cups-2.4.11-r0: task do_compile: Started
NOTE: recipe cups-2.4.11-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_install)
NOTE: recipe cups-2.4.11-r0: task do_install: Started
NOTE: recipe cups-2.4.11-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_package)
NOTE: Running task 1998 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_populate_sysroot)
NOTE: recipe cups-2.4.11-r0: task do_populate_sysroot: Started
NOTE: recipe cups-2.4.11-r0: task do_package: Started
NOTE: recipe cups-2.4.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1999 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ghostscript-10.05.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ghostscript-10.05.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2000 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb:do_configure)
NOTE: recipe ghostscript-10.05.1-r0: task do_configure: Started
NOTE: recipe cups-2.4.11-r0: task do_package: Succeeded
NOTE: Running task 2001 of 2015 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_packagedata)
NOTE: recipe cups-2.4.11-r0: task do_packagedata: Started
NOTE: recipe cups-2.4.11-r0: task do_packagedata: Failed
NOTE: recipe ghostscript-10.05.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2001 tasks of which 1982 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501103926.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501103926.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/cups/2.4.11/temp/log.do_packagedata.1898125
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-src went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-dbg went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-lib went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-libimage went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-webif went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-staticdev went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-dev went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-doc went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-ca went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-cs went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-da went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-de went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-en went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-es went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-fr went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-it went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-ja went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-pt-br went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-ru went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups-locale-zh-cn went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: QA Issue: Package version for package cups went backwards which would break package feeds (from 0:2.4.12-r0 to 0:2.4.11-r0) [version-going-backwards]
ERROR: cups-2.4.11-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/cups/2.4.11/temp/log.do_packagedata.1898125
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cups/cups_2.4.11.bb:do_packagedata) failed with exit code '1'

--===============5872557756189594273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ghostscript/ghostscript-dbg: PKGV changed from 10.05.0 [default] to 10.05.1 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-dbg: PKGSIZE changed from 189393096 to 189394968 (+0%)
packages/core2-64-poky-linux/ghostscript/ghostscript-dbg: PV changed from "10.05.0" to "10.05.1"
packages/core2-64-poky-linux/ghostscript/ghostscript-dev: PKGV changed from 10.05.0 [default] to 10.05.1 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-dev: PV changed from "10.05.0" to "10.05.1"
packages/core2-64-poky-linux/ghostscript/ghostscript-doc: PKGV changed from 10.05.0 [default] to 10.05.1 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed from 11323954 to 11323661 (-0%)
packages/core2-64-poky-linux/ghostscript/ghostscript-doc: PV changed from "10.05.0" to "10.05.1"
packages/core2-64-poky-linux/ghostscript/ghostscript-locale: PKGV changed from 10.05.0 [default] to 10.05.1 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-locale: PV changed from "10.05.0" to "10.05.1"
packages/core2-64-poky-linux/ghostscript/ghostscript-src: PKGV changed from 10.05.0 [default] to 10.05.1 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-src: PKGSIZE changed from 93322278 to 93324292 (+0%)
packages/core2-64-poky-linux/ghostscript/ghostscript-src: PV changed from "10.05.0" to "10.05.1"
packages/core2-64-poky-linux/ghostscript/ghostscript-staticdev: PKGV changed from 10.05.0 [default] to 10.05.1 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript-staticdev: PV changed from "10.05.0" to "10.05.1"
packages/core2-64-poky-linux/ghostscript/ghostscript: PKGV changed from 10.05.0 [default] to 10.05.1 [default]
packages/core2-64-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.05.0/iccprofiles -> /usr/share/ghostscript/10.05.1/iccprofiles, directory renamed /usr/share/ghostscript/10.05.0/Resource/Decoding -> /usr/share/ghostscript/10.05.1/Resource/Decoding, directory renamed /usr/share/ghostscript/10.05.0/Resource/Init -> /usr/share/ghostscript/10.05.1/Resource/Init, directory renamed /usr/share/ghostscript/10.05.0/Resource/SubstCID -> /usr/share/ghostscript/10.05.1/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.05.0/Resource/Encoding -> /usr/share/ghostscript/10.05.1/Resource/Encoding, directory renamed /usr/share/ghostscript/10.05.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.05.1/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.05.0/Resource/CMap -> /usr/share/ghostscript/10.05.1/Resource/CMap, directory renamed /usr/share/ghostscript/10.05.0/Resource/CIDFont -> /usr/share/ghostscript/10.05.1/Resource/CIDFont, di
 rectory renamed /usr/share/ghostscript/10.05.0/Resource/ColorSpace -> /usr/share/ghostscript/10.05.1/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.05.0/Resource/Font -> /usr/share/ghostscript/10.05.1/Resource/Font, directory renamed /usr/share/ghostscript/10.05.0/Resource/IdiomSet -> /usr/share/ghostscript/10.05.1/Resource/IdiomSet, removed "/usr/share/ghostscript/10.05.0/lib/uninfo.ps /usr/share/ghostscript/10.05.0/lib/viewcmyk.ps /usr/share/ghostscript/10.05.0/lib/bj8.rpd /usr/share/ghostscript/10.05.0/lib/bjc610a0.upp /usr/share/ghostscript/10.05.0/lib/caption.ps /usr/share/ghostscript/10.05.0/lib/gs_l.xbm /usr/share/ghostscript/10.05.0/lib/gs_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_s.xbm /usr/share/ghostscript/10.05.0/lib/gs_t.xbm /usr/share/ghostscript/10.05.0/lib/gslp.ps /usr/share/ghostscript/10.05.0/lib/pphs.ps /usr/share/ghostscript/10.05.0/lib/stc.upp /usr/share/ghostscript/10.05.0/lib/gs_lgx_e.ps /usr/share/ghostscript/10.05.0/lib/ht_ccsto.ps /usr/s
 hare/ghostscript/10.05.0/lib/stc300bm.upp /usr/share/ghostscript/10.05.0/lib/align.ps /usr/share/ghostscript/10.05.0/lib/cbjc600.ppd /usr/share/ghostscript/10.05.0/lib/cbjc800.ppd /usr/share/ghostscript/10.05.0/lib/docie.ps /usr/share/ghostscript/10.05.0/lib/gsnup.ps /usr/share/ghostscript/10.05.0/lib/lines.ps /usr/share/ghostscript/10.05.0/lib/ppath.ps /usr/share/ghostscript/10.05.0/lib/ps2ai.ps /usr/share/ghostscript/10.05.0/lib/st640pg.upp /usr/share/ghostscript/10.05.0/lib/mkcidfm.ps /usr/share/ghostscript/10.05.0/lib/pfbtopfa.ps /usr/share/ghostscript/10.05.0/lib/viewpcx.ps /usr/share/ghostscript/10.05.0/lib/bjc610a5.upp /usr/share/ghostscript/10.05.0/lib/bjc6000b1.upp /usr/share/ghostscript/10.05.0/lib/stc1520h.upp /usr/share/ghostscript/10.05.0/lib/bjc610b6.upp /usr/share/ghostscript/10.05.0/lib/stc600ih.upp /usr/share/ghostscript/10.05.0/lib/stc740ih.upp /usr/share/ghostscript/10.05.0/lib/stc800ih.upp /usr/share/ghostscript/10.05.0/lib/bjc610b7.upp /usr/share/ghostscript/10.
 05.0/lib/bjc610a7.upp /usr/share/ghostscript/10.05.0/lib/gs_ksb_e.ps /usr/share/ghostscript/10.05.0/lib/viewmiff.ps /usr/share/ghostscript/10.05.0/lib/necp2x6.upp /usr/share/ghostscript/10.05.0/lib/viewpbm.ps /usr/share/ghostscript/10.05.0/lib/zeroline.ps /usr/share/ghostscript/10.05.0/lib/stcinfo.ps /usr/share/ghostscript/10.05.0/lib/bjc6000a1.upp /usr/share/ghostscript/10.05.0/lib/Stc670pl.upp /usr/share/ghostscript/10.05.0/lib/Stc680pl.upp /usr/share/ghostscript/10.05.0/lib/Stc740pl.upp /usr/share/ghostscript/10.05.0/lib/Stc760pl.upp /usr/share/ghostscript/10.05.0/lib/Stp720pl.upp /usr/share/ghostscript/10.05.0/lib/Stp870pl.upp /usr/share/ghostscript/10.05.0/lib/stc600pl.upp /usr/share/ghostscript/10.05.0/lib/stc800pl.upp /usr/share/ghostscript/10.05.0/lib/bjc610b8.upp /usr/share/ghostscript/10.05.0/lib/gs_wl5_e.ps /usr/share/ghostscript/10.05.0/lib/viewgif.ps /usr/share/ghostscript/10.05.0/lib/stc300bl.upp /usr/share/ghostscript/10.05.0/lib/stc2_h.upp /usr/share/ghostscript/10.0
 5.0/lib/jispaper.ps /usr/share/ghostscript/10.05.0/lib/gs_l_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_m_m.xbm /usr/share/ghostscript/10.05.0/lib/cid2code.ps /usr/share/ghostscript/10.05.0/lib/gs_s_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_t_m.xbm /usr/share/ghostscript/10.05.0/lib/stcolor.ps /usr/share/ghostscript/10.05.0/lib/bjc610a2.upp /usr/share/ghostscript/10.05.0/lib/stc500ph.upp /usr/share/ghostscript/10.05.0/lib/PDFA_def.ps /usr/share/ghostscript/10.05.0/lib/PDFX_def.ps /usr/share/ghostscript/10.05.0/lib/pf2afm.ps /usr/share/ghostscript/10.05.0/lib/dnj750m.upp /usr/share/ghostscript/10.05.0/lib/pdf_info.ps /usr/share/ghostscript/10.05.0/lib/stc200_h.upp /usr/share/ghostscript/10.05.0/lib/viewps2a.ps /usr/share/ghostscript/10.05.0/lib/PM760pl.upp /usr/share/ghostscript/10.05.0/lib/PM820pl.upp /usr/share/ghostscript/10.05.0/lib/st640pl.upp /usr/share/ghostscript/10.05.0/lib/gs_l.xpm /usr/share/ghostscript/10.05.0/lib/gs_m.xpm /usr/share/ghostscript/10.05.0/lib/bjc610a3.upp
  /usr/share/ghostscript/10.05.0/lib/gs_s.xpm /usr/share/ghostscript/10.05.0/lib/gs_t.xpm /usr/share/ghostscript/10.05.0/lib/viewjpeg.ps /usr/share/ghostscript/10.05.0/lib/st640ihg.upp /usr/share/ghostscript/10.05.0/lib/gs_css_e.ps /usr/share/ghostscript/10.05.0/lib/bjc610a6.upp /usr/share/ghostscript/10.05.0/lib/gs_wl1_e.ps /usr/share/ghostscript/10.05.0/lib/Stc777p.upp /usr/share/ghostscript/10.05.0/lib/s400a1.upp /usr/share/ghostscript/10.05.0/lib/bjc610b4.upp /usr/share/ghostscript/10.05.0/lib/gs_kanji.ps /usr/share/ghostscript/10.05.0/lib/s400b1.upp /usr/share/ghostscript/10.05.0/lib/traceimg.ps /usr/share/ghostscript/10.05.0/lib/bjc610b3.upp /usr/share/ghostscript/10.05.0/lib/Stc777pl.upp /usr/share/ghostscript/10.05.0/lib/traceop.ps /usr/share/ghostscript/10.05.0/lib/ras1.upp /usr/share/ghostscript/10.05.0/lib/ras3.upp /usr/share/ghostscript/10.05.0/lib/ras4.upp /usr/share/ghostscript/10.05.0/lib/bjc610a8.upp /usr/share/ghostscript/10.05.0/lib/stc2.upp /usr/share/ghostscript/1
 0.05.0/lib/stcany.upp /usr/share/ghostscript/10.05.0/lib/bjc610a4.upp /usr/share/ghostscript/10.05.0/lib/cdj690ec.upp /usr/share/ghostscript/10.05.0/lib/landscap.ps /usr/share/ghostscript/10.05.0/lib/prfont.ps /usr/share/ghostscript/10.05.0/lib/stocht.ps /usr/share/ghostscript/10.05.0/lib/st640ih.upp /usr/share/ghostscript/10.05.0/lib/stc2s_h.upp /usr/share/ghostscript/10.05.0/lib/bjc610a1.upp /usr/share/ghostscript/10.05.0/lib/necp2x.upp /usr/share/ghostscript/10.05.0/lib/zugferd.ps /usr/share/ghostscript/10.05.0/lib/PM760p.upp /usr/share/ghostscript/10.05.0/lib/PM820p.upp /usr/share/ghostscript/10.05.0/lib/st640p.upp /usr/share/ghostscript/10.05.0/lib/bjc610b1.upp /usr/share/ghostscript/10.05.0/lib/winmaps.ps /usr/share/ghostscript/10.05.0/lib/stcany_h.upp /usr/share/ghostscript/10.05.0/lib/ras24.upp /usr/share/ghostscript/10.05.0/lib/ras32.upp /usr/share/ghostscript/10.05.0/lib/ras8m.upp /usr/share/ghostscript/10.05.0/lib/sharp.upp /usr/share/ghostscript/10.05.0/lib/stc_h.upp /us
 r/share/ghostscript/10.05.0/lib/stc_l.upp /usr/share/ghostscript/10.05.0/lib/dnj750c.upp /usr/share/ghostscript/10.05.0/lib/font2pcl.ps /usr/share/ghostscript/10.05.0/lib/ps2epsi.ps /usr/share/ghostscript/10.05.0/lib/bj8oh06n.upp /usr/share/ghostscript/10.05.0/lib/bj8pa06n.upp /usr/share/ghostscript/10.05.0/lib/bj8ts06n.upp /usr/share/ghostscript/10.05.0/lib/sipixa6.upp /usr/share/ghostscript/10.05.0/lib/stc500p.upp /usr/share/ghostscript/10.05.0/lib/stc600p.upp /usr/share/ghostscript/10.05.0/lib/stc640p.upp /usr/share/ghostscript/10.05.0/lib/stc800p.upp /usr/share/ghostscript/10.05.0/lib/Stc670p.upp /usr/share/ghostscript/10.05.0/lib/Stc680p.upp /usr/share/ghostscript/10.05.0/lib/Stc740p.upp /usr/share/ghostscript/10.05.0/lib/Stc760p.upp /usr/share/ghostscript/10.05.0/lib/Stp720p.upp /usr/share/ghostscript/10.05.0/lib/Stp870p.upp /usr/share/ghostscript/10.05.0/lib/st640plg.upp /usr/share/ghostscript/10.05.0/lib/printafm.ps /usr/share/ghostscript/10.05.0/lib/cdj550.upp /usr/share/gh
 ostscript/10.05.0/lib/cdj690.upp /usr/share/ghostscript/10.05.0/lib/stc300.upp /usr/share/ghostscript/10.05.0/lib/gs_il2_e.ps /usr/share/ghostscript/10.05.0/lib/gs_wl2_e.ps /usr/share/ghostscript/10.05.0/lib/ghostpdf.ppd /usr/share/ghostscript/10.05.0/lib/bj8gc12f.upp /usr/share/ghostscript/10.05.0/lib/bj8hg12f.upp /usr/share/ghostscript/10.05.0/lib/bj8pp12f.upp /usr/share/ghostscript/10.05.0/lib/image-qa.ps /usr/share/ghostscript/10.05.0/lib/bjc610b2.upp /usr/share/ghostscript/10.05.0/lib/gs_lgo_e.ps /usr/share/ghostscript/10.05.0/lib/gs_ce_e.ps /usr/share/ghostscript/10.05.0/lib/rollconv.ps /usr/share/ghostscript/10.05.0/lib/acctest.ps", added "/usr/share/ghostscript/10.05.1/lib/uninfo.ps /usr/share/ghostscript/10.05.1/lib/viewcmyk.ps /usr/share/ghostscript/10.05.1/lib/bj8.rpd /usr/share/ghostscript/10.05.1/lib/bjc610a0.upp /usr/bin/pdf2dsc /usr/share/ghostscript/10.05.1/lib/caption.ps /usr/share/ghostscript/10.05.1/lib/gs_l.xbm /usr/share/ghostscript/10.05.1/lib/gs_m.xbm /usr/sha
 re/ghostscript/10.05.1/lib/gs_s.xbm /usr/share/ghostscript/10.05.1/lib/gs_t.xbm /usr/share/ghostscript/10.05.1/lib/gslp.ps /usr/share/ghostscript/10.05.1/lib/pphs.ps /usr/share/ghostscript/10.05.1/lib/stc.upp /usr/share/ghostscript/10.05.1/lib/gs_lgx_e.ps /usr/share/ghostscript/10.05.1/lib/ht_ccsto.ps /usr/share/ghostscript/10.05.1/lib/stc300bm.upp /usr/share/ghostscript/10.05.1/lib/align.ps /usr/share/ghostscript/10.05.1/lib/cbjc600.ppd /usr/share/ghostscript/10.05.1/lib/cbjc800.ppd /usr/share/ghostscript/10.05.1/lib/docie.ps /usr/share/ghostscript/10.05.1/lib/gsnup.ps /usr/share/ghostscript/10.05.1/lib/lines.ps /usr/share/ghostscript/10.05.1/lib/ppath.ps /usr/share/ghostscript/10.05.1/lib/ps2ai.ps /usr/share/ghostscript/10.05.1/lib/st640pg.upp /usr/share/ghostscript/10.05.1/lib/mkcidfm.ps /usr/share/ghostscript/10.05.1/lib/pfbtopfa.ps /usr/share/ghostscript/10.05.1/lib/viewpcx.ps /usr/share/ghostscript/10.05.1/lib/bjc610a5.upp /usr/share/ghostscript/10.05.1/lib/bjc6000b1.upp /usr/
 share/ghostscript/10.05.1/lib/stc1520h.upp /usr/share/ghostscript/10.05.1/lib/bjc610b6.upp /usr/share/ghostscript/10.05.1/lib/stc600ih.upp /usr/share/ghostscript/10.05.1/lib/stc740ih.upp /usr/share/ghostscript/10.05.1/lib/stc800ih.upp /usr/share/ghostscript/10.05.1/lib/bjc610b7.upp /usr/share/ghostscript/10.05.1/lib/bjc610a7.upp /usr/share/ghostscript/10.05.1/lib/gs_ksb_e.ps /usr/share/ghostscript/10.05.1/lib/viewmiff.ps /usr/share/ghostscript/10.05.1/lib/necp2x6.upp /usr/share/ghostscript/10.05.1/lib/viewpbm.ps /usr/share/ghostscript/10.05.1/lib/zeroline.ps /usr/share/ghostscript/10.05.1/lib/stcinfo.ps /usr/share/ghostscript/10.05.1/lib/bjc6000a1.upp /usr/share/ghostscript/10.05.1/lib/Stc670pl.upp /usr/share/ghostscript/10.05.1/lib/Stc680pl.upp /usr/share/ghostscript/10.05.1/lib/Stc740pl.upp /usr/share/ghostscript/10.05.1/lib/Stc760pl.upp /usr/share/ghostscript/10.05.1/lib/Stp720pl.upp /usr/share/ghostscript/10.05.1/lib/Stp870pl.upp /usr/share/ghostscript/10.05.1/lib/stc600pl.upp /
 usr/share/ghostscript/10.05.1/lib/stc800pl.upp /usr/share/ghostscript/10.05.1/lib/bjc610b8.upp /usr/share/ghostscript/10.05.1/lib/gs_wl5_e.ps /usr/share/ghostscript/10.05.1/lib/viewgif.ps /usr/share/ghostscript/10.05.1/lib/stc300bl.upp /usr/share/ghostscript/10.05.1/lib/stc2_h.upp /usr/share/ghostscript/10.05.1/lib/jispaper.ps /usr/share/ghostscript/10.05.1/lib/gs_l_m.xbm /usr/share/ghostscript/10.05.1/lib/gs_m_m.xbm /usr/share/ghostscript/10.05.1/lib/cid2code.ps /usr/share/ghostscript/10.05.1/lib/gs_s_m.xbm /usr/share/ghostscript/10.05.1/lib/gs_t_m.xbm /usr/share/ghostscript/10.05.1/lib/stcolor.ps /usr/share/ghostscript/10.05.1/lib/bjc610a2.upp /usr/share/ghostscript/10.05.1/lib/stc500ph.upp /usr/share/ghostscript/10.05.1/lib/PDFA_def.ps /usr/share/ghostscript/10.05.1/lib/PDFX_def.ps /usr/share/ghostscript/10.05.1/lib/pf2afm.ps /usr/share/ghostscript/10.05.1/lib/dnj750m.upp /usr/share/ghostscript/10.05.1/lib/pdf_info.ps /usr/share/ghostscript/10.05.1/lib/stc200_h.upp /usr/share/gho
 stscript/10.05.1/lib/viewps2a.ps /usr/share/ghostscript/10.05.1/lib/PM760pl.upp /usr/share/ghostscript/10.05.1/lib/PM820pl.upp /usr/share/ghostscript/10.05.1/lib/st640pl.upp /usr/share/ghostscript/10.05.1/lib/gs_l.xpm /usr/share/ghostscript/10.05.1/lib/gs_m.xpm /usr/share/ghostscript/10.05.1/lib/bjc610a3.upp /usr/share/ghostscript/10.05.1/lib/gs_s.xpm /usr/share/ghostscript/10.05.1/lib/gs_t.xpm /usr/share/ghostscript/10.05.1/lib/viewjpeg.ps /usr/share/ghostscript/10.05.1/lib/st640ihg.upp /usr/share/ghostscript/10.05.1/lib/gs_css_e.ps /usr/share/ghostscript/10.05.1/lib/bjc610a6.upp /usr/share/ghostscript/10.05.1/lib/gs_wl1_e.ps /usr/share/ghostscript/10.05.1/lib/Stc777p.upp /usr/share/ghostscript/10.05.1/lib/s400a1.upp /usr/share/ghostscript/10.05.1/lib/bjc610b4.upp /usr/share/ghostscript/10.05.1/lib/gs_kanji.ps /usr/share/ghostscript/10.05.1/lib/s400b1.upp /usr/share/ghostscript/10.05.1/lib/traceimg.ps /usr/share/ghostscript/10.05.1/lib/bjc610b3.upp /usr/share/ghostscript/10.05.1/li
 b/Stc777pl.upp /usr/share/ghostscript/10.05.1/lib/traceop.ps /usr/share/ghostscript/10.05.1/lib/ras1.upp /usr/share/ghostscript/10.05.1/lib/ras3.upp /usr/share/ghostscript/10.05.1/lib/ras4.upp /usr/share/ghostscript/10.05.1/lib/bjc610a8.upp /usr/share/ghostscript/10.05.1/lib/stc2.upp /usr/share/ghostscript/10.05.1/lib/stcany.upp /usr/share/ghostscript/10.05.1/lib/bjc610a4.upp /usr/share/ghostscript/10.05.1/lib/cdj690ec.upp /usr/share/ghostscript/10.05.1/lib/landscap.ps /usr/share/ghostscript/10.05.1/lib/prfont.ps /usr/share/ghostscript/10.05.1/lib/stocht.ps /usr/share/ghostscript/10.05.1/lib/st640ih.upp /usr/share/ghostscript/10.05.1/lib/stc2s_h.upp /usr/share/ghostscript/10.05.1/lib/bjc610a1.upp /usr/share/ghostscript/10.05.1/lib/necp2x.upp /usr/share/ghostscript/10.05.1/lib/pdf2dsc.ps /usr/share/ghostscript/10.05.1/lib/zugferd.ps /usr/share/ghostscript/10.05.1/lib/PM760p.upp /usr/share/ghostscript/10.05.1/lib/PM820p.upp /usr/share/ghostscript/10.05.1/lib/st640p.upp /usr/share/ghos
 tscript/10.05.1/lib/bjc610b1.upp /usr/share/ghostscript/10.05.1/lib/winmaps.ps /usr/share/ghostscript/10.05.1/lib/stcany_h.upp /usr/share/ghostscript/10.05.1/lib/ras24.upp /usr/share/ghostscript/10.05.1/lib/ras32.upp /usr/share/ghostscript/10.05.1/lib/ras8m.upp /usr/share/ghostscript/10.05.1/lib/sharp.upp /usr/share/ghostscript/10.05.1/lib/stc_h.upp /usr/share/ghostscript/10.05.1/lib/stc_l.upp /usr/share/ghostscript/10.05.1/lib/dnj750c.upp /usr/share/ghostscript/10.05.1/lib/font2pcl.ps /usr/share/ghostscript/10.05.1/lib/ps2epsi.ps /usr/share/ghostscript/10.05.1/lib/bj8oh06n.upp /usr/share/ghostscript/10.05.1/lib/bj8pa06n.upp /usr/share/ghostscript/10.05.1/lib/bj8ts06n.upp /usr/share/ghostscript/10.05.1/lib/sipixa6.upp /usr/share/ghostscript/10.05.1/lib/stc500p.upp /usr/share/ghostscript/10.05.1/lib/stc600p.upp /usr/share/ghostscript/10.05.1/lib/stc640p.upp /usr/share/ghostscript/10.05.1/lib/stc800p.upp /usr/share/ghostscript/10.05.1/lib/Stc670p.upp /usr/share/ghostscript/10.05.1/lib
 /Stc680p.upp /usr/share/ghostscript/10.05.1/lib/Stc740p.upp /usr/share/ghostscript/10.05.1/lib/Stc760p.upp /usr/share/ghostscript/10.05.1/lib/Stp720p.upp /usr/share/ghostscript/10.05.1/lib/Stp870p.upp /usr/share/ghostscript/10.05.1/lib/st640plg.upp /usr/share/ghostscript/10.05.1/lib/printafm.ps /usr/share/ghostscript/10.05.1/lib/cdj550.upp /usr/share/ghostscript/10.05.1/lib/cdj690.upp /usr/share/ghostscript/10.05.1/lib/stc300.upp /usr/share/ghostscript/10.05.1/lib/gs_il2_e.ps /usr/share/ghostscript/10.05.1/lib/gs_wl2_e.ps /usr/share/ghostscript/10.05.1/lib/ghostpdf.ppd /usr/share/ghostscript/10.05.1/lib/bj8gc12f.upp /usr/share/ghostscript/10.05.1/lib/bj8hg12f.upp /usr/share/ghostscript/10.05.1/lib/bj8pp12f.upp /usr/share/ghostscript/10.05.1/lib/image-qa.ps /usr/share/ghostscript/10.05.1/lib/bjc610b2.upp /usr/share/ghostscript/10.05.1/lib/gs_lgo_e.ps /usr/share/ghostscript/10.05.1/lib/gs_ce_e.ps /usr/share/ghostscript/10.05.1/lib/rollconv.ps /usr/share/ghostscript/10.05.1/lib/acctest
 .ps"
packages/core2-64-poky-linux/ghostscript/ghostscript: PKGSIZE changed from 92669291 to 92678810 (+0%)
packages/core2-64-poky-linux/ghostscript/ghostscript: PV changed from "10.05.0" to "10.05.1"
packages/core2-64-poky-linux/ghostscript: PKGV changed from 10.05.0 [default] to 10.05.1 [default]
packages/core2-64-poky-linux/ghostscript: SRC_URI changed from "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10050/ghostscript-10.05.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch" to "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/ghostscript-10.05.1.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch"
packages/core2-64-poky-linux/ghostscript: PV changed from "10.05.0" to "10.05.1"
Changes to packages/core2-64-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.05.0 moved to /usr/share/ghostscript/10.05.1
  /usr/share/ghostscript/10.05.1/lib/pdf2dsc.ps was added

--===============5872557756189594273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.05.0/Resource/Encoding -> /usr/share/ghostscript/10.05.1/Resource/Encoding, directory renamed /usr/share/ghostscript/10.05.0/Resource/IdiomSet -> /usr/share/ghostscript/10.05.1/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.05.0/Resource/Init -> /usr/share/ghostscript/10.05.1/Resource/Init, directory renamed /usr/share/ghostscript/10.05.0/Resource/ColorSpace -> /usr/share/ghostscript/10.05.1/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.05.0/Resource/Font -> /usr/share/ghostscript/10.05.1/Resource/Font, directory renamed /usr/share/ghostscript/10.05.0/Resource/CMap -> /usr/share/ghostscript/10.05.1/Resource/CMap, directory renamed /usr/share/ghostscript/10.05.0/iccprofiles -> /usr/share/ghostscript/10.05.1/iccprofiles, directory renamed /usr/share/ghostscript/10.05.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.05.1/Resource/CIDFSubst, dire
 ctory renamed /usr/share/ghostscript/10.05.0/Resource/SubstCID -> /usr/share/ghostscript/10.05.1/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.05.0/Resource/CIDFont -> /usr/share/ghostscript/10.05.1/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.05.0/Resource/Decoding -> /usr/share/ghostscript/10.05.1/Resource/Decoding, removed "/usr/share/ghostscript/10.05.0/lib/stc2s_h.upp /usr/share/ghostscript/10.05.0/lib/st640ih.upp /usr/share/ghostscript/10.05.0/lib/Stc680p.upp /usr/share/ghostscript/10.05.0/lib/Stc670p.upp /usr/share/ghostscript/10.05.0/lib/Stc740p.upp /usr/share/ghostscript/10.05.0/lib/Stc760p.upp /usr/share/ghostscript/10.05.0/lib/Stp720p.upp /usr/share/ghostscript/10.05.0/lib/Stp870p.upp /usr/share/ghostscript/10.05.0/lib/bjc610a3.upp /usr/share/ghostscript/10.05.0/lib/cbjc800.ppd /usr/share/ghostscript/10.05.0/lib/zeroline.ps /usr/share/ghostscript/10.05.0/lib/cbjc600.ppd /usr/share/ghostscript/10.05.0/lib/acctest.ps /usr/share/ghostscript/
 10.05.0/lib/bjc6000a1.upp /usr/share/ghostscript/10.05.0/lib/viewcmyk.ps /usr/share/ghostscript/10.05.0/lib/bjc610a6.upp /usr/share/ghostscript/10.05.0/lib/gs_lgo_e.ps /usr/share/ghostscript/10.05.0/lib/gs_l.xpm /usr/share/ghostscript/10.05.0/lib/gs_m.xpm /usr/share/ghostscript/10.05.0/lib/gs_s.xpm /usr/share/ghostscript/10.05.0/lib/gs_t.xpm /usr/share/ghostscript/10.05.0/lib/bjc610a8.upp /usr/share/ghostscript/10.05.0/lib/Stc777p.upp /usr/share/ghostscript/10.05.0/lib/dnj750m.upp /usr/share/ghostscript/10.05.0/lib/gs_l.xbm /usr/share/ghostscript/10.05.0/lib/gs_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_s.xbm /usr/share/ghostscript/10.05.0/lib/gs_t.xbm /usr/share/ghostscript/10.05.0/lib/bjc6000b1.upp /usr/share/ghostscript/10.05.0/lib/bjc610b2.upp /usr/share/ghostscript/10.05.0/lib/ps2epsi.ps /usr/share/ghostscript/10.05.0/lib/prfont.ps /usr/share/ghostscript/10.05.0/lib/stocht.ps /usr/share/ghostscript/10.05.0/lib/bjc610a4.upp /usr/share/ghostscript/10.05.0/lib/stcinfo.ps /usr/sha
 re/ghostscript/10.05.0/lib/viewpbm.ps /usr/share/ghostscript/10.05.0/lib/dnj750c.upp /usr/share/ghostscript/10.05.0/lib/st640plg.upp /usr/share/ghostscript/10.05.0/lib/gs_l_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_m_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_s_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_t_m.xbm /usr/share/ghostscript/10.05.0/lib/gs_wl5_e.ps /usr/share/ghostscript/10.05.0/lib/necp2x6.upp /usr/share/ghostscript/10.05.0/lib/bj8oh06n.upp /usr/share/ghostscript/10.05.0/lib/bj8pa06n.upp /usr/share/ghostscript/10.05.0/lib/bj8ts06n.upp /usr/share/ghostscript/10.05.0/lib/ras1.upp /usr/share/ghostscript/10.05.0/lib/ras3.upp /usr/share/ghostscript/10.05.0/lib/ras4.upp /usr/share/ghostscript/10.05.0/lib/stc2.upp /usr/share/ghostscript/10.05.0/lib/Stc777pl.upp /usr/share/ghostscript/10.05.0/lib/viewpcx.ps /usr/share/ghostscript/10.05.0/lib/bjc610b4.upp /usr/share/ghostscript/10.05.0/lib/viewjpeg.ps /usr/share/ghostscript/10.05.0/lib/stcany_h.upp /usr/share/ghostscript/10.05.
 0/lib/PM760p.upp /usr/share/ghostscript/10.05.0/lib/PM820p.upp /usr/share/ghostscript/10.05.0/lib/st640p.upp /usr/share/ghostscript/10.05.0/lib/stcany.upp /usr/share/ghostscript/10.05.0/lib/caption.ps /usr/share/ghostscript/10.05.0/lib/printafm.ps /usr/share/ghostscript/10.05.0/lib/gs_ce_e.ps /usr/share/ghostscript/10.05.0/lib/gs_ksb_e.ps /usr/share/ghostscript/10.05.0/lib/jispaper.ps /usr/share/ghostscript/10.05.0/lib/Stp870pl.upp /usr/share/ghostscript/10.05.0/lib/image-qa.ps /usr/share/ghostscript/10.05.0/lib/stc600pl.upp /usr/share/ghostscript/10.05.0/lib/stc800pl.upp /usr/share/ghostscript/10.05.0/lib/Stc670pl.upp /usr/share/ghostscript/10.05.0/lib/Stc680pl.upp /usr/share/ghostscript/10.05.0/lib/Stc740pl.upp /usr/share/ghostscript/10.05.0/lib/Stc760pl.upp /usr/share/ghostscript/10.05.0/lib/Stp720pl.upp /usr/share/ghostscript/10.05.0/lib/stc2_h.upp /usr/share/ghostscript/10.05.0/lib/PM820pl.upp /usr/share/ghostscript/10.05.0/lib/PM760pl.upp /usr/share/ghostscript/10.05.0/lib/st6
 40pl.upp /usr/share/ghostscript/10.05.0/lib/ghostpdf.ppd /usr/share/ghostscript/10.05.0/lib/stc500ph.upp /usr/share/ghostscript/10.05.0/lib/cid2code.ps /usr/share/ghostscript/10.05.0/lib/pdf_info.ps /usr/share/ghostscript/10.05.0/lib/PDFA_def.ps /usr/share/ghostscript/10.05.0/lib/PDFX_def.ps /usr/share/ghostscript/10.05.0/lib/cdj690ec.upp /usr/share/ghostscript/10.05.0/lib/winmaps.ps /usr/share/ghostscript/10.05.0/lib/necp2x.upp /usr/share/ghostscript/10.05.0/lib/stc.upp /usr/share/ghostscript/10.05.0/lib/traceimg.ps /usr/share/ghostscript/10.05.0/lib/gslp.ps /usr/share/ghostscript/10.05.0/lib/pf2afm.ps /usr/share/ghostscript/10.05.0/lib/pphs.ps /usr/share/ghostscript/10.05.0/lib/gs_kanji.ps /usr/share/ghostscript/10.05.0/lib/bj8.rpd /usr/share/ghostscript/10.05.0/lib/st640pg.upp /usr/share/ghostscript/10.05.0/lib/bjc610a5.upp /usr/share/ghostscript/10.05.0/lib/stcolor.ps /usr/share/ghostscript/10.05.0/lib/stc1520h.upp /usr/share/ghostscript/10.05.0/lib/viewps2a.ps /usr/share/ghosts
 cript/10.05.0/lib/traceop.ps /usr/share/ghostscript/10.05.0/lib/bjc610a7.upp /usr/share/ghostscript/10.05.0/lib/gs_wl1_e.ps /usr/share/ghostscript/10.05.0/lib/bjc610a2.upp /usr/share/ghostscript/10.05.0/lib/stc600ih.upp /usr/share/ghostscript/10.05.0/lib/stc740ih.upp /usr/share/ghostscript/10.05.0/lib/stc800ih.upp /usr/share/ghostscript/10.05.0/lib/rollconv.ps /usr/share/ghostscript/10.05.0/lib/landscap.ps /usr/share/ghostscript/10.05.0/lib/bjc610b8.upp /usr/share/ghostscript/10.05.0/lib/ras24.upp /usr/share/ghostscript/10.05.0/lib/cdj550.upp /usr/share/ghostscript/10.05.0/lib/cdj690.upp /usr/share/ghostscript/10.05.0/lib/ras32.upp /usr/share/ghostscript/10.05.0/lib/ras8m.upp /usr/share/ghostscript/10.05.0/lib/sharp.upp /usr/share/ghostscript/10.05.0/lib/stc300.upp /usr/share/ghostscript/10.05.0/lib/stc_h.upp /usr/share/ghostscript/10.05.0/lib/stc_l.upp /usr/share/ghostscript/10.05.0/lib/uninfo.ps /usr/share/ghostscript/10.05.0/lib/viewgif.ps /usr/share/ghostscript/10.05.0/lib/st640
 ihg.upp /usr/share/ghostscript/10.05.0/lib/viewmiff.ps /usr/share/ghostscript/10.05.0/lib/gs_css_e.ps /usr/share/ghostscript/10.05.0/lib/bjc610a1.upp /usr/share/ghostscript/10.05.0/lib/bjc610b7.upp /usr/share/ghostscript/10.05.0/lib/zugferd.ps /usr/share/ghostscript/10.05.0/lib/pfbtopfa.ps /usr/share/ghostscript/10.05.0/lib/ht_ccsto.ps /usr/share/ghostscript/10.05.0/lib/bjc610a0.upp /usr/share/ghostscript/10.05.0/lib/bjc610b3.upp /usr/share/ghostscript/10.05.0/lib/gs_lgx_e.ps /usr/share/ghostscript/10.05.0/lib/s400a1.upp /usr/share/ghostscript/10.05.0/lib/s400b1.upp /usr/share/ghostscript/10.05.0/lib/stc200_h.upp /usr/share/ghostscript/10.05.0/lib/stc300bl.upp /usr/share/ghostscript/10.05.0/lib/bjc610b6.upp /usr/share/ghostscript/10.05.0/lib/bj8gc12f.upp /usr/share/ghostscript/10.05.0/lib/bj8hg12f.upp /usr/share/ghostscript/10.05.0/lib/bj8pp12f.upp /usr/share/ghostscript/10.05.0/lib/sipixa6.upp /usr/share/ghostscript/10.05.0/lib/stc300bm.upp /usr/share/ghostscript/10.05.0/lib/stc500
 p.upp /usr/share/ghostscript/10.05.0/lib/stc600p.upp /usr/share/ghostscript/10.05.0/lib/stc640p.upp /usr/share/ghostscript/10.05.0/lib/stc800p.upp /usr/share/ghostscript/10.05.0/lib/bjc610b1.upp /usr/share/ghostscript/10.05.0/lib/align.ps /usr/share/ghostscript/10.05.0/lib/docie.ps /usr/share/ghostscript/10.05.0/lib/gs_il2_e.ps /usr/share/ghostscript/10.05.0/lib/gs_wl2_e.ps /usr/share/ghostscript/10.05.0/lib/gsnup.ps /usr/share/ghostscript/10.05.0/lib/lines.ps /usr/share/ghostscript/10.05.0/lib/ppath.ps /usr/share/ghostscript/10.05.0/lib/ps2ai.ps /usr/share/ghostscript/10.05.0/lib/font2pcl.ps /usr/share/ghostscript/10.05.0/lib/mkcidfm.ps", added "/usr/share/ghostscript/10.05.1/lib/stc2s_h.upp /usr/share/ghostscript/10.05.1/lib/st640ih.upp /usr/share/ghostscript/10.05.1/lib/Stc680p.upp /usr/share/ghostscript/10.05.1/lib/Stc670p.upp /usr/share/ghostscript/10.05.1/lib/Stc740p.upp /usr/share/ghostscript/10.05.1/lib/Stc760p.upp /usr/share/ghostscript/10.05.1/lib/Stp720p.upp /usr/share/gh
 ostscript/10.05.1/lib/Stp870p.upp /usr/share/ghostscript/10.05.1/lib/bjc610a3.upp /usr/share/ghostscript/10.05.1/lib/cbjc800.ppd /usr/share/ghostscript/10.05.1/lib/zeroline.ps /usr/share/ghostscript/10.05.1/lib/cbjc600.ppd /usr/share/ghostscript/10.05.1/lib/acctest.ps /usr/share/ghostscript/10.05.1/lib/bjc6000a1.upp /usr/share/ghostscript/10.05.1/lib/viewcmyk.ps /usr/share/ghostscript/10.05.1/lib/bjc610a6.upp /usr/share/ghostscript/10.05.1/lib/gs_lgo_e.ps /usr/share/ghostscript/10.05.1/lib/gs_l.xpm /usr/share/ghostscript/10.05.1/lib/gs_m.xpm /usr/share/ghostscript/10.05.1/lib/gs_s.xpm /usr/share/ghostscript/10.05.1/lib/gs_t.xpm /usr/share/ghostscript/10.05.1/lib/bjc610a8.upp /usr/share/ghostscript/10.05.1/lib/Stc777p.upp /usr/share/ghostscript/10.05.1/lib/dnj750m.upp /usr/share/ghostscript/10.05.1/lib/gs_l.xbm /usr/share/ghostscript/10.05.1/lib/gs_m.xbm /usr/share/ghostscript/10.05.1/lib/gs_s.xbm /usr/share/ghostscript/10.05.1/lib/gs_t.xbm /usr/share/ghostscript/10.05.1/lib/bjc6000b
 1.upp /usr/share/ghostscript/10.05.1/lib/bjc610b2.upp /usr/bin/pdf2dsc /usr/share/ghostscript/10.05.1/lib/ps2epsi.ps /usr/share/ghostscript/10.05.1/lib/prfont.ps /usr/share/ghostscript/10.05.1/lib/stocht.ps /usr/share/ghostscript/10.05.1/lib/bjc610a4.upp /usr/share/ghostscript/10.05.1/lib/stcinfo.ps /usr/share/ghostscript/10.05.1/lib/viewpbm.ps /usr/share/ghostscript/10.05.1/lib/dnj750c.upp /usr/share/ghostscript/10.05.1/lib/st640plg.upp /usr/share/ghostscript/10.05.1/lib/gs_l_m.xbm /usr/share/ghostscript/10.05.1/lib/gs_m_m.xbm /usr/share/ghostscript/10.05.1/lib/gs_s_m.xbm /usr/share/ghostscript/10.05.1/lib/gs_t_m.xbm /usr/share/ghostscript/10.05.1/lib/gs_wl5_e.ps /usr/share/ghostscript/10.05.1/lib/necp2x6.upp /usr/share/ghostscript/10.05.1/lib/bj8oh06n.upp /usr/share/ghostscript/10.05.1/lib/bj8pa06n.upp /usr/share/ghostscript/10.05.1/lib/bj8ts06n.upp /usr/share/ghostscript/10.05.1/lib/ras1.upp /usr/share/ghostscript/10.05.1/lib/ras3.upp /usr/share/ghostscript/10.05.1/lib/ras4.upp /
 usr/share/ghostscript/10.05.1/lib/stc2.upp /usr/share/ghostscript/10.05.1/lib/Stc777pl.upp /usr/share/ghostscript/10.05.1/lib/viewpcx.ps /usr/share/ghostscript/10.05.1/lib/bjc610b4.upp /usr/share/ghostscript/10.05.1/lib/viewjpeg.ps /usr/share/ghostscript/10.05.1/lib/stcany_h.upp /usr/share/ghostscript/10.05.1/lib/PM760p.upp /usr/share/ghostscript/10.05.1/lib/PM820p.upp /usr/share/ghostscript/10.05.1/lib/st640p.upp /usr/share/ghostscript/10.05.1/lib/stcany.upp /usr/share/ghostscript/10.05.1/lib/caption.ps /usr/share/ghostscript/10.05.1/lib/printafm.ps /usr/share/ghostscript/10.05.1/lib/gs_ce_e.ps /usr/share/ghostscript/10.05.1/lib/gs_ksb_e.ps /usr/share/ghostscript/10.05.1/lib/jispaper.ps /usr/share/ghostscript/10.05.1/lib/Stp870pl.upp /usr/share/ghostscript/10.05.1/lib/image-qa.ps /usr/share/ghostscript/10.05.1/lib/stc600pl.upp /usr/share/ghostscript/10.05.1/lib/stc800pl.upp /usr/share/ghostscript/10.05.1/lib/Stc670pl.upp /usr/share/ghostscript/10.05.1/lib/Stc680pl.upp /usr/share/gh
 ostscript/10.05.1/lib/Stc740pl.upp /usr/share/ghostscript/10.05.1/lib/Stc760pl.upp /usr/share/ghostscript/10.05.1/lib/Stp720pl.upp /usr/share/ghostscript/10.05.1/lib/stc2_h.upp /usr/share/ghostscript/10.05.1/lib/PM820pl.upp /usr/share/ghostscript/10.05.1/lib/PM760pl.upp /usr/share/ghostscript/10.05.1/lib/st640pl.upp /usr/share/ghostscript/10.05.1/lib/ghostpdf.ppd /usr/share/ghostscript/10.05.1/lib/stc500ph.upp /usr/share/ghostscript/10.05.1/lib/cid2code.ps /usr/share/ghostscript/10.05.1/lib/pdf_info.ps /usr/share/ghostscript/10.05.1/lib/PDFA_def.ps /usr/share/ghostscript/10.05.1/lib/PDFX_def.ps /usr/share/ghostscript/10.05.1/lib/cdj690ec.upp /usr/share/ghostscript/10.05.1/lib/winmaps.ps /usr/share/ghostscript/10.05.1/lib/necp2x.upp /usr/share/ghostscript/10.05.1/lib/stc.upp /usr/share/ghostscript/10.05.1/lib/traceimg.ps /usr/share/ghostscript/10.05.1/lib/gslp.ps /usr/share/ghostscript/10.05.1/lib/pf2afm.ps /usr/share/ghostscript/10.05.1/lib/pphs.ps /usr/share/ghostscript/10.05.1/lib
 /gs_kanji.ps /usr/share/ghostscript/10.05.1/lib/bj8.rpd /usr/share/ghostscript/10.05.1/lib/st640pg.upp /usr/share/ghostscript/10.05.1/lib/bjc610a5.upp /usr/share/ghostscript/10.05.1/lib/stcolor.ps /usr/share/ghostscript/10.05.1/lib/stc1520h.upp /usr/share/ghostscript/10.05.1/lib/viewps2a.ps /usr/share/ghostscript/10.05.1/lib/traceop.ps /usr/share/ghostscript/10.05.1/lib/bjc610a7.upp /usr/share/ghostscript/10.05.1/lib/gs_wl1_e.ps /usr/share/ghostscript/10.05.1/lib/pdf2dsc.ps /usr/share/ghostscript/10.05.1/lib/bjc610a2.upp /usr/share/ghostscript/10.05.1/lib/stc600ih.upp /usr/share/ghostscript/10.05.1/lib/stc740ih.upp /usr/share/ghostscript/10.05.1/lib/stc800ih.upp /usr/share/ghostscript/10.05.1/lib/rollconv.ps /usr/share/ghostscript/10.05.1/lib/landscap.ps /usr/share/ghostscript/10.05.1/lib/bjc610b8.upp /usr/share/ghostscript/10.05.1/lib/ras24.upp /usr/share/ghostscript/10.05.1/lib/cdj550.upp /usr/share/ghostscript/10.05.1/lib/cdj690.upp /usr/share/ghostscript/10.05.1/lib/ras32.upp /u
 sr/share/ghostscript/10.05.1/lib/ras8m.upp /usr/share/ghostscript/10.05.1/lib/sharp.upp /usr/share/ghostscript/10.05.1/lib/stc300.upp /usr/share/ghostscript/10.05.1/lib/stc_h.upp /usr/share/ghostscript/10.05.1/lib/stc_l.upp /usr/share/ghostscript/10.05.1/lib/uninfo.ps /usr/share/ghostscript/10.05.1/lib/viewgif.ps /usr/share/ghostscript/10.05.1/lib/st640ihg.upp /usr/share/ghostscript/10.05.1/lib/viewmiff.ps /usr/share/ghostscript/10.05.1/lib/gs_css_e.ps /usr/share/ghostscript/10.05.1/lib/bjc610a1.upp /usr/share/ghostscript/10.05.1/lib/bjc610b7.upp /usr/share/ghostscript/10.05.1/lib/zugferd.ps /usr/share/ghostscript/10.05.1/lib/pfbtopfa.ps /usr/share/ghostscript/10.05.1/lib/ht_ccsto.ps /usr/share/ghostscript/10.05.1/lib/bjc610a0.upp /usr/share/ghostscript/10.05.1/lib/bjc610b3.upp /usr/share/ghostscript/10.05.1/lib/gs_lgx_e.ps /usr/share/ghostscript/10.05.1/lib/s400a1.upp /usr/share/ghostscript/10.05.1/lib/s400b1.upp /usr/share/ghostscript/10.05.1/lib/stc200_h.upp /usr/share/ghostscrip
 t/10.05.1/lib/stc300bl.upp /usr/share/ghostscript/10.05.1/lib/bjc610b6.upp /usr/share/ghostscript/10.05.1/lib/bj8gc12f.upp /usr/share/ghostscript/10.05.1/lib/bj8hg12f.upp /usr/share/ghostscript/10.05.1/lib/bj8pp12f.upp /usr/share/ghostscript/10.05.1/lib/sipixa6.upp /usr/share/ghostscript/10.05.1/lib/stc300bm.upp /usr/share/ghostscript/10.05.1/lib/stc500p.upp /usr/share/ghostscript/10.05.1/lib/stc600p.upp /usr/share/ghostscript/10.05.1/lib/stc640p.upp /usr/share/ghostscript/10.05.1/lib/stc800p.upp /usr/share/ghostscript/10.05.1/lib/bjc610b1.upp /usr/share/ghostscript/10.05.1/lib/align.ps /usr/share/ghostscript/10.05.1/lib/docie.ps /usr/share/ghostscript/10.05.1/lib/gs_il2_e.ps /usr/share/ghostscript/10.05.1/lib/gs_wl2_e.ps /usr/share/ghostscript/10.05.1/lib/gsnup.ps /usr/share/ghostscript/10.05.1/lib/lines.ps /usr/share/ghostscript/10.05.1/lib/ppath.ps /usr/share/ghostscript/10.05.1/lib/ps2ai.ps /usr/share/ghostscript/10.05.1/lib/font2pcl.ps /usr/share/ghostscript/10.05.1/lib/mkcidfm
 .ps"
Changes to packages/core2-64-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.05.0 moved to /usr/share/ghostscript/10.05.1
  /usr/share/ghostscript/10.05.1/lib/pdf2dsc.ps was added

--===============5872557756189594273==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.05.0-10.05.1.patch"

RnJvbSA5MGM4Yzc1M2E1MjdjZWRmMDcwMTg4Y2FlNzE4MWY4OGNjYjhlZmY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMDo0MDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdo
b3N0c2NyaXB0OiB1cGdyYWRlIDEwLjA1LjAgLT4gMTAuMDUuMQoKLS0tCiAuLi5GaXgtY29tcGF0
aWJpbGl0eS13aXRoLUMyMy1jb21waWxlcnMucGF0Y2ggfCA0MyArKysrKysrKysrLS0tLS0tLS0t
CiAuLi4vYXZvaWQtaG9zdC1jb250YW1pbmF0aW9uLnBhdGNoICAgICAgICAgICAgfCAgMiArLQog
Li4uL2dob3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoIHwgIDIgKy0KIC4u
LnJpcHRfMTAuMDUuMC5iYiA9PiBnaG9zdHNjcmlwdF8xMC4wNS4xLmJifSB8ICAyICstCiA0IGZp
bGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC97Z2hvc3RzY3JpcHRfMTAuMDUuMC5iYiA9
PiBnaG9zdHNjcmlwdF8xMC4wNS4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC8wMDAxLUJ1Zy03MDgxNjAtRml4LWNv
bXBhdGliaWxpdHktd2l0aC1DMjMtY29tcGlsZXJzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0LzAwMDEtQnVnLTcwODE2MC1GaXgtY29tcGF0aWJp
bGl0eS13aXRoLUMyMy1jb21waWxlcnMucGF0Y2gKaW5kZXggNzhmM2ZjMWMzNC4uOGQ2ZjJmN2Nl
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2Ny
aXB0LzAwMDEtQnVnLTcwODE2MC1GaXgtY29tcGF0aWJpbGl0eS13aXRoLUMyMy1jb21waWxlcnMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0
LzAwMDEtQnVnLTcwODE2MC1GaXgtY29tcGF0aWJpbGl0eS13aXRoLUMyMy1jb21waWxlcnMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM1OTUwODZiZmUyMDY3NzY2NzZlMjkwZGY5OGNkMDll
OTEyMTBlMjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJjMzM2ODliMjE3NmMwNmMx
OTkxYjQwZGNjMzM2YjYwNjliMjlkMWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4IENoZXJlcGFub3YgPGFsZXhAY29zY3JpcHQuYml6PgogRGF0ZTogVGh1LCAzIEFwciAyMDI1
IDE3OjE5OjQxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEJ1ZyA3MDgxNjA6IEZpeCBjb21wYXRp
YmlsaXR5IHdpdGggQzIzIGNvbXBpbGVycwpAQCAtMjIsOSArMjIsMjkgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBCYWNrcG9ydCBbUGFydGlhbCBiYWNrcG9ydCBvZiBodHRwczovL2NnaXQuZ2hvc3RzY3Jp
cHQuY29tL2NnaS0KIAogU2lnbmVkLW9mZi1ieTogTWFydGluIEphbnNhIDxtYXJ0aW4uamFuc2FA
Z21haWwuY29tPgogLS0tCisgYmFzZS9ncC5oICAgICB8IDQgKystLQogIGJhc2Uvc3RkcHJlLmgg
fCA2ICsrKystLQotIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCisgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiAK
K2RpZmYgLS1naXQgYS9iYXNlL2dwLmggYi9iYXNlL2dwLmgKK2luZGV4IGFkNWJiNjEuLmNmMmM5
Y2YgMTAwNjQ0CistLS0gYS9iYXNlL2dwLmgKKysrKyBiL2Jhc2UvZ3AuaAorQEAgLTEsNCArMSw0
IEBACistLyogQ29weXJpZ2h0IChDKSAyMDAxLTIwMjMgQXJ0aWZleCBTb2Z0d2FyZSwgSW5jLgor
Ky8qIENvcHlyaWdodCAoQykgMjAwMS0yMDI1IEFydGlmZXggU29mdHdhcmUsIEluYy4KKyAgICBB
bGwgUmlnaHRzIFJlc2VydmVkLgorIAorICAgIFRoaXMgc29mdHdhcmUgaXMgcHJvdmlkZWQgQVMt
SVMgd2l0aCBubyB3YXJyYW50eSwgZWl0aGVyIGV4cHJlc3Mgb3IKK0BAIC02NDYsNyArNjQ2LDcg
QEAgaW50IGdwX2ZzZWVrX2ltcGwoRklMRSAqc3RybSwgZ3Nfb2Zmc2V0X3Qgb2Zmc2V0LCBpbnQg
b3JpZ2luKTsKKyAvKiBDcmVhdGUgYSBzZWNvbmQgb3BlbiBncF9maWxlIG9uIHRoZSBiYXNpcyBv
ZiBhIGdpdmVuIG9uZSAqLworIEZJTEUgKmdwX2ZkdXBfaW1wbChGSUxFICpmLCBjb25zdCBjaGFy
ICptb2RlKTsKKyAKKy1pbnQgZ3BfZnNlZWthYmxlX2ltcGwoRklMRSAqZik7CisrYm9vbCBncF9m
c2Vla2FibGVfaW1wbChGSUxFICpmKTsKKyAKKyAvKiBGb3JjZSBnaXZlbiBmaWxlIGludG8gYmlu
YXJ5IG1vZGUgKG5vIGVvbCB0cmFuc2xhdGlvbnMsIGV0YykgKi8KKyAvKiBpZiAybmQgcGFyYW0g
dHJ1ZSwgdGV4dCBtb2RlIGlmIDJuZCBwYXJhbSBmYWxzZSAqLwogZGlmZiAtLWdpdCBhL2Jhc2Uv
c3RkcHJlLmggYi9iYXNlL3N0ZHByZS5oCiBpbmRleCBkZGEzMGI2Li4yZjljODRlIDEwMDY0NAog
LS0tIGEvYmFzZS9zdGRwcmUuaApAQCAtNDYsMjIgKzY2LDMgQEAgaW5kZXggZGRhMzBiNi4uMmY5
Yzg0ZSAxMDA2NDQKICAjaWZkZWYgX19CRU9TX18KICB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgYm9v
bDsKICAjZWxzZQotZGlmZiAtLWdpdCBhL2Jhc2UvZ3AuaCBiL2Jhc2UvZ3AuaAotaW5kZXggYWQ1
YmI2MS4uY2YyYzljZiAxMDA2NDQKLS0tLSBhL2Jhc2UvZ3AuaAotKysrIGIvYmFzZS9ncC5oCi1A
QCAtMSw0ICsxLDQgQEAKLS0vKiBDb3B5cmlnaHQgKEMpIDIwMDEtMjAyMyBBcnRpZmV4IFNvZnR3
YXJlLCBJbmMuCi0rLyogQ29weXJpZ2h0IChDKSAyMDAxLTIwMjUgQXJ0aWZleCBTb2Z0d2FyZSwg
SW5jLgotICAgIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCi0gCi0gICAgVGhpcyBzb2Z0d2FyZSBpcyBw
cm92aWRlZCBBUy1JUyB3aXRoIG5vIHdhcnJhbnR5LCBlaXRoZXIgZXhwcmVzcyBvcgotQEAgLTY0
Niw3ICs2NDYsNyBAQCBpbnQgZ3BfZnNlZWtfaW1wbChGSUxFICpzdHJtLCBnc19vZmZzZXRfdCBv
ZmZzZXQsIGludCBvcmlnaW4pOwotIC8qIENyZWF0ZSBhIHNlY29uZCBvcGVuIGdwX2ZpbGUgb24g
dGhlIGJhc2lzIG9mIGEgZ2l2ZW4gb25lICovCi0gRklMRSAqZ3BfZmR1cF9pbXBsKEZJTEUgKmYs
IGNvbnN0IGNoYXIgKm1vZGUpOwotIAotLWludCBncF9mc2Vla2FibGVfaW1wbChGSUxFICpmKTsK
LStib29sIGdwX2ZzZWVrYWJsZV9pbXBsKEZJTEUgKmYpOwotIAotIC8qIEZvcmNlIGdpdmVuIGZp
bGUgaW50byBiaW5hcnkgbW9kZSAobm8gZW9sIHRyYW5zbGF0aW9ucywgZXRjKSAqLwotIC8qIGlm
IDJuZCBwYXJhbSB0cnVlLCB0ZXh0IG1vZGUgaWYgMm5kIHBhcmFtIGZhbHNlICovCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvYXZvaWQt
aG9zdC1jb250YW1pbmF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2Ny
aXB0L2dob3N0c2NyaXB0L2F2b2lkLWhvc3QtY29udGFtaW5hdGlvbi5wYXRjaAppbmRleCBkMTkx
MjMxYzdiLi4zN2FmZmRjMDZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hv
c3RzY3JpcHQvZ2hvc3RzY3JpcHQvYXZvaWQtaG9zdC1jb250YW1pbmF0aW9uLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9hdm9pZC1ob3N0
LWNvbnRhbWluYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg1OTA1Y2UzYjFiYzYz
ZjBiZTllZGE5ODg4ZTQwZDhlN2E4MDNkMjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGE2NTVkNzhjMmNlYzYyZTc2OGUxMDJmZGQwMzdlMDM5NzBiMzJhZDEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6
IFRodSwgMjkgTWFyIDIwMTggMTY6MDI6MDUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXZvaWQg
aG9zdCBjb250YW1pbmF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hv
c3RzY3JpcHQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQtOS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvZ2hv
c3RzY3JpcHQtOS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUucGF0Y2gKaW5kZXggMDU5OGMzZGNkMi4u
MmJiNjVlMThmOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0
L2dob3N0c2NyaXB0L2dob3N0c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9naG9zdHNj
cmlwdC05LjE2LVdlcnJvci1yZXR1cm4tdHlwZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
YzIzYjc4N2Y5YTM4YmUyY2RjNTcxMzM5MTVjNDAyYjY5YWNlZGQxYSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZjA3ZWUzMDhmODM2ODI3OGI4MTI3ZDU4ZWY2MDBjYjEyNmZlMWM1OSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3
aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCA0IE1heSAyMDE1IDIyOjMxOjQ4IC0wNzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGJhc2UvZ2VuZGV2LmM6IGZpeCBmb3IgLVdlcnJvcj1yZXR1cm4tdHlwZQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0
XzEwLjA1LjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3Jp
cHRfMTAuMDUuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDUuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjA1LjEuYmIK
aW5kZXggYzBlMjY1NDcwMS4uOGYxMzJkNTVjNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjA1LjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjA1LjEuYmIKQEAgLTI4LDcg
KzI4LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vQXJ0aWZleFNvZnR3YXJlL2do
b3N0cGRsLWRvd25sb2Fkcy9yZWxlYXNlcy9kb3dubG8KICAgICAgICAgICAgZmlsZTovLzAwMDEt
QnVnLTcwODE2MC1GaXgtY29tcGF0aWJpbGl0eS13aXRoLUMyMy1jb21waWxlcnMucGF0Y2ggXAog
ICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NmU3NzgzM2RlNjgzODI1YzQy
MGQwYWY4Y2I5MGFhOGJhN2RhNzFlYTZmYjU2MjQyOTBjYmMxYjUzZmU3OTQyIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjEyMTg2MWI2ZDI5YjI0NjFkZWM2NTc1YzlmM2NhYjY2NWI4MTBiZDQwOGQ0
ZWMwMmM4NjcxOWZhNzA4YjBhNDkiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09O
RklHW2d0a10gPSAiLS1lbmFibGUtZ3RrLC0tZGlzYWJsZS1ndGssZ3RrKzMiCi0tIAoyLjQ3LjEK
Cg==

--===============5872557756189594273==--

