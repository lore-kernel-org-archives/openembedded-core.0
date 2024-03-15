Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A996C54ED3
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1268.1710522011381238197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XCgV2TNg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=My3m2qbN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e430e9388-64132ca2-ca3d-41f5-b657-5f8bd4d0d84d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Clqdi471RLyKEO8jozFlGd2z0w37lC5S7AT3zoLHxHE=;
	b=XCgV2TNglYkMTxlLvxtKbCQcERieFXjnvSjKZSlecaB45f3MVL0bBrub5PZbR6M6
	RuYVECWFXIcYmaGF/547adkf+T0x1jhp+XwZizf5zqW3SNl93r2k8H4ZM3A5DC8Ogu/
	EIXinDGq5cDeCFOzV8T73aR2d6ozACe/tDbb+POY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Clqdi471RLyKEO8jozFlGd2z0w37lC5S7AT3zoLHxHE=;
	b=My3m2qbNg3OFhmDS6mSaRPUtNaWRIiDze1uEVYi8dq/Cs6EIvGk0aGpHCiLcvEt/
	F7Y64yIm3D7MMctueRcDV1pJaPpXf9G49nmajqQGFAYTMteTLYTRzbZM5pAic0oiT0y
	oCqQygkva9mhhx27OIrlenY4sbyZFz/ZbqN0EeEs=
Content-Type: multipart/mixed; boundary="===============1429817406958852796=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mdadm: upgrading to 4.3 FAILED
Message-ID: <0101018e430e9388-64132ca2-ca3d-41f5-b657-5f8bd4d0d84d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197194

--===============1429817406958852796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mdadm* to *4.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mdadm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3294a54e7ebff413a60ce4b933ccd79e42be7045"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3294a54e7ebff413a60ce4b933ccd79e42be7045"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (921 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3294a54e7ebff413a60ce4b933ccd79e42be7045"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3294a54e7ebff413a60ce4b933ccd79e42be7045"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/raid/mdadm/mdadm-4.3.tar.xz...
INFO: Rebasing devtool onto d017b6a5c77e22066a892f60fd522541218d1b13
WARNING: Command 'git rebase d017b6a5c77e22066a892f60fd522541218d1b13' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/mdadm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mdadm/mdadm_4.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1429817406958852796==--

