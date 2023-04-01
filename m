Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4392BC88C97
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.32138.1680384534966378332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=B6LmYLKh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101873eb92720-f7bb13bb-6240-429c-b16a-7409c544ab08-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=3I92mPROtp4lffd5fwBFaYpecbVWb7hANEUIJH+zlsE=;
	b=B6LmYLKhd/KdwMI+lyZkXNau8IGkaWTZ9UnfCcTyt1D6DK+AiFttU+RB7EoMAzlC
	Z+9v2EDVSQrTe43qWdMgPQowUYQMfl2ZQGvUb177/wgIEFgsCOJN/Oe9iL5AuJ0X05p
	tsynhRf0FLBXXvi1hTY4ua1NqTNUChhRCafqqK2o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=3I92mPROtp4lffd5fwBFaYpecbVWb7hANEUIJH+zlsE=;
	b=LlqHPPeBaf1irHD6Je4uD7qmLyqt21rsKWCkcMlX1XoSJf2McKgEBC2PRm2BFlXV
	HFnoTwj5MByD+BYDCT0hJha3Y2MuMNCRsCTuBeVafsEpMd0s22E1uRaajh2zJY5qyJp
	AvX3Auu1xik619hY64W+VYiLMv/8Wb9ZGN4IL7/Q=
Content-Type: multipart/mixed; boundary="===============8651810118008035414=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.18.1 FAILED
Message-ID: <010101873eb92720-f7bb13bb-6240-429c-b16a-7409c544ab08-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179509

--===============8651810118008035414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.18.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (10:07:00.265339)
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
DISTRO_VERSION       = "4.1+snapshot-797c37511965ac08d18f24ce2873734941650649"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:797c37511965ac08d18f24ce2873734941650649"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4588bc3f994338502d2770ad24cbfcdaa6c335ec
WARNING: Command 'git rebase 4588bc3f994338502d2770ad24cbfcdaa6c335ec' failed:
Auto-merging build/rpmfc.c
CONFLICT (content): Merge conflict in build/rpmfc.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rpm/rpm_4.18.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8651810118008035414==--

