Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA658C54EE3
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.75760.1722536832802889095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=e47warjd;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4fk43pR6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101910f3245f1-a5e0504c-106b-47e8-8092-a06fb55cbd20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=daNNCbIknZt7H7bsSKIACvfQXdZqgK65kND+Qe7wQik=;
	b=e47warjdMsVvGQf0jOLvUenNwi7pGBlcZ/PTIRQBJ8fb5swRrlN4vZN7gNCEdlYf
	dX7D/ANGqk6ugkcNURLaewcPBd1yFzDfVpjgwtu8N9vNaL6qSMkTl87RbU9AK5/xozD
	A32iOFUsRXj6IQ1Zl9tUMJRVcxz2yChwCFZqWwzM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=daNNCbIknZt7H7bsSKIACvfQXdZqgK65kND+Qe7wQik=;
	b=4fk43pR6RzGmuvSG235eeinAV10hpNSpSkvVr/5I5jAXHSssYTRL+RwiNyTwXtMg
	Tmo0J960/1ik1H4BJdLM/iNZ85PxrLMGUFZ7efaYXjaf/obMunlxMgAaeiz/PoVa6eV
	RwfLF6fOCjCXerwjktICPTrMJ5jjCwFiZxERaUlc=
Content-Type: multipart/mixed; boundary="===============5484093033585295254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.62.1 SUCCEEDED
Message-ID: <010101910f3245f1-a5e0504c-106b-47e8-8092-a06fb55cbd20-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202882

--===============5484093033585295254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nghttp2* to *1.62.1* has Succeeded.

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
From eac457632ca4c73bed0b0c325169ac655b095902 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 17:57:35 +0000
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


--===============5484093033585295254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1884 targets, 48 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 62 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-7a51dda65b997ecc28b1b37d611b5e21292d3982"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7a51dda65b997ecc28b1b37d611b5e21292d3982"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 422 Local 407 Mirrors 0 Missed 15 Current 207 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 208 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 209 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 210 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 213 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 214 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: Running task 649 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_recipe_qa)
NOTE: recipe openssl-3.3.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 283 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_recipe_qa unihash changed to 0f34935f5108d3de49687a5fd14f43828fe67bcdc61f47017089ea1be14651ae
NOTE: Running task 739 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_fetch)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 299 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: Running task 740 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_unpack)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 301 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 302 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: Running task 741 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_patch)
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 313 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_patch: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_patch: Succeeded
NOTE: Running task 774 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 775 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_generate_toolchain_file)
NOTE: Running task 776 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_populate_lic)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_populate_lic: Started
NOTE: recipe openssl-3.3.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 347 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 348 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.1-r0: task do_populate_lic: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_populate_lic unihash changed to aeae0670d0e2d286edee1f608bacf52b9b8bdd9d3eb45f7692c8cc1f49a8459a
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 370 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_deploy_source_date_epoch unihash changed to e4a2132a0f2142520fc9e5c1ad66b25ec24a340f8200e7bd067e2853be8626cd
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 400 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 401 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 436 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1016 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/curl/8.8.0/temp/log.do_packagedata_setscene.2937663
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 488 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_package_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1072 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1073 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1079 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1101 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1107 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe curl-8.8.0-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1108 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1114 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 551 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1140 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 624 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1590 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1628 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata)
NOTE: Running task 1723 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_collect_spdx_deps)
NOTE: recipe nghttp2-1.62.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1759 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_configure)
NOTE: recipe nghttp2-1.62.1-r0: task do_configure: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_configure: Succeeded
NOTE: Running task 1760 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_compile)
NOTE: recipe nghttp2-1.62.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_compile: Succeeded
NOTE: Running task 1761 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_install)
NOTE: recipe nghttp2-1.62.1-r0: task do_install: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_install: Succeeded
NOTE: Running task 1762 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package)
NOTE: Running task 1763 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.62.1-r0: task do_package: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_populate_sysroot unihash changed to 8c469a3f05c570dd33f847114ae96d3776e46efdef82489dd5393872d882d476
NOTE: Setscene tasks completed
NOTE: recipe nghttp2-1.62.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package unihash changed to 96e253b8d6ab7de25d5598536d3978d2514ee9f6b0e7462201200c39b5745f1d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_packagedata became valid
NOTE: Running setscene task 629 of 629 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1765 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_create_spdx)
NOTE: Running task 1766 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_write_ipk)
NOTE: Running task 1767 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_write_deb)
NOTE: Running task 1768 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_write_rpm)
NOTE: Running task 1769 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_qa)
NOTE: recipe nghttp2-1.62.1-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_ipk: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_deb: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_rpm: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_qa: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1770 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_create_package_spdx)
NOTE: recipe nghttp2-1.62.1-r0: task do_create_package_spdx: Started
NOTE: recipe nghttp2-1.62.1-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_qa unihash changed to b088b1b66253127d199c991a2dddfb8803e638751d3ce5211710ef7fbc3fddd5
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_write_ipk unihash changed to 24153bc3831d0ce5635d306ff61c29fa912a6a0c785359058136203496562cb6
NOTE: recipe nghttp2-1.62.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_write_deb unihash changed to 0a1e680d08a8053074d6678ef1a529c03bb24ed18750b1807dffc4651b115e51
NOTE: recipe nghttp2-1.62.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_package_write_rpm unihash changed to e02fa75d80c059ef02923933299e0ba73c9d81f05f340bd557ae018cfdd9abe8
NOTE: Running noexec task 1771 of 1771 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1771 tasks of which 1740 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-8.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:8.9.1-r0 to 0:8.8.0-r0) [version-going-backwards]
ERROR: curl-8.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:8.9.1-r0 to 0:8.8.0-r0) [version-going-backwards]
ERROR: curl-8.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:8.9.1-r0 to 0:8.8.0-r0) [version-going-backwards]
ERROR: curl-8.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:8.9.1-r0 to 0:8.8.0-r0) [version-going-backwards]
ERROR: curl-8.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:8.9.1-r0 to 0:8.8.0-r0) [version-going-backwards]
ERROR: curl-8.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:8.9.1-r0 to 0:8.8.0-r0) [version-going-backwards]
ERROR: curl-8.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:8.9.1-r0 to 0:8.8.0-r0) [version-going-backwards]
ERROR: curl-8.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:8.9.1-r0 to 0:8.8.0-r0) [version-going-backwards]
ERROR: curl-8.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:8.9.1-r0 to 0:8.8.0-r0) [version-going-backwards]
ERROR: curl-8.8.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5484093033585295254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.62.0/nghttp2-1.62.0.tar.xz" to "https://github.com/nghttp2/nghttp2/releases//download/v1.62.1/nghttp2-1.62.1.tar.xz"
packages/core2-64-poky-linux/nghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/libnghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]

