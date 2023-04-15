Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C7CC77B78
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:28 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.13541.1681581687668218596
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KokK+3xH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018786144183-19bb2238-a7f5-4412-ba70-ec9e6d7aa07c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hQupWOg/Gp0PkS8Uc9r/xgyQw4NAleSi6Ejgsa1amR4=;
	b=KokK+3xHa+omijFWGjAoUDWaUluOfDw5FZOWUaw4HARUWtIW7r4SV9DigD3/rwuP
	Bv3IU1wZTvQ1YY+Ooyqzj5fXdTvxx53sVHyNF7lgya7KWNoKO9DybZeGkPk6ifA3QOW
	0vS12bMPS67RoE3DBKux1la+4fVlDr0hNvKRwYFQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hQupWOg/Gp0PkS8Uc9r/xgyQw4NAleSi6Ejgsa1amR4=;
	b=VEJQ2bZRDjQDHA9tMeXwKtXhtaBVYJ3qevIqr42cTuq5T8rAjO5Nw6mxOhj73iMJ
	fB2quUYklKqpJZvX14kimNHCPBJE+SKKm07n2qjnLaFBUJUiHx/FnYt2Y8umJFVjlgu
	iS2BFXPUzkWoULJ+FW8crIKvy096YOz88psVPRsc=
Content-Type: multipart/mixed; boundary="===============6930207378738056106=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 1.19.0 FAILED
Message-ID: <0101018786144183-19bb2238-a7f5-4412-ba70-ec9e6d7aa07c-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180107

--===============6930207378738056106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gpgme* to *1.19.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gpgme failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (17:52:02.578729)
Loading cache...done.
Loaded 1799 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:6b68b13c82ba66ff75242f4c7157aa8ff1690772"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1800 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:6b68b13c82ba66ff75242f4c7157aa8ff1690772"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

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
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.19.0.tar.bz2...
INFO: Rebasing devtool onto 0de8cbef6e97509effca4b2bf1c34e319ab92770
WARNING: Command 'git rebase 0de8cbef6e97509effca4b2bf1c34e319ab92770' failed:
Auto-merging src/gpgme.m4
CONFLICT (content): Merge conflict in src/gpgme.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gpgme
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gpgme/gpgme_1.19.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6930207378738056106==--

