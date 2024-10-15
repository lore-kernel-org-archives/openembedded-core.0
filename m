Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AAED1D876
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11814.1728994565238030173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Mk3k3JZA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=W9NMw1Uv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010192901b59d3-adb9c1cd-1a66-40e3-bc34-f0a9df99f232-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994564;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2v0WfwATY2d8leHkYbBQeQdgnjGh0MIcANKOqrVZF3w=;
	b=Mk3k3JZAnRLB+fc3xkHG2Ya5v0nfsSywTd0uVIuEO+cn4ZYLTioT7j+vQd8UxlzF
	zaVE2M5ep944nG0clAHcmfbJKYj1S0AxN25W9l59CNgHLybm23hmeOzkzhXgkTLYb8h
	Zp3ILmj3AVswYGy7ij0InNnM7M7NRVIN//+TL0L0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994564;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2v0WfwATY2d8leHkYbBQeQdgnjGh0MIcANKOqrVZF3w=;
	b=W9NMw1Uv07vCyTJQda61xsoBaTCDFgttRzvnHOf+sgP+KIoTSguEoPdcK6KbHOPU
	ON5nLNE3GrURJMOpGC09b5g8tBJpKxIOJ/b2mHQ5uGFTSCnMTPMyCCrsZQXs7kgSg6D
	i9KCC3Om3NJjjHWumn5oYQeirddjaQCHDYcSbW7c=
Content-Type: multipart/mixed; boundary="===============7759664552635514394=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-db: upgrading to 2.13.0 FAILED
Message-ID: <01010192901b59d3-adb9c1cd-1a66-40e3-bc34-f0a9df99f232-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205869

--===============7759664552635514394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *man-db* to *2.13.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe man-db failed.
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
workspace            = "tmp-auh-upgrades:10124a609af9259d314aef83d9baf513c1632a9b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:10124a609af9259d314aef83d9baf513c1632a9b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-gnx77l0v: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-eeys0n9m/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-eeys0n9m/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  17% |######                              | ETA:  0:00:00
Adding changed files:  34% |############                        | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.savannah.nongnu.org/releases/man-db/man-db-2.13.0.tar.xz...
INFO: Rebasing devtool onto 743888495d02d3d73256c2f44f9c7b688547cedc
WARNING: Command 'git rebase 743888495d02d3d73256c2f44f9c7b688547cedc' failed:
Auto-merging src/man.c
CONFLICT (content): Merge conflict in src/man.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/man-db
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/man-db/man-db_2.13.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7759664552635514394==--

