Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F14C35FFF
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.115408.1726410842119677540
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=M27ZOBab;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nwxydXmb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010191f61adcbc-cb715263-3481-42f2-aab9-7c9649314f14-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uM8r8kGurBUgl7p5Vm6xrXg38KjtEl+pZDesoMtRQ5g=;
	b=M27ZOBabkjk9jUWlA3YO6sX0qmMPHdq4DQvt6lISzQyswtl1h3t0G4VJlPIr24aO
	D7r/BdhPwgbf0ck/Bk5lcS1XYYj/PecZhIma26dmCwU2mmlbT3ywTIu90WKfKx/zYy3
	79RZ/JxYSgtlbZLXoWwo199h4qPV/VLeMgq4NnJQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uM8r8kGurBUgl7p5Vm6xrXg38KjtEl+pZDesoMtRQ5g=;
	b=nwxydXmb/ypDK0q5Lmhe3L7j3CW32ldJlKA49nULqchFm7dFH4xwI+cgccjiG8zL
	lBK0dc96SVEzze+TDkU/7ECxCIDPy+l7/jnbTBtf+BummdHjzcVkry6ToqQEAzpQlz+
	SOiKdrKwADfTn8gdfDeeK0IYpTiHSd4E8aPRpex8=
Content-Type: multipart/mixed; boundary="===============7069899526622823603=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 16cd61ed45a11db87f647b6563ddd4ca3ec1ae3a FAILED
Message-ID: <01010191f61adcbc-cb715263-3481-42f2-aab9-7c9649314f14-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204575

--===============7069899526622823603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *16cd61ed45a11db87f647b6563ddd4ca3ec1ae3a* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 16cd61ed45a11db87f647b6563ddd4ca3ec1ae3a
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
DISTRO_VERSION       = "5.0+snapshot-340c6fd6840e78824daff9bc56ba9f15336ef4ab"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:340c6fd6840e78824daff9bc56ba9f15336ef4ab"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 16cd61ed45a11db87f647b6563ddd4ca3ec1ae3a
ERROR: Execution of 'git rev-list devtool-base..8db8ce9c528330f0b1261b07531b009732b08731' failed with exit code 128:
fatal: Invalid revision range devtool-base..8db8ce9c528330f0b1261b07531b009732b08731



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7069899526622823603==--

