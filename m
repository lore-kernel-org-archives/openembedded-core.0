Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AF6C3271E
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1274.1715794337841958544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aTxUYIFj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RD+lmNxi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f7d4fdd4e-c3027901-46fc-4acf-8053-a41ae3d52c35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=I0c2zIcEiaF8Ehtgp38thD9RSuz6E8YG/a1upRtUjqw=;
	b=aTxUYIFjF57Dl/Zw+MrcSJxTLUyvm5jiowxPsgpJmVDyBirYtxkH6OvvhFYzSgAK
	OfMs2P9o6qI+92+tboey5xPbURO0kZWCawQVjzEjQse4qz9rkJSkmGq5JZtKoOx+FFA
	QemxGwlrDptFXxlstxeDAUj6kWN5eI3FeeD/CCIc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=I0c2zIcEiaF8Ehtgp38thD9RSuz6E8YG/a1upRtUjqw=;
	b=RD+lmNximl/MUJ+fnxPF2jA2vCUn3xm18ep3H06WW1ws08KaDDyrRiV+69fVtpnX
	sw0/LYEWeXrEnDmMBGPzmcSaas75qoglL6D1JYx73vN0eAEQjxljGSXRwIqeZYQhMoR
	mmXI7M5sDKGwdKOlJBJBf8qd7/kDo5ZJxlxuKFNA=
Content-Type: multipart/mixed; boundary="===============3366687850722118542=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.29.3 FAILED
Message-ID: <0101018f7d4fdd4e-c3027901-46fc-4acf-8053-a41ae3d52c35-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199319

--===============3366687850722118542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.29.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.28.3-3.29.3.patch
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
From cbd3c59c5a61c68bf8874a67d383ca22645f3592 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 08:27:50 +0000
Subject: [PATCH] cmake: upgrade 3.28.3 -> 3.29.3

