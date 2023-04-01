Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F79CA9EB0
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.32115.1680384533910505129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZEJy14nX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101873eb922fb-e9edc8e4-8f14-433b-aaee-e63caed87a00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r3hsGfD21gX0v4vMkA3nL2D8Ew6oeWAjMCEY6FEG4HA=;
	b=ZEJy14nXTs02j8/ke2TDdTg/ddgRpJTyarB0WljR95Yd4SnNn7SpekrJpcP6+W+z
	RoF6B9IygWuJ7v5498gEPVzzlS393lrHd4WBGc58+VVZThq4ca3gch92tHRlo1qVcaL
	wM92ak6jb6jos/Ci2iMsFJAzA0Ire9pRZ9OeHaws=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r3hsGfD21gX0v4vMkA3nL2D8Ew6oeWAjMCEY6FEG4HA=;
	b=FiA3iSoB0eMa1knxYpQCDEfmNZj9pBfvOaJrFncQNZbTPTx7m6QSDXO9YuXQOFSw
	JkjVT2V5jKdA1JWdOwpT3RV4uYICZ99i1T9VoDZ0d/ne3eMcoaXu418GYbfqlS1i5Hx
	Es3A3NBqkLZ8YpuSvSyKMyLEs+Qqy3OEf0AnTnnA=
Content-Type: multipart/mixed; boundary="===============7532938649328795938=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Weinberger <richard@nod.at>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.6 FAILED
Message-ID: <010101873eb922fb-e9edc8e4-8f14-433b-aaee-e63caed87a00-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179479

--===============7532938649328795938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *erofs-utils* to *1.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe erofs-utils failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:02:37.056993)
Loading cache...done.
Loaded 1797 entries from dependency cache.
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
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 21710612d35cd952490959bfa6ea9fe87aaa52dd
WARNING: Command 'git rebase 21710612d35cd952490959bfa6ea9fe87aaa52dd' failed:
Auto-merging lib/inode.c
CONFLICT (content): Merge conflict in lib/inode.c
Auto-merging lib/xattr.c
Auto-merging mkfs/main.c
CONFLICT (content): Merge conflict in mkfs/main.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/erofs-utils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/erofs-utils/erofs-utils_1.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7532938649328795938==--

