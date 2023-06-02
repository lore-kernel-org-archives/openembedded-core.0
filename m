Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10216C87FF1
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.7617.1685693430680420661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EbmBGWwL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101887b2890bd-888d338f-cea4-479f-adf3-1502047b295e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7GFg7kEay5u/A0jVPrt7aUnH9oPqd9YFyf6qYARf8Fw=;
	b=EbmBGWwLJkS9aVCdWfFQ4N1DR1Yd30BI5K0c/nXrWDOMYmCTSaCwaFyKyTYE8TH5
	4l7oYvEEqjoNvS6/NsuPMgL868l1iXFtEiLtgUbfjLRjfm53/41VI9D+IKzcD87dwDC
	hzjsoNvhzICokX8X06DHw8pIHVMKtvzRSgsaVHZ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7GFg7kEay5u/A0jVPrt7aUnH9oPqd9YFyf6qYARf8Fw=;
	b=iHpM9GXXGwFD+W6HyQpKEXgej5S2TwuhWe+XoSpiqwWCi/DkJU5CMlryh7fmqTKv
	LszVHV7z5R/5lL0p02zV0fPXED8W4kuypNEpzelQDfOzk+eh2aTnqxy+FqN9VKyePpl
	2XYzYzWkErlrsT/vklu35zgqXY62GYJb/RUF6n7w=
Content-Type: multipart/mixed; boundary="===============6472672150846766777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to b6c842a28cf6597df063fcff35079c3e3982381e
 SUCCEEDED
Message-ID: <010101887b2890bd-888d338f-cea4-479f-adf3-1502047b295e-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182270

--===============6472672150846766777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *b6c842a28cf6597df063fcff35079c3e3982381e* has Succeeded.

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
--===============6472672150846766777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a1757f038f5b7c3a8fdc4e57ff7faea52c3fbb1"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 29 Mirrors 0 Missed 7 Current 560 (80% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 578 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1959 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_fetch: Succeeded
NOTE: Running task 2086 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gtk+3/3.24.37-r0/temp/log.do_packagedata_setscene.3500424
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 595 of 596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_package_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_unpack: Succeeded
NOTE: Running task 2087 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_patch: Succeeded
NOTE: Running task 2088 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2089 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2090 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 88d94a254702a24e0b5e6cdb077221e05eb296de97299f5d3f7c44077cd0ae38
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2101 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2103 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2104 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_configure: Succeeded
NOTE: Running task 2105 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_compile: Succeeded
NOTE: Running task 2106 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_install: Succeeded
NOTE: Running task 2107 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2108 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package: Succeeded
NOTE: Running task 2109 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_packagedata: Succeeded
NOTE: Running task 2110 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2111 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2112 of 2112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2112 tasks of which 2095 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6472672150846766777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a1757f038f5b7c3a8fdc4e57ff7faea52c3fbb1"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 30 Mirrors 0 Missed 7 Current 555 (81% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 574 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1941 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_fetch: Succeeded
NOTE: Running task 2068 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gtk+3/3.24.37-r0/temp/log.do_packagedata_setscene.3505318
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 591 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_package_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_unpack: Succeeded
NOTE: Running task 2069 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_patch: Succeeded
NOTE: Running task 2070 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2071 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2072 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 88d94a254702a24e0b5e6cdb077221e05eb296de97299f5d3f7c44077cd0ae38
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2083 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2085 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2086 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_configure: Succeeded
NOTE: Running task 2087 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_compile: Succeeded
NOTE: Running task 2088 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_install: Succeeded
NOTE: Running task 2089 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2090 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package: Succeeded
NOTE: Running task 2091 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_packagedata: Succeeded
NOTE: Running task 2092 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2093 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2094 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2094 tasks of which 2077 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6472672150846766777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c

--===============6472672150846766777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a1757f038f5b7c3a8fdc4e57ff7faea52c3fbb1"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 30 Mirrors 0 Missed 7 Current 551 (81% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 570 of 588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1929 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_fetch: Succeeded
NOTE: Running task 2054 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gtk+3/3.24.37-r0/temp/log.do_packagedata_setscene.3510316
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 587 of 588 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_package_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_unpack: Succeeded
NOTE: Running task 2055 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_patch: Succeeded
NOTE: Running task 2056 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2057 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2058 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 88d94a254702a24e0b5e6cdb077221e05eb296de97299f5d3f7c44077cd0ae38
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2069 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2071 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2072 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_configure: Succeeded
NOTE: Running task 2073 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_compile: Succeeded
NOTE: Running task 2074 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_install: Succeeded
NOTE: Running task 2075 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2076 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package: Succeeded
NOTE: Running task 2077 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_packagedata: Succeeded
NOTE: Running task 2078 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2079 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2080 of 2080 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2080 tasks of which 2063 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6472672150846766777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2a1757f038f5b7c3a8fdc4e57ff7faea52c3fbb1"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 30 Mirrors 0 Missed 7 Current 555 (81% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 574 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1941 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gtk+3/3.24.37-r0/temp/log.do_packagedata_setscene.3515156
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 591 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_package_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_fetch: Succeeded
NOTE: Running task 2068 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_unpack: Succeeded
NOTE: Running task 2069 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_patch: Succeeded
NOTE: Running task 2070 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2071 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2072 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 88d94a254702a24e0b5e6cdb077221e05eb296de97299f5d3f7c44077cd0ae38
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2083 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2085 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2086 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_configure: Succeeded
NOTE: Running task 2087 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_compile: Succeeded
NOTE: Running task 2088 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_install: Succeeded
NOTE: Running task 2089 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2090 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package: Succeeded
NOTE: Running task 2091 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_packagedata: Succeeded
NOTE: Running task 2092 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2093 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+b6c842a28c-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2094 of 2094 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2094 tasks of which 2077 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.38-r0 to 0:3.24.37-r0) [version-going-backwards]
ERROR: gtk+3-3.24.37-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6472672150846766777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBkZTU4NzIwM2FhODMzNDkzMDU1NjYxNTYwMDJjYzgzMmJjNTIxMDg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNDo1Mzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCA0YjA0NTg4NjgyLi45NjBiNWQzYjExIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgotU1JDUkVWID0gIjVhNDkxYzVhZDMzM2VmMzRjMWU3NzEzZjkyMGY1MWNi
YjIwNWFmNjAiCitTUkNSRVYgPSAiYjZjODQyYTI4Y2Y2NTk3ZGYwNjNmY2ZmMzUwNzljM2UzOTgy
MzgxZSIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0JHtTUkNQVn0iCiAKLS0gCjIuMzkuMgoK

--===============6472672150846766777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+5a491c5ad3 [default] to 0.0+gitAUTOINC+b6c842a28c [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+b6c842a28c"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14446212 to 15556196 (+8%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+b6c842a28c"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+b6c842a28c"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+b6c842a28c"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+b6c842a28c"
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a49
 1c5ad3-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/map.c /usr/src/debug/puzzles/2_0.0+git
 AUTOINC+5a491c5ad3-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/netslide.c /usr/src/debug/puzzles/2
 _0.0+gitAUTOINC+5a491c5ad3-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mosaic.c /usr/src/deb
 ug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopy.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/lightup.c /usr/src/de
 bug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/drawi
 ng.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c84
 2a28c-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c8
 42a28c-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/untangle.c /usr/src/debug/puzzles
 /2_0.0+gitAUTOINC+b6c842a28c-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/netslide.c"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3542339 to 3692462 (+4%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+b6c842a28c"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+b6c842a28c"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+b6c842a28c
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 6847938 to 7450054 (+9%)
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+b6c842a28c"

--===============6472672150846766777==--

