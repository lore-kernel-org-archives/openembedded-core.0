Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0407C6FA9A
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.843.1667349632023130775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bdZmuLFX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018435c8671e-d3efb173-e6d8-4967-a9af-7529adc5ba20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2HG5K7Hvgs48HKrwyCLNqhnn5gIcoOWYf966KP0ldXI=;
	b=bdZmuLFXIDQ8GDU2Zpzw0Cm2hvQxAwpDXxrAal7qE3raEfrfdNIAi9yUhZLofiMB
	Ewno1axpYs0QOANon2P5oDAu6nvOAQQbpzzSbB9FmgndxNrAkWvMm+3BfkBTN/PmLUC
	xAibkI28xKEJnNRrkbRbCzHnkQCX84DzJStsG2SU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2HG5K7Hvgs48HKrwyCLNqhnn5gIcoOWYf966KP0ldXI=;
	b=fm3p6BZducpQ1fMdbUG7btKVQYpeuOqvRsMvX+2AWw4PQP87+qYq08xvXjHlzKfN
	KokeH3F+3PdlkPRLWTV4RKEtOUa4DmZE1HVIrNQReS5neJ2EqCQGtzN1aImOHbgMfl2
	/sz1jYzEjPvoZ4Fo/0s2yLGbz+2/hoLCSIFCpW+Y=
Content-Type: multipart/mixed; boundary="===============7030483390563623612=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.46 FAILED
Message-ID: <0101018435c8671e-d3efb173-e6d8-4967-a9af-7529adc5ba20-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172524

--===============7030483390563623612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgpg-error* to *1.46* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgpg-error failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a2afb9ba7b81daeac283036fc6825353199d959a"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (885 cached, 2 parsed). 1665 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a2afb9ba7b81daeac283036fc6825353199d959a"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

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
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.46.tar.bz2...
INFO: Rebasing devtool onto 04339077381f759cf16f9b7b209d36256704b95f
WARNING: Command 'git rebase 04339077381f759cf16f9b7b209d36256704b95f' failed:
Auto-merging src/gpg-error.m4
CONFLICT (content): Merge conflict in src/gpg-error.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libgpg-error
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libgpg-error/libgpg-error_1.46.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7030483390563623612==--

