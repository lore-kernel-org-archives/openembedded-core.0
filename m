Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E3AC7EE37
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.24051.1677681915862304093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HcI5/y2u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101869da27447-4cf64ff8-bf00-4185-823f-8ca3dd8dbf51-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E2paoV9CI0xpp316veXwEeT/1wYluJMX55btGnM7eZs=;
	b=HcI5/y2uaPy/Z00M9PXMVTrPnocviZ26mq/RW9vxRogIzZmrGofnI1NPqgv9uaKk
	r+Ao/LS/9is89fu1UM7mqanXXZeP4nDUYof7HqCF1ywK8m4zVdOpSvyuVLxhW0hVhk9
	53Txfhq+0tD4giWZdO0Lkn2IO9WgDqqsTUf1A/bw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E2paoV9CI0xpp316veXwEeT/1wYluJMX55btGnM7eZs=;
	b=SEJ5VsjeG3ymg/M6JuqdfmWLhZ4JgH9fiNX5+cljirwJer6yLWJ/SwS8gv2dzTJw
	mH2EBLN3a6gNfPZqsvAYvpA7YUxaKGVDXLJT1oKLRfrZQYtbMCBodaRacuV7oeAjc6V
	lQmUxFZLd0kiwq46QfjySzJ5R2upY6pUWqCbshQI=
Content-Type: multipart/mixed; boundary="===============4971470572095425975=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 5a491c5ad333ef34c1e7713f920f51cbb205af60
 SUCCEEDED
Message-ID: <010101869da27447-4cf64ff8-bf00-4185-823f-8ca3dd8dbf51-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177931

--===============4971470572095425975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *5a491c5ad333ef34c1e7713f920f51cbb205af60* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
--===============4971470572095425975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1697 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9b04db9dafe2974b54fd5e0a712ad3542184b16a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9b04db9dafe2974b54fd5e0a712ad3542184b16a"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 18 Mirrors 0 Missed 10 Current 572 (64% match, 98% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 577 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/pango/1.50.12-r0/temp/log.do_packagedata_setscene.3168491
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 599 of 600 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_setscene)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1588 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1944 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Succeeded
NOTE: Running task 2056 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2057 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2058 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2073 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Succeeded
NOTE: Running task 2074 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c345f6a217af5358c1ba08e9736210fba6decfc2bb8c2d72006c0ecd5c669071
NOTE: Running task 2098 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Succeeded
NOTE: Running task 2099 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2100 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2101 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to a2cd21a8442ea765cb5f1c94777a38fb37b90ee394d6ddefa9a576b8e9ce275b
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2102 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a2ffcc996d332fc811cbcfa9d450bc46756f44756a1a31643378580d2d3f8de
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2111 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Succeeded
NOTE: Running task 2112 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Succeeded
NOTE: Running task 2113 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Succeeded
NOTE: Running task 2114 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2115 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Succeeded
NOTE: Running task 2116 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Succeeded
NOTE: Running task 2117 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2118 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2119 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2119 tasks of which 2098 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4971470572095425975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9b04db9dafe2974b54fd5e0a712ad3542184b16a"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9b04db9dafe2974b54fd5e0a712ad3542184b16a"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 19 Mirrors 0 Missed 10 Current 563 (65% match, 98% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 569 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/pango/1.50.12-r0/temp/log.do_packagedata_setscene.3179400
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 591 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_setscene)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1577 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1914 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Succeeded
NOTE: Running task 2024 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2025 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2026 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2041 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Succeeded
NOTE: Running task 2042 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a206e5ca9bfb216d3dcb37f8735837b27539f6a3bbad6c0ef438389972eb1307
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Started
NOTE: Running task 2066 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Succeeded
NOTE: Running task 2067 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2068 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2069 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to a2cd21a8442ea765cb5f1c94777a38fb37b90ee394d6ddefa9a576b8e9ce275b
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2070 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4f4afd15a80d48448aa20cf7cb73786eed2afa02b3e2bd86610490f4d02562e4
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2079 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Succeeded
NOTE: Running task 2080 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Succeeded
NOTE: Running task 2081 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Succeeded
NOTE: Running task 2082 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2083 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Succeeded
NOTE: Running task 2084 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Succeeded
NOTE: Running task 2085 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2086 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2087 of 2087 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2087 tasks of which 2066 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4971470572095425975==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAyNmRiODVkZjE3NTY2ZjljYjA3NDNlZjVhMWRlZDNiZmM1NGVhMGMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxNDowMTozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCA1OTk4YzIzZGNkLi44N2I2ZmFjMDI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbiIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgot
U1JDUkVWID0gIjczNjRjZThlMjY2ZDk0N2JlMTQ2ZDYzNTk1OGE3YjI4Mjc1MmFhYzYiCitTUkNS
RVYgPSAiNWE0OTFjNWFkMzMzZWYzNGMxZTc3MTNmOTIwZjUxY2JiMjA1YWY2MCIKIFBFID0gIjIi
CiBQViA9ICIwLjArZ2l0JHtTUkNQVn0iCiAKLS0gCjIuMzkuMgoK

