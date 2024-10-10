Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8525AD1A45B
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.53344.1728588936244469837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aWcZjDba;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=11kvvkfk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277eec093-92d594c8-2609-423f-9941-6ce9678c6ce3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HaqcGHNHqSY7qra2PI/MTEyYg7criEFHbp9TqxNDAHk=;
	b=aWcZjDbaallLwSXha8QtjNYBZZgGccQWsBraeJGHgEkCUfBlnwCHMFU8BtvDKrUX
	hk49cHhrrCPo58fhox0x7UXz6+RgXvITpbro2oP4UnLcLTz23LoGSSvpK9ENbm3RzCV
	xNhzv6CtuqVZV5TIaELiBZc1pGdbHzh9TBPaGQ+U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HaqcGHNHqSY7qra2PI/MTEyYg7criEFHbp9TqxNDAHk=;
	b=11kvvkfksU2odWJxvl2ZCpRAyl37aTod3cLjNBItTHeFYwX8WLA+SzjUCB9kqC7Q
	ScXwvyAqZpJErs0PmklS/wDoQHw45faSaNrJpAbj+fGszTNLC5KcA+PZVGrK+f5+trw
	lMGpxGdS06p4M6tDnPod6BqBS9Omsn3O/O9wv2JI=
Content-Type: multipart/mixed; boundary="===============8699549786782906792=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.48 SUCCEEDED
Message-ID: <0101019277eec093-92d594c8-2609-423f-9941-6ce9678c6ce3-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205586

--===============8699549786782906792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.48* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.47-2.48.patch
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
From 71fc6b814a62016d145002bcfad3740b05b9e931 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 02:39:07 +0000
Subject: [PATCH] repo: upgrade 2.47 -> 2.48

