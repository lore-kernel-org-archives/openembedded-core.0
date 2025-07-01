Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC43C83F1E
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:37 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1433.1751386835735364402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OKzSS1Vo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HsfJJKn+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010197c6ca48fc-e3d468a2-ca57-4479-9225-1c5dac9ceecc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2CGM3Tp1YCvEAv6fBhEq8QG8KMORoOak3VrpgUePsWk=;
	b=OKzSS1VoDqdI0ewhjRXLhtFPJ7cNFzKIHkLEFtQiclOFMzKjGdkzJRm8zKIExKEo
	IkBkXnBOKsMSK2LUIjBiM4mwFKooCjgpQm304vXs7XuqRmNDSrIslMSl9CnmwgOl8jk
	BPJVJJyyYVE7w4QINS8icW8CgzOABsKQGdsfw0Jk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2CGM3Tp1YCvEAv6fBhEq8QG8KMORoOak3VrpgUePsWk=;
	b=HsfJJKn+zMmJrOemzi9mqr2q3kly8T1azSjNV6CPvVyQi2ZyX8Pi9LqppC2d/YP2
	kq2XtQdQ9nQfDyEaqE4KIDO1I+iCxX2tv8DB1sheztjv0mOwq5cm3tY8MrZp0UL9oyu
	9OLFkUJQ/DhXbYrkij0l67UwhmINNSx4/rI1ePFY=
Content-Type: multipart/mixed; boundary="===============4222426144634958606=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.50.2 FAILED
Message-ID: <01010197c6ca48fc-e3d468a2-ca57-4479-9225-1c5dac9ceecc-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219711

--===============4222426144634958606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.50.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.48.0-3.50.2.patch
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
From d1be4fbdab9261a79cdd91c95e1ac3859902ea48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 16:14:46 +0000
Subject: [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2

---
 .../sqlite/{sqlite3_3.48.0.bb => sqlite3_3.50.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.50.2.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.50.2.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.50.2.bb
index bd2ac6614d..1aaaa73c35 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.50.2.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI[sha256sum] = "84a616ffd31738e4590b65babb3a9e1ef9370f3638e36db220ee0e73f8ad2156"
 
-- 
2.47.1


--===============4222426144634958606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1919 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-aaa3454d2591fde966ac7424a2d094d72a2ee486"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:aaa3454d2591fde966ac7424a2d094d72a2ee486"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 148 Local 77 Mirrors 0 Missed 71 Current 208 (52% match, 80% complete)
Removing 4 stale sstate objects for arch core2-64...done.
Removing 9 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 278 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 281 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 287 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 290 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 310 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 330 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: Running task 164 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 337 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running noexec task 663 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 672 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_fetch)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 673 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 340 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 689 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: Running noexec task 693 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: Running task 694 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_recipe_qa)
NOTE: recipe expat-native-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 344 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_create_spdx_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 761 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe sqlite3-3_3.50.2-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe ninja-native-1.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 762 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: Running task 763 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 764 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe ninja-native-1.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_fetch: Started
NOTE: Running task 765 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.50.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 766 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_unpack)
NOTE: Running task 767 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: Running task 768 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_fetch)
NOTE: recipe ninja-native-1.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.50.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.50.2-r0: task do_fetch: Succeeded
NOTE: Running task 769 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 770 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe ninja-native-1.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/re2c/re2c_4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.50.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: Running task 775 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_patch)
NOTE: Running task 776 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_collect_spdx_deps)
NOTE: recipe re2c-native-4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.50.2-r0: task do_unpack: Succeeded
NOTE: Running task 777 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_patch)
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_patch: Succeeded
NOTE: Running task 778 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.50.2-r0: task do_patch: Started
NOTE: recipe re2c-native-4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/re2c/re2c_4.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.50.2-r0: task do_patch: Succeeded
NOTE: Running task 779 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 780 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_populate_lic)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_unpack: Succeeded
NOTE: recipe re2c-native-4.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 781 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_patch)
NOTE: recipe sqlite3-3_3.50.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.50.2-r0: task do_populate_lic: Started
NOTE: recipe re2c-native-4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 813 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_configure)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_configure: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.50.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.50.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 350 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 816 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 354 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 355 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 827 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 828 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 841 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 842 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'autoconf-native', 'automake-native', 'gnu-config-native', 'pkgconfig-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Running ../sources/sqlite-autoconf-3500200/configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr 		  --exec_prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr 		  --bindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/bin 		  --sbindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/sbin 		  --libexecdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/libexec 		  --datadir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/share 		  --sysconfdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work
 /x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/etc 		  --sharedstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/com 		  --localstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/var 		  --libdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/lib 		  --includedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/include 		  --oldincludedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/include 		  --infodir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/share/info 		  --mandir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot
 -native/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking      --enable-shared     --enable-threadsafe     --disable-static-shell  --disable-static  --enable-dynamic-extensions --disable-editline --disable-fts3 --enable-fts4 --enable-fts5 --disable-readline --enable-rtree --disable-session
