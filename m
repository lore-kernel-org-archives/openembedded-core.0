Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E006E7719E
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.33344.1734254982310866049
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ne7MXpxp;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bHbmHh31;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193c9a6f1db-22144d19-4c3a-4eac-a103-b76d74b8a650-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=65exUbRDtGT9LQEU8e7d+WvQiHgL8KtPVotcvb5B5V0=;
	b=Ne7MXpxpepyQDPZXNDi2Ck5Ah2+aiUEtUr/goGZFriZp/2AuO9zJKiKhbyh2vIpe
	qkBpB6spbfmNGTiVBl6KKQsLHFsIWgn64fRQUf85j2iOzV87LGnib73Dall9CoWlye8
	D8mPfoahQjajD464mrU2+eqWIcS4tK+0jKq474mU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=65exUbRDtGT9LQEU8e7d+WvQiHgL8KtPVotcvb5B5V0=;
	b=bHbmHh31YyWs6FGf0i2eRhsCvtURFxabwymdjS1XXSmrsEod+M3U4aXwKXiZp/8N
	VBmBe0PDmoh9JWPnk11o+q+Fp+zxjYZMDTvTbOT8rmpKyjWZ9hiaCY59KOQA87Yi6O8
	o5Yk8DNnAYZKBwtEiZWTcVqQ7Kr59gdjGGiNYEVM=
Content-Type: multipart/mixed; boundary="===============8825177415315901991=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] file: upgrading to 5.46 FAILED
Message-ID: <01010193c9a6f1db-22144d19-4c3a-4eac-a103-b76d74b8a650-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208715

--===============8825177415315901991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *file* to *5.46* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-file-upgrade-5.45-5.46.patch
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
From 160ef0d97da98e2057c68164ad281671ea7a19dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 07:13:04 +0000
Subject: [PATCH] file: upgrade 5.45 -> 5.46

---
 meta/recipes-devtools/file/{file_5.45.bb => file_5.46.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.45.bb => file_5.46.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.45.bb b/meta/recipes-devtools/file/file_5.46.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.45.bb
rename to meta/recipes-devtools/file/file_5.46.bb
index fa8dc576dc..2e9dabb96f 100644
--- a/meta/recipes-devtools/file/file_5.45.bb
+++ b/meta/recipes-devtools/file/file_5.46.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
            file://print_c.patch \
           "
 
-SRCREV = "4cbd5c8f0851201d203755b76cb66ba991ffd8be"
+SRCREV = "c5aa4f7f8d5063fb3c37ad57bf54bb67ec641a09"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.44.1


--===============8825177415315901991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5884ea0609786d03696138fc3040af1f9ae035c0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 144 Local 98 Mirrors 0 Missed 46 Current 199 (68% match, 86% complete)
Removing 1 stale sstate objects for arch x86_64...done.
Removing 10 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 275 of 343 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 290 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 295 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 300 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 302 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 303 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 308 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 314 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_stash_locale_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-native-1.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Started
NOTE: Running noexec task 589 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running noexec task 635 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 674 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_fetch)
NOTE: Running task 680 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: Running task 685 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 691 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 696 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 700 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe xz-5.6.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 715 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_fetch)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-native-1.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 315 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.14-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe file-5.46-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 741 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe xz-5.6.3-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 742 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 318 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 332 of 343 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running setscene task 333 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: recipe file-5.46-r0: task do_fetch: Succeeded
NOTE: Running task 806 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 807 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 808 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 809 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: Running task 810 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe file-native-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 334 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.6.3-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 811 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_patch)
NOTE: Running task 812 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: Running task 814 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_unpack: Started
NOTE: recipe file-native-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: Running task 816 of 1019 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe xz-5.6.3-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 817 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: Running task 818 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 819 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe file-native-5.46-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 820 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_fetch)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.6.3-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_unpack)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 828 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe file-5.46-r0: task do_unpack: Succeeded
NOTE: Running task 829 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 830 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe file-native-5.46-r0: task do_fetch: Succeeded
NOTE: Running task 831 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 832 of 1019 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: Running task 833 of 1019 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.46-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe file-native-5.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-native-5.46-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe file-native-5.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-native-5.46-r0: task do_unpack: Succeeded
NOTE: Running task 837 of 1019 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: Running task 838 of 1019 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_collect_spdx_deps)
NOTE: recipe file-native-5.46-r0: task do_patch: Started
NOTE: recipe file-native-5.46-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-native-5.46-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 839 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_unpack)
NOTE: recipe lzlib-1.14-r0: task do_unpack: Started
NOTE: recipe lzlib-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 840 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_patch)
NOTE: recipe lzlib-1.14-r0: task do_patch: Started
NOTE: recipe lzlib-1.14-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_unpack: Succeeded
NOTE: Running task 842 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_patch)
NOTE: recipe glibc-2.40+git-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 340 of 343 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.40+git-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 865 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 866 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: Running noexec task 868 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: Running noexec task 869 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 870 of 1019 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: recipe file-5.46-r0: task do_patch: Failed
NOTE: recipe file-native-5.46-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 870 tasks of which 829 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241215071249.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241215071249.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/file/5.46/temp/log.do_patch.1221036
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/file-native/5.46/temp/log.do_patch.1221537
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: file-5.46-r0 do_patch: Applying patch 'print_c.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/file/5.46/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/file/5.46/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch print_c.patch
patching file src/print.c
Hunk #1 FAILED at 289.
1 out of 1 hunk FAILED -- rejects in file src/print.c
Patch print_c.patch can be reverse-applied

