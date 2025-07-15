Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D85CA0EDC
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.12173.1752594939144685491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CLLOKRsA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SHv5sTJM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101980eccbff4-1ecf630c-c2a3-4c51-b2d1-4722efd49c43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594956;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bZanhpdxkoEa8fY4Dlc0p+O2SXDfeDkudqzlQL0AdRc=;
	b=CLLOKRsAKLn2pb2Uu934yyd1FShMFWXxzenEftKa3hsr0mN4bqSA0aRvmgWjCiCZ
	yOT54gqDsK+iU71VgiK/9bZ1Usd0VBNH3ySqyjAZrrv5cScR7k0y7Dveik5jYldahHI
	yxgbdbcpdToqcQvsiPscE1yWJzRCpN18dwAjGJDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594956;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bZanhpdxkoEa8fY4Dlc0p+O2SXDfeDkudqzlQL0AdRc=;
	b=SHv5sTJMKgSw2PCSvskXq39zGGLA2Qy0GJvrnacfbId/RsKlTV4U8Wvo9C5/isDc
	Pk23DyvS0hFwP38iyf618cwluM3HFMVHNKccIyDUxSlbj3RTq5b6/Khu34tMVjC7I3i
	8bX1Florr0x8mQ3jXz/eOwwfkH1aDoDzg91lZVZw=
Content-Type: multipart/mixed; boundary="===============5840714471272374260=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libmicrohttpd: upgrading to 1.0.2 SUCCEEDED
Message-ID: <010101980eccbff4-1ecf630c-c2a3-4c51-b2d1-4722efd49c43-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220400

--===============5840714471272374260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmicrohttpd* to *1.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmicrohttpd-upgrade-1.0.1-1.0.2.patch
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
From 5487ee5d2a8da1f81af2378a1285f0c5895b28e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 15:47:15 +0000
Subject: [PATCH] libmicrohttpd: upgrade 1.0.1 -> 1.0.2

