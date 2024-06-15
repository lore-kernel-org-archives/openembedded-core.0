Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830AEC52CDC
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:31 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18366.1718475799039839409
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=T45qbiSP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZVps1GwR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101901d23b761-05914a1b-4b93-40db-acdc-88f60be29f40-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tsjYHVxRJib3Nrp7PntB2sUbFnXtXW/o3iWmhJbz9SM=;
	b=T45qbiSPIY+CulkM+gBDM+5ug6r7tg1POviqfQiY/Et845IPVH5vaaWsuSqXSTSH
	gD1kr1K3pHhrgq8CskS/3eG3Sv3Bsv1wGtnEdKQZvmwKVQkBU8u2kvVXNYnIwj0OhcF
	Z3PEWXnxp7kdjUloEPWxx2xmL08BuDQJ2F6bdGxg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tsjYHVxRJib3Nrp7PntB2sUbFnXtXW/o3iWmhJbz9SM=;
	b=ZVps1GwR9z0GVCaicFrlZDssXcOn1zk4+SATY7Wuuf4khPIwDsTkzUDSmeRwRvyk
	fSFmE2d2CH0RDObZvsHJBcr6BW6RlZpDER2Ai+xspR8xqkgdjJbzOyzHZ1+bzRSem1S
	qqDtmjlnDbTfZK+sVNCFyPtjDnxz142MbyXrzmn0=
Content-Type: multipart/mixed; boundary="===============1911100908468183125=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.9 FAILED
Message-ID: <010101901d23b761-05914a1b-4b93-40db-acdc-88f60be29f40-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200679

--===============1911100908468183125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.9* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade btrfs-tools -V 6.9 -S 87c7821d528448ffd387c38725308c75bd504120
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-070e31c652424256a87ee2c5f7459042af92fb55"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:070e31c652424256a87ee2c5f7459042af92fb55"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 87c7821d528448ffd387c38725308c75bd504120' failed with exit code 128:
fatal: reference is not a tree: 87c7821d528448ffd387c38725308c75bd504120



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1911100908468183125==--

