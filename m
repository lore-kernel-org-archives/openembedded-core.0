Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEDCCD13C3
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:32 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1993.1711994601512053514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U87Ak1lJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=j7hyO3xk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e9ad47cda-c91e9078-2bbe-46b6-9b2a-68dff2ecca8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P2lexDqhR9JqYF1Q9E2zeNLbHd1mrYfuPpZdFyv0c3w=;
	b=U87Ak1lJwXMx8VGxUvp+6Wn+qb9QcUdhed2WrBtWn//pbHWfpHPeACR7wiJFdL2/
	s4T0qDL5MUokfhYLNUyBdvq40m4CbN+S3EEzy7NgxZIoLm1cxtjnMPtHBPorGzGfSSZ
	a+3BHSpdegarkEli39QlJDVFA5LJcj1+H4ne8fYg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P2lexDqhR9JqYF1Q9E2zeNLbHd1mrYfuPpZdFyv0c3w=;
	b=j7hyO3xkkhPBiJ4rgdqnitjb3EUVFEDw/AQGD1LfpGkuQuFjI5trF3viNpXyJnlX
	CrRu0eEANtUI/PkbMzp4RiqFcaSIigZ+vyV3coQQpInRq5eU8Fc/JIInxqEMtcaEvR2
	A/PN+wdhs7wMtnEK9VTQhvQZsdlvnaWqR8hO3kD8=
Content-Type: multipart/mixed; boundary="===============4436714779745325556=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.40 FAILED
Message-ID: <0101018e9ad47cda-c91e9078-2bbe-46b6-9b2a-68dff2ecca8f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197713

--===============4436714779745325556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.40* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe util-linux-libuuid failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-2b162967e33ecc7736b5dfd8bc4daa32916b2818"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2b162967e33ecc7736b5dfd8bc4daa32916b2818"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1875 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-2b162967e33ecc7736b5dfd8bc4daa32916b2818"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2b162967e33ecc7736b5dfd8bc4daa32916b2818"

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
Adding changed files:   8% |##                                  | ETA:  0:00:01
Adding changed files:  16% |#####                               | ETA:  0:00:00
Adding changed files:  24% |########                            | ETA:  0:00:00
Adding changed files:  33% |###########                         | ETA:  0:00:00
Adding changed files:  41% |##############                      | ETA:  0:00:00
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.tar.xz...
INFO: Rebasing devtool onto a507069194627a9473f0c57a0e48482da03d7e8a
WARNING: Command 'git rebase a507069194627a9473f0c57a0e48482da03d7e8a' failed:
Auto-merging login-utils/su-common.c
CONFLICT (content): Merge conflict in login-utils/su-common.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/util-linux-libuuid
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/util-linux-libuuid/util-linux-libuuid_2.40.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4436714779745325556==--

