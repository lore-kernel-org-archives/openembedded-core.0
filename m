Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EB9C7115F
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.27779.1748786133860078651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wPUjYX+4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Ek6k4GbQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101972bc6e1e0-fb3ed96e-7826-44ab-9449-679c27da1a0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p4cfignAP8YZ6zs5zQY7EOhMrs4KjUGELS/mHSoOwdA=;
	b=wPUjYX+4B2dS4xDwXWD8jbP/NWAMr+SHn8q3oL6iuE8xBI1ZWuVHwEU5cnvEP+x3
	QvZR8+PF8hyikozQAR6eUjpSBD+J9mcXs17cuQOWZ3fN3xXm40IWGAqEkRfjDh86ro1
	4mC/qRfUMozywJpHQjKpyXefxYpH/rXj02Unf39E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p4cfignAP8YZ6zs5zQY7EOhMrs4KjUGELS/mHSoOwdA=;
	b=Ek6k4GbQ/wrkC6Dl/6D71if48dZNtkiOu8C57UOZ8aixVsQsnHMxdNWkMU8NJOB4
	NkfOoQmNzr3nNpw+n6P3ZQFqSNGZd1C+j7Rjf6GvsOPELpZ8mLLCUjI9GRKup7HfaXg
	oO5zb0Daf0CwvN9UxxeBOjXztLrRu5CkjC2wd+AA=
Content-Type: multipart/mixed; boundary="===============4373073230337034641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 e8420e48cb0ab72c0dc1ac230329e313ed218851 FAILED
Message-ID: <010101972bc6e1e0-fb3ed96e-7826-44ab-9449-679c27da1a0f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217632

--===============4373073230337034641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *e8420e48cb0ab72c0dc1ac230329e313ed218851* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S e8420e48cb0ab72c0dc1ac230329e313ed218851
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1f87b5d8504fd92b0c1db16d6743fdf603399c69"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout e8420e48cb0ab72c0dc1ac230329e313ed218851' failed with exit code 128:
fatal: unable to read tree (e8420e48cb0ab72c0dc1ac230329e313ed218851)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4373073230337034641==--

