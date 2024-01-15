Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91608C47DBA
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.88840.1705340029293973474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EQlQmq/J;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JXZDZdEN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d0e2fcf6b-0a4b0de6-9c5a-4ca6-b142-f9d7a4bc5ef5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rkxv3AI4bk0FfOOORc9jIsmEXTVmq613mOK5Tl0OOzg=;
	b=EQlQmq/JM4g0agdhJDMUlEazRN06xEQcYi7Z0MvecU3vz2QzusWB5BFvNISPWLL4
	xV7szdQT6DnZQVxofNaKty53NIMhuQIPwqqWkPiuPpTLNgWGhq2pepO/cQKtFR2pWGv
	kgggtfWnMU/w7r7qctTA0qn13gqB3hwSUKawybiE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rkxv3AI4bk0FfOOORc9jIsmEXTVmq613mOK5Tl0OOzg=;
	b=JXZDZdENAp1MKnC4AaY6NxM2z4i+8vFn8/w/6xeBtRPhupoEDEXw+ti7K+djhXR0
	X711mj6Ktz/nR+okwsUrprtE9WF81aTnkffPNpvjYyJMYMgGt7j61Zi49zfyMdG+9WQ
	VgPawkxjQxtAmd8T2ia3XdugvdHz9JPa72ykAZi0=
Content-Type: multipart/mixed; boundary="===============9044725051240317190=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.2 FAILED
Message-ID: <0101018d0e2fcf6b-0a4b0de6-9c5a-4ca6-b142-f9d7a4bc5ef5-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193780

--===============9044725051240317190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtraceevent* to *1.8.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libtraceevent failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-28c45a77468e9fd5cad975ca83ca3ee71c5227e6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:28c45a77468e9fd5cad975ca83ca3ee71c5227e6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 6f6d5802f31992e7527a4c32b43a32fda6bf6bdf
WARNING: Command 'git rebase 6f6d5802f31992e7527a4c32b43a32fda6bf6bdf' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
Auto-merging meson_options.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libtraceevent
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libtraceevent/libtraceevent_1.8.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9044725051240317190==--

