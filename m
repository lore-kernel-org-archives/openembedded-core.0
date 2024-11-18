Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079C2D62041
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:32 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4838.1731964645136050851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ype7INDf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DkSZ32dL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019341232cfe-efc354c5-6a5c-4129-985b-5f53053588dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964644;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LGAD2gSQMXbdjssih8ZVEUHUQY1i+rNPIEwpJhp48f8=;
	b=Ype7INDfV1g4xii9gU6+TAcf1VUrmGNAtvBi/p5VmRfIBt45ZMuE88A/3bK6oJqF
	626VNZa+cYLuUPEhkeXQngkBn28624PFUIodL7yPvyD2eILfYqCzgI8QNRv2T3xz11F
	sY3wOFUn3By5rQfSb+JRcz5TMEnKBfVkdTVwRjH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964644;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LGAD2gSQMXbdjssih8ZVEUHUQY1i+rNPIEwpJhp48f8=;
	b=DkSZ32dLki9IxvnV5xTsWdPnl+sy9JJqUEdZxb/0R0TlmngToFnLPoR3ZQMrNiqU
	Icgoo6GAIhkCtXSoZyB8kq2+9lWSm65Tw/dLmW/Ey1z6edt3MFeyXsC08CP/D0DZHgS
	S0m8rYZTwHiBT8/3hMZpsmzHG1DMfsLOCY66xG4k=
Content-Type: multipart/mixed; boundary="===============5501123731047715231=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] rpm: upgrading to 4.20.0 FAILED
Message-ID: <0101019341232cfe-efc354c5-6a5c-4129-985b-5f53053588dd-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207302

--===============5501123731047715231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm* to *4.20.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:1c849ef3951794b9b8674ed238b7705db3d618c1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 13 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b3323786668cf99bc9aed7e60ccdab0bc25e19da
WARNING: Command 'git rebase b3323786668cf99bc9aed7e60ccdab0bc25e19da' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt
Auto-merging tests/rpmsigdig.at
CONFLICT (content): Merge conflict in tests/rpmsigdig.at

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_4.20.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5501123731047715231==--

