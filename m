Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BE3CD3430
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15712.1777645534207843400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vd7/ZSK3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ti6q474x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019de3ee3687-3e47e1a8-b2a9-422d-a177-de816a474f81-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/oqJaupG58evPFbzGNWOM+3XdlOIMgXdOgBieYTkAeE=;
	b=vd7/ZSK3zsxzNfn1dh511GqJOYnfhlPKSwDAhPu0RJJ+l8h4JXT0Bf5SSvQirwJm
	AX5L87gBYG93aGbqJvGehrGXRN+i7zvS7/gT5MdRXRUH57YF2O/dgXaBA6zFJr23d46
	pxKMONAdTQued6CRn0o9m2sch1HCP/zM6FVOlsmY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/oqJaupG58evPFbzGNWOM+3XdlOIMgXdOgBieYTkAeE=;
	b=Ti6q474x3f/VGF6tmtPvJYPlhTsK68SItBa2iGq3W7bXXZ2+PiC5pktDJOtbcfTE
	/iE4cB3R5xnIuM0YdGFkeGxxxO+5c7Ar52jWkUhGWE9opmX04lyGZQTi5Ay/TdZRLFs
	bgI0F2XZmdn6gKcXcQjpfmz4Qd8NtUBHz87K3Q8I=
Content-Type: multipart/mixed; boundary="===============6486860136247146305=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng-python,libcap-ng: upgrading to 0.9.3,0.9.3 FAILED
Message-ID: <0101019de3ee3687-3e47e1a8-b2a9-422d-a177-de816a474f81-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236216

--===============6486860136247146305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap-ng-python,libcap-ng* to *0.9.3,0.9.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libcap-ng-python-libcap-ng-upgrade-0.9.1-0.9.3-0.9.1.patch
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
From 60a336c760d65aa9643c0f3205c414723b097d5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 06:35:01 +0000
Subject: [PATCH] libcap-ng-python,libcap-ng: upgrade 0.9.1 -> 0.9.3,0.9.1 ->
 0.9.3

---
 .../{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.3.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.3.bb}        | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.3.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.3.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 9d65c889bd..f023fe8f01 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "427ed6d2c2b16e9b48f12953e55febfead3ef2e2"
+SRCREV = "0ab44af5a23e8edb69a39c0dc803ce4395ff2086"
 
 inherit lib_package autotools pkgconfig
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
-- 
2.47.1


