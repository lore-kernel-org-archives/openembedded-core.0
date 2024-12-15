Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E3EE7718A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.33340.1734254975608843039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VonUrEuv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wDiWpFOz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193c9a6e508-7d77ea5d-e9ae-4423-a34d-e9c625cb104e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FYGlkL/Uz7Z7q5hGtp0SF7qspy9XYzbE7Z8mhhucqzk=;
	b=VonUrEuv14brbXw+u9t48ti8WUuMapjQuLEEBsb9FrJQB8Dlu1bAZUGAaXgvXltR
	shLe476SJvSzJ7XRAdhi7KVmwCLCm4ctZhcGYA/bMXkCCRbqdeIyVWpmRJbcGtTtaJb
	SMruFgtFJ4JIYYoO2XR0/I3Q5salnpu7LJQQ0rbY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FYGlkL/Uz7Z7q5hGtp0SF7qspy9XYzbE7Z8mhhucqzk=;
	b=wDiWpFOz5xJyiSAHhu0jry7HCXuvS7sH69Jaagl/FWwMiTTeqhvuADR93auPCd1A
	WV080OiJBioQk3xtsqZ6SqeXd6uUb6srS7IiPunLbhu3X7vUxmFr3/zz2e4dsPNXAQ+
	0g6MUuTSeE3kwzYmKOw57ROo/8zebudVYJJse63E=
Content-Type: multipart/mixed; boundary="===============8044252810000343406=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 libsm,libxv,libxt,libice,libxrender,libxau,libxxf86vm,libxshmfence: upgrading
 to 1.2.5,1.0.13,1.3.1,1.1.2,0.9.12,1.0.12,1.1.6,1.3.3 FAILED
Message-ID: <01010193c9a6e508-7d77ea5d-e9ae-4423-a34d-e9c625cb104e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208704

--===============8044252810000343406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsm,libxv,libxt,libice,libxrender,libxau,libxxf86vm,libxshmfence* to *1.2.5,1.0.13,1.3.1,1.1.2,0.9.12,1.0.12,1.1.6,1.3.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libxt failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1879 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:d30ae1aa9d7831e0f29b51290e9114f3f6e8af19"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:d30ae1aa9d7831e0f29b51290e9114f3f6e8af19"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-63jjwhpg: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-50hgoka1/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-50hgoka1/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.x.org/releases//individual/lib/libXt-1.3.1.tar.xz...
INFO: Rebasing devtool onto 9c1181e6d65b03affc6c9219f83ead7074b3e257
WARNING: Command 'git rebase 9c1181e6d65b03affc6c9219f83ead7074b3e257' failed:
Auto-merging include/X11/Xtos.h
CONFLICT (content): Merge conflict in include/X11/Xtos.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libxt
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libxt/libxt_1.3.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8044252810000343406==--

