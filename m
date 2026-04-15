Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9510EF419BF
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:36 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19815.1776261874440482013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TT49P/gK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nbshiPMb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91753f8a-7d3babef-b9dd-41dc-9407-40d3af1c6176-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6FYq2uEfziVrIiTWeBZ+LLoR5rtd9N+fkX0OHKtDMP0=;
	b=TT49P/gKYUoDmJ7gVw7zIdpu928ODz9QBdBEh3jtWiALE5q3Hvu6Nbj3kNYGrl+z
	+uasGpQGD9OD+bj5upby09o20LvrTQJB9JiMlytA46oHWZ9UaDpFn1u1RTANgcvlj0q
	PBU79BBrebmW0f9eIUHrz0E9iK33rMF0r8EJGGcc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6FYq2uEfziVrIiTWeBZ+LLoR5rtd9N+fkX0OHKtDMP0=;
	b=nbshiPMbKqipKcSGq1UWlFhBmqeAtzCwxVs+XnXvFz2q1IC8oOo94AbG9/yXn7bE
	BySUwZK7NwsHhpJV6nVNOzZN1VdelSgNRW6K9UkVbf2Qxmr2KN6mXBBV3DvrO4VF/qx
	stLZ9Yl5yLHy3i9MIN1/lbFKBH/8r6opSP+aDD4c=
Content-Type: multipart/mixed; boundary="===============1293664479220882257=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng,libcap-ng-python: upgrading to 0.9.3,0.9.3 FAILED
Message-ID: <0101019d91753f8a-7d3babef-b9dd-41dc-9407-40d3af1c6176-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235221

--===============1293664479220882257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap-ng,libcap-ng-python* to *0.9.3,0.9.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libcap-ng-libcap-ng-python-upgrade-0.9.1-0.9.3-0.9.1.patch
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
From 9cdda15f5dff8b7e8475d726ff99040d66befb39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 05:58:54 +0000
Subject: [PATCH] libcap-ng,libcap-ng-python: upgrade 0.9.1 -> 0.9.3,0.9.1 ->
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


