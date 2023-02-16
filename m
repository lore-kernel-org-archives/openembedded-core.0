Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6251AC77B70
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10286.1676508396546483010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H6n683ay;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018657aff856-e0f216ad-0d30-4704-8f56-1e4edb83aadf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OnY5T3xEDJJdfRdP56lswDLiaHAiGNMSOOOzKVTJ/S8=;
	b=H6n683ayc3hTllslWo9Gjo2+io/y+nQrKYyLk5iwR6ms6z6anJkluv57AKE0JT5W
	TR/2SPe1KYvNAMOosgmh51ift1zTsZVeEkCAYKHot+a66BS3Tet0524mUHTRB/Yc8cf
	zP88pr6E3DRJJb26aDAoKcJEtnHQ3MSFGw3ASJcs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OnY5T3xEDJJdfRdP56lswDLiaHAiGNMSOOOzKVTJ/S8=;
	b=AF9VuqyAotV5UlYxDYUisLLDYk++eN5nEZ0/pHQ0mPuSMMRaSuydjW1DB8dXychk
	t2cQnyYvw6XSlHPMDjFTAb30lVlr0t1aABaN/r4JfRCLxlNPkhOQKbBwjxZ/W+160HY
	NB9NTeOjuqXsYd2EQYI9jPCyc3yC2tfqNqnauMhg=
Content-Type: multipart/mixed; boundary="===============3553934072627936437=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.24.2 FAILED
Message-ID: <0101018657aff856-e0f216ad-0d30-4704-8f56-1e4edb83aadf-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177233

--===============3553934072627936437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.24.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-numpy failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (16:09:45.168989)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a96f3b8ebe20916b5086278c9d3ed888ce6e1a48"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a96f3b8ebe20916b5086278c9d3ed888ce6e1a48"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (894 cached, 2 parsed). 1694 targets, 37 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a96f3b8ebe20916b5086278c9d3ed888ce6e1a48"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a96f3b8ebe20916b5086278c9d3ed888ce6e1a48"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

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
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/numpy/numpy/releases/download/v1.24.2/numpy-1.24.2.tar.gz...
INFO: Rebasing devtool onto 50467edec486d8e1e28c1a25ed4c307192866165
WARNING: Command 'git rebase 50467edec486d8e1e28c1a25ed4c307192866165' failed:
Auto-merging numpy/core/src/multiarray/arraytypes.c.src
CONFLICT (content): Merge conflict in numpy/core/src/multiarray/arraytypes.c.src
Auto-merging numpy/core/src/multiarray/common.h
CONFLICT (content): Merge conflict in numpy/core/src/multiarray/common.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/python3-numpy
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/python3-numpy/python3-numpy_1.24.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3553934072627936437==--

