Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74939C5472D
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.75739.1722536823652597663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OUEkiGio;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YMRg5tpy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f320ad6-ff1e6210-9063-4c46-b55e-ace3cff6ed37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k+7qrHgK8ylskPHpyr9AKWkGDo3s3uMd0Qbn5wM4lv4=;
	b=OUEkiGioz42ArIb42lrwGw1u1M9+XcbV6cyeuUPYSxHsH7hNpxvlG6xAbm2/oL6y
	nv1mHP6jviGMcSt6gzvwWCOtuYRQUdo580Q/jjMqFeWDL8yoRx4C/qcVaRBJjop5RQk
	YnD4Wr5bMIP7ZEAXmJZhgb35BJ/gZ5R4jdJehDmI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k+7qrHgK8ylskPHpyr9AKWkGDo3s3uMd0Qbn5wM4lv4=;
	b=YMRg5tpy2pGj1aTc7VWW+zsHo4n6qsJz7Pkfta6LYqN7Io22lLHJ+gAW7iMQQIrY
	BerWpW31WjG2HeRfPajN7Te3qjvXcPvTVS1SsqstX1JDeHANone+6m7jrol69Gi7zWq
	dlm3BvtWh1BzAfC7PZRFt5S0scOhlRxzZ9qfTTao=
Content-Type: multipart/mixed; boundary="===============1237811697313717244=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.22.10 FAILED
Message-ID: <010101910f320ad6-ff1e6210-9063-4c46-b55e-ace3cff6ed37-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202784

--===============1237811697313717244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dpkg* to *1.22.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe dpkg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-4fecd88a41cded3bd991f6caca7fbca9af4c8cde"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4fecd88a41cded3bd991f6caca7fbca9af4c8cde"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ef5536cfe24e4c41c6fdc56e4530161fade3887c
WARNING: Command 'git rebase ef5536cfe24e4c41c6fdc56e4530161fade3887c' failed:
Auto-merging src/main/script.c
CONFLICT (content): Merge conflict in src/main/script.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto ef5536cfe24e4c41c6fdc56e4530161fade3887c
WARNING: Command 'git rebase ef5536cfe24e4c41c6fdc56e4530161fade3887c' failed:
Auto-merging src/main/script.c
CONFLICT (content): Merge conflict in src/main/script.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/dpkg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/dpkg/dpkg_1.22.10.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1237811697313717244==--