--===============1293664479220882257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-2bfa43adb4a5f93cdf8b825ac7a0b3c4da9a280b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2bfa43adb4a5f93cdf8b825ac7a0b3c4da9a280b"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 319 Local 180 Mirrors 0 Missed 139 Current 230 (56% match, 74% complete)
done.
Removing 9 stale sstate objects for arch x86_64...done.
Removing 19 stale sstate objects for arch qemux86_64...done.
Removing 31 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 382 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 395 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 422 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 423 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 426 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 432 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 439 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 440 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 444 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 447 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 451 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 452 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 453 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.42.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 455 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 458 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 460 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 461 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 462 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.7.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 468 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 471 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 474 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 482 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 484 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-native-5.42.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 496 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-native-2.77-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 497 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 498 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-native-2.77-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 502 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-native-5.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 504 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 505 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 506 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 517 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 520 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-2.43+git-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-native-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 524 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 528 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 529 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-native-2.77-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gawk-native-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 535 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-native-0.194-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.46-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 542 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-native-2.77-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 543 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gawk-native-5.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-native-0.194-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 545 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 549 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 400 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_fetch)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 521 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa)
NOTE: Running task 531 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_fetch)
NOTE: Running task 539 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_fetch)
NOTE: Running task 543 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_fetch)
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 607 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_write_config)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Started
NOTE: Running noexec task 621 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_fetch)
NOTE: Running task 626 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: Running task 629 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_fetch)
NOTE: recipe gawk-native-5.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 656 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_fetch)
NOTE: Running task 662 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Succeeded
NOTE: Running task 680 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 681 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: Running noexec task 689 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_fetch)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_fetch: Started
NOTE: Running task 725 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: Running task 727 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 730 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_write_config: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe gawk-native-5.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_fetch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_write_config: Succeeded
NOTE: Running task 830 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_fetch)
NOTE: recipe libarchive-native-3.8.6-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_fetch: Succeeded
NOTE: Running task 842 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: Running task 843 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.8.6-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.194-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: Running task 844 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-native-0.194-r0: task do_fetch: Succeeded
NOTE: Running task 845 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: Running task 846 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: Running task 847 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: Running task 848 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: recipe expat-2.7.5-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_fetch)
NOTE: Running task 850 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe libarchive-native-3.8.6-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-native-0.194-r0: task do_unpack: Started
NOTE: Running task 851 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 853 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_fetch: Started
NOTE: Running task 854 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_fetch)
NOTE: recipe xz-5.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 856 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe glibc-2.43+git-r1: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_unpack: Started
NOTE: Running task 857 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_unpack)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_fetch: Started
NOTE: Running task 858 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: recipe openssl-3.5.6-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_unpack: Started
NOTE: Running task 868 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-native-3.8.6-r0: task do_unpack: Succeeded
NOTE: Running task 870 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: Running task 871 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_patch)
NOTE: recipe glibc-2.43+git-r1: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe expat-2.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_patch)
NOTE: recipe libarchive-native-3.8.6-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 874 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 875 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_unpack)
NOTE: recipe xz-5.8.2-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.6-r0: task do_patch: Succeeded
NOTE: Running task 877 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe expat-2.7.5-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.6-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe xz-5.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 878 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_patch: Succeeded
NOTE: Running task 879 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_patch)
NOTE: Running task 880 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_patch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 881 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe xz-5.8.2-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: Running task 882 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 891 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_generate_toolchain_file)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 892 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe xz-5.8.2-r0: task do_patch: Succeeded
NOTE: Running task 897 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.7.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 904 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 921 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_fetch: Succeeded
NOTE: Running task 922 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_fetch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 923 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_fetch)
NOTE: Running task 925 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 926 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe elfutils-native-0.194-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Started
NOTE: Running task 927 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_patch)
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_fetch: Succeeded
NOTE: Running task 928 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_fetch)
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 929 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 933 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 934 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.194-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe python3-3.14.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_patch: Succeeded
NOTE: Running task 936 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_unpack)
NOTE: recipe python3-3.14.4-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 939 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_unpack)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Started
NOTE: Running task 951 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 952 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_unpack: Succeeded
NOTE: Running task 953 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_patch)
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 954 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_patch)
NOTE: Running task 955 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_patch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 956 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_patch: Started
NOTE: Running task 957 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx)
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Started
NOTE: recipe libffi-3.5.2-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.5.6-r0: task do_unpack: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_unpack: Succeeded
NOTE: Running task 958 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_patch)
NOTE: Running task 959 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_patch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_patch: Succeeded
NOTE: Running task 961 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_unpack)
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_patch: Started
NOTE: recipe libffi-3.5.2-r0: task do_patch: Succeeded
NOTE: Running task 971 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa)
NOTE: Running task 977 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_recipe_qa)
NOTE: recipe openssl-3.5.6-r0: task do_patch: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_patch: Succeeded
NOTE: recipe elfutils-native-0.194-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.14.4-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Succeeded
NOTE: Running task 1021 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_patch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1022 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_configure)
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1023 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_configure: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1024 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1025 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe openssl-3.5.6-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1027 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_fetch: Started
NOTE: Running task 1028 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1030 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1032 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1034 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1035 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_unpack: Succeeded
NOTE: Running task 1036 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_unpack)
NOTE: Running task 1037 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_patch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Started
NOTE: recipe glibc-2.43+git-r1: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_unpack: Succeeded
NOTE: Running task 1038 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx)
NOTE: Running task 1039 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.4-r0: task do_patch: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1040 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1041 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx)
NOTE: Running task 1042 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx)
NOTE: Running task 1043 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_recipe_spdx)
NOTE: Running task 1044 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx)
NOTE: Running task 1045 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_create_recipe_spdx)
NOTE: Running task 1046 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe expat-2.7.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 1047 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1048 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_populate_lic)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1049 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_patch)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_populate_lic: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1050 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1051 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1052 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: Running task 1053 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1054 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1055 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_populate_lic: Succeeded
NOTE: Running task 1056 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1059 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe glibc-2.43+git-r1: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 1061 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx)
NOTE: Running task 1062 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1063 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1064 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_recipe_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_lic: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1065 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.4-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Succeeded
NOTE: Running task 1067 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Started
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1068 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: Running task 1070 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Succeeded
NOTE: Running noexec task 1072 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 1073 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 1074 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 1076 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 1091 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_compile)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_compile: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 1093 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_install)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1094 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 1096 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1097 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1098 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_spdx)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1099 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_configure)
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Succeeded
NOTE: Running task 1100 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_compile)
NOTE: recipe util-linux-native-2.41.3-r0: task do_compile: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_compile: Succeeded
NOTE: Running task 1101 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_install)
NOTE: recipe util-linux-native-2.41.3-r0: task do_install: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_install: Succeeded
NOTE: Running task 1102 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot)
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1103 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1104 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1105 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1106 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_configure)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1107 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_configure)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_configure: Succeeded
NOTE: Running task 1108 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_compile)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_compile: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_configure: Succeeded
NOTE: Running task 1109 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_compile)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_compile: Succeeded
NOTE: Running task 1110 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_install)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_install: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_compile: Succeeded
NOTE: Running task 1111 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_install)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_install: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_install: Succeeded
NOTE: Running task 1112 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_populate_sysroot)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1113 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1114 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_install: Succeeded
NOTE: Running task 1115 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1116 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_configure)
NOTE: recipe glibc-2.43+git-r1: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1117 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-native-3.8.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.8.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1118 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_configure)
NOTE: recipe libarchive-native-3.8.6-r0: task do_configure: Started
NOTE: recipe glibc-2.43+git-r1: task do_configure: Succeeded
NOTE: Running task 1119 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_compile)
NOTE: recipe glibc-2.43+git-r1: task do_compile: Started
NOTE: recipe libarchive-native-3.8.6-r0: task do_configure: Succeeded
NOTE: Running task 1120 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_compile)
NOTE: recipe libarchive-native-3.8.6-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.8.6-r0: task do_compile: Succeeded
NOTE: Running task 1121 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_install)
NOTE: recipe libarchive-native-3.8.6-r0: task do_install: Started
NOTE: recipe libarchive-native-3.8.6-r0: task do_install: Succeeded
NOTE: Running task 1122 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_populate_sysroot)
NOTE: recipe libarchive-native-3.8.6-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-native-3.8.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1123 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.194-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.194-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1124 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_configure)
NOTE: recipe elfutils-native-0.194-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.194-r0: task do_configure: Succeeded
NOTE: Running task 1125 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_compile)
NOTE: recipe elfutils-native-0.194-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.194-r0: task do_compile: Succeeded
NOTE: Running task 1126 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_install)
NOTE: recipe elfutils-native-0.194-r0: task do_install: Started
NOTE: recipe elfutils-native-0.194-r0: task do_install: Succeeded
NOTE: Running task 1127 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.194-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.194-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1128 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1129 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1130 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1131 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1132 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1133 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1134 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Succeeded
NOTE: Running task 1135 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_compile)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Succeeded
NOTE: Running task 1136 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_install)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Succeeded
NOTE: Running task 1137 of 1341 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1138 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package)
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package unihash changed to 6fcd005e1247f1baab2f567008e2c4fa3e5f64cf36463ac5e8529b82f76d3400
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx became valid
NOTE: Running setscene task 541 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 549 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.43+git-r1: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1143 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_install)
NOTE: recipe glibc-2.43+git-r1: task do_install: Started
NOTE: recipe glibc-2.43+git-r1: task do_install: Succeeded
NOTE: Running task 1144 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale)
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale: Started
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale unihash changed to e30c38aa32029b65a39da1f74e8f01e4f898932a74f1aeba5eedb3e83d4f672f
NOTE: Setscene tasks completed
NOTE: Running task 1145 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot)
NOTE: Running task 1146 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_package)
NOTE: recipe glibc-2.43+git-r1: task do_populate_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_package: Started
NOTE: recipe glibc-2.43+git-r1: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot unihash changed to aa63e1a4ff7546e195e224ddba15b6d50b39502b4e99465d024fcc6c773e0040
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot became valid
NOTE: Running setscene task 485 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1147 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1148 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_configure)
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1149 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_compile)
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Started
NOTE: recipe libgcc-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1150 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_install)
NOTE: recipe libgcc-15.2.0-r0: task do_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1151 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_multilib_install)
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1152 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-15.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1154 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1155 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_configure)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Started
NOTE: recipe glibc-2.43+git-r1: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_package unihash changed to 56c08446afb7a5d1c417ad71bb111064e449f5b48d475b868f63b66fb69414db
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_packagedata became valid
NOTE: Running setscene task 548 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.43+git-r1: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1157 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package)
NOTE: Running task 1158 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx)
NOTE: recipe libgcc-15.2.0-r0: task do_package: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx: Started
NOTE: recipe libgcc-15.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_package unihash changed to ca78807fba211629c1e01f37e894c6eed29b6d48547670ffcac6b2e76dfb6eb8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata became valid
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx: Succeeded
NOTE: Running setscene task 545 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1160 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx)
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1161 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_compile)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1162 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_install)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1169 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1170 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1171 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1172 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1173 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package)
NOTE: Running task 1174 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1175 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1176 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1177 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1178 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1179 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Started
NOTE: recipe libffi-3.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1180 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1181 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_configure)
NOTE: Running task 1182 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1183 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe zlib-1.3.2-r0: task do_configure: Started
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_configure: Started
NOTE: Running task 1184 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: recipe libffi-3.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: Running task 1185 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1186 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_configure)
NOTE: Running task 1187 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1188 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_configure)
NOTE: Running task 1189 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_configure: Started
NOTE: recipe libffi-3.5.2-r0: task do_configure: Started
NOTE: Running task 1190 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_configure: Started
NOTE: recipe expat-2.7.5-r0: task do_configure: Started
NOTE: Running task 1191 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe libcap-ng-0.9.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1192 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1193 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1195 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1196 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1197 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1198 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1199 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile)
NOTE: recipe xz-5.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1200 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1201 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_configure)
NOTE: Running task 1202 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_configure)
NOTE: Running task 1203 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe xz-5.8.2-r0: task do_configure: Started
NOTE: recipe openssl-3.5.6-r0: task do_configure: Started
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1204 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1205 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1206 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install_ptest_base)
NOTE: recipe expat-2.7.5-r0: task do_configure: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1207 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_configure_ptest_base: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_configure: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1209 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_compile)
NOTE: Running task 1210 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_compile)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_compile: Started
NOTE: recipe expat-2.7.5-r0: task do_compile: Started
NOTE: recipe expat-2.7.5-r0: task do_compile: Succeeded
NOTE: Running task 1211 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_compile_ptest_base)
NOTE: recipe expat-2.7.5-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.7.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1212 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_install)
NOTE: recipe expat-2.7.5-r0: task do_install: Started
NOTE: recipe expat-2.7.5-r0: task do_install: Succeeded
NOTE: Running task 1213 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_install_ptest_base)
NOTE: recipe expat-2.7.5-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.7.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_package unihash changed to 704d2619d4fbf146310df7d8cd6268e163b78e32714313592a3fd2dc0e5f1a27
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata became valid
NOTE: Running setscene task 549 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1215 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1216 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1218 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: Running task 1219 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: Running task 1220 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package)
NOTE: Running task 1221 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx: Started
NOTE: recipe expat-2.7.5-r0: task do_package: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1222 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_compile: Started
NOTE: Running task 1223 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1224 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1225 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to cbf552d54a2010d010164eede7b03ca9ea1804020ef7ccdb57c7b4c0fe71db8b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 549 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_package unihash changed to a80d129fe2989296341f00cb329e7d52c780b8d4d75a9ec55a64241b84ffed08
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata became valid
NOTE: Running setscene task 549 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1227 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx)
NOTE: recipe libffi-3.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1228 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 1230 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_create_spdx)
NOTE: Running task 1231 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libffi-3.5.2-r0: task do_compile: Started
NOTE: recipe expat-2.7.5-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package unihash changed to 73f193936b58f166d332de213853ce30b2997333db4d8201052453dd4953fdca
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata became valid
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 549 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1232 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: Running task 1234 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe openssl-3.5.6-r0: task do_configure: Succeeded
NOTE: Running task 1235 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe openssl-3.5.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 1236 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe openssl-3.5.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1237 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 1239 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx)
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe openssl-3.5.6-r0: task do_compile: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1240 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_install)
NOTE: recipe libffi-3.5.2-r0: task do_install: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 1241 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_install)
NOTE: recipe libcap-ng-0.9.3-r0: task do_install: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1242 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_compile)
NOTE: recipe libxcrypt-4.5.2-r0: task do_compile: Started
NOTE: recipe libffi-3.5.2-r0: task do_install: Succeeded
NOTE: Running task 1244 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_package)
NOTE: recipe libffi-3.5.2-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 1245 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package)
NOTE: Running task 1246 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libcap-ng-0.9.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: Running task 1247 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe libxcrypt-4.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1248 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_install: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_install: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1250 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: Running task 1251 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 712fed1b0750928357e8f600bb52d427baa36e21e32a99a531ee09fa6e731200
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_package: Started
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: Running setscene task 549 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1253 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_package unihash changed to 93008cc775cd4d66de5e187cd5a47c3350bfa41dde84a9dc580266747c0b4e4d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 549 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1255 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1256 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_package unihash changed to a4dce40437211adb90ffb894861d55412f141a5ccb2a6be95f62c827c36a8c3f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 549 of 549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1258 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_spdx)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx: Started
NOTE: recipe xz-5.8.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1259 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_configure_ptest_base)
NOTE: recipe xz-5.8.2-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1260 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_compile)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_compile: Started
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1262 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe xz-5.8.2-r0: task do_compile: Succeeded
NOTE: Running task 1263 of 1341 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_compile_ptest_base)
NOTE: recipe xz-5.8.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_package: Failed
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_configure: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_compile: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1263 tasks of which 993 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415055338.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415055338.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libcap-ng/0.9.3/temp/log.do_package.367522
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-0.9.3-r0 do_package: QA Issue: libcap-ng: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/libcap-ng.bash_completion
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libcap-ng: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: libcap-ng-0.9.3-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libcap-ng/0.9.3/temp/log.do_package.367522
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package) failed with exit code '1'

