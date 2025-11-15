Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C705CEDD82
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11939.1763224721298458727
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NbSpnAAv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iL6Jp+Ef;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a88629b1d-d22b2daa-c7d1-45a0-908e-0e4fe9def13a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DpFS0IgCP65d3q9KxTIxqZi3rQsMYAyiqZYmQy9IhBo=;
	b=NbSpnAAvjXGnvjEnahDQTz3NLU89oMqFzUgUbFwOIT8fph5SeiZaHVXpPxQjZoHc
	n140efMUfGolnsQHFfK9+bU+NFWEaoAJbDez4H68NpEOkuCdcE+NfoFn2TNWuR93sbC
	sj8gl2no7tGVPCSWEIqnt7AqhP+YOgLzFjxUXh1M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DpFS0IgCP65d3q9KxTIxqZi3rQsMYAyiqZYmQy9IhBo=;
	b=iL6Jp+EfEzJKh+KoeBQAKxF63L6WclmQt1tWZ1AOsQ2H1qZ8cBeIKD0Y3OWyOpPB
	Jo5/kH0HPouzg1cwu7q9+TO6zhJlKXx8loIycXmwnleaORmvpR2teQ9w6n7zdnUPNZd
	k5uOq9HLoDJnvWpjZXDU1yEXdbhuPTVhY7EEHlkI=
Content-Type: multipart/mixed; boundary="===============0109822559047441064=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] sqlite3: upgrading to 3.51.0 FAILED
Message-ID: <0101019a88629b1d-d22b2daa-c7d1-45a0-908e-0e4fe9def13a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226458

--===============0109822559047441064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.51.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.48.0-3.51.0.patch
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
From 4da41b4f0daad9da2d5b74f8eea93ad4a217d798 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 16:37:02 +0000
Subject: [PATCH] sqlite3: upgrade 3.48.0 -> 3.51.0

---
 .../sqlite/{sqlite3_3.48.0.bb => sqlite3_3.51.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.51.0.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.51.0.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.51.0.bb
index bd2ac6614d..3f3eee49a0 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.0.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI[sha256sum] = "42e26dfdd96aa2e6b1b1be5c88b0887f9959093f650d693cb02eb9c36d146ca5"
 
-- 
2.47.1


--===============0109822559047441064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1946 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8f17ca4d760ec4a52a4c434f9e77a5736a4d4b4b"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:8f17ca4d760ec4a52a4c434f9e77a5736a4d4b4b"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 142 Local 76 Mirrors 0 Missed 66 Current 214 (53% match, 81% complete)
Removing 6 stale sstate objects for arch x86-64-v3...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 31 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 252 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 289 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 294 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 303 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 306 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 308 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 327 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 329 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 333 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 344 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 346 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 347 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-native-2.7.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 348 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 350 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-native-10.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 352 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-native-2.7.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 319 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_fetch)
NOTE: Running task 332 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_fetch)
NOTE: recipe sqlite3-3_3.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 515 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_fetch)
NOTE: Running noexec task 519 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_fetch)
NOTE: Running task 521 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_fetch: Started
NOTE: Running noexec task 723 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_fetch)
NOTE: Running noexec task 735 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_fetch)
NOTE: Running task 737 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 739 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 803 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_fetch)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.9-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 804 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.9-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.51.0-r0: task do_fetch: Succeeded
NOTE: Running task 805 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_unpack)
NOTE: Running task 806 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe glibc-2.42+git-r0: task do_fetch: Succeeded
NOTE: Running task 807 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_unpack)
NOTE: Running task 808 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_fetch: Succeeded
NOTE: Running task 809 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_unpack)
NOTE: Running task 810 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 811 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_patch)
NOTE: recipe glibc-2.42+git-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-native-3.13.9-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_unpack: Succeeded
NOTE: Running task 812 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_patch)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 813 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.51.0-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_unpack: Succeeded
NOTE: Running task 815 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_patch)
NOTE: Running task 816 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_collect_spdx_deps)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_patch: Succeeded
NOTE: Running task 820 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_configure)
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_configure: Started
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_fetch: Succeeded
NOTE: Running task 821 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_unpack: Started
NOTE: recipe python3-native-3.13.9-r0: task do_unpack: Succeeded
NOTE: Running task 823 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_patch)
NOTE: recipe python3-native-3.13.9-r0: task do_patch: Started
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_unpack: Succeeded
NOTE: Running task 824 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 356 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 835 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_fetch)
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_fetch: Succeeded
NOTE: Running task 837 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.17-r0: task do_unpack: Started
NOTE: recipe glibc-2.42+git-r0: task do_unpack: Succeeded
NOTE: Running task 838 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_patch)
NOTE: recipe glibc-2.42+git-r0: task do_patch: Started
NOTE: recipe python3-native-3.13.9-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.42+git-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_unpack: Succeeded
NOTE: Running task 841 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_patch)
NOTE: Running task 842 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.17-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_patch: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'autoconf-native', 'automake-native', 'gnu-config-native', 'pkgconfig-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Running ../sources/sqlite-autoconf-3510000/configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr 		  --exec_prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr 		  --bindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/bin 		  --sbindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/sbin 		  --libexecdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/libexec 		  --datadir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/share 		  --sysconfdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work
 /x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/etc 		  --sharedstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/com 		  --localstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/var 		  --libdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/lib 		  --includedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/include 		  --oldincludedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/include 		  --infodir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/share/info 		  --mandir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot
 -native/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking      --enable-shared     --enable-threadsafe     --disable-static-shell  --disable-static  --enable-dynamic-extensions --disable-editline --disable-fts3 --enable-fts4 --enable-fts5 --disable-readline --enable-rtree --disable-session