---
 meta/recipes-devtools/repo/{repo_2.47.bb => repo_2.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.47.bb => repo_2.48.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.47.bb b/meta/recipes-devtools/repo/repo_2.48.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.47.bb
rename to meta/recipes-devtools/repo/repo_2.48.bb
index adebea1c8e..8b72a9e71b 100644
--- a/meta/recipes-devtools/repo/repo_2.47.bb
+++ b/meta/recipes-devtools/repo/repo_2.48.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "1e19f7dd61923b8835d9c6e1a7e560575dafaf1e"
+SRCREV = "454fdaf1191c87e5c770ab865a911e10e600e178"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.44.1


--===============8699549786782906792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1872 targets, 51 skipped, 0 masked, 0 errors.
Removing 37 recipes from the core2-64 sysroot...done.
Removing 65 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7fc2ca06e005099c255aad96f5798a9a128f188a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 458 Local 447 Mirrors 0 Missed 11 Current 192 (97% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 195 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 196 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 197 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 201 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 202 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 206 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 214 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_populate_lic_setscene)
NOTE: recipe git-2.46.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe git-2.46.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe repo-2.48-r0: task do_populate_lic_setscene: Started
NOTE: recipe git-2.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.46.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe repo-2.48-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 661 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_recipe_qa)
NOTE: recipe git-2.46.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe repo-2.48-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 296 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe git-2.46.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe git-2.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe git-2.46.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 302 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 305 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 317 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.48-r0: task do_recipe_qa: Succeeded
NOTE: recipe git-2.46.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 675 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_fetch)
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.48-r0: task do_fetch: Started
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/git/2.46.1/temp/log.do_packagedata_setscene.3391309
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 324 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.1.bb:do_package_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.48-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running task 743 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.48-r0: task do_unpack: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe git-2.46.1-r0: task do_package_setscene: Started
NOTE: recipe repo-2.48-r0: task do_unpack: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: Running task 902 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_patch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.48-r0: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.48-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: Running task 918 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 502 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.48-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.48-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.46.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 550 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 554 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 650 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1613 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1649 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.1.bb:do_packagedata)
NOTE: Running task 1773 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.46.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.48-r0: task do_collect_spdx_deps: Started
NOTE: recipe repo-2.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.48-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1806 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_configure)
NOTE: recipe repo-2.48-r0: task do_configure: Started
NOTE: recipe repo-2.48-r0: task do_configure: Succeeded
NOTE: recipe git-2.46.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1807 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_compile)
NOTE: recipe repo-2.48-r0: task do_compile: Started
NOTE: recipe repo-2.48-r0: task do_compile: Succeeded
NOTE: Running task 1812 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_install)
NOTE: recipe repo-2.48-r0: task do_install: Started
NOTE: recipe repo-2.48-r0: task do_install: Succeeded
NOTE: Running task 1813 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_package)
NOTE: Running task 1814 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_populate_sysroot)
NOTE: recipe repo-2.48-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.48-r0: task do_package: Started
NOTE: recipe repo-2.48-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.48-r0: task do_package: Succeeded
NOTE: Running task 1815 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_packagedata)
NOTE: recipe repo-2.48-r0: task do_packagedata: Started
NOTE: recipe repo-2.48-r0: task do_packagedata: Succeeded
NOTE: Running task 1816 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_create_spdx)
NOTE: Running task 1817 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_package_write_ipk)
NOTE: Running task 1818 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_package_write_deb)
NOTE: Running task 1819 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_package_write_rpm)
NOTE: Running task 1820 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_package_qa)
NOTE: recipe repo-2.48-r0: task do_create_spdx: Started
NOTE: recipe repo-2.48-r0: task do_package_write_ipk: Started
NOTE: recipe repo-2.48-r0: task do_package_write_deb: Started
NOTE: recipe repo-2.48-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.48-r0: task do_package_qa: Started
NOTE: recipe repo-2.48-r0: task do_create_spdx: Succeeded
NOTE: Running task 1821 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_create_package_spdx)
NOTE: recipe repo-2.48-r0: task do_create_package_spdx: Started
NOTE: recipe repo-2.48-r0: task do_package_qa: Succeeded
NOTE: recipe repo-2.48-r0: task do_package_write_ipk: Succeeded
NOTE: recipe repo-2.48-r0: task do_package_write_deb: Succeeded
NOTE: recipe repo-2.48-r0: task do_create_package_spdx: Succeeded
NOTE: recipe repo-2.48-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1822 of 1822 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.48.bb:do_build)
NOTE: Tasks Summary: Attempted 1822 tasks of which 1801 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.47.0-r0 to 0:2.46.1-r0) [version-going-backwards]
ERROR: git-2.46.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8699549786782906792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.47 [default] to 2.48 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.47" to "2.48"
packages/core2-64-poky-linux/repo/repo: PKGSIZE changed from 46943 to 47175 (+0%)

--===============8699549786782906792==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.47-2.48.patch"

RnJvbSA3MWZjNmI4MTRhNjIwMTZkMTQ1MDAyYmNmYWQzNzQwYjA1YjllOTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDI6Mzk6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNDcgLT4gMi40OAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by97cmVwb18yLjQ3LmJiID0+IHJlcG9fMi40OC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcmVwby97cmVwb18yLjQ3LmJiID0+IHJlcG9fMi40OC5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDcuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcmVwby9yZXBvXzIuNDguYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQ3LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDguYmIKaW5kZXggYWRlYmVhMWM4ZS4uOGI3
MmE5ZTcxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQ3
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40OC5iYgpAQCAtMTEs
NyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5
NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9nZXJyaXQuZ29v
Z2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAog
ICAgICAgICAgICAiCi1TUkNSRVYgPSAiMWUxOWY3ZGQ2MTkyM2I4ODM1ZDljNmUxYTdlNTYwNTc1
ZGFmYWYxZSIKK1NSQ1JFViA9ICI0NTRmZGFmMTE5MWM4N2U1Yzc3MGFiODY1YTkxMWUxMGU2MDBl
MTc4IgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVw
by5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAot
LSAKMi40NC4xCgo=

--===============8699549786782906792==--