stderr: ')
ERROR: file-native-5.46-r0 do_patch: Applying patch 'print_c.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/file-native/5.46/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/file-native/5.46/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch print_c.patch
patching file src/print.c
Hunk #1 FAILED at 289.
1 out of 1 hunk FAILED -- rejects in file src/print.c
Patch print_c.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/file/5.46/temp/log.do_patch.1221036
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/file-native/5.46/temp/log.do_patch.1221537
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch) failed with exit code '1'

--===============8825177415315901991==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-file-upgrade-5.45-5.46.patch"

RnJvbSAxNjBlZjBkOTdkYTk4ZTIwNTdjNjgxNjRhZDI4MTY3MWVhN2ExOWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDc6MTM6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
aWxlOiB1cGdyYWRlIDUuNDUgLT4gNS40NgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmls
ZS97ZmlsZV81LjQ1LmJiID0+IGZpbGVfNS40Ni5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmlsZS97ZmlsZV81LjQ1LmJiID0+IGZpbGVfNS40Ni5iYn0gKDk3JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZmlsZS9maWxlXzUuNDUuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZmlsZS9maWxlXzUuNDYuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZpbGUvZmlsZV81LjQ1LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZmlsZS9maWxlXzUuNDYuYmIKaW5kZXggZmE4ZGM1NzZkYy4uMmU5
ZGFiYjk2ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZpbGUvZmlsZV81LjQ1
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9maWxlL2ZpbGVfNS40Ni5iYgpAQCAtMTUs
NyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZmlsZS9maWxlLmdpdDticmFu
Y2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovL3ByaW50X2MucGF0
Y2ggXAogICAgICAgICAgICIKIAotU1JDUkVWID0gIjRjYmQ1YzhmMDg1MTIwMWQyMDM3NTViNzZj
YjY2YmE5OTFmZmQ4YmUiCitTUkNSRVYgPSAiYzVhYTRmN2Y4ZDUwNjNmYjNjMzdhZDU3YmY1NGJi
NjdlYzY0MWEwOSIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHVw
ZGF0ZS1hbHRlcm5hdGl2ZXMKLS0gCjIuNDQuMQoK

--===============8825177415315901991==--

