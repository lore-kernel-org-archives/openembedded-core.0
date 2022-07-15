Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B04C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.979.1657900665345661915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XlT1ovFq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010182029485dd-17e24671-ce6a-487c-9b4a-81995bda4eb6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900664;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Kb6Gkdd31Hoa17wrS3+5YIoZJGF2oe+YUZhlGQN55MA=;
	b=XlT1ovFqY5Ejzl0R/iu/OCEkWBl2JAMUhPYfMRL+h+0Th+qWUm3wOu0y4Hv7r92E
	BfTCEWAOiKlf4d28KrnMTQ7UC9o9g19S5dUqpDpKAAJa65HQrzy3CbLtSuucSt12xNl
	M8J9qXFNV0nT5/r2Pmq47c7uoG5oeFPw0hoZlEiM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900664;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Kb6Gkdd31Hoa17wrS3+5YIoZJGF2oe+YUZhlGQN55MA=;
	b=gU1XrpuQg6wp5xm4Fk1csJ34QSeJXLsI/speq7t7m3QZNN+mFOYltuPnMZQ6kRFb
	ZDFf3L6TE3lWbMFKdSSjuKTNhe4fpHZJ7cWz0WMW75Dh+rM7pm7E+cVa1NuKb9oIhSX
	oosXbBDul0UibQpgLZF6IIeT3nGI0dC063ydwg4s=
Content-Type: multipart/mixed; boundary="===============5007965918074530163=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] efibootmgr: upgrading to 18 FAILED
Message-ID: 
 <01010182029485dd-17e24671-ce6a-487c-9b4a-81995bda4eb6-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:44 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168064

--===============5007965918074530163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *efibootmgr* to *18* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe efibootmgr failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 35 skipped, 0 masked, 0 errors.

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
DISTRO_VERSION       = "4.1+snapshot-f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c3f9f0534e32158f62c43564036878b93b9e0fd6
WARNING: Command 'git rebase c3f9f0534e32158f62c43564036878b93b9e0fd6' failed:
Auto-merging src/efibootmgr.c
CONFLICT (content): Merge conflict in src/efibootmgr.c
Auto-merging src/efibootdump.c
CONFLICT (content): Merge conflict in src/efibootdump.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/efibootmgr
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/efibootmgr/efibootmgr_18.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5007965918074530163==--