---
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 .../{cmake_3.28.3.bb => cmake_3.29.3.bb}      | 31 ++++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake_3.28.3.bb => cmake_3.29.3.bb} (64%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ab9f459c05..443c97254f 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"
+SRC_URI[sha256sum] = "252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.29.3.bb
similarity index 64%
rename from meta/recipes-devtools/cmake/cmake_3.28.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.29.3.bb
index 9146fa8c0f..46546b1122 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.29.3.bb
@@ -1,7 +1,33 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- Copyright.txt
+# +++ Copyright.txt
+# @@ -1,5 +1,5 @@
+#  CMake - Cross Platform Makefile Generator
+# -Copyright 2000-2023 Kitware, Inc. and Contributors
+# +Copyright 2000-2024 Kitware, Inc. and Contributors
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 require cmake.inc
 
 inherit cmake bash-completion
 
+LIC_FILES_CHKSUM += "file://Copyright.txt;md5=718f05155941b33862726348d3cd46ce \
+                    file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
+                    file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
+                    file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
+                    file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
+                    "
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
 SRC_URI:append:class-nativesdk = " \
@@ -12,11 +38,6 @@ SRC_URI:append:class-nativesdk = " \
 "
 
 LICENSE:append = " & BSD-1-Clause & MIT"
-LIC_FILES_CHKSUM:append = " \
-    file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
-    file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
-    file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
-"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
2.44.0


--===============3366687850722118542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-6d17209bf8add0a4e0d039237dce0fd152c22a97"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6d17209bf8add0a4e0d039237dce0fd152c22a97"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 236 Local 137 Mirrors 0 Missed 99 Current 181 (58% match, 76% complete)
Removing 14 stale sstate objects for arch x86_64...done.
Removing 20 stale sstate objects for arch qemux86_64...done.
Removing 17 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 213 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 215 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 220 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 224 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 228 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 232 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 241 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 242 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 255 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 266 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 267 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 274 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 280 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 285 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 286 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 287 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 290 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 291 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 304 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 326 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 328 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 332 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 333 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 334 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 336 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-native-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 337 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 338 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 339 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 345 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 346 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 347 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 348 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-native-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 352 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-native-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 354 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 363 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 366 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 378 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-native-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 379 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 380 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-native-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 381 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 388 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 389 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: recipe rsync-native-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-native-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 393 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-native-0.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 394 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 407 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-native-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: Running task 183 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.12.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 300 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_recipe_qa)
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 426 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running task 444 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 446 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 447 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe cmake-native-3.28.3-r0: task do_recipe_qa: Started
NOTE: Running setscene task 411 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-native-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 412 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 448 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe libarchive-native-3.7.3-r0: task do_fetch: Started
NOTE: recipe libtirpc-native-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 463 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 465 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe python3-native-3.12.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 466 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 467 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 479 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe libtasn1-native-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 490 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 498 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_fetch)
NOTE: Running task 499 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Started
NOTE: Running task 514 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-native-3.8.5-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_recipe_qa unihash changed to 6b72a80bb58c6fad533620ad1998691503cb75bdd5da4e873eb45a5a84320a52
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Started
NOTE: recipe python3-native-3.12.3-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-native-3.8.5-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-native-3.12.3-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 336 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 396 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 515 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: Running task 516 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch)
NOTE: Running task 517 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 518 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_unpack)
NOTE: Running task 519 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_unpack)
NOTE: Running task 520 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 521 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 522 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: Running task 531 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_unpack)
NOTE: Running task 532 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: Running task 533 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_unpack)
NOTE: Running task 540 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: Running task 549 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_unpack)
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Started
WARNING: cmake-native-3.28.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.28.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz_bad-checksum_72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1
NOTE: recipe libarchive-native-3.7.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Started
NOTE: recipe python3-native-3.12.3-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 571 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 572 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running noexec task 574 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 576 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: Running task 577 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running task 578 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: Running task 579 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Started
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 580 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_patch)
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 581 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: Running task 612 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe libidn2-native-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe libarchive-native-3.7.3-r0: task do_patch: Started
NOTE: Running task 615 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: Running task 616 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 620 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 621 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-native-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: Running task 649 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 651 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 654 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_fetch)
WARNING: cmake-native-3.28.3-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.28/cmake-3.28.3.tar.gz - will attempt other sources if available
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.0-r0: task do_fetch: Started
NOTE: Running task 655 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_patch)
NOTE: recipe libarchive-native-3.7.3-r0: task do_patch: Succeeded
NOTE: Running task 675 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: recipe gnutls-native-3.8.5-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: Running task 676 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe util-linux-native-2.39.3-r0: task do_unpack: Succeeded
NOTE: Running task 677 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 678 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_unpack)
NOTE: Running task 679 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_patch)
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 680 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe openssl-3.3.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 681 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
WARNING: cmake-native-3.28.3-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz
Cleaning and trying again.
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
WARNING: cmake-native-3.28.3-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz_bad-checksum_72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: Running task 691 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 692 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_unpack: Succeeded
NOTE: Running task 693 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: Running task 694 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: Running task 697 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 709 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: Running task 712 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: Running task 713 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 714 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 715 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_patch)
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 716 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: Running task 720 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_patch: Started
NOTE: Running task 724 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Started
NOTE: Running task 725 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_patch)
NOTE: recipe curl-8.7.1-r0: task do_fetch: Started
NOTE: recipe python3-native-3.12.3-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 726 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_patch)
NOTE: Running task 727 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 728 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_fetch)
NOTE: Running task 730 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Started
NOTE: recipe curl-8.7.1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: Running task 732 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe python3-native-3.12.3-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 733 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe gnutls-native-3.8.5-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 735 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: Running task 736 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 737 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 738 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 739 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_unpack)
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: Running task 740 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Failed
NOTE: recipe curl-8.7.1-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.7.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.39.3-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.191-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.19.1.1-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: recipe python3-native-3.12.3-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 741 tasks of which 660 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 9 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515082619.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515082619.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.28.3-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.28/cmake-3.28.3.tar.gz
ERROR: cmake-native-3.28.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.28.3.tar.gz\' has sha256 checksum \'72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1\' when \'252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.28/cmake-3.28.3.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/3.28.3/temp/log.do_fetch.3810969
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch) failed with exit code '1'

--===============3366687850722118542==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.28.3-3.29.3.patch"

