Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ACCC2D0CE
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18393.1718475800798216759
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=A9NTCIkc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UlNMh7Y+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101901d23bef7-5bb220eb-1739-43e7-bcbb-7f7746fac244-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cs1otZUbVjXQhiSaNgnYhUgk4Lpi5UYduJb8Z/Tsifw=;
	b=A9NTCIkcck4v+VxH6U29WpLP8FJMU9+cyTokvjXmCB0wJsFUO8JJ89chhjXadSdk
	Jw5wmH01p0Sc8/g2kv3BKv3TfTaTDh5sIojSnfjQdh3TsHbxTfuXH4Cg7iPorBu7cE1
	x2Efp81x1g+2PQ8Y5N2gHvfBsfm4q1Rk/e9g+xDM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cs1otZUbVjXQhiSaNgnYhUgk4Lpi5UYduJb8Z/Tsifw=;
	b=UlNMh7Y+VEuT6Qlda3cCxPnNo+1izu9ZfAg2XhYDqU//fFJIcWcWtxP41sp1O/tw
	kkotNeiB2qFE/EiuhiICAMGukfS1KPIYzHGGi7DSFpygxzxSPjnxekUy6tnxARJlwjL
	NcpPm43eP4cNOQYDdEPYkp/o1w4Zj+/p+NdK8RcA=
Content-Type: multipart/mixed; boundary="===============7396696644159096307=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rt-tests: upgrading to 2.7 FAILED
Message-ID: <010101901d23bef7-5bb220eb-1739-43e7-bcbb-7f7746fac244-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200752

--===============7396696644159096307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rt-tests* to *2.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rt-tests failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-d12e05dbf9689cd8b18ae45b599dd601546d5d18"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d12e05dbf9689cd8b18ae45b599dd601546d5d18"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5bd94923ffda2ab326d081926dbfc6775fb5050b
WARNING: Command 'git rebase 5bd94923ffda2ab326d081926dbfc6775fb5050b' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/rt-tests
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rt-tests/rt-tests_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7396696644159096307==--

