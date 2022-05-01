Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9802CC35295
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.2255.1651434542844188916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BzUy4CAP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010180812b532a-7a74aeb8-c0db-4829-ac6c-5f278ce57a79-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8+1+8PoFLD5/qhFmawLcTURqU9Jrr09EHbvjfMIoqos=;
	b=BzUy4CAPvtHF4InbOXdwLbv1eT98yW5Z29THh1XylJePp3DMQy7DzwC+Xdcg8Vc3
	oUkv2Pjr0y9+nplqo6gXX28C3p/ejAJSmwjTXltI0f02cLEfC6cGLKQkiE1gjBgPLVt
	2PCc+gg1AX8mvO7C7Qe6UuEh5xfiuBOPc5PfvMpg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8+1+8PoFLD5/qhFmawLcTURqU9Jrr09EHbvjfMIoqos=;
	b=IQ52dIIu53F5F8UCmI+S1bC9nOdUmz+jNuMgJvOon15ctkpmBZOAfLJDpajmyLcD
	czJY3DA5w2i5EkQ4LfEyZiOZIzben2pgZqfkDVMMZl8DNtYlWB1EjowVifReh896P0s
	Mk/yp7L2qV+BsAhSGCmwZ4UMr/wOmaBHoeXWCwpU=
Content-Type: multipart/mixed; boundary="===============2709781019953966371=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.38 FAILED
Message-ID: 
 <01010180812b532a-7a74aeb8-c0db-4829-ac6c-5f278ce57a79-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165102

--===============2709781019953966371==
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
--===============2709781019953966371==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.37.4-2.38.patch"

From 0dbf56b2b3ab76d45ae39a3c1e9c7109a8075f19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 08:46:15 +0000
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


--===============2709781019953966371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (882 cached, 2 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-4f978e76b8175f26e9e918cc1a11cddd79881eb1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f978e76b8175f26e9e918cc1a11cddd79881eb1"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 12 Mirrors 0 Missed 28 Current 119 (30% match, 82% complete)
Removing 4 stale sstate objects for arch qemux86...done.
Removing 11 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 130 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 135 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_stash_locale_setscene)
NOTE: Running setscene task 136 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 137 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 140 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 249 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch)
NOTE: Running task 343 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_fetch)
NOTE: Running noexec task 493 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.3.bb:do_fetch)
NOTE: Running task 508 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_fetch)
NOTE: Running noexec task 510 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-11.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.35-r0: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 519 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.37.4-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 520 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_unpack)
NOTE: Running task 521 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_fetch)
NOTE: Running task 522 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-11.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: util-linux-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe gcc-runtime-11.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_fetch: Succeeded
NOTE: Running task 529 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_unpack)
NOTE: Running task 530 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.35-r0: task do_stash_locale_setscene: Succeeded
WARNING: util-linux-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: Running setscene task 155 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 156 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_11.3.bb:do_populate_sysroot_setscene)
WARNING: util-linux-native-2.37.4-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz - will attempt other sources if available
NOTE: recipe linux-libc-headers-5.16-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcc-initial-11.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 531 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_fetch)
NOTE: recipe libgcc-initial-11.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 157 of 159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.3.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe glibc-2.35-r0: task do_fetch: Started
NOTE: recipe gcc-cross-i686-11.3.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe glibc-2.35-r0: task do_fetch: Succeeded
NOTE: Running task 534 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 535 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_patch: Started
NOTE: recipe glibc-2.35-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_patch: Succeeded
NOTE: Running task 536 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_deploy_source_date_epoch)
NOTE: Running task 537 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 538 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_lic: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_patch: Succeeded
NOTE: Running task 539 of 664 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_deploy_source_date_epoch)
WARNING: util-linux-native-2.37.4-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.37.4-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.37.4.tar.xz_bad-checksum_634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83
NOTE: recipe util-linux-native-2.37.4-r0: task do_fetch: Failed
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-native-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-11.3.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe glibc-2.35-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 539 tasks of which 521 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-native/2.37.4-r0/temp/log.do_fetch.1220141
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_fetch) failed with exit code '1'

--===============2709781019953966371==--

