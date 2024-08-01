Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC69AC52D6F
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.75748.1722536827204193488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CQ4IBLNW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=HEL1/nvC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101910f324612-d2eb1595-365d-4c33-8820-25c0022f64a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uXhfVC3e+256LPL28CaofF5lG2nWf9mp9Sb/z6x/5bM=;
	b=CQ4IBLNWCCQWiy5qwtwx0FRdNKzS0gflP1Gol6PAHIL9KFXf6aKkgQMrMRL4FJd3
	D2RMMGCrlYDxkzyzObefDGcBY41IhJTh6ua4upNCfSg5HaG/oV+wOnovwzeZ0kOuIxn
	6FUc+eIt7lqdNaqFlFtXgrqnL8ymgPigrQ7eGQAc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uXhfVC3e+256LPL28CaofF5lG2nWf9mp9Sb/z6x/5bM=;
	b=HEL1/nvCH2qVxs0gFUOMvfJF7aWk9tmN2SEqQRloLNUl3ec9mGJW3GLcazlXzVCZ
	tX2eK1hIu4D0Zdv7A3j6KRlscuno6IAVLZNkeqCWZ1Fux9xF3LGSHwVkuBStSSBgkhS
	OTR1vkFGXwEXqycK6bVYVMoLG/U5czqtUDJXT/u0=
Content-Type: multipart/mixed; boundary="===============2680938863884205939=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.25.5 FAILED
Message-ID: <010101910f324612-d2eb1595-365d-4c33-8820-25c0022f64a1-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202883

--===============2680938863884205939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.25.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade p11-kit -V 0.25.5 -S 0dd113361057e477f40ff4d8788f3e7e400af5f9
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
DISTRO_VERSION       = "5.0+snapshot-fb79d200540e0c6c2600890f4155e88e861f327b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fb79d200540e0c6c2600890f4155e88e861f327b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0dd113361057e477f40ff4d8788f3e7e400af5f9
ERROR: Execution of 'git rev-list devtool-base..f973d0f6acebbe7ab2f4ab027b5adb32b97a758a' failed with exit code 128:
fatal: Invalid revision range devtool-base..f973d0f6acebbe7ab2f4ab027b5adb32b97a758a



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2680938863884205939==--

