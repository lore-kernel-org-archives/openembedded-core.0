Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B79C27C6F
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.819.1686887482731355763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aho6zoU1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188c2544326-353d9aff-d640-4fad-a220-e8cd8d6506ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zSR91lwoTWU/YL0iu8unLIDdAwwQbid4xUi6YxSk91Q=;
	b=aho6zoU1WBbSsb7t+pCPMNoPfpm6d3YKXBqPJeeghk2ke6Vi1dKNiNgqt1zlBw8H
	SdkC6G6v41QMzyIW5ThyDbHeQgtHMp8fFil/A0IJuK3V8TMHhE2BHgt2hbVANOeJ43T
	podWkfwx6XikwCub6s3e2DpWvR/N9Sx8TXSGG0QY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zSR91lwoTWU/YL0iu8unLIDdAwwQbid4xUi6YxSk91Q=;
	b=p5oCpXklHFaTk4bJmIwANP1dxzjr18qRPatnCl7618/xPHrlosmy7IE7m1D0PAwC
	OF/MwkUyNH71BWaAW1CQD68BsUwI5WxuCm1YRwjGLgLZgh3GPrfvrRLMx17obhA970J
	x31d49IJyro2cJrEyAALlCOew+JAXZGxX9BC+cb0=
Content-Type: multipart/mixed; boundary="===============5233311263185462820=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lua: upgrading to 5.4.6 FAILED
Message-ID: <01010188c2544326-353d9aff-d640-4fad-a220-e8cd8d6506ae-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182904

--===============5233311263185462820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lua* to *5.4.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lua failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2b45c2b22558ad4032286a249453551d05dfcc2a"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1803 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2b45c2b22558ad4032286a249453551d05dfcc2a"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.lua.org/ftp/lua-5.4.6.tar.gz;name=tarballsrc...
INFO: Rebasing devtool onto c1450f1b4c2e578f37e3f6994f89684f2a24cbe6
WARNING: Command 'git rebase c1450f1b4c2e578f37e3f6994f89684f2a24cbe6' failed:
Auto-merging src/ldebug.c
CONFLICT (content): Merge conflict in src/ldebug.c
Auto-merging src/lvm.c
CONFLICT (content): Merge conflict in src/lvm.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lua
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lua/lua_5.4.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5233311263185462820==--

