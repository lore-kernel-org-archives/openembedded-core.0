Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDECDC54EDA
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1293.1721071145581690660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=avjECkEK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EsLe+LPS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d59214-aa57c34b-327d-49bc-ac2a-cdb40bdb0a72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=VGTI1xEtG2wPCqocHIABHhY17cKcssuaDPJ/XHt4kQw=;
	b=avjECkEKuVrknbOsvhVhd6auMwnlGvevvGdlIQtPhEtkl2oC2GStGBcwjfOlE956
	pZbzmpP3nFssoFl78jfzmvEyyPVhSOkZBq/eabOtzJEiob55qIa9poP8O3z9s1lSpLl
	qZSK6Xi+kbHOcsXnRc00rlcMiemhLabSoRPlRVI4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=VGTI1xEtG2wPCqocHIABHhY17cKcssuaDPJ/XHt4kQw=;
	b=EsLe+LPSfQJA1EaTx0QtXrMqqlZPtzsjMsgXbZZt1mKp3btP0n+YGWLSgFyvrwrt
	x7sEW3dPRFmbd8048R1zQpzTVDiR4dUR3P4HwZZOh4fG5jVSoOYxf7DkxFJ6ZmtvAV0
	i/HWsfVNKOekbt2HPo+qTksuu249nL0XeUnL6Vrc=
Content-Type: multipart/mixed; boundary="===============3784233326835268205=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.30.0 FAILED
Message-ID: <01010190b7d59214-aa57c34b-327d-49bc-ac2a-cdb40bdb0a72-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201953

--===============3784233326835268205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.30.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.29.3-3.30.0.patch
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
From 39c9302b65bc687b9a1f44eadf2295cdf904e848 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 08:54:49 +0000
Subject: [PATCH] cmake: upgrade 3.29.3 -> 3.30.0

---
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.29.3.bb => cmake_3.30.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake_3.29.3.bb => cmake_3.30.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1155c1bbe0..cc5f135a99 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb"
+SRC_URI[sha256sum] = "157e5be6055c154c34f580795fe5832f260246506d32954a971300ed7899f579"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.29.3.bb b/meta/recipes-devtools/cmake/cmake_3.30.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.29.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.30.0.bb
-- 
2.44.0


