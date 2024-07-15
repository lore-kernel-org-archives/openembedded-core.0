Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B47FC3DA62
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1371.1721071147167946565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TKf8BAYs;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=de/GxTIF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010190b7d59f29-a5645b21-43ba-4df8-b4b7-421b7060f376-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4HdV/lochRv8rsPqsVXsvt0h0fAXAMCtkj/FLZgx8gg=;
	b=TKf8BAYs5va/SMS4YZ8lEtWH+wHJ6zHUbZx3ZaYm6SXZcW86bDfwCqUgBu8iaQTP
	wL5xXyjgtEbA+lApbJCVVgu5VmvZXS95PJhR+zKjnkXsjnjI4LcNSdca/JRWeWmK/po
	qv4NOD1a2jgQn1ksCm2B/u6YtQJjTVO00aMumuXo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4HdV/lochRv8rsPqsVXsvt0h0fAXAMCtkj/FLZgx8gg=;
	b=de/GxTIFKOrgTncZD2SlHAv3mKXmdaCcYN9l6x/V40xpnIETBbUaboMoj+zZJ1Lo
	GD8M0NlTEbBjSWGfWBQxUHzgKrPQKYcKxT/0QDWPaXv7qaAa8feEiE1KMD7qwTZk7X3
	FXDewIwtG2m3KJSztrXoRqoKrPOpUIkCYtUZHqt4=
Content-Type: multipart/mixed; boundary="===============7844386096241270375=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.62.1 SUCCEEDED
Message-ID: <01010190b7d59f29-a5645b21-43ba-4df8-b4b7-421b7060f376-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202059

--===============7844386096241270375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nghttp2* to *1.62.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.62.0-1.62.1.patch
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
From 7525d01989bcac94b6e9db7582c2e6b8e5c261b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 19:00:35 +0000
Subject: [PATCH] nghttp2: upgrade 1.62.0 -> 1.62.1

---
 .../nghttp2/{nghttp2_1.62.0.bb => nghttp2_1.62.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.62.0.bb => nghttp2_1.62.1.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.62.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
index 5a820d8cd5..8ab6b17feb 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "26798308fa0a12dabdb7ba8c77f74383019d3a0f1f36d25958b836af22474958"
+SRC_URI[sha256sum] = "2345d4dc136fda28ce243e0bb21f2e7e8ef6293d62c799abbf6f633a6887af72"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.44.0


--===============7844386096241270375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 58 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-f61cef2b844e42534bb7583d5f076a22eec666e8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f61cef2b844e42534bb7583d5f076a22eec666e8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 412 Local 397 Mirrors 0 Missed 15 Current 216 (96% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 217 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 218 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 219 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 223 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 224 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: Running task 724 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_recipe_qa)
NOTE: recipe openssl-3.3.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_recipe_qa: Started
NOTE: recipe openssl-3.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 292 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.62.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 827 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_fetch)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_fetch: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_fetch: Succeeded
NOTE: Running task 828 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_unpack)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 307 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 308 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.1-r0: task do_unpack: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 339 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.62.1-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_patch: Succeeded
NOTE: Running task 868 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 869 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_generate_toolchain_file)
NOTE: Running task 870 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_populate_lic)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 349 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 351 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_populate_lic: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 366 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 376 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_populate_lic unihash changed to aeae0670d0e2d286edee1f608bacf52b9b8bdd9d3eb45f7692c8cc1f49a8459a
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gnutls/3.8.5/temp/log.do_packagedata_setscene.108303
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 461 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_package_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.5-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gnutls-3.8.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 480 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 484 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 512 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 522 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 536 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1106 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1117 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1118 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1119 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1126 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1127 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1128 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1139 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1155 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 628 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1592 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1674 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_packagedata)
NOTE: Running task 1723 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_collect_spdx_deps)
NOTE: recipe nghttp2-1.62.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_configure)
NOTE: recipe nghttp2-1.62.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_configure: Succeeded
NOTE: Running task 1759 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_compile)
NOTE: recipe nghttp2-1.62.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_install)
NOTE: recipe nghttp2-1.62.1-r0: task do_install: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_install: Succeeded
NOTE: Running task 1761 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package)
NOTE: Running task 1762 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.62.1-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_package: Succeeded
NOTE: Running task 1763 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_packagedata)
NOTE: recipe nghttp2-1.62.1-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1764 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_create_spdx)
NOTE: Running task 1765 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_write_ipk)
NOTE: Running task 1766 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_write_deb)
NOTE: Running task 1767 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_write_rpm)
NOTE: Running task 1768 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_qa)
NOTE: recipe nghttp2-1.62.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_ipk: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_deb: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_rpm: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_qa: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1769 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_create_runtime_spdx)
NOTE: recipe nghttp2-1.62.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_package_qa: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1770 of 1770 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1770 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 31 ERROR messages, returning a non-zero exit code.
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-src went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dbg went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dane went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-openssl went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-xx went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-fips went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-ptest went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-staticdev went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dev went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-doc went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-cs went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-de went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-eo went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-es went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fi went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fr went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-it went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ka went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ms went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-nl went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pl went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pt-br went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ro went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sr went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sv went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-uk went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-vi went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-zh-cn went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-bin went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls went backwards which would break package feeds (from 0:3.8.6-r0 to 0:3.8.5-r0) [version-going-backwards]
ERROR: gnutls-3.8.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7844386096241270375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.62.0/nghttp2-1.62.0.tar.xz" to "https://github.com/nghttp2/nghttp2/releases//download/v1.62.1/nghttp2-1.62.1.tar.xz"
packages/core2-64-poky-linux/nghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/libnghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2: PV changed from "1.62.0" to "1.62.1"

--===============7844386096241270375==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.62.0-1.62.1.patch"

RnJvbSA3NTI1ZDAxOTg5YmNhYzk0YjZlOWRiNzU4MmMyZTZiOGU1YzI2MWI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTk6MDA6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
Z2h0dHAyOiB1cGdyYWRlIDEuNjIuMCAtPiAxLjYyLjEKCi0tLQogLi4uL25naHR0cDIve25naHR0
cDJfMS42Mi4wLmJiID0+IG5naHR0cDJfMS42Mi4xLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbmdodHRwMi97bmdodHRwMl8xLjYyLjAuYmIgPT4gbmdodHRwMl8xLjYy
LjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9u
Z2h0dHAyXzEuNjIuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8x
LjYyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjIuMS5iYgppbmRleCA1YTgyMGQ4Y2Q1Li44YWI2YjE3
ZmViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS42
Mi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjYyLjEu
YmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NzY0YWJkZjMwYjJlYWRkMzdjZTQ3ZGNiY2UwZWExZWMiCiAKIFNS
Q19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9uZ2h0dHAyLSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNjc5ODMwOGZhMGExMmRhYmRiN2JhOGM3
N2Y3NDM4MzAxOWQzYTBmMWYzNmQyNTk1OGI4MzZhZjIyNDc0OTU4IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjIzNDVkNGRjMTM2ZmRhMjhjZTI0M2UwYmIyMWYyZTdlOGVmNjI5M2Q2MmM3OTlhYmJm
NmY2MzNhNjg4N2FmNzIiCiAKIGluaGVyaXQgY21ha2UgbWFucGFnZXMgcHl0aG9uM25hdGl2ZSBn
aXRodWItcmVsZWFzZXMKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIiIKLS0gCjIuNDQuMAoK

--===============7844386096241270375==--