---
 .../{libmicrohttpd_1.0.1.bb => libmicrohttpd_1.0.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.1.bb => libmicrohttpd_1.0.2.bb} (90%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
similarity index 90%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
index 0628ee71b5..a75a5b3be8 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94"
+SRC_URI[sha256sum] = "df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.47.1


--===============5840714471272374260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (0 cached, 941 parsed). 1929 targets, 50 skipped, 0 masked, 0 errors.
Removing 30 recipes from the core2-64 sysroot...done.
Removing 28 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c9c40fe4d49e79d3a8bb4db5f9ae34308be5fb5d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c9c40fe4d49e79d3a8bb4db5f9ae34308be5fb5d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 235 Local 145 Mirrors 0 Missed 90 Current 253 (61% match, 81% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 257 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 333 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 398 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 402 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 408 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 413 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 414 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 416 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 417 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 418 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 419 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 421 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 423 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 425 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 426 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 427 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 428 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 431 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 432 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 433 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 434 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 435 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 437 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 439 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 441 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 443 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 444 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 445 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 446 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 447 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 450 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 451 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 452 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 826 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 840 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 842 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 850 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 852 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 454 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: Running setscene task 455 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running task 854 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: Running task 856 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 858 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 457 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 860 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 864 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_fetch)
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 865 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 458 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_fetch: Started
NOTE: Running task 866 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: Running task 868 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_fetch)
NOTE: Running task 869 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_fetch)
NOTE: Running task 870 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_fetch: Started
NOTE: Running setscene task 459 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running setscene task 460 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 872 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_fetch)
NOTE: Running task 873 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Started
NOTE: Running task 874 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_unpack)
NOTE: recipe gnutls-3.8.9-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 875 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_fetch)
NOTE: Running task 888 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: Running setscene task 461 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 890 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 892 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_fetch)
NOTE: Running task 893 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 895 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 897 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 898 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: Running task 899 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 900 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_unpack)
NOTE: recipe libunistring-1.3-r0: task do_fetch: Started
NOTE: Running task 901 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: Running task 902 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_patch)
NOTE: Running task 903 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe openssl-3.5.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 904 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Started
NOTE: Running task 905 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: Running task 906 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_unpack)
NOTE: recipe nettle-3.10.1-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 463 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 907 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 908 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_patch)
NOTE: Running task 909 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: Running task 910 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_patch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Started
NOTE: Running task 911 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_unpack)
NOTE: Running task 913 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 915 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_unpack)
NOTE: recipe gnutls-3.8.9-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Started
NOTE: Running task 938 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 939 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libunistring-1.3-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: Running task 940 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_patch)
NOTE: Running task 942 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: Running task 943 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 944 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 945 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: Running task 946 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Succeeded
NOTE: Running task 948 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 956 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: Running task 959 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa)
NOTE: recipe gnutls-3.8.9-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_fetch: Started
NOTE: recipe lzlib-1.15-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 961 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: Running task 962 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_unpack)
NOTE: recipe file-5.46-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa: Started
NOTE: Running task 976 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_patch)
NOTE: Running task 997 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_patch)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 465 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 466 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.1-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_patch: Started
NOTE: recipe curl-8.14.1-r0: task do_patch: Started
NOTE: Running task 1026 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_patch)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1027 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_patch)
NOTE: recipe nettle-3.10.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.46-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1028 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_patch: Started
NOTE: Running noexec task 1030 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: Running task 1032 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: Running task 1033 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_patch: Succeeded
NOTE: Running setscene task 467 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1034 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe curl-8.14.1-r0: task do_patch: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1038 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1039 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_patch)
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: Running noexec task 1041 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running setscene task 471 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 473 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running task 1044 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.9-r0: task do_patch: Succeeded
NOTE: recipe file-5.46-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1047 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1048 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe file-5.46-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 474 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running setscene task 475 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 478 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 480 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1053 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 481 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1059 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1061 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: Running task 1063 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: Running task 1065 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1066 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: Running task 1068 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_collect_spdx_deps)
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: Running noexec task 1071 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: Running noexec task 1072 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 1073 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_unpack: Succeeded
NOTE: Running setscene task 482 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 1074 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe musl-1.2.5+git-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: Running task 1075 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.5+git-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 483 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1088 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_fetch: Succeeded
NOTE: Running task 1101 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_unpack)
NOTE: Running task 1102 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to a5195a8651bd771dfe48b1ecae2e89a153927fbb5dc68cc8c0dfb226e9d1dda0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: recipe linux-libc-headers-6.15-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.15-r0: task do_unpack: Succeeded
NOTE: Running task 1105 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_patch)
NOTE: Running task 1106 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_patch: Succeeded
NOTE: Running noexec task 1108 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_configure)
NOTE: Running noexec task 1109 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_compile)
NOTE: Running task 1110 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_install)
NOTE: recipe linux-libc-headers-6.15-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_install: Succeeded
NOTE: Running task 1123 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1126 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1127 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1128 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1129 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1131 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1132 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.5+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.5+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1133 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.5+git-r0: task do_configure: Started
NOTE: recipe musl-1.2.5+git-r0: task do_configure: Succeeded
NOTE: Running task 1134 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe musl-1.2.5+git-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to da33fe8f6a7890db63413405feb1881b88b767074b7f31fbdd6672dce23e2838
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Running setscene task 485 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-6.15-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_package unihash changed to ddff8f6156106d2e64408b37da53533a3e3a062bbc402bce770890e7bc4dce06
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata became valid
NOTE: Running setscene task 482 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1144 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_collect_spdx_deps)
NOTE: recipe musl-1.2.5+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.5+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1145 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.5+git-r0: task do_install: Started
NOTE: recipe musl-1.2.5+git-r0: task do_install: Succeeded
NOTE: Running task 1147 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1148 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe libgcc-15.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package: Started
NOTE: recipe libgcc-15.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1149 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_configure)
NOTE: recipe libgcc-15.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1150 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_compile)
NOTE: recipe libgcc-15.1.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to b9a9e2733a27da4330422728d1c06b0adeb190ace6dd59cfb0088ed98b6f2b7a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Running setscene task 484 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1153 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-15.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-15.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1154 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_install)
NOTE: recipe libgcc-15.1.0-r0: task do_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_install: Succeeded
NOTE: Running task 1155 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_multilib_install)
NOTE: recipe libgcc-15.1.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-15.1.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1156 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_extra_symlinks)
NOTE: recipe libgcc-15.1.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-15.1.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1158 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1159 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_package)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-15.1.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1160 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_configure)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-15.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_package unihash changed to 37892d8bd191cfae154d0b5d6acc2afc5d264720f984910e48d46f1d1724245b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1163 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1164 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_compile)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1165 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_install)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1173 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1174 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1175 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1176 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1177 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1178 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_package)
NOTE: Running task 1179 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1180 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1181 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1182 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1183 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1184 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: Running task 1185 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1186 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe libunistring-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1187 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure)
NOTE: Running task 1188 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe lzlib-1.15-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-1.3-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1189 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: Running task 1190 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe lzlib-1.15-r0: task do_configure: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1191 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_compile)
NOTE: Running task 1192 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1193 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_configure)
NOTE: recipe lzlib-1.15-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_configure: Started
NOTE: Running task 1194 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1195 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1196 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1198 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1199 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1200 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1201 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1202 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_configure)
NOTE: Running task 1203 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1204 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_configure)
NOTE: Running task 1205 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure)
NOTE: recipe openssl-3.5.1-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.55-r0: task do_configure: Started
NOTE: recipe xz-5.8.1-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1206 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1207 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe lzlib-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1208 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1209 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe lzlib-1.15-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_install: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1212 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1213 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1214 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 1215 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1216 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: Running task 1217 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_package unihash changed to adf1c13b6969fa341ac7b7367b98d2ae551de949f07eaf2f2ace61e3cfddd1ae
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx became valid
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: Running setscene task 484 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1218 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1220 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: Running task 1222 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: Running task 1225 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_package)
NOTE: Running task 1226 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1227 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_collect_spdx_deps)
NOTE: Running task 1228 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_collect_spdx_deps)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 1229 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe lzlib-1.15-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gmp-6.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gmp-6.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1230 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_collect_spdx_deps)
NOTE: Running task 1231 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1233 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1234 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1235 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1236 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: Running task 1237 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: Running task 1238 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Started
NOTE: Running task 1239 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1240 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: Running task 1241 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe zstd-1.5.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1242 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_collect_spdx_deps)
NOTE: recipe lzlib-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1244 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_collect_spdx_deps)
NOTE: recipe zlib-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1245 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_collect_spdx_deps)
NOTE: recipe lzlib-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 102cae314aba23bab775ed99bdcad7fffabfb78d7f1d9fc27ae8b0cb6e0f0054
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_package: Succeeded
NOTE: Running task 1247 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1249 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_collect_spdx_deps)
NOTE: Running task 1250 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_package unihash changed to c9f854f994ba44a1b144512018573c309b5af8c906606d04321f0ba3aea6e1af
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_create_spdx became valid
NOTE: recipe bzip2-1.0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xz-5.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 40ee9056326a91be937f83637fc6b15a24792f6033ffd74d059895fa619e9c8d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: recipe xz-5.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_configure: Succeeded
NOTE: Running setscene task 482 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_create_spdx_setscene)
NOTE: Running task 1251 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_configure_ptest_base)
NOTE: Running task 1252 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_collect_spdx_deps)
NOTE: Running task 1253 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_collect_spdx_deps)
NOTE: recipe lzlib-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.55-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssl-3.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe openssl-3.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running task 1254 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_compile)
NOTE: recipe libgpg-error-1.55-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_compile: Started
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1257 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1260 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.55-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.55-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1261 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_compile)
NOTE: recipe libgpg-error-1.55-r0: task do_compile: Started
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 05f392b84647c83e80398fd9746df35387965e29aa354f247af2951955f93901
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 485 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running task 1263 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1264 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_configure_ptest_base)
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xz-5.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1267 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile)
NOTE: recipe xz-5.8.1-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1268 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install)
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 1269 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to 4de3c314c5f23b524d09e43d06898128ce6f113afccc9a93c5a76cb09c690615
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: recipe xz-5.8.1-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 481 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx_setscene)
NOTE: Running task 1271 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_compile_ptest_base)
NOTE: Running task 1272 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1273 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1275 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package)
NOTE: recipe libtasn1-4.20.0-r0: task do_compile: Started
NOTE: Running task 1277 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.76-r0: task do_package: Started
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.55-r0: task do_compile: Succeeded
NOTE: Running task 1278 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.55-r0: task do_compile_ptest_base: Started
NOTE: recipe xz-5.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1279 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install)
NOTE: Running task 1280 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_install)
NOTE: recipe xz-5.8.1-r0: task do_install: Started
NOTE: recipe libgpg-error-1.55-r0: task do_install: Started
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1281 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.55-r0: task do_install: Succeeded
NOTE: Running task 1282 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.55-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.55-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1284 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1285 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_package)
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.55-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1286 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_configure)
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package unihash changed to 8216cd5327db04ab5903da8d2dac6c5a740b4eca0589eb5783eb2b3621093706
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Running setscene task 484 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package unihash changed to 31c48510793faa3cfcc48001778a9d4c79869822ca725fb16e54a162f8e40145
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx became valid
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running task 1289 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_install_ptest_base)
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1293 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package)
NOTE: recipe xz-5.8.1-r0: task do_package: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1294 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_install)
NOTE: recipe libtasn1-4.20.0-r0: task do_install: Started
NOTE: recipe libgpg-error-1.55-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_package unihash changed to 6ed79004ed337e90859e5abb6cf05461ce89c44c05a1b2d95d718953b427847d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_create_spdx became valid
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1297 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1298 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe libtasn1-4.20.0-r0: task do_install: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: Running task 1300 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_package)
NOTE: recipe libtasn1-4.20.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_package unihash changed to dd417f33bd60020d49e63fb4486b40cfb4d39ce6c594d0c5a2b0274195cd695a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata became valid
NOTE: Running setscene task 485 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1303 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe xz-5.8.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_package unihash changed to 5e81124b1d95fe8496f06e324c5ad083acbef4e9798051bd5c7f2587c3ddee16
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx became valid
NOTE: Running setscene task 485 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1307 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1308 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe nettle-3.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe libunistring-1.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1309 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_compile)
NOTE: recipe nettle-3.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1310 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_configure)
NOTE: recipe libunistring-1.3-r0: task do_compile: Started
NOTE: recipe nettle-3.10.1-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to f6c82071e6bef832ed5389f273fcaecb982890a71425af5823702da7b6e131ed
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1313 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_collect_spdx_deps)
NOTE: recipe nettle-3.10.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe nettle-3.10.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1314 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1315 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_compile)
NOTE: recipe libgcrypt-1.11.1-r0: task do_compile: Started
NOTE: recipe nettle-3.10.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1316 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1317 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_compile)
NOTE: recipe nettle-3.10.1-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: Running task 1319 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1320 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: recipe file-5.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe file-5.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1321 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_configure)
NOTE: recipe file-5.46-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to f7597c410f2f67cc62a7860e5c9f6f6369d230a4bb02517759190ddd930f3f42
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx became valid
NOTE: Running setscene task 484 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1324 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_collect_spdx_deps)
NOTE: recipe file-5.46-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.46-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1325 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1326 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_install)
NOTE: recipe nettle-3.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 1327 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1328 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_install)
NOTE: recipe nettle-3.10.1-r0: task do_install: Succeeded
NOTE: Running task 1329 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.11.1-r0: task do_install: Started
NOTE: recipe nettle-3.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 1330 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.11.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1331 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_package)
NOTE: recipe nettle-3.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1334 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.11.1-r0: task do_package: Started
NOTE: recipe nettle-3.10.1-r0: task do_package: Started
NOTE: recipe file-5.46-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1335 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_compile)
NOTE: recipe file-5.46-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_package unihash changed to e1ff697d46b205ee5093b97de0946d56d096a66ec7ce9ab57ff7fbe8275cbaff
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata became valid
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_compile: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1336 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1337 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_install)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.5.1-r0: task do_install: Started
NOTE: recipe file-5.46-r0: task do_compile: Succeeded
NOTE: Running task 1340 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_install)
NOTE: recipe file-5.46-r0: task do_install: Started
NOTE: recipe nettle-3.10.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_package unihash changed to 2d7458c6525e5e3550f20b9f820466d9dd8def1520a830d3380184a524740cbe
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata became valid
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_install: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1341 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package)
NOTE: recipe file-5.46-r0: task do_package: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe file-5.46-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_package unihash changed to a6c1a598b7d171de627c1a7b75419cce69489d863598d9314d093242f4738aa1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata became valid
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 1345 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_install_ptest_base)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1349 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_package)
NOTE: recipe openssl-3.5.1-r0: task do_package: Started
NOTE: recipe libunistring-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1350 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_install)
NOTE: recipe libunistring-1.3-r0: task do_install: Started
NOTE: recipe libunistring-1.3-r0: task do_install: Succeeded
NOTE: Running task 1352 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1353 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_package)
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.3-r0: task do_package: Started
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1354 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_configure)
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Started
NOTE: recipe openssl-3.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_package unihash changed to b3f11f390024409ef3484a61d7a3d476373668c147f4eef960362bb66092e289
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_package unihash changed to 75bef6804edc8cdc1ccd3fcd390bf68b83ea453f3ae467bbfa93a10cc41958c7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx became valid
NOTE: Running setscene task 481 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1359 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1360 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_compile)
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_install)
NOTE: recipe libidn2-2.3.8-r0: task do_install: Started
NOTE: recipe libidn2-2.3.8-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1364 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1365 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package)
NOTE: recipe gnutls-3.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Started
NOTE: recipe curl-8.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1366 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_configure)
NOTE: recipe gnutls-3.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1367 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_configure)
NOTE: recipe curl-8.14.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.9-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package unihash changed to 6fc339826ade9cc5956b430c50eb47e99f8b1dc062d6a6ea891ec7a1fbf26d82
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata became valid
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1370 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_collect_spdx_deps)
NOTE: Running task 1371 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_collect_spdx_deps)
NOTE: recipe gnutls-3.8.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.14.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1372 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.14.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.14.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1373 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_compile)
NOTE: recipe curl-8.14.1-r0: task do_compile: Started
NOTE: recipe curl-8.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1374 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.14.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.14.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1375 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_install)
NOTE: recipe curl-8.14.1-r0: task do_install: Started
NOTE: recipe curl-8.14.1-r0: task do_install: Succeeded
NOTE: Running task 1376 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.14.1-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1377 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1378 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_compile)
NOTE: recipe gnutls-3.8.9-r0: task do_compile: Started
NOTE: recipe curl-8.14.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1379 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_package)
NOTE: recipe curl-8.14.1-r0: task do_package: Started
NOTE: recipe curl-8.14.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_package unihash changed to 545d0bc623a4a7831dfcf0df15f9672bf84ecb50b96d28302e0a851c40ae6adb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata became valid
NOTE: Running setscene task 486 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnutls-3.8.9-r0: task do_compile: Succeeded
NOTE: Running task 1383 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1384 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_install)
NOTE: recipe gnutls-3.8.9-r0: task do_install: Started
NOTE: recipe gnutls-3.8.9-r0: task do_install: Succeeded
NOTE: Running task 1385 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.9-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1386 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_package)
NOTE: Running task 1388 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.9-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1389 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_package unihash changed to 182732324b28e9fe97c11ac89c761a8e4143944e0f8bcfe48e3a984598f6eb9b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_create_spdx became valid
NOTE: Running setscene task 487 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 488 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gnutls/3.8.9/temp/log.do_packagedata_setscene.2914942
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 1390 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1392 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1393 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1394 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1395 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package)
NOTE: Running task 1396 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1397 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1398 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_spdx)
NOTE: Running task 1399 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_write_ipk)
NOTE: Running task 1400 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_write_deb)
NOTE: Running task 1401 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_write_rpm)
NOTE: Running task 1402 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_qa)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_write_ipk: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_write_deb: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_qa: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1403 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_package_spdx)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_package_spdx: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1404 of 1404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1404 tasks of which 1116 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 31 ERROR messages, returning a non-zero exit code.
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-src went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dbg went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dane went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-openssl went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-xx went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-fips went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-ptest went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-staticdev went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dev went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-doc went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-cs went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-de went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-eo went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-es went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fi went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fr went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-it went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ka went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ms went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-nl went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pl went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pt-br went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ro went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sr went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sv went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-uk went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-vi went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-zh-cn went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-bin went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls went backwards which would break package feeds (from 0:3.8.10-r0 to 0:3.8.9-r0) [version-going-backwards]
ERROR: gnutls-3.8.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5840714471272374260==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmicrohttpd-upgrade-1.0.1-1.0.2.patch"