--===============6486860136247146305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-7602d981c906c6f687aaf6b95b54c9d80f5caf2c"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7602d981c906c6f687aaf6b95b54c9d80f5caf2c"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 340 Local 201 Mirrors 0 Missed 139 Current 212 (59% match, 74% complete)
done.
Removing 8 stale sstate objects for arch x86_64...done.
Removing 19 stale sstate objects for arch qemux86_64...done.
Removing 32 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 311 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 339 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 402 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 411 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 413 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 419 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 422 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 428 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 431 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe swig-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 432 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 438 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 439 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 443 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 444 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 449 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 450 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 456 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 457 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe swig-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 459 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 463 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gawk-native-5.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-native-2.78-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-native-5.42.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 466 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe swig-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 467 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 475 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-native-2.78-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 479 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 485 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 487 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-native-5.42.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 490 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 491 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 498 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe swig-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 501 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe swig-native-4.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-native-2.78-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 510 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 518 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 526 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 529 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-native-2.78-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 530 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 533 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-native-0.194-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe swig-native-4.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-native-0.194-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 375 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 547 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_recipe_qa_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gawk-native-5.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 472 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa)
NOTE: Running task 475 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_fetch)
NOTE: Running task 484 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_fetch)
NOTE: Running task 488 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_fetch)
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe swig-native-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 549 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: Running task 530 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_write_config)
NOTE: Running noexec task 549 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_fetch)
NOTE: Running task 555 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_fetch)
NOTE: recipe gawk-native-5.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Started
NOTE: Running task 587 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_fetch)
NOTE: Running task 594 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running noexec task 625 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_fetch)
NOTE: Running setscene task 551 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_recipe_qa_setscene)
NOTE: Running task 631 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: Running task 632 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe swig-native-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_fetch: Started
NOTE: Running task 648 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: Running task 650 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_write_config: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.43+git-r1: task do_fetch: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_fetch: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_write_config: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_fetch: Started
NOTE: Running task 653 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: Running task 655 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-native-0.194-r0: task do_fetch: Started
NOTE: Running task 656 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_unpack)
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 713 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: Running task 715 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: Running task 752 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_fetch)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 856 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_fetch)
NOTE: Running task 857 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa unihash changed to 942437bf965f3f7f101ab85c21bdc78fca332e91f4564284096fe8c98f9dfbd4
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe expat-2.8.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_fetch: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_fetch: Succeeded
NOTE: Running task 858 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: Running task 859 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_unpack)
NOTE: Running task 860 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_unpack)
NOTE: Running task 861 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: Running task 862 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: Running task 863 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 864 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_fetch: Started
NOTE: recipe glibc-2.43+git-r1: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 865 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 867 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_patch)
NOTE: recipe openssl-3.5.6-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 869 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe xz-5.8.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_unpack: Started
NOTE: Running task 870 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 873 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_unpack: Started
NOTE: Running task 883 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_unpack)
NOTE: recipe xz-5.8.2-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 885 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe util-linux-native-2.41.3-r0: task do_patch: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 894 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx)
NOTE: Running task 895 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 912 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe xz-5.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 913 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe expat-2.8.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 914 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe xz-5.8.2-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 915 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: recipe expat-2.8.0-r0: task do_patch: Succeeded
NOTE: Running task 917 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_generate_toolchain_file)
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 923 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe expat-2.8.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_patch: Succeeded
NOTE: Running task 937 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_fetch)
NOTE: Running task 938 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_fetch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 939 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 940 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_fetch: Succeeded
NOTE: Running task 941 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 942 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_fetch)
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 943 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_fetch)
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_fetch: Succeeded
NOTE: Running task 944 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_unpack: Succeeded
NOTE: Running task 945 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_patch: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_patch: Succeeded
NOTE: Running task 950 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_fetch)
NOTE: recipe python3-3.14.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 951 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_recipe_spdx)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 952 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 953 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: Running task 955 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch unihash changed to 9b4e9b5d6ca05ca76ca5352e73db82c36641f5398890ca7c29c4a77265b10266
NOTE: recipe sqlite3-3_3.53.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 956 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_configure)
NOTE: Running task 958 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx)
NOTE: Running task 959 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_unpack)
NOTE: Running task 960 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_unpack)
NOTE: recipe openssl-3.5.6-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 961 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_unpack)
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Started
NOTE: Running task 963 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_unpack)
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_fetch: Succeeded
NOTE: Running task 964 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_patch)
NOTE: Setscene tasks completed
NOTE: Running task 965 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_unpack: Started
NOTE: Running task 966 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Started
NOTE: recipe glibc-2.43+git-r1: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 967 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_patch)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_patch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Started
NOTE: recipe libffi-3.5.2-r0: task do_patch: Started
NOTE: recipe glibc-2.43+git-r1: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_patch: Succeeded
NOTE: Running task 969 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_unpack)
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_patch: Succeeded
NOTE: Running task 979 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa)
NOTE: Running task 985 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_recipe_qa)
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 986 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.14.4-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa unihash changed to 394938f3276873e1a0f007ddf8e1a21eb7a36ce45bbd88509929ebde66e5adc2
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 987 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_patch)
NOTE: Running task 988 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_recipe_qa unihash changed to ae2adfde23677497481a1a280a473dcb43c42426824a73aa98ac4e5a8b20e38e
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 989 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_recipe_spdx)
NOTE: Running task 990 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 991 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 992 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_patch)
NOTE: recipe openssl-3.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 993 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 994 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx)
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_patch: Succeeded
NOTE: Running task 995 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_unpack)
NOTE: recipe openssl-3.5.6-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1040 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx)
NOTE: Running task 1041 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx)
NOTE: Running task 1042 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_create_recipe_spdx)
NOTE: Running task 1043 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.4-r0: task do_unpack: Succeeded
NOTE: Running task 1044 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe openssl-3.5.6-r0: task do_patch: Succeeded
NOTE: Running task 1046 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.4-r0: task do_patch: Started
NOTE: recipe expat-2.8.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1047 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: Running task 1048 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx)
NOTE: Running task 1049 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_recipe_spdx)
NOTE: Running task 1050 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1051 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: recipe expat-2.8.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1052 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 1053 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1054 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1055 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1056 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_patch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch unihash changed to 243669373b29f2a8d4d463b3f9480415897097a1da2c13409f5a09669233625c
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1058 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx)
NOTE: Running task 1059 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx)
NOTE: Running task 1060 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1061 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_lic)
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 1062 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1063 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_populate_lic)
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_lic: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_populate_lic: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_lic: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_lic unihash changed to 3b971e1b4f18639be757d4e138445a494eafbe8ecc28a3ba19bda3d3b7ba039d
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1064 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_populate_lic unihash changed to b7f56664e65f12846dc593a465af23f7e00fc1a05ea9163face9beaf4c125bcb
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_deploy_source_date_epoch unihash changed to c18021c87e28ed69c84b5d8ad82e42a180191aebbeab389f3be0f5f5680ed082
NOTE: Setscene tasks completed
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1065 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Started
NOTE: recipe python3-3.14.4-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Succeeded
NOTE: Running noexec task 1068 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 1069 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 1070 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1071 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 1089 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_compile)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_compile: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 1090 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_install)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_install: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1091 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: Running task 1092 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1093 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1094 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_spdx)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Succeeded
NOTE: Running task 1095 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_patch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1096 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_configure)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1098 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1099 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1100 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe elfutils-native-0.194-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1102 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_unpack)
NOTE: recipe elfutils-native-0.194-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.194-r0: task do_unpack: Succeeded
NOTE: Running task 1103 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_patch)
NOTE: recipe elfutils-native-0.194-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.194-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Succeeded
NOTE: Running task 1105 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_compile)
NOTE: recipe util-linux-native-2.41.3-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1106 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_unpack)
NOTE: recipe libarchive-native-3.8.7-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1107 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_patch)
NOTE: recipe libarchive-native-3.8.7-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1109 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1110 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_compile: Succeeded
NOTE: Running task 1112 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_install)
NOTE: recipe util-linux-native-2.41.3-r0: task do_install: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_install: Succeeded
NOTE: Running task 1113 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot)
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1114 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1115 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1116 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1117 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_configure)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1118 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_configure)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_configure: Succeeded
NOTE: Running task 1119 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_compile)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_compile: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_configure: Succeeded
NOTE: Running task 1120 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_compile)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_compile: Succeeded
NOTE: Running task 1121 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_install)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_install: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_compile: Succeeded
NOTE: Running task 1122 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_install)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_install: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_install: Succeeded
NOTE: Running task 1123 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_populate_sysroot)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1124 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1125 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_install: Succeeded
NOTE: Running task 1126 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1127 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_configure)
NOTE: recipe glibc-2.43+git-r1: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1128 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-native-3.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1129 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_configure)
NOTE: recipe libarchive-native-3.8.7-r0: task do_configure: Started
NOTE: recipe glibc-2.43+git-r1: task do_configure: Succeeded
NOTE: Running task 1130 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_compile)
NOTE: recipe glibc-2.43+git-r1: task do_compile: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_configure: Succeeded
NOTE: Running task 1131 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_compile)
NOTE: recipe libarchive-native-3.8.7-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_compile: Succeeded
NOTE: Running task 1132 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_install)
NOTE: recipe libarchive-native-3.8.7-r0: task do_install: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_install: Succeeded
NOTE: Running task 1133 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_populate_sysroot)
NOTE: recipe libarchive-native-3.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1134 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.194-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.194-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1135 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_configure)
NOTE: recipe elfutils-native-0.194-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.194-r0: task do_configure: Succeeded
NOTE: Running task 1136 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_compile)
NOTE: recipe elfutils-native-0.194-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.194-r0: task do_compile: Succeeded
NOTE: Running task 1137 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_install)
NOTE: recipe elfutils-native-0.194-r0: task do_install: Started
NOTE: recipe elfutils-native-0.194-r0: task do_install: Succeeded
NOTE: Running task 1138 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.194-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.194-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1139 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1140 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1141 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1142 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1143 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1144 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1145 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Succeeded
NOTE: Running task 1146 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_compile)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Succeeded
NOTE: Running task 1147 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_install)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Succeeded
NOTE: Running task 1148 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1149 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package)
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package unihash changed to 6fcd005e1247f1baab2f567008e2c4fa3e5f64cf36463ac5e8529b82f76d3400
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata became valid
NOTE: Running setscene task 543 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.43+git-r1: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1154 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_install)
NOTE: recipe glibc-2.43+git-r1: task do_install: Started
NOTE: recipe glibc-2.43+git-r1: task do_install: Succeeded
NOTE: Running task 1155 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale)
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale: Started
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale unihash changed to e30c38aa32029b65a39da1f74e8f01e4f898932a74f1aeba5eedb3e83d4f672f
NOTE: Setscene tasks completed
NOTE: Running task 1156 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot)
NOTE: Running task 1157 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_package)
NOTE: recipe glibc-2.43+git-r1: task do_populate_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_package: Started
NOTE: recipe glibc-2.43+git-r1: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot unihash changed to aa63e1a4ff7546e195e224ddba15b6d50b39502b4e99465d024fcc6c773e0040
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot became valid
NOTE: Running setscene task 493 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1158 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1159 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_configure)
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1160 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_compile)
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Started
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1161 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_install)
NOTE: recipe libgcc-15.2.0-r0: task do_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1162 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_multilib_install)
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1163 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1165 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1166 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_configure)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Started
NOTE: recipe glibc-2.43+git-r1: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_package unihash changed to 56c08446afb7a5d1c417ad71bb111064e449f5b48d475b868f63b66fb69414db
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.43+git-r1: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1168 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package)
NOTE: Running task 1169 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx)
NOTE: recipe libgcc-15.2.0-r0: task do_package: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package unihash changed to ca78807fba211629c1e01f37e894c6eed29b6d48547670ffcac6b2e76dfb6eb8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata became valid
NOTE: Running setscene task 531 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1171 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx)
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1172 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_compile)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1173 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_install)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1180 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1181 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1182 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1183 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1184 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package)
NOTE: Running task 1185 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1186 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1187 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1188 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1189 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1190 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1191 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1192 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_configure)
NOTE: Running task 1193 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_configure: Started
NOTE: Running task 1194 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1195 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe libffi-3.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1196 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_configure)
NOTE: Running task 1197 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1198 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_configure)
NOTE: Running task 1199 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: Running task 1200 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_configure: Started
NOTE: recipe libffi-3.5.2-r0: task do_configure: Started
NOTE: Running task 1201 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe expat-2.8.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1203 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1204 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1206 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1207 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1208 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1209 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1210 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile)
NOTE: recipe xz-5.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile: Started
NOTE: recipe xz-5.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1211 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1212 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_configure)
NOTE: Running task 1213 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_configure)
NOTE: Running task 1214 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe xz-5.8.2-r0: task do_configure: Started
NOTE: recipe openssl-3.5.6-r0: task do_configure: Started
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1215 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1216 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_install: Started
NOTE: recipe expat-2.8.0-r0: task do_configure: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1217 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_configure_ptest_base)
NOTE: Running task 1218 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install_ptest_base)
NOTE: recipe expat-2.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1219 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_compile)
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_configure: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_compile: Started
NOTE: Running task 1221 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_compile)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_compile: Started
NOTE: recipe expat-2.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1222 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_compile_ptest_base)
NOTE: recipe expat-2.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1223 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_install)
NOTE: recipe expat-2.8.0-r0: task do_install: Started
NOTE: recipe expat-2.8.0-r0: task do_install: Succeeded
NOTE: Running task 1224 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_install_ptest_base)
NOTE: recipe expat-2.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1226 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package unihash changed to 704d2619d4fbf146310df7d8cd6268e163b78e32714313592a3fd2dc0e5f1a27
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata became valid
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1227 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1229 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: Running task 1230 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx)
NOTE: Running task 1231 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package)
NOTE: Running task 1232 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Started
NOTE: recipe expat-2.8.0-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1233 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_compile)
NOTE: Running task 1234 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe libcap-ng-0.9.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1235 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1236 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_package unihash changed to 6d6d937072691ae3659e3e613c18c60994ba670355c109fee8df42b7ebf6e907
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_packagedata became valid
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to cbf552d54a2010d010164eede7b03ca9ea1804020ef7ccdb57c7b4c0fe71db8b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: recipe libffi-3.5.2-r0: task do_configure: Succeeded
NOTE: Running setscene task 551 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running task 1237 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: Running task 1238 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1240 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx)
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1242 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_create_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_create_spdx: Started
NOTE: Running task 1244 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe zlib-1.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package unihash changed to 73f193936b58f166d332de213853ce30b2997333db4d8201052453dd4953fdca
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata became valid
NOTE: recipe openssl-3.5.6-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1245 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.5.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1247 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_compile)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1249 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx)
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1250 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe expat-2.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_compile: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe libffi-3.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1251 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_install: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_install)
NOTE: recipe libcap-ng-0.9.3-r0: task do_install: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1253 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_compile)
NOTE: recipe libxcrypt-4.5.2-r0: task do_compile: Started
NOTE: recipe libffi-3.5.2-r0: task do_install: Succeeded
NOTE: Running task 1255 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_package)
NOTE: recipe libffi-3.5.2-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 1256 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package)
NOTE: Running task 1257 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libcap-ng-0.9.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1258 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: Running task 1259 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_install)
NOTE: recipe libxcrypt-4.5.2-r0: task do_install: Started
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 712fed1b0750928357e8f600bb52d427baa36e21e32a99a531ee09fa6e731200
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe libxcrypt-4.5.2-r0: task do_install: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running task 1261 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_package: Started
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1262 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1264 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot unihash changed to 26a739047f8d7df41960dfe8da61cfd920ca40c8417037c4da7c8b340a60ca7b
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_package unihash changed to 93008cc775cd4d66de5e187cd5a47c3350bfa41dde84a9dc580266747c0b4e4d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata became valid
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1266 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1267 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_package unihash changed to a4dce40437211adb90ffb894861d55412f141a5ccb2a6be95f62c827c36a8c3f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1269 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_spdx)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx: Started
NOTE: recipe xz-5.8.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1270 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_configure_ptest_base)
NOTE: recipe xz-5.8.2-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1271 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_compile)
NOTE: recipe xz-5.8.2-r0: task do_compile: Started
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1273 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe xz-5.8.2-r0: task do_compile: Succeeded
NOTE: Running task 1274 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_compile_ptest_base)
NOTE: recipe xz-5.8.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_package: Failed
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_configure: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_compile: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1274 tasks of which 1004 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501062943.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501062943.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libcap-ng/0.9.3/temp/log.do_package.2757432
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-0.9.3-r0 do_package: QA Issue: libcap-ng: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/libcap-ng.bash_completion
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libcap-ng: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: libcap-ng-0.9.3-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libcap-ng/0.9.3/temp/log.do_package.2757432
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package) failed with exit code '1'