--===============1293664479220882257==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-libcap-ng-python-upgrade-0.9.1-0.9.3-0.9.1.patch"

RnJvbSA5Y2RkYTE1ZjVkZmY4YjdlODQ3NWQ3MjZmZjk5MDQwZDY2YmVmYjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDU6NTg6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXAtbmcsbGliY2FwLW5nLXB5dGhvbjogdXBncmFkZSAwLjkuMSAtPiAwLjkuMywwLjkuMSAt
PgogMC45LjMKCi0tLQogLi4uL3tsaWJjYXAtbmctcHl0aG9uXzAuOS4xLmJiID0+IGxpYmNhcC1u
Zy1weXRob25fMC45LjMuYmJ9ICAgIHwgMAogbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5n
L2xpYmNhcC1uZy5pbmMgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL2xpYmNhcC1uZy97
bGliY2FwLW5nXzAuOS4xLmJiID0+IGxpYmNhcC1uZ18wLjkuMy5iYn0gICAgICAgIHwgMAogMyBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy97bGliY2FwLW5nLXB5dGhvbl8wLjkuMS5iYiA9PiBs
aWJjYXAtbmctcHl0aG9uXzAuOS4zLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJjYXAtbmcve2xpYmNhcC1uZ18wLjkuMS5iYiA9PiBsaWJjYXAtbmdfMC45LjMuYmJ9
ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJj
YXAtbmctcHl0aG9uXzAuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xp
YmNhcC1uZy1weXRob25fMC45LjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0aG9uXzAuOS4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLXB5dGhv
bl8wLjkuMy5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xp
YmNhcC1uZy5pbmMgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmlu
YwppbmRleCA5ZDY1Yzg4OWJkLi5mMDIzZmU4ZjAxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLmluYworKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJjYXAtbmcvbGliY2FwLW5nLmluYwpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTRkNTVkNTEyYTliYTM2Y2FhOWI3ZGYwNzliYWUxOWYg
XAogCQkgICAgZmlsZTovL0NPUFlJTkcuTElCO21kNT1lM2VkYTAxZDk4MTVmOGQyNGFhZTJkYmQ4
OWI2OGIwNiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N0ZXZlZ3J1YmIvbGliY2Fw
LW5nLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz12JHtQVn0iCi1TUkNSRVYg
PSAiNDI3ZWQ2ZDJjMmIxNmU5YjQ4ZjEyOTUzZTU1ZmViZmVhZDNlZjJlMiIKK1NSQ1JFViA9ICIw
YWI0NGFmNWEyM2U4ZWRiNjlhMzljMGRjODAzY2U0Mzk1ZmYyMDg2IgogCiBpbmhlcml0IGxpYl9w
YWNrYWdlIGF1dG90b29scyBwa2djb25maWcKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC1uZy9saWJjYXAtbmdfMC45LjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmdfMC45LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmdfMC45LjMu
YmIKLS0gCjIuNDcuMQoK

--===============1293664479220882257==--

