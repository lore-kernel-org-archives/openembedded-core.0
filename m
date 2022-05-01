Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA28BC352B6
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.2256.1651434543554138388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X+8JQq9t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010180812b577d-f028547f-45ac-42ce-a3da-6193ddf643d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cyvoS5HAO30gOYVTr9S2+l3DCacHQa2Mu84m5uJ1ziM=;
	b=X+8JQq9t0YZoZFyGlO9YKAiQLwYLT7fv3PLJ+gqxadc/JRTwnsp2ZOclTzlkIspx
	FiaNMlm9LokOyE6ftS1Sxhz5DceiXwWBYr/7BjDy7yMJpGmHF9IVG28yZyte0zix2cy
	mTfN6Z2XsJTn6keGcMcy9uPYn5v7Pd7MWvow40mA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cyvoS5HAO30gOYVTr9S2+l3DCacHQa2Mu84m5uJ1ziM=;
	b=L03XzTtj5GM/gNVWc/NYcON8QSev56zqaPT4nG5JNna64F0sppEiNFYBAhZiCMrp
	tsnBhLh19yUmaRrWiooI+DVvtb2vC3V2GZOnoAPmgNO8wE4P7kA8NdzjOZARshGQfLH
	HSpuLOOkvZ9C1+nEiv7bBLmZsBIkofFgmPMhI6pk=
Content-Type: multipart/mixed; boundary="===============4889435247961318670=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.95.0 FAILED
Message-ID: 
 <01010180812b577d-f028547f-45ac-42ce-a3da-6193ddf643d0-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165117

--===============4889435247961318670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lsof* to *4.95.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lsof failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1642 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f96e7e0db4d2aa7724e4864d1381c35b29d1a8dd"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 67d8c828e7bdc01ba93f8ff79765dd424da0c9d7
WARNING: Command 'git rebase 67d8c828e7bdc01ba93f8ff79765dd424da0c9d7' failed:
Auto-merging dialects/linux/Makefile
CONFLICT (content): Merge conflict in dialects/linux/Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lsof
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lsof/lsof_4.95.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4889435247961318670==--

