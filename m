Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F0FC2BA16
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1253.1715794338882039388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Gm+RyeNj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BPhNER10;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f7d4fe1ff-6a2f80d2-ca20-4ab8-b6c5-23ff28ba3b6a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R9zqSLDjY+KBKGPhHw2oJQqBN2tLtb4R7mBuhxDUvXY=;
	b=Gm+RyeNjuzbAwyxt73eFf2E/ha98VnTpGdlpyDfBvBszI/LfRfgN6btLIr3gVg3s
	c6X1x32qySXoO0T4APfjaAodBGOpCrhuH/18ZkjiPDzwpY+hizPSjbHFxc/rRyg5cCn
	pkZws5gnwAK2v5qH16FH4eXDZfh1sUAAF3GvLnKY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R9zqSLDjY+KBKGPhHw2oJQqBN2tLtb4R7mBuhxDUvXY=;
	b=BPhNER10nWkqQbYjMGPUBiurcgMyygRt3/Og0CrWvAsS6E2+OluQuL5z+SEi72Up
	rFzC4rRgPaGW42rriclIGpPVsU784bxzrunCJZ3WHKYa37RvOymd+eq9OkzvKgdkW0s
	eqwsBtzhbCsaCf9M/ukvwBraMG09lEzxefYQZnCU=
Content-Type: multipart/mixed; boundary="===============6929447988032447773=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.7 FAILED
Message-ID: <0101018f7d4fe1ff-6a2f80d2-ca20-4ab8-b6c5-23ff28ba3b6a-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199357

--===============6929447988032447773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe man-pages failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-5eddf09c4781ab7080e27832a1144852989b63dc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5eddf09c4781ab7080e27832a1144852989b63dc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1879 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-5eddf09c4781ab7080e27832a1144852989b63dc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5eddf09c4781ab7080e27832a1144852989b63dc"

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
Adding changed files:   7% |##                                  | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:01
Adding changed files:  22% |#######                             | ETA:  0:00:01
Adding changed files:  29% |##########                          | ETA:  0:00:00
Adding changed files:  36% |#############                       | ETA:  0:00:00
Adding changed files:  44% |###############                     | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.7.tar.gz...
INFO: Rebasing devtool onto 6d4d7b3cec74d2145a73053f52d954bf5f8224c6
WARNING: Command 'git rebase 6d4d7b3cec74d2145a73053f52d954bf5f8224c6' failed:
Auto-merging share/mk/install/man.mk
CONFLICT (content): Merge conflict in share/mk/install/man.mk

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/man-pages
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/man-pages/man-pages_6.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6929447988032447773==--

