Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DBCCFD2FD
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.53258.1728588943954843865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NBeSgWkc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pu2gktze;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019277ee0dfe-a4a8cbfb-48ad-429a-bd74-e3dcc1190967-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588943;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/0tYCsTbgN4bOw2ClCD8zYWmDsxdeCsyGreDDzriE3U=;
	b=NBeSgWkc5/AgfSS3nDGIlJVk09nvtnRzofwkHhqrsWbcRtd8EVQmWtyuyGFDXq9H
	QqFCzFcyN/yl/uN9+Dza/q8zhpJwGwAjG6CUiJ7Blpsf92E7/t5ZkEaEJ7RMaHneOEB
	9ejiLVQQHlvPl13YhY/OdPbnogOQou9xakH0jXec=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588943;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/0tYCsTbgN4bOw2ClCD8zYWmDsxdeCsyGreDDzriE3U=;
	b=pu2gktzeW+U0DaOhgWXf5E8rQgecXR4gFcoVAMU23A8a5GYXIJK1HwWfLrlUWgUe
	iXW5LPZCLfp5TdxoyG1Go3XckbJZs+eaUNnrFHI67WjocDsoPxXquj5bLF4v5Q8v6YW
	GvxaHL7tFUDlhabMsfVk0Hz1xNgQVTV3f8E0BvKw=
Content-Type: multipart/mixed; boundary="===============7401983047418199181=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 7d15e86ce7ff99d6ee10cec98bc8b3f16021053c FAILED
Message-ID: <0101019277ee0dfe-a4a8cbfb-48ad-429a-bd74-e3dcc1190967-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205444

--===============7401983047418199181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *7d15e86ce7ff99d6ee10cec98bc8b3f16021053c* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 7d15e86ce7ff99d6ee10cec98bc8b3f16021053c
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:792e087aeac91aef65fdae922819225f8e5fdc6e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 7d15e86ce7ff99d6ee10cec98bc8b3f16021053c
WARNING: Command 'git rebase 7d15e86ce7ff99d6ee10cec98bc8b3f16021053c' failed:
Failed to merge submodule third_party/ktx
CONFLICT (submodule): Merge conflict in third_party/ktx
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/ktx), and either merge commit 3f880e63
   or update to an existing commit which has merged those changes
 - come back to superproject and run:

      git add third_party/ktx

   to record the above merge or update
 - resolve any other conflicts in the superproject
 - commit the resulting index in the superproject

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Execution of 'git rev-list devtool-base..8db8ce9c528330f0b1261b07531b009732b08731' failed with exit code 128:
fatal: Invalid revision range devtool-base..8db8ce9c528330f0b1261b07531b009732b08731



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7401983047418199181==--