--===============5484093033585295254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.62.0-1.62.1.patch"

RnJvbSBlYWM0NTc2MzJjYTRjNzNiZWQwYjBjMzI1MTY5YWM2NTViMDk1OTAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNzo1NzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aHR0cDI6IHVwZ3JhZGUgMS42Mi4wIC0+IDEuNjIuMQoKLS0tCiAuLi4vbmdodHRwMi97bmdodHRw
Ml8xLjYyLjAuYmIgPT4gbmdodHRwMl8xLjYyLjEuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNjIuMC5iYiA9PiBuZ2h0dHAyXzEuNjIu
MS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25n
aHR0cDJfMS42Mi4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEu
NjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS42Mi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS42Mi4xLmJiCmluZGV4IDVhODIwZDhjZDUuLjhhYjZiMTdm
ZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjYy
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjIuMS5i
YgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT03NjRhYmRmMzBiMmVhZGQzN2NlNDdkY2JjZTBlYTFlYyIKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L25naHR0cDItJHtQVn0u
dGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI2Nzk4MzA4ZmEwYTEyZGFiZGI3YmE4Yzc3
Zjc0MzgzMDE5ZDNhMGYxZjM2ZDI1OTU4YjgzNmFmMjI0NzQ5NTgiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjM0NWQ0ZGMxMzZmZGEyOGNlMjQzZTBiYjIxZjJlN2U4ZWY2MjkzZDYyYzc5OWFiYmY2
ZjYzM2E2ODg3YWY3MiIKIAogaW5oZXJpdCBjbWFrZSBtYW5wYWdlcyBweXRob24zbmF0aXZlIGdp
dGh1Yi1yZWxlYXNlcwogUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10gPSAiIgotLSAKMi40NC4wCgo=

--===============5484093033585295254==--

