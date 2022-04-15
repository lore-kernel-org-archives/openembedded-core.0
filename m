Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B13C3527D
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.11561.1650052686789761630
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=lmMRE9KV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101802ecddf97-b3083ce3-b171-4000-8167-4b1ea876769a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qgwe0GytI8Wo8ADQbbGn1aeou6Wqy6n07WHFJ4tC/yg=;
	b=lmMRE9KVYUnQy9aDCUkfOLcLQ1upw8HKigpXIRvAuXxMLuhIwCq2u0Ioc9+sZBmV
	XBsy9Ai5wWvgsh0TBFMfeQRC4n8fPnEVA7D5CJoj8/TMecAsp/3N1CoaTA75RKpeuuz
	NvCLK39yYUQXz36RICqq2cOTX4K6QUrzHgQAxw+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qgwe0GytI8Wo8ADQbbGn1aeou6Wqy6n07WHFJ4tC/yg=;
	b=bw8TB7qlgYSPzaTZ2Gu/Ibqk0cxQWdbk+iL6N8HrnG8HdYOX7/jRlP8CZLyC2NPq
	uz25wi1EfzkDkwVKymVzFHaeCbT4tAP/i2H2az+goRM12+jHT1lXeGQzIcau/wvTiWe
	mqZLTjQcsEOeFVY6jjkHbGoMzFKjiRiap+fiOqTc=
Content-Type: multipart/mixed; boundary="===============2534696769852084979=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.38 FAILED
Message-ID: 
 <010101802ecddf97-b3083ce3-b171-4000-8167-4b1ea876769a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:05 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164440

--===============2534696769852084979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.38* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-upgrade-2.37.4-2.38.patch
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
--===============2534696769852084979==
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
meta-yocto-bsp       = "tmp-auh-upgrades:819f41658c916294d1e2b54fc7715ed0f9c0e81e"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 13 Mirrors 0 Missed 28 Current 118 (31% match, 82% complete)
Removing 4 stale sstate objects for arch qemux86...done.
Removing 11 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 129 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 134 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_stash_locale_setscene)
NOTE: Running setscene task 135 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 136 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 139 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 249 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch)
NOTE: Running task 343 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_fetch)
NOTE: Running noexec task 493 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_fetch)
NOTE: Running task 508 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch)
NOTE: Running noexec task 510 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.35-r0: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 519 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.37.4-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 520 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_unpack)
NOTE: Running task 521 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 522 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_fetch)
NOTE: recipe libgcc-11.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: util-linux-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe gcc-runtime-11.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_fetch: Succeeded
NOTE: Running task 529 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_unpack)
NOTE: Running task 530 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.35-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 154 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 155 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_prepare_recipe_sysroot: Started
WARNING: util-linux-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
WARNING: util-linux-native-2.37.4-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz - will attempt other sources if available
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcc-initial-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 531 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_fetch)
NOTE: recipe libgcc-initial-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 156 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.35-r0: task do_fetch: Started
NOTE: recipe glibc-2.35-r0: task do_fetch: Succeeded
NOTE: Running task 534 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_unpack)
NOTE: recipe glibc-2.35-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 535 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_patch: Started
WARNING: util-linux-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe util-linux-native-2.37.4-r0: task do_fetch: Failed
NOTE: recipe util-linux-libuuid-2.38-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.35-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 535 tasks of which 521 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_fetch
Summary: There were 7 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: util-linux-native-2.37.4-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz
ERROR: util-linux-native-2.37.4-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz\' has sha256 checksum \'634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83\' when \'6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-native/2.37.4-r0/temp/log.do_fetch.1376103
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_fetch) failed with exit code '1'

--===============2534696769852084979==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.37.4-2.38.patch"

From ceacacbc27b187d220edcc09276d1c730f16658d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 06:41:27 +0000
Subject: [PATCH] util-linux-libuuid: upgrade 2.37.4 -> 2.38

---
 ...{util-linux-libuuid_2.37.4.bb => util-linux-libuuid_2.38.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.4.bb => util-linux-libuuid_2.38.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 982ec669a2..c9bddfb7a6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
+SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
-- 
2.27.0


--===============2534696769852084979==--