--===============6486860136247146305==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-python-libcap-ng-upgrade-0.9.1-0.9.3-0.9.1.patch"

RnJvbSA2MGEzMzZjNzYwZDY1YWE5NjQzYzBmMzIwNWM0MTQ3MjNiMDk3ZDVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjozNTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNhcC1uZy1weXRob24sbGliY2FwLW5nOiB1cGdyYWRlIDAuOS4xIC0+IDAuOS4zLDAuOS4xIC0+
CiAwLjkuMwoKLS0tCiAuLi4ve2xpYmNhcC1uZy1weXRob25fMC45LjEuYmIgPT4gbGliY2FwLW5n
LXB5dGhvbl8wLjkuMy5iYn0gICAgfCAwCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcv
bGliY2FwLW5nLmluYyAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4vbGliY2FwLW5nL3ts
aWJjYXAtbmdfMC45LjEuYmIgPT4gbGliY2FwLW5nXzAuOS4zLmJifSAgICAgICAgfCAwCiAzIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL3tsaWJjYXAtbmctcHl0aG9uXzAuOS4xLmJiID0+IGxp
YmNhcC1uZy1weXRob25fMC45LjMuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmNhcC1uZy97bGliY2FwLW5nXzAuOS4xLmJiID0+IGxpYmNhcC1uZ18wLjkuMy5iYn0g
KDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNh
cC1uZy1weXRob25fMC45LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGli
Y2FwLW5nLXB5dGhvbl8wLjkuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy1weXRob25fMC45LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0aG9u
XzAuOS4zLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGli
Y2FwLW5nLmluYyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5j
CmluZGV4IDlkNjVjODg5YmQuLmYwMjNmZThmMDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZjYWE5YjdkZjA3OWJhZTE5ZiBc
CiAJCSAgICBmaWxlOi8vQ09QWUlORy5MSUI7bWQ1PWUzZWRhMDFkOTgxNWY4ZDI0YWFlMmRiZDg5
YjY4YjA2IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc3RldmVncnViYi9saWJjYXAt
bmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSIKLVNSQ1JFViA9
ICI0MjdlZDZkMmMyYjE2ZTliNDhmMTI5NTNlNTVmZWJmZWFkM2VmMmUyIgorU1JDUkVWID0gIjBh
YjQ0YWY1YTIzZThlZGI2OWEzOWMwZGM4MDNjZTQzOTVmZjIwODYiCiAKIGluaGVyaXQgbGliX3Bh
Y2thZ2UgYXV0b3Rvb2xzIHBrZ2NvbmZpZwogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJjYXAtbmcvbGliY2FwLW5nXzAuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMy5i
YgotLSAKMi40Ny4xCgo=

--===============6486860136247146305==--