--===============3784233326835268205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (916 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-df8bb0a433dc2e0c3a67cb062ef7cbecf54a96e8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:df8bb0a433dc2e0c3a67cb062ef7cbecf54a96e8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 198 Local 99 Mirrors 0 Missed 99 Current 219 (50% match, 76% complete)
Removing 20 stale sstate objects for arch qemux86_64...done.
Removing 17 stale sstate objects for arch core2-64...done.
Removing 15 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 238 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 249 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 251 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 256 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 260 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 264 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 268 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 278 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 281 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 291 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 302 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 303 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 309 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 310 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 316 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 321 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_stash_locale_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 322 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 323 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 326 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 327 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 359 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 369 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 407 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.40.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-native-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running task 335 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_recipe_qa)
NOTE: recipe util-linux-libuuid-native-2.40.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 399 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 410 of 417 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running task 410 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe cmake-native-3.29.3-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 479 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Started
NOTE: recipe glibc-2.39+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running noexec task 573 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_fetch)
NOTE: Running task 575 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_fetch)
NOTE: Running setscene task 411 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Succeeded
NOTE: Running task 597 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_unpack)
NOTE: Running task 598 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 616 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_fetch)
NOTE: Running task 620 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Started
NOTE: Running task 651 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 653 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: Running task 672 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 673 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: Running task 681 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-native-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 694 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.29.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_recipe_qa unihash changed to 502cc1b245d32d816bafe48185fe74b08e0a8412574c634139b085d2eec599f0
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 336 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 396 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 695 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: Running task 696 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_fetch)
NOTE: Running task 697 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: Running task 699 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_fetch)
NOTE: Running task 700 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_unpack)
NOTE: Running task 701 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_unpack)
NOTE: Running task 702 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 703 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: Running task 704 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: Running task 705 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 706 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: Running task 708 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: Running task 709 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cmake-native-3.29.3-r0: task do_fetch: Started
WARNING: cmake-native-3.29.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/downloads/cmake-3.29.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.29.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/downloads/cmake-3.29.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/downloads/cmake-3.29.3.tar.gz_bad-checksum_252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Started
NOTE: Running task 715 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Started
NOTE: Running task 719 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 720 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe util-linux-native-2.40.1-r0: task do_fetch: Started
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 721 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: Running task 722 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-native-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: Running task 723 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: Running task 725 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 726 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 727 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 730 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe curl-8.8.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: recipe curl-8.8.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: Running task 731 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 732 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 734 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: Running task 741 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe expat-native-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 743 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 746 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.1-r0: task do_fetch: Succeeded
NOTE: Running task 747 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 750 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_fetch)
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 751 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Started
NOTE: Running task 752 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: recipe curl-8.8.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 753 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 754 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: Running task 755 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.40.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 757 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: Running task 758 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 759 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: Running task 761 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 763 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_unpack)
NOTE: Running task 764 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.30.0.bb:do_recipe_qa)
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: Running task 765 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe cmake-3.30.0-r0: task do_recipe_qa: Started
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe curl-8.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_patch)
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 840 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Succeeded
NOTE: Running task 842 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_patch)
NOTE: recipe cmake-3.30.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 844 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.30.0.bb:do_fetch)
NOTE: recipe curl-8.8.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Started
NOTE: recipe cmake-3.30.0-r0: task do_fetch: Started
NOTE: recipe curl-8.8.0-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.30.0-r0: task do_fetch: Succeeded
NOTE: Running task 846 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.30.0.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 847 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
WARNING: cmake-native-3.29.3-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz - will attempt other sources if available
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe cmake-3.30.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 849 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 851 of 1200 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
WARNING: cmake-native-3.29.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/downloads/cmake-3.29.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.29.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/downloads/cmake-3.29.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/downloads/cmake-3.29.3.tar.gz_bad-checksum_252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb
NOTE: recipe util-linux-native-2.40.1-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 854 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.40.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe cmake-3.30.0-r0: task do_unpack: Succeeded
NOTE: Running task 859 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.30.0.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 860 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe cmake-3.30.0-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: Running task 861 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe cmake-3.30.0-r0: task do_patch: Succeeded
NOTE: Running task 862 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.30.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 863 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.30.0.bb:do_generate_toolchain_file)
NOTE: Running task 864 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.30.0.bb:do_populate_lic)
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe cmake-3.30.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.30.0-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.30.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.30.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.30.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cmake-3.30.0-r0: task do_populate_lic: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_patch: Succeeded
NOTE: Running task 867 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_preconfigure)
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_preconfigure: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_preconfigure: Succeeded
NOTE: recipe cmake-native-3.29.3-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 872 tasks of which 795 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715085428.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715085428.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.29.3-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz
ERROR: cmake-native-3.29.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/downloads/cmake-3.29.3.tar.gz\' has sha256 checksum \'252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb\' when \'157e5be6055c154c34f580795fe5832f260246506d32954a971300ed7899f579\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/3.29.3/temp/log.do_fetch.845095
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb:do_fetch) failed with exit code '1'

--===============3784233326835268205==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.29.3-3.30.0.patch"

RnJvbSAzOWM5MzAyYjY1YmM2ODdiOWExZjQ0ZWFkZjIyOTVjZGY5MDRlODQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDg6NTQ6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI5LjMgLT4gMy4zMC4wCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjI5LjMuYmIgPT4gY21ha2VfMy4zMC4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjkuMy5iYiA9PiBjbWFr
ZV8zLjMwLjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmlu
ZGV4IDExNTVjMWJiZTAuLmNjNWYxMzVhOTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5q
b2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczov
L2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIu
Z3ogXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjUyYWVlMTQ0OGQ0OWNhYTA0OTU0ZmQ1
ZTI3ZDE4OWRkNTE1NzA1NTczMTNlN2IyODE2MzY3MTZhMjM4YmNjYiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIxNTdlNWJlNjA1NWMxNTRjMzRmNTgwNzk1ZmU1ODMyZjI2MDI0NjUwNmQzMjk1NGE5
NzEzMDBlZDc4OTlmNTc5IgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZl
cj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlXzMuMjkuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZV8zLjMwLjAuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI5LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZV8zLjMwLjAuYmIKLS0gCjIuNDQuMAoK

--===============3784233326835268205==--

