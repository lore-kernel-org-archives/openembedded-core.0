Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC833C36012
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.115641.1726410841439048495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=kD4lIqqz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=abItZPe9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010191f61ada55-cb38bcf0-db65-40d3-be5d-d256b9e86f30-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5nQWsQ+TZLszNUicpF2PO4XEcV4SbmnP27EERf1Iajg=;
	b=kD4lIqqz0fsOie6WUlSCA9TXF7Tkah91ahn249jFTT7L3DVM5q297nRqJisvYCyy
	OBUr0oJ6oB2zxWYPsr77zdVLkH/Z68LLM2ZF5wrbH90Ga1Yhf2fU7qLh597rtrrCFUI
	a+mhRhffG9q6may/0W6LEaRRZgp9Hv4NORwzpp3k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5nQWsQ+TZLszNUicpF2PO4XEcV4SbmnP27EERf1Iajg=;
	b=abItZPe9xF7b8pm2BRhYYSnZytLcgfjbH8MovOWUC4QeLUdOLDtXbadfkHjtRR6D
	7aUJyZciVh6itV6wzbv0nrK2k64080bAaQlnKOLWAgcJOPYGCPf1sQoU5fzRhgEoyf3
	G373z5hWFUDlbHrGD3Uh++ubIkjmC5NM9YtDSrdw=
Content-Type: multipart/mixed; boundary="===============1686260257676103475=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 4e46ff54a64bea9d2dec900072e2338425c2345a FAILED
Message-ID: <01010191f61ada55-cb38bcf0-db65-40d3-be5d-d256b9e86f30-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204546

--===============1686260257676103475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *4e46ff54a64bea9d2dec900072e2338425c2345a* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 4e46ff54a64bea9d2dec900072e2338425c2345a
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-623449e9056b88571edbade910c4837a0cebd7ce"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:623449e9056b88571edbade910c4837a0cebd7ce"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 4e46ff54a64bea9d2dec900072e2338425c2345a' failed with exit code 128:
fatal: reference is not a tree: 4e46ff54a64bea9d2dec900072e2338425c2345a



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1686260257676103475==--

