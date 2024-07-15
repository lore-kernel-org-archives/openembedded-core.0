Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3989DC54743
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1296.1721071145959393741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iQuQ+BKj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cZ41VEyi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010190b7d59815-c61fd844-ce58-4171-b247-c2169e01c32a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071147;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=93q9lBtHlvHowRZGcJOaCz+PV7iKqDz75NbI/qS3gds=;
	b=iQuQ+BKjJPf6kzBNPVScN8IQ0suSFi++2qSM59L7DNejv2fg8BXGv8/N4bQlf984
	hYtscjBKZJGgYSWwp6HecbDWAHCWNIdPx157g3JeclFdedk+4wJQkXzSj1+4UflqwNA
	KJe7oiqvtfDMTROpPrcqMCbfmuRKli08PVtz9i9k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071147;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=93q9lBtHlvHowRZGcJOaCz+PV7iKqDz75NbI/qS3gds=;
	b=cZ41VEyistaJVllmBzJOIv37mFS99UfzvpHb9Mp17Clzjb9AJTqMrc5/UTQeMdwa
	fir+BL97gnAsrEaBD7Mbpkqd2gKoF8vUIx+MpRfZ2VMv+xlmBJPsFVOIFWIdiwRMG+h
	KO+70juPK6xd3t9zc9rqCLTW+zESV8PoCMfVmt8A=
Content-Type: multipart/mixed; boundary="===============7012008325757831316=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cracklib: upgrading to 2.10.0 FAILED
Message-ID: <01010190b7d59815-c61fd844-ce58-4171-b247-c2169e01c32a-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201993

--===============7012008325757831316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cracklib* to *2.10.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe cracklib failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c072be000c5e5526d539376713059707e29005c1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c072be000c5e5526d539376713059707e29005c1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 19c4f79a979e1ebf672a22db9dcf1680c61e7cdd
WARNING: Command 'git rebase 19c4f79a979e1ebf672a22db9dcf1680c61e7cdd' failed:
Auto-merging src/lib/packlib.c
CONFLICT (content): Merge conflict in src/lib/packlib.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/cracklib
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/cracklib/cracklib_2.10.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7012008325757831316==--

