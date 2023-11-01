Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95C3C25B55
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8649.1698848703575674379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bDQGSpQl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZJIxE+xN;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460126-2398736c-aedf-49c5-b27c-aef69cb353eb-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848702;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=w6GxMXgGvzWCWoPyOQP9VI7ovMPbLeMxFXgyMhhfUWA=;
	b=bDQGSpQltfMTIhuQUqn9lJ9agFkYGYYVHbjqLhk0C7iiBh5FnA4N3lXj75SRwTBJ
	u1MJE8w/wAGmgzudIZn7WwBF3L9sB5z6PYqNvfTHh+TtwilR4RjJkBGN+AGbQHoY8Ys
	g8i9gjdlESwWzAqvcIgHCKHe9437142iYharaAQg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848702;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=w6GxMXgGvzWCWoPyOQP9VI7ovMPbLeMxFXgyMhhfUWA=;
	b=ZJIxE+xNs1pd82XI9us06xSNQk52MzrgJkm2cp6kuzfTg7AGn+4R0W12BjWvFE9Q
	24KD7mafxhBq/DLdzneXI0CJskMh5FaRjYcp86R6AHDLygl7k1yPytltvSsjkIE8TVo
	xpyKDzGmlagLZYhHE+w/TI1vARHbqr/I8RNIrdz0=
Content-Type: multipart/mixed; boundary="===============2914929204170560188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.27.7 FAILED
Message-ID: <0101018b8b460126-2398736c-aedf-49c5-b27c-aef69cb353eb-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189934

--===============2914929204170560188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.27.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.27.5-3.27.7.patch
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
From 68a3a5b0c838a214c4bbd2fa64057fe2c810b6e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 06:29:44 +0000
Subject: [PATCH] cmake: upgrade 3.27.5 -> 3.27.7

---
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ef4eec5ab1..ecb0e487df 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"
+SRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.5.bb b/meta/recipes-devtools/cmake/cmake_3.27.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.7.bb
-- 
2.39.2


--===============2914929204170560188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (909 cached, 2 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-2947323c123914592866a944a72711d3e15e9653"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2947323c123914592866a944a72711d3e15e9653"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 127 Local 38 Mirrors 0 Missed 89 Current 274 (29% match, 77% complete)
Removing 14 stale sstate objects for arch x86_64...done.
Removing 20 stale sstate objects for arch qemux86_64...done.
Removing 31 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 340 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 351 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 354 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 366 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 371 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 309 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_recipe_qa)
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-native-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: Running task 652 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: Running task 655 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_recipe_qa)
NOTE: recipe cmake-native-3.27.5-r0: task do_recipe_qa: Started
NOTE: recipe gnutls-native-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-native-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe cmake-3.27.7-r0: task do_recipe_qa: Started
NOTE: recipe cmake-native-3.27.5-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_recipe_qa unihash changed to ddcb5f78a1c1844635225fb39e69e52b6435f3971ac6e5f5923d77c5ca7953d5
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 807 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch)
NOTE: recipe libtirpc-native-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cmake-3.27.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 817 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_fetch)
NOTE: recipe cmake-native-3.27.5-r0: task do_fetch: Started
WARNING: cmake-native-3.27.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz_bad-checksum_5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 398 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-native-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_fetch: Started
NOTE: recipe cmake-3.27.7-r0: task do_fetch: Succeeded
NOTE: Running task 840 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_unpack)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cmake-3.27.7-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 842 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_unpack: Succeeded
NOTE: Running task 844 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 846 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe cmake-3.27.7-r0: task do_patch: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe cmake-3.27.7-r0: task do_patch: Succeeded
NOTE: Running task 849 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 850 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_generate_toolchain_file)
NOTE: Running task 851 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_populate_lic)
NOTE: recipe cmake-3.27.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.27.7-r0: task do_populate_lic: Started
NOTE: recipe cmake-3.27.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.27.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: cmake-native-3.27.5-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.27/cmake-3.27.5.tar.gz - will attempt other sources if available
WARNING: cmake-native-3.27.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz_bad-checksum_5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9
NOTE: recipe cmake-native-3.27.5-r0: task do_fetch: Failed
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 851 tasks of which 839 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.27.5-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.27/cmake-3.27.5.tar.gz
ERROR: cmake-native-3.27.5-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.27.5.tar.gz\' has sha256 checksum \'5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9\' when \'08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.27/cmake-3.27.5.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.27.5/temp/log.do_fetch.2148723
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch) failed with exit code '1'

--===============2914929204170560188==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.27.5-3.27.7.patch"

RnJvbSA2OGEzYTViMGM4MzhhMjE0YzRiYmQyZmE2NDA1N2ZlMmM4MTBiNmU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNjoyOTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiB1cGdyYWRlIDMuMjcuNSAtPiAzLjI3LjcKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjcuNS5iYiA9PiBjbWFrZV8zLjI3LjcuYmJ9
IHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfMy4yNy41LmJiID0+IGNtYWtl
XzMuMjcuNy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5k
ZXggZWY0ZWVjNWFiMS4uZWNiMGU0ODdkZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2UuaW5jCkBAIC0xOSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpv
aW4oZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0gImh0dHBzOi8v
Y21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7UFZ9LnRhci5n
eiBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1MTc1ZThmZTFjYTliMWRkMDkwOTAxMzBk
YjcyMDE5NjhiY2NlMTU5NTk3MWZmOWU5OTk4YzJmMDc2NTAwNGM5IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjA4ZjcxYTEwNjAzNmJmMDUxZjY5Mjc2MGVmOTU1OGMwNTc3YzQyYWMzOWU5NmJhMDk3
ZTc2NjJiZDQxNThkOGUiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/UDxwdmVy
PlxkKyhcLlxkKykrKVwudGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2VfMy4yNy41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
XzMuMjcuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMjcuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlXzMuMjcuNy5iYgotLSAKMi4zOS4yCgo=

--===============2914929204170560188==--