| No installed jimsh or tclsh, building local bootstrap jimsh0
| Configuring SQLite version 3.50.2
| Host System...x86_64-pc-linux-gnu
| Build System...x86_64-pc-linux-gnu
| Source dir = /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/sources/sqlite-autoconf-3500200
| Build dir  = /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/build
| C compiler... gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/include -O2 -pipe -DUSE_PREAD -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_BYTEORDER=1234 -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/include
| C++ compiler... g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/recipe-sysroot-native/usr/include
| Build C compiler...gcc
| Checking for stdlib.h...ok
| Error: Unknown option --target
| Try: 'configure --help' for options
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/temp/run.do_configure.62140:267 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/temp/run.do_configure.62140, line 267
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/temp/run.do_configure.62140, line 243
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/temp/run.do_configure.62140, line 216
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/temp/run.do_configure.62140, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/temp/run.do_configure.62140, line 271
NOTE: recipe sqlite3-native-3_3.50.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 843 tasks of which 813 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701161432.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701161432.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/temp/log.do_configure.62140
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-native-3_3.50.2-r0 do_configure: configure failed
ERROR: sqlite3-native-3_3.50.2-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/temp/run.do_configure.62140' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.2/temp/log.do_configure.62140
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.2.bb:do_configure) failed with exit code '1'

--===============4222426144634958606==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.48.0-3.50.2.patch"

RnJvbSBkMWJlNGZiZGFiOTI2MWE3OWNkZDkxYzk1ZTFhYzM4NTk5MDJlYTQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNjoxNDo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNx
bGl0ZTM6IHVwZ3JhZGUgMy40OC4wIC0+IDMuNTAuMgoKLS0tCiAuLi4vc3FsaXRlL3tzcWxpdGUz
XzMuNDguMC5iYiA9PiBzcWxpdGUzXzMuNTAuMi5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9zcWxpdGUve3NxbGl0ZTNfMy40OC4wLmJiID0+IHNxbGl0ZTNfMy41MC4y
LmJifSAoNjklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxp
dGUzXzMuNDguMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTAu
Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDY5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjQ4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L3NxbGl0ZS9zcWxpdGUzXzMuNTAuMi5iYgppbmRleCBiZDJhYzY2MTRkLi4xYWFhYTczYzM1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjQ4LjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41MC4yLmJiCkBAIC00
LDUgKzQsNSBAQCBMSUNFTlNFID0gIlBEIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vc3Fs
aXRlMy5oO2VuZGxpbmU9MTE7bWQ1PTc4NmQzZGM1ODFlZmYwM2Y0ZmQ5ZTRhNzdlZDAwYzY2Igog
CiBTUkNfVVJJID0gImh0dHA6Ly93d3cuc3FsaXRlLm9yZy8yMDI1L3NxbGl0ZS1hdXRvY29uZi0k
e1NRTElURV9QVn0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFjOTkyZjdmY2EzOTg5
ZGU3ZWQxZmU5OWMxNjM2M2Y4NDg3OTRjOGMzMmExNThkYWZkNGViOTI3YTJlMDJmZDUiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiODRhNjE2ZmZkMzE3MzhlNDU5MGI2NWJhYmIzYTllMWVmOTM3MGYz
NjM4ZTM2ZGIyMjBlZTBlNzNmOGFkMjE1NiIKIAotLSAKMi40Ny4xCgo=

--===============4222426144634958606==--

