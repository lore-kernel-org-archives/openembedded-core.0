Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6B5C63717
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.24535.1665871393716352491
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Nc4bdXBZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac37de-1a36aae0-4f22-43cb-9c57-f327e0cdc121-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G1jkCKnMOkd09Q53xZ7WeJ9zvr/G4NxPjm3ughbJvEU=;
	b=Nc4bdXBZy4Pq5lIho2uxEQKdu+5hTguKUaKgWim2G7yOB9qr8JA3k5VMAwlOSVNd
	8Tti06kL925lxIiGCdft+ENVw513mEnrvZmuR2Ngp3CQYbucLJF0p3rwqoCelJfks3K
	hJOlq+wBr+RFduStQXJenA3/UrBRSVorV7iBwpqo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G1jkCKnMOkd09Q53xZ7WeJ9zvr/G4NxPjm3ughbJvEU=;
	b=ONrgvzCqm0lmY554vkiDR1z+FDCP5aOo/4N9QAAvsekyPFh6U7Ofu2aE7Zwj5Bj1
	9Jm5ItZ6jO7M3Hr4VhncSMlWw7qsUpoabCV24Z+6GesXDb2+++8ucsW1dNgn9LI+FTK
	7MJEXbePJeCd/IBQJ6FumAEV3pCQNPtX+wQQYOtk=
Content-Type: multipart/mixed; boundary="===============5028591371243144142=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] quota: upgrading to 4.09 FAILED
Message-ID: <01010183ddac37de-1a36aae0-4f22-43cb-9c57-f327e0cdc121-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171807

--===============5028591371243144142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *quota* to *4.09* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe quota failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.

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
meta-yocto-bsp       = "tmp-auh-upgrades:4e0460c034e7a7ab6dd982b47e4b12e89a2458c9"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (884 cached, 2 parsed). 1662 targets, 35 skipped, 0 masked, 0 errors.

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
meta-yocto-bsp       = "tmp-auh-upgrades:4e0460c034e7a7ab6dd982b47e4b12e89a2458c9"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

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
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/project/linuxquota/quota-tools/4.09/quota-4.09.tar.gz...
INFO: Rebasing devtool onto e76d45f31d408b345f5c1f70fb5ecb3872c90d38
WARNING: Command 'git rebase e76d45f31d408b345f5c1f70fb5ecb3872c90d38' failed:
Auto-merging quotacheck.c
Auto-merging quota.h
CONFLICT (content): Merge conflict in quota.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/quota
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/quota/quota_4.09.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5028591371243144142==--