| No installed jimsh or tclsh, building local bootstrap jimsh0
| Configuring SQLite version 3.51.0
| Host System...x86_64-pc-linux-gnu
| Build System...x86_64-pc-linux-gnu
| Source dir = /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/sources/sqlite-autoconf-3510000
| Build dir  = /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/build
| C compiler... gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/include -O2 -pipe -DUSE_PREAD -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_BYTEORDER=1234 -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/include
| C++ compiler... g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/recipe-sysroot-native/usr/include
| Build C compiler...gcc
| Checking for stdlib.h...ok
| Error: Unknown option --target
| Try: 'configure --help' for options
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2255389:288 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2255389, line 288
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2255389, line 264
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2255389, line 237
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2255389, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2255389, line 292
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 843 tasks of which 812 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115163648.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115163648.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/log.do_configure.2255389
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-native-3_3.51.0-r0 do_configure: configure failed
ERROR: sqlite3-native-3_3.51.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2255389' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/log.do_configure.2255389
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_configure) failed with exit code '1'

--===============0109822559047441064==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.48.0-3.51.0.patch"

RnJvbSA0ZGE0MWI0ZjBkYWFkOWRhMmQ1Yjc0ZjhlZWE5M2FkNGEyMTdkNzk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTY6Mzc6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNDguMCAtPiAzLjUxLjAKCi0tLQogLi4uL3NxbGl0ZS97c3FsaXRl
M18zLjQ4LjAuYmIgPT4gc3FsaXRlM18zLjUxLjAuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuNDguMC5iYiA9PiBzcWxpdGUzXzMuNTEu
MC5iYn0gKDY5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlM18zLjQ4LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUx
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA2OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy40OC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjUxLjAuYmIKaW5kZXggYmQyYWM2NjE0ZC4uM2YzZWVlNDlhMCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy40OC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTEuMC5iYgpAQCAt
NCw1ICs0LDUgQEAgTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3Nx
bGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIK
IAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyNS9zcWxpdGUtYXV0b2NvbmYt
JHtTUUxJVEVfUFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhYzk5MmY3ZmNhMzk4
OWRlN2VkMWZlOTljMTYzNjNmODQ4Nzk0YzhjMzJhMTU4ZGFmZDRlYjkyN2EyZTAyZmQ1IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjQyZTI2ZGZkZDk2YWEyZTZiMWIxYmU1Yzg4YjA4ODdmOTk1OTA5
M2Y2NTBkNjkzY2IwMmViOWMzNmQxNDZjYTUiCiAKLS0gCjIuNDcuMQoK

--===============0109822559047441064==--