RnJvbSBjYmQzYzU5YzVhNjFjNjhiZjg4NzRhNjdkMzgzY2EyMjY0NWYzNTkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDg6Mjc6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI4LjMgLT4gMy4yOS4zCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICB8ICAyICstCiAuLi4ve2NtYWtlXzMuMjguMy5iYiA9
PiBjbWFrZV8zLjI5LjMuYmJ9ICAgICAgfCAzMSArKysrKysrKysrKysrKysrLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjI4LjMuYmIgPT4gY21ha2VfMy4yOS4zLmJi
fSAoNjQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmluZGV4IGFiOWY0NTlj
MDUuLjQ0M2M5NzI1NGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwpAQCAt
MTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5qb2luKGQuZ2V0VmFy
KCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczovL2NtYWtlLm9yZy9m
aWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIuZ3ogXAogIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNzJiNzU3MGU1Yzg1OTNkZTZhYzRhYjQzM2I3M2VhYjE4YzVm
YjMyODg4MDQ2MGM4NmNlMzI2MDgxNDFhZDVjMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNTJh
ZWUxNDQ4ZDQ5Y2FhMDQ5NTRmZDVlMjdkMTg5ZGQ1MTU3MDU1NzMxM2U3YjI4MTYzNjcxNmEyMzhi
Y2NiIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZlcj5cZCsoXC5cZCsp
KylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
XzMuMjguMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI5LjMuYmIK
c2ltaWxhcml0eSBpbmRleCA2NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlXzMuMjguMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlXzMuMjkuMy5iYgppbmRleCA5MTQ2ZmE4YzBmLi40NjU0NmIxMTIyIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4yOC4zLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI5LjMuYmIKQEAgLTEsNyArMSwzMyBAQAor
IyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5
ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJl
dHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUg
dGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGlu
CisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhh
bXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBU
aGUgY2hhbmdlczoKKyMKKyMgLS0tIENvcHlyaWdodC50eHQKKyMgKysrIENvcHlyaWdodC50eHQK
KyMgQEAgLTEsNSArMSw1IEBACisjICBDTWFrZSAtIENyb3NzIFBsYXRmb3JtIE1ha2VmaWxlIEdl
bmVyYXRvcgorIyAtQ29weXJpZ2h0IDIwMDAtMjAyMyBLaXR3YXJlLCBJbmMuIGFuZCBDb250cmli
dXRvcnMKKyMgK0NvcHlyaWdodCAyMDAwLTIwMjQgS2l0d2FyZSwgSW5jLiBhbmQgQ29udHJpYnV0
b3JzCisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQg
dXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgCisjCisK
IHJlcXVpcmUgY21ha2UuaW5jCiAKIGluaGVyaXQgY21ha2UgYmFzaC1jb21wbGV0aW9uCiAKK0xJ
Q19GSUxFU19DSEtTVU0gKz0gImZpbGU6Ly9Db3B5cmlnaHQudHh0O21kNT03MThmMDUxNTU5NDFi
MzM4NjI3MjYzNDhkM2NkNDZjZSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9Tb3VyY2Uv
Y21ha2UuaDtiZWdpbmxpbmU9MTtlbmRsaW5lPTI7bWQ1PWE1ZjcwZTFmZWY4NjE0NzM0ZWFlMGQ2
MmI0ZjU4OTFiIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1V0aWxpdGllcy9jbWpzb25j
cHAvTElDRU5TRTttZDU9NWQ3M2MxNjVhMGY5ZTg2YTEzNDJmMzJkMTllYzU5MjYgXAorICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vVXRpbGl0aWVzL2NtbGlicmhhc2gvQ09QWUlORzttZDU9YThj
MmE1NTdhNWM1M2IxYzEyY2RkYmVlOThjMDk5YWYgXAorICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vVXRpbGl0aWVzL2NtbGlidXYvTElDRU5TRTttZDU9YWQ5M2NhMWZmZmU5MzE1MzdmY2Y2NGY2
ZmNjZTA4NGQgXAorICAgICAgICAgICAgICAgICAgICAiCiBERVBFTkRTICs9ICJjdXJsIGV4cGF0
IHpsaWIgbGliYXJjaGl2ZSB4eiBuY3Vyc2VzIGJ6aXAyIgogCiBTUkNfVVJJOmFwcGVuZDpjbGFz
cy1uYXRpdmVzZGsgPSAiIFwKQEAgLTEyLDExICszOCw2IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNz
LW5hdGl2ZXNkayA9ICIgXAogIgogCiBMSUNFTlNFOmFwcGVuZCA9ICIgJiBCU0QtMS1DbGF1c2Ug
JiBNSVQiCi1MSUNfRklMRVNfQ0hLU1VNOmFwcGVuZCA9ICIgXAotICAgIGZpbGU6Ly9VdGlsaXRp
ZXMvY21qc29uY3BwL0xJQ0VOU0U7bWQ1PTVkNzNjMTY1YTBmOWU4NmExMzQyZjMyZDE5ZWM1OTI2
IFwKLSAgICBmaWxlOi8vVXRpbGl0aWVzL2NtbGlicmhhc2gvQ09QWUlORzttZDU9YThjMmE1NTdh
NWM1M2IxYzEyY2RkYmVlOThjMDk5YWYgXAotICAgIGZpbGU6Ly9VdGlsaXRpZXMvY21saWJ1di9M
SUNFTlNFO21kNT1hZDkzY2ExZmZmZTkzMTUzN2ZjZjY0ZjZmY2NlMDg0ZCBcCi0iCiAKICMgU3Ry
aXAgJHtwcmVmaXh9IGZyb20gJHtkb2NkaXJ9LCBzZXQgcmVzdWx0IGludG8gZG9jZGlyX3N0cmlw
cGVkCiBweXRob24gKCkgewotLSAKMi40NC4wCgo=

--===============3366687850722118542==--

