Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1943C47081
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.10485.1647349734621607279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DrnqSMEY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017f8db21cf5-d4f588ce-a6ea-4b15-b67a-51bbf21aa939-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9C6Fgyzl3+oAKrKBlMAid9pwQKUw44PgM6QUjpg35cA=;
	b=DrnqSMEYzmgcvkpnoCWrllh0yfapc33JbjMzDQkd24o9rR3NTgq6D7mShln0jblm
	1i+NvY2ftVDxoMncVj2zIrNjuTuHiXEw1sw93HuWpqM3tDgCseAPtSNsZjpUhuLqU60
	aN+Ik4EsN9bn/mx8lBh+ANEaMuALvbWRLWjHUcQw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9C6Fgyzl3+oAKrKBlMAid9pwQKUw44PgM6QUjpg35cA=;
	b=ZjWAkpZbWgGB78cmXYqQiynwJQeZwpjq4xRsg7r0VSFy0W1HSPucFvWDOifluFt4
	w6HhMOGIC0uPxr4Yx6EjUO8rwjooOpEnmLJmO0u/naDbxIrzoVkBc4q/GxuX28XePhn
	5W9iEZ+ORTiGRyn7l0RbtMCEZ8aY3MY1ANnZHZG4=
Content-Type: multipart/mixed; boundary="===============0536870004683212504=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2 FAILED
Message-ID: 
 <0101017f8db21cf5-d4f588ce-a6ea-4b15-b67a-51bbf21aa939-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163258

--===============0536870004683212504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1521 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-1beea9b00e58cd114e776fe975d3adcdc5ff892d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1beea9b00e58cd114e776fe975d3adcdc5ff892d"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2' failed with exit code 128:
fatal: reference is not a tree: ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0536870004683212504==--

