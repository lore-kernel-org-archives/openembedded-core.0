Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC31C35FFA
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.115628.1726410840164789463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bh05cIDY;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RKNVpcD8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191f61ad5c5-a25c2d28-9e44-4719-995f-02b1dd4549fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ap6AQMy8I9Ife5yKlVJZj58LkKqS0JHIySpKB32LpoU=;
	b=bh05cIDYML8rtieXv2sYujXfju6OVp9DSFrC3hrVENoQ76bVqGBFX1T/oCFX8SA6
	SX1oZlg7ErvTgiKEOOBpOdnad+hiLiJCvn7o76gYSQUyDuywjlQc2mmhezMRUyBvSN9
	krkW2cxapcPpJjbCopNdILpmsHrghIFn5rbZqwmI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ap6AQMy8I9Ife5yKlVJZj58LkKqS0JHIySpKB32LpoU=;
	b=RKNVpcD8UHvKW7bybQIlaL/xjMWBQrFP9Y2GutCa29MpFnA7L9utBuhgUq21qwlt
	zA22Bzr0XxxVSkoegjLusOf/xo5wwwk5jzqRGcFmTfZG5MWd6dph7bsnJD7Y/gk3E8M
	x9NCdsQcbXjM42TxXActq/u/Uxy4i/MEuMttbrbA=
Content-Type: multipart/mixed; boundary="===============7355321741203233701=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] socat: upgrading to 1.8.0.1 FAILED
Message-ID: <01010191f61ad5c5-a25c2d28-9e44-4719-995f-02b1dd4549fe-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204506

--===============7355321741203233701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *socat* to *1.8.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe socat failed.
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
DISTRO_VERSION       = "5.0+snapshot-5dfc85d44f8dc5bf4c0181b0311d63f05a31348f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5dfc85d44f8dc5bf4c0181b0311d63f05a31348f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-5dfc85d44f8dc5bf4c0181b0311d63f05a31348f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5dfc85d44f8dc5bf4c0181b0311d63f05a31348f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-hxc5k0lu: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-noylklkw/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-noylklkw/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.dest-unreach.org/socat/download/socat-1.8.0.1.tar.bz2...
INFO: Rebasing devtool onto 63afb56b485cfb9953d93a5400fe7de6c5a62f68
WARNING: Command 'git rebase 63afb56b485cfb9953d93a5400fe7de6c5a62f68' failed:
Auto-merging Makefile.in
CONFLICT (content): Merge conflict in Makefile.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/socat
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/socat/socat_1.8.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7355321741203233701==--

