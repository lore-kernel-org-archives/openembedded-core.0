Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF8CE74906
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.64730.1696183990544245275
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TQbUOpHl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VRj7h26O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018aec71b4da-6dcec826-d047-47c5-b8da-609690a29145-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/znGGxxD+G0ezGwLk8UMZf9tvOhsROyM4Am3u6D6zjg=;
	b=TQbUOpHlQwEYhHfCXtBG/rbu0afwB7sJa8vjy/BJ/wroTc+g3JV1h2jAza3omQ2u
	D/bWvCa3zC133Jd1ItozXaedfSVDTIIU3PzVYWTknZNKgkuxZxgCte655vtGJoXQDRI
	CIA8vJepmGu5YTbSPx+UUx5Xdeh2Iue5m+9gFHUM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/znGGxxD+G0ezGwLk8UMZf9tvOhsROyM4Am3u6D6zjg=;
	b=VRj7h26OKkpEe/sZTiUcJ7NAZnjIj979Qxku2+VbScuLLAQ74kUXRDVa0Xivi6AO
	Pxcfj8Xky1lYiNPIiScG2PGhaUgl5uHegGdplVE+QtpWqU2H74oQiQeZ/RLbmo5xWUZ
	8f80lgnM/479xOIBFM2ua3SCZ34Vu4K4IIGV6ftw=
Content-Type: multipart/mixed; boundary="===============6975289985710702385=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext: upgrading to 0.22.2 FAILED
Message-ID: <0101018aec71b4da-6dcec826-d047-47c5-b8da-609690a29145-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188525

--===============6975289985710702385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gettext* to *0.22.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gettext-upgrade-0.22-0.22.2.patch
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
From b0759bb057e9e85852ccf9f5a73270702a2c513b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 07:16:43 +0000
Subject: [PATCH] gettext: upgrade 0.22 -> 0.22.2

---
 meta/recipes-core/gettext/gettext-sources.inc                   | 2 +-
 .../recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.2.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.2.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index b4fb647916..aaa1764c65 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"
+SRC_URI[sha256sum] = "a99662bafc1cc683ec7740844b465c7f30ccb044967f157f74697df9a9306b0e"
diff --git a/meta/recipes-core/gettext/gettext_0.22.bb b/meta/recipes-core/gettext/gettext_0.22.2.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.22.bb
rename to meta/recipes-core/gettext/gettext_0.22.2.bb
-- 
2.39.2


