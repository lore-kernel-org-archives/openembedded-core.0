Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD244C2BBE5
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.39614.1656687061824725347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VCfnDneE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010181ba3e6ea2-7732f7cb-403c-46bb-b96f-5bd0d97c349e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=afPJUiYoegqq6n0vbRX7AYsRRYOBNE9CosaxqsmUrzQ=;
	b=VCfnDneEeKM7q6w8MMfQgRcqxpOgRspoBgh1Sal7vvN7VQZKAF/M04D6CV7+uPlN
	+hI6XIQjMEFP78WxrZZoAwhZsmpQB7iNeIrEjTDkJFpkjaZEIGwZjHc7KzAxY0wDpCD
	k4la6dy8XsQ7Wz50ijQCo2fE2lQkryGCHnsDf3yI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=afPJUiYoegqq6n0vbRX7AYsRRYOBNE9CosaxqsmUrzQ=;
	b=j0luYoTyByhwBxrL/afSZD+i1IlbdO+HsBKhEtUxkBDRl/SE1NL+UO0OyRg51Y8X
	YU3LYgv67AyBgpRiPXsfJlr/gTYZlPJo7/KQxvk2x1L/KYgqMyY4YWvu4vkUtKptrd/
	VttmsjHfxCcoGWBdeNMMKQ+LFInG88ou0iM0lVts=
Content-Type: multipart/mixed; boundary="===============3409748545479206826=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] procps: upgrading to 4.0.0 FAILED
Message-ID: 
 <01010181ba3e6ea2-7732f7cb-403c-46bb-b96f-5bd0d97c349e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167493

--===============3409748545479206826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *procps* to *4.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe procps failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1655 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7aded86b509598c64f74a20776880bd500ba25d5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7aded86b509598c64f74a20776880bd500ba25d5"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 61825a5cc56b40c4afffd8c880b641210b05b3b7
WARNING: Command 'git rebase 61825a5cc56b40c4afffd8c880b641210b05b3b7' failed:
Auto-merging ps/output.c
CONFLICT (content): Merge conflict in ps/output.c
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/procps
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/procps/procps_4.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3409748545479206826==--

