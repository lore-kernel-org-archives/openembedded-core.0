Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D595BC47086
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.11583.1650052687477836339
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ilWJtIhA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101802ecde3d7-0e8b8446-e30d-4cb4-9d73-bdab430c0980-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JO4Z+V2I4iYJ4OGKOK2igJ1lqGEvisK+yxZF0GhHHx8=;
	b=ilWJtIhAqM0g0H9CQl1EEyiPcr4K0NF2fOFIRmvcsCHUezZp/m0YqF8tP2TlspON
	9fHNcjayKFeXHd5E9u3QxVgTwIgfTG6+mIpgHTCZhvb+JeOS31lb0uhAw28QhBDHN8F
	Fxl4IfNe0UQ8sl/zR9TyDZY7XhjTXg19G1TK46PA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JO4Z+V2I4iYJ4OGKOK2igJ1lqGEvisK+yxZF0GhHHx8=;
	b=WT2bo9VtlmgfrxuahptAX2+nMDchjpnERZ219ctfywsJjhnKkjIPHc/K1Al+cYGn
	ciUbSj5vaiZ5PdhzmDPfAhPj67LqyNHYIh6piSvgKgTUa9OdU7Te8JqR4Nf8qAXDjPy
	sSfpJ6uKnIsy2XqEjP+J6D3oY0c2BnS8TBVJ2Rlg=
Content-Type: multipart/mixed; boundary="===============0857347987774247054=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 14.0.1 FAILED
Message-ID: 
 <010101802ecde3d7-0e8b8446-e30d-4cb4-9d73-bdab430c0980-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164456

--===============0857347987774247054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *14.0.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm -V 14.0.1 -S c62053979489ccb002efe411c3af059addcb5d7d
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1640 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:028c4d6086e4390b2d3513abe4bfc8cf5577eeed"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout c62053979489ccb002efe411c3af059addcb5d7d' failed with exit code 1:
error: Your local changes to the following files would be overwritten by checkout:
	llvm/include/llvm/Analysis/TargetLibraryInfo.def
	llvm/tools/llvm-config/llvm-config.cpp
	llvm/utils/TableGen/AsmMatcherEmitter.cpp
Please commit your changes or stash them before you switch branches.
Aborting



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0857347987774247054==--

