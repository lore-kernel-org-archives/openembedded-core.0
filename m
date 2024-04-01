Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5800BCD12B4
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:28 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.44659.1711994603134501674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ErjuuXgE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GWUliQtL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e9ad48427-681e5dbd-9c36-4650-b58a-85a2fa7a7c81-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uh9HDLz85FnDF9+W3q1Ntm7lB6iMcKMxU3HCRg4sPBU=;
	b=ErjuuXgEG2UsIS37QGRJO/66gEF4NtK/WnU6Xakkt/1spRdLzvkPuPbECe2O5M+F
	RG6C40YxQ5KN7tZJeN10BtNUzsMLhZv0mnObqyctZ1od68eRgG4d5c3Oj0IVIFMFb5l
	2b5nNEJRBJFH8tMdQtRkY++c3LqpWbC+i8qOWfMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uh9HDLz85FnDF9+W3q1Ntm7lB6iMcKMxU3HCRg4sPBU=;
	b=GWUliQtLuaGgapkvsQiHKnulZQu1MMQ7mLWl2SwcpSJuPlhvAfF7MyhoEjASS61+
	IbUfLQXY5VYO6mM6GQIAPe/Na+1BLyj0MrtfV+x6iycZRvlBOicPYMSv/hrFrE9YJeN
	F/S0giorIq99jnEWilhB4ArsT2hWAnUeABssAJOQ=
Content-Type: multipart/mixed; boundary="===============2200480361867184544=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.21.0 FAILED
Message-ID: <0101018e9ad48427-681e5dbd-9c36-4650-b58a-85a2fa7a7c81-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197787

--===============2200480361867184544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-utils* to *2.21.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libva-utils -V 2.21.0 -S c46adc8dff6120cbba3f03781e4d6df054dd8f21
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e47e1434e618338ebf4629dfa705552951ff6802"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e47e1434e618338ebf4629dfa705552951ff6802"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout c46adc8dff6120cbba3f03781e4d6df054dd8f21' failed with exit code 128:
fatal: reference is not a tree: c46adc8dff6120cbba3f03781e4d6df054dd8f21



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2200480361867184544==--

