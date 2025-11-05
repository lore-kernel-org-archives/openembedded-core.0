Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858C4CD4F30
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:50 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2343.1762384572017878893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Brz9vsHs;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tX4/1rZ5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a564ef817-2798ecd5-408a-47d5-bc40-4c93bbb97962-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384607;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eIvhO8n2IFbAk6lN56ba5TTcP/8uMVawLjOiWdMGqkg=;
	b=Brz9vsHsQ7aoE0dtEvhy1HfdxrL7MDnAyICswWVEC3/UcXyXs4Z50Wm5QF9i+pcO
	GBn1Q2M6/hSAdsthzBU7PxZXdoQayO4/WJBSSrHLL39AMj1YwJlV72trW3GlswuLUZA
	6T5GDGukSMTesgL0FvFjanG/5uV+og9hjSwnPOGQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384607;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eIvhO8n2IFbAk6lN56ba5TTcP/8uMVawLjOiWdMGqkg=;
	b=tX4/1rZ523ikqg8Fh0QJuFBBhD0JKWgcyMdOlvUnzbSl8eLRQ09Kl4I4FndqkRxN
	2Iygvo3HCGqiZIqiWcaDxXVRcc4wRRl8fnwKuE6TGHZi4II6sxTTcI/myBEy261cdMW
	lzWd6AFHzJ7Yi96vKCxDDQ/7uY9+uDPfwLLeNcnw=
Content-Type: multipart/mixed; boundary="===============1256034617611039977=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] sqlite3: upgrading to 3.51.0 FAILED
Message-ID: <0101019a564ef817-2798ecd5-408a-47d5-bc40-4c93bbb97962-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225923

--===============1256034617611039977==
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
From bb2a16af8926e436208ced88f5df0bf13c769c2b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 23:14:41 +0000
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


--===============1256034617611039977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1947 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-67f00f5562d485388246a84c7d1f5d39ebe4a829"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:67f00f5562d485388246a84c7d1f5d39ebe4a829"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 142 Local 71 Mirrors 0 Missed 71 Current 214 (50% match, 80% complete)
Removing 31 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 6 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 289 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 296 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 300 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 317 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 324 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 325 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 329 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 347 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 165 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_recipe_qa)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 350 of 356 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_recipe_qa: Started
NOTE: recipe libgcc-initial-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 567 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_fetch)
NOTE: Running noexec task 568 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_15.2.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 626 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_fetch)
NOTE: recipe libpcre2-native-10.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 659 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_fetch)
NOTE: Running noexec task 723 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 735 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_fetch)
NOTE: Running task 736 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_recipe_qa)
NOTE: recipe python3-native-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 799 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_fetch)
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 801 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe glibc-2.42+git-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 802 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_unpack)
NOTE: Running task 803 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_unpack)
NOTE: Running task 804 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 805 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe python3-native-3.13.9-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_unpack: Started
NOTE: recipe python3-native-3.13.9-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_unpack: Started
NOTE: Running task 806 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 807 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_unpack)
NOTE: Running task 808 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 809 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_patch)
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.51.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_patch: Started
NOTE: Running task 810 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: Running task 811 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_fetch)
NOTE: recipe python3-native-3.13.9-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.51.0-r0: task do_fetch: Started
NOTE: Running task 813 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_patch)
NOTE: Running task 814 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_collect_spdx_deps)
NOTE: recipe sqlite3-3_3.51.0-r0: task do_fetch: Succeeded
NOTE: Running task 815 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.51.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sqlite3-3_3.51.0-r0: task do_unpack: Succeeded
NOTE: Running task 816 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_patch)
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_patch: Succeeded
NOTE: Running task 817 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.51.0-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_patch: Succeeded
NOTE: Running task 818 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 819 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_populate_lic)
NOTE: recipe sqlite3-3_3.51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_populate_lic: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_fetch: Succeeded
NOTE: Running task 821 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 822 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_configure)
NOTE: recipe sqlite3-3_3.51.0-r0: task do_populate_lic: Succeeded
NOTE: recipe pseudo-native-1.9.2+git-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_configure: Started
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2050277:288 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2050277, line 288
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2050277, line 264
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2050277, line 237
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2050277, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2050277, line 292
NOTE: recipe sqlite3-native-3_3.51.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 843 tasks of which 807 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105231426.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105231426.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/log.do_configure.2050277
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-native-3_3.51.0-r0 do_configure: configure failed
ERROR: sqlite3-native-3_3.51.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/run.do_configure.2050277' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.51.0/temp/log.do_configure.2050277
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.0.bb:do_configure) failed with exit code '1'

--===============1256034617611039977==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.48.0-3.51.0.patch"

RnJvbSBiYjJhMTZhZjg5MjZlNDM2MjA4Y2VkODhmNWRmMGJmMTNjNzY5YzJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMzoxNDo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNx
bGl0ZTM6IHVwZ3JhZGUgMy40OC4wIC0+IDMuNTEuMAoKLS0tCiAuLi4vc3FsaXRlL3tzcWxpdGUz
XzMuNDguMC5iYiA9PiBzcWxpdGUzXzMuNTEuMC5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9zcWxpdGUve3NxbGl0ZTNfMy40OC4wLmJiID0+IHNxbGl0ZTNfMy41MS4w
LmJifSAoNjklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxp
dGUzXzMuNDguMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTEu
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDY5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjQ4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L3NxbGl0ZS9zcWxpdGUzXzMuNTEuMC5iYgppbmRleCBiZDJhYzY2MTRkLi4zZjNlZWU0OWEwIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjQ4LjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy41MS4wLmJiCkBAIC00
LDUgKzQsNSBAQCBMSUNFTlNFID0gIlBEIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vc3Fs
aXRlMy5oO2VuZGxpbmU9MTE7bWQ1PTc4NmQzZGM1ODFlZmYwM2Y0ZmQ5ZTRhNzdlZDAwYzY2Igog
CiBTUkNfVVJJID0gImh0dHA6Ly93d3cuc3FsaXRlLm9yZy8yMDI1L3NxbGl0ZS1hdXRvY29uZi0k
e1NRTElURV9QVn0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFjOTkyZjdmY2EzOTg5
ZGU3ZWQxZmU5OWMxNjM2M2Y4NDg3OTRjOGMzMmExNThkYWZkNGViOTI3YTJlMDJmZDUiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNDJlMjZkZmRkOTZhYTJlNmIxYjFiZTVjODhiMDg4N2Y5OTU5MDkz
ZjY1MGQ2OTNjYjAyZWI5YzM2ZDE0NmNhNSIKIAotLSAKMi40Ny4xCgo=

--===============1256034617611039977==--