--===============6975289985710702385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (909 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-f4fdb631e5d5d566ff283dd3225e5b5a50b392e0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f4fdb631e5d5d566ff283dd3225e5b5a50b392e0"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 413 Local 38 Mirrors 0 Missed 375 Current 217 (9% match, 40% complete)
Removing 50 stale sstate objects for arch qemux86...done.
Removing 152 stale sstate objects for arch x86_64...done.
Removing 67 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 251 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 290 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 363 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 369 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 376 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 392 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 393 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 398 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 401 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 411 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 422 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 437 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 440 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 442 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 450 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 461 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 463 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 478 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 481 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 89 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 119 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_fetch)
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 155 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running noexec task 208 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 226 of 1777 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.2.bb:do_recipe_qa)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 272 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 616 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe psmisc-23.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 618 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 619 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 620 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 630 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running task 315 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 316 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 317 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 318 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 369 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 371 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: Running task 375 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 386 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 388 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 391 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: Running task 395 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 396 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_fetch)
NOTE: Running task 398 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_fetch)
NOTE: Running task 400 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 425 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Started
NOTE: Running task 426 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_fetch)
NOTE: Running task 430 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 431 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: Running task 432 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 435 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_write_config)
NOTE: recipe gettext-native-0.22.2-r0: task do_recipe_qa: Started
NOTE: Running task 439 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_fetch)
NOTE: Running noexec task 441 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 443 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 444 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 445 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 446 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_fetch)
NOTE: Running task 447 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: Running task 450 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.2.bb:do_recipe_qa)
NOTE: Running task 452 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: Running task 458 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 461 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_recipe_qa)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.3-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Started
NOTE: Running task 486 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: Running task 487 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 493 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: Running task 494 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_unpack)
NOTE: Running task 496 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_fetch)
NOTE: Running task 503 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 505 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_fetch)
NOTE: Running task 508 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 534 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: Running task 536 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 537 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: Running task 539 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 540 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: recipe util-linux-2.39.2-r0: task do_fetch: Started
NOTE: recipe psmisc-23.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: Running task 543 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Started
NOTE: Running task 545 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_fetch: Succeeded
NOTE: Running task 546 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: recipe gettext-native-0.22.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe gettext-minimal-native-0.22-r0: task do_recipe_qa: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: Running task 548 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_fetch: Started
NOTE: Running task 549 of 1777 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.2.bb:do_fetch)
NOTE: Running task 550 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 551 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_unpack)
NOTE: recipe libedit-20230828-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.36-r0: task do_fetch: Succeeded
NOTE: Running task 552 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 553 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 554 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 555 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: Running task 556 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_write_config: Started
NOTE: Running task 557 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe openssl-3.1.3-r0: task do_unpack: Started
NOTE: Running task 558 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe gettext-0.22.2-r0: task do_recipe_qa: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 559 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: Running task 560 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe python3-3.11.5-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: Running task 561 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.69-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: recipe gettext-minimal-native-0.22-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_fetch: Succeeded
NOTE: Running task 562 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_unpack)
NOTE: recipe coreutils-9.4-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Started
NOTE: Running task 563 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_write_config: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_recipe_qa unihash changed to fd321419c9276f338a3d103348fdc2dc06d3f287af59591a0a0b0e25597080b4
NOTE: recipe psmisc-23.6-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Started
NOTE: recipe gettext-native-0.22.2-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe gettext-native-0.22.2-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe gettext-0.22.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe psmisc-23.6-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_unpack: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 564 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 565 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: Running task 566 of 1777 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.2.bb:do_unpack)
NOTE: Running task 567 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: Running task 568 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: Running task 569 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.2.bb:do_fetch)
NOTE: Running task 570 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Setscene tasks completed
NOTE: Running task 571 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_unpack)
NOTE: Running task 572 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 573 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 574 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe gettext-minimal-native-0.22-r0: task do_fetch: Started
NOTE: Setscene tasks completed
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz_bad-checksum_49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Started
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe gettext-0.22.2-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_unpack: Started
NOTE: recipe psmisc-23.6-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe gettext-0.22.2-r0: task do_fetch: Succeeded
NOTE: Running task 575 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.2.bb:do_unpack)
NOTE: recipe gettext-native-0.22.2-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe gettext-0.22.2-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.13-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe gettext-native-0.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 576 of 1777 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.2.bb:do_patch)
NOTE: recipe gettext-native-0.22.2-r0: task do_patch: Started
NOTE: recipe gettext-native-0.22.2-r0: task do_patch: Succeeded
NOTE: Running task 577 of 1777 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gettext-native-0.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gettext-native-0.22.2-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum failure encountered with download of https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz - will attempt other sources if available
NOTE: recipe gettext-0.22.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 578 of 1777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_patch)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_patch: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_patch: Succeeded
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz_bad-checksum_49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab
NOTE: recipe gettext-minimal-native-0.22-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 579 tasks of which 495 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gettext-minimal-native-0.22-r0 do_fetch: Checksum failure fetching https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz
ERROR: gettext-minimal-native-0.22-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz\' has sha256 checksum \'49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab\' when \'a99662bafc1cc683ec7740844b465c7f30ccb044967f157f74697df9a9306b0e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gettext-minimal-native/0.22/temp/log.do_fetch.3924917
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch) failed with exit code '1'

--===============6975289985710702385==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gettext-upgrade-0.22-0.22.2.patch"

RnJvbSBiMDc1OWJiMDU3ZTllODU4NTJjY2Y5ZjVhNzMyNzA3MDJhMmM1MTNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwNzoxNjo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdl
dHRleHQ6IHVwZ3JhZGUgMC4yMiAtPiAwLjIyLjIKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZ2V0
dGV4dC9nZXR0ZXh0LXNvdXJjZXMuaW5jICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3Jl
Y2lwZXMtY29yZS9nZXR0ZXh0L3tnZXR0ZXh0XzAuMjIuYmIgPT4gZ2V0dGV4dF8wLjIyLjIuYmJ9
IHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQve2dldHRleHRfMC4yMi5iYiA9PiBnZXR0ZXh0
XzAuMjIuMi5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4
dC9nZXR0ZXh0LXNvdXJjZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0
LXNvdXJjZXMuaW5jCmluZGV4IGI0ZmI2NDc5MTYuLmFhYTE3NjRjNjUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4dC1zb3VyY2VzLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHQtc291cmNlcy5pbmMKQEAgLTEsNCArMSw0IEBACiBI
T01FUEFHRSA9ICJodHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvZ2V0dGV4dC9nZXR0ZXh0Lmh0
bWwiCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZ2V0dGV4dC9nZXR0ZXh0LSR7UFZ9LnRhci5n
eiBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OWYwODliZTExYjQ5MDE3
MGJiZjA5ZWQyZjUxZTVmNTE3N2Y1NWJlNGNjNjY1MDRhNTg2MTgyMGUwZmIwNmFiIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImE5OTY2MmJhZmMxY2M2ODNlYzc3NDA4NDRiNDY1YzdmMzBjY2IwNDQ5
NjdmMTU3Zjc0Njk3ZGY5YTkzMDZiMGUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9n
ZXR0ZXh0L2dldHRleHRfMC4yMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4
dF8wLjIyLjIuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1jb3JlL2dldHRleHQvZ2V0dGV4dF8wLjIyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29y
ZS9nZXR0ZXh0L2dldHRleHRfMC4yMi4yLmJiCi0tIAoyLjM5LjIKCg==

--===============6975289985710702385==--

