Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8405AC64E95
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.878.1667349634337752058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nwmI6yIP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c85add-707f3a90-cc88-4999-83cd-2ab0a5669335-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2kj0GULN69es6KNr/IPG1/SKqamxqZSEsuY/HCRffzs=;
	b=nwmI6yIPEuTjeaQL7PSToeJBbOFbnjgd7tjC5nomj0RO6W+r60SotRScxSZIj4ny
	fI8Q3a8EQMG8yPALpzj4/5UHvmLjg/CzZU8n36cAs7Jdajwa2+at39IhdMBSfZp06d3
	Ek4TN3GuMIBcYKSG+NIkhA053L+ppu+DgCmFwCIo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2kj0GULN69es6KNr/IPG1/SKqamxqZSEsuY/HCRffzs=;
	b=dKHLJqPILt1ltbIm6XqfojlFavmURS8VoUdMcIiJ7bhL+xYh7e0QxKVOK6XrT8v9
	jDY+Q5fT+mdeErVG5yBYbTsm52Qu7pAEvBCJlSKvDbTiSuz4kYO+UpqVuvmcpfr2ESu
	wk6RvwjMlnAWWFposcokw+M7Bc1gLEUGU98/+Bzw=
Content-Type: multipart/mixed; boundary="===============7769024927180974781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] unfs3: upgrading to 0.10.0 FAILED
Message-ID: <0101018435c85add-707f3a90-cc88-4999-83cd-2ab0a5669335-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172443

--===============7769024927180974781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *unfs3* to *0.10.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe unfs3 failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:86bfb58317f96d91ce159a76a8e8d77720ca2a19"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c8f2d2cd4529955419bad0e163f88d47ff176b8d
WARNING: Command 'git rebase c8f2d2cd4529955419bad0e163f88d47ff176b8d' failed:
Auto-merging Makefile.in
CONFLICT (content): Merge conflict in Makefile.in
Auto-merging Config/Makefile.in
CONFLICT (content): Merge conflict in Config/Makefile.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/unfs3
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/unfs3/unfs3_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7769024927180974781==--

