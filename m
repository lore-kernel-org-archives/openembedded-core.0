Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94E7D10DA9
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.148756.1733047552396771918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Bsa88xrN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=d5ksvlwg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019381af1596-cee76c97-a298-42fa-8302-f23fef897a0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W+Sxx/r0/GnjMQnhWjjD1MwS0hA/ZCy0R/quvmu4XRg=;
	b=Bsa88xrNIdC039BF9gIM2inrA89I+g6YVVReWBEoD8x5JIWuRsgGiJqs7yRFxrdx
	AzcXPellUzssWu3W2MCzRPP06OxE+Bz+rzRtxN2mD6lKNd0NRIZQcrmsAZlaoDFkXcz
	meDfVgMi1e3iVQBtzkFa0XelGoZlQBV8AjYgytqU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W+Sxx/r0/GnjMQnhWjjD1MwS0hA/ZCy0R/quvmu4XRg=;
	b=d5ksvlwgUjTZwRlVeptJ5mxZ++eAQsmp/iQDJAdpbObNslDUPhJ9U9Ckw6rkhnZk
	cH8TP1CpxeMBzM8QQZgalyECoRZYYXkgMTUG2XEj3bhHjbFyXJQjACFdQrLWk8YfX6o
	Cjt5oFYjWesTGVop2YLwb1YTyDnjdE4T0/HkwrWA=
Content-Type: multipart/mixed; boundary="===============5585787367220703766=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202411 FAILED
Message-ID: <0101019381af1596-cee76c97-a298-42fa-8302-f23fef897a0f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208062

--===============5585787367220703766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202411* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202411 -S 0f3867fa6ef0553e26c42f7d71ff6bdb98429742
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:fdfc537770d1bd647019820a3b86d8a9311650c6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0f3867fa6ef0553e26c42f7d71ff6bdb98429742
WARNING: Command 'git rebase 0f3867fa6ef0553e26c42f7d71ff6bdb98429742' failed:
Auto-merging BaseTools/Conf/tools_def.template
CONFLICT (content): Merge conflict in BaseTools/Conf/tools_def.template

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Execution of 'git rev-list devtool-base..b64af41c3276f97f0e181920400ee056b9c88037' failed with exit code 128:
fatal: Invalid revision range devtool-base..b64af41c3276f97f0e181920400ee056b9c88037



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5585787367220703766==--

