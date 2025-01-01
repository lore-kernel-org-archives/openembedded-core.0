Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23570C02182
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11489.1735723939159868366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=i28ywWyQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oXWAhlrV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019421357270-ec2c1115-93f0-4597-a630-401b564c3ed2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yOZ/D6Pddizk1rhvhLuvTOxTUabbtXOlglIEIpFtZXM=;
	b=i28ywWyQ4ngkn6EDY3skm1UswU8hHAkSYzt2W5PckDPNonoXa1/V/ujPIXdCNThJ
	rM60Q3Dsp9U2UP5ULkU7kvwQmEPYwh1zZAq7iK120c8uKJhuQairtX0V6i/U2rvSRC/
	b5153Q1InOoKLMrDe5rD0eBRkurSGBKHmWGjHgQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yOZ/D6Pddizk1rhvhLuvTOxTUabbtXOlglIEIpFtZXM=;
	b=oXWAhlrVGFseIqc7ScRjauBqa/kYuhl0RXuhdsssHlSj/uMVlRbeeAHneycvo4Bw
	qRKjzu6BKQ4YEJ719c/V/SVQG+W6bW3QMr0buMiqkNKNsB+3AOevYl9FFeWv710V6Rq
	VtSJbkMo2yLWQ/giRYRHibUeDnegK0wIiiInmbBg=
Content-Type: multipart/mixed; boundary="===============5055081794715945282=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] hwlatdetect,rt-tests: upgrading to 2.8,2.8 FAILED
Message-ID: <0101019421357270-ec2c1115-93f0-4597-a630-401b564c3ed2-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209198

--===============5055081794715945282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwlatdetect,rt-tests* to *2.8,2.8* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade hwlatdetect -V 2.8 -S c8b918c53cd57fdcbb6df153064d1b2e5cc329e8
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:468a9ecedc8b0fc120c700d0ff34ebe67c7bee34"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision c8b918c53cd57fdcbb6df153064d1b2e5cc329e8 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5055081794715945282==--

