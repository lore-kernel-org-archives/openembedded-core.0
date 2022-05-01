Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07830C388F3
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.2325.1651434543197444419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Fyk/Imj4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010180812b5617-b0c1deed-8023-4bab-8dc0-6b0eb8f4c062-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TH+8PbllmFF5E4v+Crs9d0HpIrDwthk3MF1NleR1sNI=;
	b=Fyk/Imj4frc6190rDZlDN8/uqqnSnn4EO6ljYs06qLnS2Q0v4oZou7lD+PrOlAIB
	2NgcL2a0GKZx+Pfqg59qI1sgF1gOyJ0Si1s+7b7Mzst2eCQCARleGn94dkOZYZNnXaH
	42Bj+Pgp5S1I8+4cFmqo3IRi9YY/mWXXL+zU3Pxs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TH+8PbllmFF5E4v+Crs9d0HpIrDwthk3MF1NleR1sNI=;
	b=JWJJWO7ROmCVpmferhw7hKTx7MT2y+l/OQHnqkcC9XgJT3lScT4hYCMBC534So8U
	/LsCNJyruokAmxcv+atARdF5x5bKQqDELZBwxVvxymA6Z5TkpoVww/WE7gzvkbF+adj
	7vZLIkbFnnkMy63g/YLOvk9ep9FnDOfury6n8pNY=
Content-Type: multipart/mixed; boundary="===============0803121311597060611=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 62.1.0 FAILED
Message-ID: 
 <01010180812b5617-b0c1deed-8023-4bab-8dc0-6b0eb8f4c062-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165119

--===============0803121311597060611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *62.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-setuptools failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1642 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b1fdaf5b2ded9727b5eb2971b80918da68dd02ea"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b1fdaf5b2ded9727b5eb2971b80918da68dd02ea"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1643 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b1fdaf5b2ded9727b5eb2971b80918da68dd02ea"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b1fdaf5b2ded9727b5eb2971b80918da68dd02ea"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  31% |###########                         | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-62.1.0.tar.gz...
INFO: Rebasing devtool onto 366d8181ee62ae61a16c871361d05ee9def58cbf
WARNING: Command 'git rebase 366d8181ee62ae61a16c871361d05ee9def58cbf' failed:
Auto-merging setuptools/_distutils/sysconfig.py
CONFLICT (content): Merge conflict in setuptools/_distutils/sysconfig.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 366d8181ee62ae61a16c871361d05ee9def58cbf
WARNING: Command 'git rebase 366d8181ee62ae61a16c871361d05ee9def58cbf' failed:
Auto-merging setuptools/_distutils/sysconfig.py
CONFLICT (content): Merge conflict in setuptools/_distutils/sysconfig.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/python3-setuptools
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/python3-setuptools/python3-setuptools_62.1.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0803121311597060611==--

