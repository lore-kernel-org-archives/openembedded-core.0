Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79019C88CB6
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.32125.1680384534636816663
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WNJ7P2MX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101873eb92320-f241b1b9-c7f4-43fb-8021-d5a58da1555f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N6VzBV9WO1AoMeWw1TwXoWyrWvika0+AvekMEqOJalc=;
	b=WNJ7P2MXYDuoI2QWHegApj/NVlEfUKB9EWb7sg7BRy9IGitUUYPqzSufdO9EKlGJ
	fXL5vJa+hPwkVX4umTbNM9NwSlMXBBHJjdYJ6jFT6J7iXD93RJXKTtPnYcJLBpTuOLz
	SuBLY8O9FLPTcwOaj5CqiULPVDjcAERFWBpI5xn8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N6VzBV9WO1AoMeWw1TwXoWyrWvika0+AvekMEqOJalc=;
	b=l4Ntl04rdp3JWuK3yi0gK9dJMHY1bmS1rnHcXTvNntW0+YgRpXv9u6MLjRhEVfY1
	vVTT0mmZ8kdwHFMBZLDkr3RJr/l77U1OkeXJMDR/XE2oy3XWEwJIwTtGJhbgW0buuYl
	Aw7Z0h28z3bsG7kXehwi50BBHhofsDgAnM+fTpr8=
Content-Type: multipart/mixed; boundary="===============4307009049272750282=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.189 FAILED
Message-ID: <010101873eb92320-f241b1b9-c7f4-43fb-8021-d5a58da1555f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179499

--===============4307009049272750282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *elfutils* to *0.189* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe elfutils failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:01:44.194789)
Loading cache...done.
Loaded 1797 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8c79c1d49cdd4ea376ff25a044b04fd63ad1bf24"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8c79c1d49cdd4ea376ff25a044b04fd63ad1bf24"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1797 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1798 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8c79c1d49cdd4ea376ff25a044b04fd63ad1bf24"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8c79c1d49cdd4ea376ff25a044b04fd63ad1bf24"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  52% |###################                 | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/elfutils/ftp/0.189/elfutils-0.189.tar.bz2...
INFO: Rebasing devtool onto 3af9d97a44897cae862250545f684387e966fae3
INFO: Rebasing devtool-override-libc-musl onto 3af9d97a44897cae862250545f684387e966fae3
WARNING: Command 'git rebase 3af9d97a44897cae862250545f684387e966fae3' failed:
Auto-merging config/eu.am
CONFLICT (content): Merge conflict in config/eu.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/elfutils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/elfutils/elfutils_0.189.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4307009049272750282==--