RnJvbSA1NDg3ZWU1ZDJhOGRhMWY4MWFmMjM3OGExMjg1ZjBjNTg5NWIyOGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTU6NDc6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtaWNyb2h0dHBkOiB1cGdyYWRlIDEuMC4xIC0+IDEuMC4yCgotLS0KIC4uLi97bGlibWljcm9o
dHRwZF8xLjAuMS5iYiA9PiBsaWJtaWNyb2h0dHBkXzEuMC4yLmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1pY3JvaHR0cGQve2xpYm1pY3JvaHR0cGRfMS4wLjEuYmIg
PT4gbGlibWljcm9odHRwZF8xLjAuMi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjEuYmIgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjIuYmIKc2ltaWxh
cml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9o
dHRwZC9saWJtaWNyb2h0dHBkXzEuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjIuYmIKaW5kZXggMDYyOGVlNzFiNS4u
YTc1YTViM2JlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRw
ZC9saWJtaWNyb2h0dHBkXzEuMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1p
Y3JvaHR0cGQvbGlibWljcm9odHRwZF8xLjAuMi5iYgpAQCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9
ICJuZXQiCiBERVBFTkRTID0gImZpbGUiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9saWJt
aWNyb2h0dHBkLyR7QlBOfS0ke1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTg5
ZTA5ZmM5YjRkZTM0ZGRlMTlmNGZjYjRmYWFhMWNlMTAyOTliOTkwOGRiMTEzMmJiZmExZGU0Nzg4
MmI5NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkZjMyNGZjZDA4MzQxNzVkYWIwNzQ4MzEzMzkw
MmQ5Nzc0YTYwNWJmYTI5ODAyNWY2OTg4MzI4OGZkMjBhOGM3IgogCiBpbmhlcml0IGF1dG90b29s
cyBsaWJfcGFja2FnZSBwa2djb25maWcgZ2V0dGV4dAogCi0tIAoyLjQ3LjEKCg==

