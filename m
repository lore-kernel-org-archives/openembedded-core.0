Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B2CC433FE
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:41 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.10612.1648819419933974180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=piCTIuKL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017fe54bb812-a617e8be-977c-46a5-9685-d1bb897483e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=brJ6zxPLFJmDqmlzGNZproPFyFYx0ko0nBM3mLUitTs=;
	b=piCTIuKLBX3o3SuO+2tiaCKuQaRXD+/aor3vHkNL9vpMgjMv7rNYwmmMZ9ovT2jZ
	PQPZ4zqRVVylFeoMOizZSbAV6ZH99KftZ5ke8TYC7YkxqBm2YiIyIM5fUHfsez4kp1o
	pCi/uNUMnjHhnpRTtMWs/yRqL+22xMmlQ1AKW1Ak=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=brJ6zxPLFJmDqmlzGNZproPFyFYx0ko0nBM3mLUitTs=;
	b=TONinFK7YuU+laxllTNPRfIuNGzhxlYg9A1F30F1xRA8iWO27BwSnhIT97sKP1Gg
	uMHMvM6s3/PMcVD3K49Sxj2DSF0g/dYQxRuNL078uL3+Wxe5GCOIEdPoC5manGJeU4l
	nm9Oh+vRQ80JtfXjXe09xsEDfrh1c6gKU37YM9tE=
Content-Type: multipart/mixed; boundary="===============7164852424765554465=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.38 FAILED
Message-ID: 
 <0101017fe54bb812-a617e8be-977c-46a5-9685-d1bb897483e6-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:39 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163888

--===============7164852424765554465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.38* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-upgrade-2.37.4-2.38.patch
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
--===============7164852424765554465==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-util-linux-upgrade-2.37.4-2.38.patch"

From 8e48c6ab228fdb7bcb797bcc9ac9042273676de7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 06:27:27 +0000
Subject: [PATCH] util-linux: upgrade 2.37.4 -> 2.38

---
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.37.4.bb => util-linux_2.38.bb}     | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux_2.37.4.bb => util-linux_2.38.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 982ec669a2..c9bddfb7a6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
+SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.4.bb b/meta/recipes-core/util-linux/util-linux_2.38.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.37.4.bb
rename to meta/recipes-core/util-linux/util-linux_2.38.bb
-- 
2.27.0


--===============7164852424765554465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (880 cached, 2 parsed). 1640 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7c8e0487d5b8cef1e59d0a1f511dafae548352c9"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 285 Local 25 Mirrors 0 Missed 260 Current 280 (8% match, 53% complete)
Removing 23 stale sstate objects for arch x86_64...done.
Removing 94 stale sstate objects for arch qemux86...done.
Removing 4 stale sstate objects for arch allarch...done.
Removing 99 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 342 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 355 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 358 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 384 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 440 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 443 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 447 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 452 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 483 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 496 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 515 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 524 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe glibc-locale-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 193 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_patch)
NOTE: recipe glibc-locale-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 252 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.63-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 287 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.16-r0: task do_patch: Started
NOTE: Running task 309 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_fetch)
NOTE: Running task 321 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 322 of 1995 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch)
NOTE: Running task 367 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 398 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_fetch)
NOTE: Running task 410 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_fetch)
NOTE: Running task 418 of 1995 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_fetch)
NOTE: Running task 433 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch)
NOTE: recipe glibc-2.35-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 532 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 534 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_fetch)
NOTE: Running task 535 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: Running task 554 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Succeeded
NOTE: Running task 588 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.37.4-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Started
NOTE: Running task 614 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: Running task 624 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe ncurses-6.3-r0: task do_fetch: Started
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 654 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 656 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 657 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_fetch)
NOTE: Running task 658 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_fetch)
NOTE: Running task 665 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 680 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_patch: Succeeded
NOTE: Running task 700 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_unpack)
NOTE: Running noexec task 717 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_configure)
NOTE: recipe ncurses-6.3-r0: task do_fetch: Succeeded
NOTE: Running noexec task 718 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_compile)
NOTE: Running task 719 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_install)
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.7-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.38-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Started
NOTE: Running task 720 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.38-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: Running task 721 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe libcap-ng-0.8.2-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: Running task 722 of 1995 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: Running task 723 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 724 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_unpack)
NOTE: Running task 725 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Started
NOTE: Running task 738 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.2-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_fetch: Started
NOTE: Running task 749 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 756 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: Running task 757 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 758 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: Running task 760 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 791 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: Running task 799 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 803 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: Running task 812 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_unpack)
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Succeeded
NOTE: Running task 832 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: Running task 833 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_patch)
NOTE: Running task 834 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.16-r0: task do_install: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz - will attempt other sources if available
NOTE: Running task 853 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_patch)
NOTE: Running task 854 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe glibc-2.35-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.3-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.7-r0: task do_unpack: Started
NOTE: recipe libcap-2.63-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe libcap-2.63-r0: task do_fetch: Succeeded
NOTE: Running task 879 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_unpack)
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_unpack)
NOTE: recipe util-linux-native-2.38-r0: task do_unpack: Started
NOTE: Running task 976 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: Running task 987 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 989 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe zlib-1.2.11-r0: task do_patch: Started
NOTE: recipe util-linux-2.38-r0: task do_unpack: Started
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: Running task 1023 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_unpack)
NOTE: Running task 1028 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: Running task 1060 of 1995 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_fetch)
NOTE: recipe coreutils-9.0-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.37.4-r0: task do_fetch: Failed
NOTE: recipe libcap-2.63-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.7-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe bash-5.1.16-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_fetch: Started
NOTE: recipe libcap-2.63-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe ncurses-6.3-r0: task do_unpack: Succeeded
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz - will attempt other sources if available
NOTE: recipe zlib-1.2.11-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.38-r0: task do_unpack: Succeeded
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-libuuid-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_fetch: Failed
NOTE: recipe util-linux-2.38-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1080 tasks of which 1023 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch
Summary: There were 12 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: util-linux-libuuid-native-2.37.4-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz
ERROR: util-linux-libuuid-native-2.37.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz\' has sha256 checksum \'634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83\' when \'6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-libuuid-native/2.37.4-r0/temp/log.do_fetch.1928967
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch) failed with exit code '1'
ERROR: util-linux-libuuid-2.37.4-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz
ERROR: util-linux-libuuid-2.37.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz\' has sha256 checksum \'634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83\' when \'6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/util-linux-libuuid/2.37.4-r0/temp/log.do_fetch.1928982
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_fetch) failed with exit code '1'

--===============7164852424765554465==--

