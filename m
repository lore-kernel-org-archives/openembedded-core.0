Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0779CC54E78
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2092.1706810404757314788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f64Kuuyl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TJj5Cw4Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d65d3f653-d50430d3-e950-41d4-ac05-a021be18be36-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uCXsoz4M9VjPV/ezqszSePV978dCT25fJTmph5gNHnc=;
	b=f64KuuylA51r2Na66dl3JGNbdojrUr5kwnx0st+spwT7cwlxtacwq0JPmB94UF+a
	4Ue5SYwLMLZukZehZLj8FfDrRKHOtJ1QX+4fXtj5zouHIZDxbgAG0Oz1DWXARrx8eYD
	ZGps6VzIowzCRFugXyCYT9m5lwQbclQnIh+yX2Ec=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uCXsoz4M9VjPV/ezqszSePV978dCT25fJTmph5gNHnc=;
	b=TJj5Cw4QPcZ3S44vP5Pf5oQWivQpGn4qi7eVGVc5xk6YSAbauXM0xNIl86E9SZCh
	MOmQlgOQTZ2LP+8St4QaLYJQ+7JigXkxr7/QENVs2qwhx3oZHXS/FK00oKTJdDDkAc3
	QxRDgxmMBXUMoEcjMMMiuxi72NDVE8QSVTo8ldEA=
Content-Type: multipart/mixed; boundary="===============5803578900963274964=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpam: upgrading to 1.6.0 FAILED
Message-ID: <0101018d65d3f653-d50430d3-e950-41d4-ac05-a021be18be36-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194663

--===============5803578900963274964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpam* to *1.6.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libpam failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4783259bd1c25f61db00d4436cb81ba7fe09a29e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4783259bd1c25f61db00d4436cb81ba7fe09a29e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 5 Local 5 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1849 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (911 cached, 2 parsed). 1850 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4783259bd1c25f61db00d4436cb81ba7fe09a29e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4783259bd1c25f61db00d4436cb81ba7fe09a29e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 5 Mirrors 0 Missed 1 Current 22 (83% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  21% |#######                             | ETA:  0:00:00
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/linux-pam/linux-pam/releases/download/v1.6.0/Linux-PAM-1.6.0.tar.xz...
INFO: Rebasing devtool onto 1a1b952b7fc0e90b0224f88ba24430c3e4bdc1a0
WARNING: Command 'git rebase 1a1b952b7fc0e90b0224f88ba24430c3e4bdc1a0' failed:
Auto-merging examples/tty_conv.c
CONFLICT (content): Merge conflict in examples/tty_conv.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libpam
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libpam/libpam_1.6.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5803578900963274964==--

