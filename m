Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BB8E77189
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.33354.1734254988123252590
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FGN+Lhhu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kSspHhb1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010193c9a70889-2c544e15-9c5b-41f9-ab15-f94bb7614182-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=byrM1KgELc5kn/wn5cGJPYlOOn/knadCZVLLETUyJdk=;
	b=FGN+Lhhu+H33qkRP/JYcSM9H4drRQX0KGKgc+SiLVFWt5HbATbr5s1bvf0R+VIDh
	oic4p9p6yUVdL4gma8Xe0irmJgKN/OjB6pb6YGU3h4Ep/aYqjGAznSfBy+OV+6ffzd4
	/wtNLU23Kl5s9TOskGctoCWvcW7p+JGb8L9UwPJc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=byrM1KgELc5kn/wn5cGJPYlOOn/knadCZVLLETUyJdk=;
	b=kSspHhb1zMLQClhIs5El0g3ojrbFljG48ADlSHKgS83fuxHBPrQDEFaed7Nq+6z8
	0zvgHei7n2D0E8gyVby/Fm2quri6NObbXHEWXVakE4Wn7eHsXhq0CLyiLDjSCaRYk+/
	DknQYTCY/iEnUTK11E/eJ8jffRUIRkBlazCz8dFg=
Content-Type: multipart/mixed; boundary="===============6751439190475162441=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 c6291b8231980c16bb8823f01a53d3ecac58ba4a FAILED
Message-ID: <01010193c9a70889-2c544e15-9c5b-41f9-ab15-f94bb7614182-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208732

--===============6751439190475162441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *c6291b8231980c16bb8823f01a53d3ecac58ba4a* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S c6291b8231980c16bb8823f01a53d3ecac58ba4a
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:26faf1e5f22c439b7d871e1794ece97f450095f2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c6291b8231980c16bb8823f01a53d3ecac58ba4a
ERROR: Execution of 'git rev-list devtool-base..8db8ce9c528330f0b1261b07531b009732b08731' failed with exit code 128:
fatal: Invalid revision range devtool-base..8db8ce9c528330f0b1261b07531b009732b08731



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6751439190475162441==--