--===============5840714471272374260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libmicrohttpd: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/libmicrohttpd: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/libmicrohttpd: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.1.tar.gz" to "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.2.tar.gz"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-bin: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-bin: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGSIZE changed from 832480 to 830528 (-0%)
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-dbg: FILELIST: removed "/usr/lib/.debug/libmicrohttpd.so.12.62.1", added "/usr/lib/.debug/libmicrohttpd.so.12.62.2"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGSIZE changed from 253070 to 253903 (+0%)
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-dev: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGSIZE changed from 513575 to 512850 (-0%)
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-doc: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-locale: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-locale: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-src: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PV changed from "1.0.1" to "1.0.2"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.1", added "/usr/lib/libmicrohttpd.so.12.62.2"
packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd: PV changed from "1.0.1" to "1.0.2"
Changes to packages/core2-64-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.1 to libmicrohttpd.so.12.62.2
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.1 to libmicrohttpd.so.12.62.2
  /usr/lib/libmicrohttpd.so.12.62.1 moved to /usr/lib/libmicrohttpd.so.12.62.2
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.1 to libmicrohttpd.so.12.62.2
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.1 to libmicrohttpd.so.12.62.2
  /usr/lib/libmicrohttpd.so.12.62.1 moved to /usr/lib/libmicrohttpd.so.12.62.2

--===============5840714471272374260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.1", added "/usr/lib/libmicrohttpd.so.12.62.2"
Changes to packages/core2-64-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.1 to libmicrohttpd.so.12.62.2
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.1 to libmicrohttpd.so.12.62.2
  /usr/lib/libmicrohttpd.so.12.62.1 moved to /usr/lib/libmicrohttpd.so.12.62.2
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.1 to libmicrohttpd.so.12.62.2
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.1 to libmicrohttpd.so.12.62.2
  /usr/lib/libmicrohttpd.so.12.62.1 moved to /usr/lib/libmicrohttpd.so.12.62.2

--===============5840714471272374260==--

