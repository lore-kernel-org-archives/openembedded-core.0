Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD00BC021A9
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.42714.1738416048290413255
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RhaT96Ou;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lZMO2C9K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abeb50-af1e02fd-e9c1-4223-8d97-e79e8ed0cdc0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gTTT1ACXkd0HCsnSqTi33vR1AoU+56irP0pRMHxbXvw=;
	b=RhaT96Ou26IljYnHWe0hnpbToiK/DD7ooo2Hvl7V8sJ8C9WhOYrNzvcug9U6CRmM
	y24vMmHu66I1NHbGdIwtLmYmJHelitjiJJ6qgsF2duxMS5X4crK9usbxgFvsPvrcDsi
	gwP3N/hqt1ZhI+lg4oq9qXbd81gzcFlTGpVyTWYU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gTTT1ACXkd0HCsnSqTi33vR1AoU+56irP0pRMHxbXvw=;
	b=lZMO2C9KwDPmPmmzIFfPVKzyg43ws2QyY4yhzd/EIV5Ulq8zeHJbZDW2Ud00sOdT
	gloL5l8g6BoEoq2X2YOKp/ykB1geGKBleUK43xr2u+Ap+i5MPGxw8CRKueol0JuiXLz
	0khJOvEAn7aqEYGXyN1U4ytbhxPr7eQUpNGvzabg=
Content-Type: multipart/mixed; boundary="===============2897834672478449338=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 40afcb705d05179afce97d51b6677e46b5b48bf5 FAILED
Message-ID: <01010194c1abeb50-af1e02fd-e9c1-4223-8d97-e79e8ed0cdc0-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210551

--===============2897834672478449338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *40afcb705d05179afce97d51b6677e46b5b48bf5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 40afcb705d05179afce97d51b6677e46b5b48bf5
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:4750e2b2e2d3772dc275fb8a68f0927d5b7e9ed5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 40afcb705d05179afce97d51b6677e46b5b48bf5' failed with exit code 128:
fatal: reference is not a tree: 40afcb705d05179afce97d51b6677e46b5b48bf5



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2897834672478449338==--

