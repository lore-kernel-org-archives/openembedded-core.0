Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BD4C8300C
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.107420.1682976349540063757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=duZB8BJR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010187d9351a17-d7e63910-8228-4d0a-810c-4d80f7d86fe7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976348;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z1fC0qAUOepSgr9G4nt5K6CzI4Rgp1GANXyvfs9zqM8=;
	b=duZB8BJRYnAnr6nJtsWzCxXb0Md+imAziY7nyKzd6jT6zBhe8ujh0BxvYGbL+KBa
	Zm+uJ93ZwcvNcgFYSnSP2CFKfMhD/Y2Z6mEezi9Q3ptN/Qk396cR//GGQI2cPtZETiW
	dcK+//1Lpz9vjta/IjhXNJGEKZ1loA06jkIxv6+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976348;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z1fC0qAUOepSgr9G4nt5K6CzI4Rgp1GANXyvfs9zqM8=;
	b=Z6QD66DQWQK3i2OjSl4TN2bAIPUgd25iTN+/onCkegC+vI2iEtyd0KaDb/p0aA4W
	q7nhI/72DjZXgUci5maZ5AYz8fWMeLk61drOD4UuI226sEuxkAtPkBfbprHRjUCoXOl
	wM/rgieI0L4hVPNH5nDF4b3H2fe93YZicRjlNe9g=
Content-Type: multipart/mixed; boundary="===============8162069291630869834=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apt: upgrading to 2.6.0 FAILED
Message-ID: <01010187d9351a17-d7e63910-8228-4d0a-810c-4d80f7d86fe7-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180599

--===============8162069291630869834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apt* to *2.6.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe apt failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:08:18.806985)
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
meta-yocto-bsp       = "tmp-auh-upgrades:07fd493ed806833359268c6cac4fcf64e730f8cb"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
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
meta-yocto-bsp       = "tmp-auh-upgrades:07fd493ed806833359268c6cac4fcf64e730f8cb"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  45% |################                    | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://ftp.debian.org/debian/pool/main/a/apt/apt_2.6.0.tar.xz...
INFO: Rebasing devtool onto 720cdc6278a0c359553e471a758ae4316450819c
WARNING: Command 'git rebase 720cdc6278a0c359553e471a758ae4316450819c' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 720cdc6278a0c359553e471a758ae4316450819c
WARNING: Command 'git rebase 720cdc6278a0c359553e471a758ae4316450819c' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 720cdc6278a0c359553e471a758ae4316450819c
WARNING: Command 'git rebase 720cdc6278a0c359553e471a758ae4316450819c' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/apt
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/apt/apt_2.6.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8162069291630869834==--

