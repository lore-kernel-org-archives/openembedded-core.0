Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04630CCA49A
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:49 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.614.1654100323222327819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LQXQDnBl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010181200fe7b7-fd83a513-423f-4e12-bd3e-b07b3d7f3ccc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sTrb4wOtl6gtXJusKz0qEXhO01+3soYBnzLjjjvOD7s=;
	b=LQXQDnBl0nXaESwM/oYaMz7/Q4aPnlphOdZtcBJAcH96fErqMh+o+tevGHQwPPRc
	zWtRvzHb3K8Db9HQ3EitThwaF/+VbWxsGbGPIXtLJCf/dm/9GhNHiiTyHNIAjTkxPIm
	l+AdbERsJTbYrru34Q91NF+ptVX1IDXfJaDNUIhQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sTrb4wOtl6gtXJusKz0qEXhO01+3soYBnzLjjjvOD7s=;
	b=Sxf0gj5GWCjJPeDqONmipP57p5ibinWsaTvAJUk2mQ3pvhnxLRTCynmfgOz+C4FR
	hFcEqQpqJhDjUw7LzZXmgFJBee+4L2t+DOoClyeNdEs+h8FzOkf0c6m+iIoaakpjkud
	y3p7uEofgj8Ap/LKU9bHvSkm7/EfYZLjg5lKjLbM=
Content-Type: multipart/mixed; boundary="===============3138960190710110938=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] seatd: upgrading to 0.7.0 FAILED
Message-ID: 
 <01010181200fe7b7-fd83a513-423f-4e12-bd3e-b07b3d7f3ccc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:42 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166394

--===============3138960190710110938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *seatd* to *0.7.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe seatd failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-780a5b66a51cab425a5cabb48f9d07672f1841bf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:780a5b66a51cab425a5cabb48f9d07672f1841bf"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto a803ba0502cccf147eec7fbcacd11c5b8643c0e0
WARNING: Command 'git rebase a803ba0502cccf147eec7fbcacd11c5b8643c0e0' failed:
Auto-merging seatd-launch/seatd-launch.c
CONFLICT (content): Merge conflict in seatd-launch/seatd-launch.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/seatd
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/seatd/seatd_0.7.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3138960190710110938==--

