Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C760DC2BA12
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1289.1715794338970266737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eUiKJXPC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oxYnFrMR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f7d4fe0d2-85fda1c6-2593-415b-9341-ad7b0a576dfa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hd1j08v3W1Eohf8c+M/BjiryC/OTeT5XvsNhHkPHGwM=;
	b=eUiKJXPCT/rJgO+bo4MGBmc0ag4C6aqf7XIJzO0XlNlrN1YJdYTXoNa9hv2QGSMC
	xxFDCo3Ku7CRZxlFW/iXtgbXZnjrLmlCDFhG+TC61jKb+lNJotvolhGOxPphCFWTm3O
	rnllM/calu2/SsLKv7SzfcGIuDBR/tMxkVRvds3w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hd1j08v3W1Eohf8c+M/BjiryC/OTeT5XvsNhHkPHGwM=;
	b=oxYnFrMRJcnm6tvDrT/JohWOVNtv1VzhVRW5MB7sAW2jjGvxkl4/HIY0SaSELETm
	0hpRRzV4PrSDyF3K8JhWAbbXFSVgs5MK5wbnjQN5mbECiiTDoc/P2+acNOBHUo1eDOm
	SxmXdRObUL4bUGblJjpFLiuVS9Sy9OT2FH7BFAWo=
Content-Type: multipart/mixed; boundary="===============6699476339084417703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] quilt: upgrading to 0.68 FAILED
Message-ID: <0101018f7d4fe0d2-85fda1c6-2593-415b-9341-ad7b0a576dfa-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199359

--===============6699476339084417703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *quilt* to *0.68* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe quilt failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-b42883fef514bff64dc37a5bcd44402eea630a93"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b42883fef514bff64dc37a5bcd44402eea630a93"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1880 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-b42883fef514bff64dc37a5bcd44402eea630a93"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b42883fef514bff64dc37a5bcd44402eea630a93"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.savannah.gnu.org/releases/quilt/quilt-0.68.tar.gz...
INFO: Rebasing devtool onto 1208ee89037b0b74adcb27076775014ce0017ebb
WARNING: Command 'git rebase 1208ee89037b0b74adcb27076775014ce0017ebb' failed:
Auto-merging quilt/scripts/patchfns.in
CONFLICT (content): Merge conflict in quilt/scripts/patchfns.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 1208ee89037b0b74adcb27076775014ce0017ebb
WARNING: Command 'git rebase 1208ee89037b0b74adcb27076775014ce0017ebb' failed:
Auto-merging quilt/scripts/patchfns.in
CONFLICT (content): Merge conflict in quilt/scripts/patchfns.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/quilt
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/quilt/quilt_0.68.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6699476339084417703==--