--===============4971470572095425975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1698 targets, 49 skipped, 0 masked, 0 errors.
Removing 96 recipes from the core2-32 sysroot...done.
Removing 95 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9b04db9dafe2974b54fd5e0a712ad3542184b16a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9b04db9dafe2974b54fd5e0a712ad3542184b16a"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 362 Local 351 Mirrors 0 Missed 11 Current 209 (96% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 210 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 212 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 223 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 943 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Succeeded
NOTE: Running task 968 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Succeeded
NOTE: Running task 969 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Succeeded
NOTE: Running task 970 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 971 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 972 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to a2cd21a8442ea765cb5f1c94777a38fb37b90ee394d6ddefa9a576b8e9ce275b
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 231 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 245 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pango/1.50.12-r0/temp/log.do_packagedata_setscene.3191053
NOTE: Running setscene task 252 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 253 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_setscene)
NOTE: Running setscene task 254 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 260 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 265 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 280 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-7.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 294 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 296 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 305 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1045 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1062 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1063 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1086 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 341 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 345 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1105 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 363 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1111 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 378 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1146 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1195 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 465 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1309 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 10bb837f9be944a042a4976b2679f37e5098b65a05b35e8bee72a997cbf5fff5
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 569 of 571 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1790 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1980 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ea966ecbf6aefa0dc1a4c5d4d0a88cedc818a0eb7c8fdd30980d0615db84acfb
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2007 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2010 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Succeeded
NOTE: Running task 2013 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Succeeded
NOTE: Running task 2014 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2015 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Succeeded
NOTE: Running task 2016 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Succeeded
NOTE: Running task 2017 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2018 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2019 of 2019 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2019 tasks of which 1991 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4971470572095425975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+7364ce8e26" to "0.0+gitAUTOINC+5a491c5ad3"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+7364ce8e26 [default] to 0.0+gitAUTOINC+5a491c5ad3 [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+7364ce8e26" to "0.0+gitAUTOINC+5a491c5ad3"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14282192 to 14299436 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+7364ce8e26" to "0.0+gitAUTOINC+5a491c5ad3"
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+7364ce8e26-r0'])", added "puzzles (['= 2:0.0+git0+5a491c5ad3-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+7364ce8e26" to "0.0+gitAUTOINC+5a491c5ad3"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+7364ce8e26" to "0.0+gitAUTOINC+5a491c5ad3"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/lo
 opy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r
 0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTO
 INC+7364ce8e26-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/matching.c /usr/src/debug/puzzles/2
 _0.0+gitAUTOINC+7364ce8e26-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+7364ce8e26-r0/combi.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.h /usr
 /src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/s
 ingles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-
 r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOI
 NC+5a491c5ad3-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/solo.c"
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+7364ce8e26" to "0.0+gitAUTOINC+5a491c5ad3"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3539478 to 3542339 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+7364ce8e26" to "0.0+gitAUTOINC+5a491c5ad3"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+7364ce8e26-r0'])", added "puzzles-dev (['= 2:0.0+git0+5a491c5ad3-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+7364ce8e26" to "0.0+gitAUTOINC+5a491c5ad3"
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7073218 to 7028162 (-1%)
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3

--===============4971470572095425975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 72 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9b04db9dafe2974b54fd5e0a712ad3542184b16a"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9b04db9dafe2974b54fd5e0a712ad3542184b16a"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 19 Mirrors 0 Missed 10 Current 567 (65% match, 98% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 573 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/pango/1.50.12-r0/temp/log.do_packagedata_setscene.3184861
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 595 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_setscene)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1587 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1926 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Succeeded
NOTE: Running task 2038 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2039 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2040 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2055 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Succeeded
NOTE: Running task 2056 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 315cf3b33000799e6b4c8ebcb437a3ee2f518c8ace1206eb1300b7e859ddf790
NOTE: Running task 2080 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Succeeded
NOTE: Running task 2081 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2082 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2083 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to a2cd21a8442ea765cb5f1c94777a38fb37b90ee394d6ddefa9a576b8e9ce275b
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2084 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 60694d5580c37a2f0574470f273d7ef18b7e5cde6370332f9903f5368d5d61d1
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2093 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Succeeded
NOTE: Running task 2094 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Succeeded
NOTE: Running task 2095 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Succeeded
NOTE: Running task 2096 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2097 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Succeeded
NOTE: Running task 2098 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Succeeded
NOTE: Running task 2099 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2100 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2101 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2101 tasks of which 2080 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4971470572095425975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9b04db9dafe2974b54fd5e0a712ad3542184b16a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9b04db9dafe2974b54fd5e0a712ad3542184b16a"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 19 Mirrors 0 Missed 10 Current 567 (65% match, 98% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 573 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/pango/1.50.12-r0/temp/log.do_packagedata_setscene.3173949
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 595 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_setscene)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1587 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1926 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Succeeded
NOTE: Running task 2038 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2039 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2040 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pango-1.50.12-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2055 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Succeeded
NOTE: Running task 2056 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 153f648d54c84d7cb8f7ea7012ff0b9db840baebc6f03abc9c63aa570b9775d3
NOTE: Running task 2080 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Succeeded
NOTE: Running task 2081 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2082 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2083 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to a2cd21a8442ea765cb5f1c94777a38fb37b90ee394d6ddefa9a576b8e9ce275b
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2084 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c6ab2bbb7247973f1dc35a2a0c6970ad3f6e794f36525bdae98d736d5108d206
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2093 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Succeeded
NOTE: Running task 2094 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Succeeded
NOTE: Running task 2095 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Succeeded
NOTE: Running task 2096 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2097 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Succeeded
NOTE: Running task 2098 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Succeeded
NOTE: Running task 2099 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2100 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2101 of 2101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2101 tasks of which 2080 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.13-r0 to 0:1.50.12-r0) [version-going-backwards]
ERROR: pango-1.50.12-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4971470572095425975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1697 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9b04db9dafe2974b54fd5e0a712ad3542184b16a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9b04db9dafe2974b54fd5e0a712ad3542184b16a"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 198 Local 191 Mirrors 0 Missed 7 Current 402 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1967 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_fetch: Succeeded
NOTE: Running task 2105 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2106 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_unpack: Succeeded
NOTE: Running task 2107 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_patch: Succeeded
NOTE: Running task 2108 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2109 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2110 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2111 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_configure: Succeeded
NOTE: Running task 2112 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_compile: Succeeded
NOTE: Running task 2113 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_install: Succeeded
NOTE: Running task 2114 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2115 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_package: Succeeded
NOTE: Running task 2116 of 2119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2116 tasks of which 2103 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+7364ce8e26-r0 to 2:0.0+git0+5a491c5ad3-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+7364ce8e26-r0 to 2:0.0+git0+5a491c5ad3-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+7364ce8e26-r0 to 2:0.0+git0+5a491c5ad3-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+7364ce8e26-r0 to 2:0.0+git0+5a491c5ad3-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+7364ce8e26-r0 to 2:0.0+git0+5a491c5ad3-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+7364ce8e26-r0 to 2:0.0+git0+5a491c5ad3-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+7364ce8e26-r0 to 2:0.0+git0+5a491c5ad3-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+5a491c5ad3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/temp/log.do_packagedata.3167782
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============4971470572095425975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+7364ce8e26-r0'])", added "puzzles (['= 2:0.0+git0+5a491c5ad3-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+7364ce8e26-r0'])", added "puzzles-dev (['= 2:0.0+git0+5a491c5ad3-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+7364ce8e26 to 0.0+git0+5a491c5ad3

--===============4971470572095425975==--

