Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D255D62072
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4707.1731964656226154736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AXJwQnAD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=byPBext7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101934123849e-68a068b1-293f-4fe4-8ca9-c755a201346a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Uz0ieexZvXAvPG7Y9GGuZ4Fy9fxxQbCG916eeg7nNZE=;
	b=AXJwQnADgYuj4KWLJ0yEW6wAucUigIM6rlMMvbUwhOnBxD9APyiWnHWoY09RVoJ/
	qyxZs4ZkUF19ktxz0etnFb/3SLoeGMHRage+5snruFbbsSwnH7MnLUeguPOOZvpCfAu
	u5JDgGeXk1jxWyxs+mayVWQUE1pBAQyftFxa7y8s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Uz0ieexZvXAvPG7Y9GGuZ4Fy9fxxQbCG916eeg7nNZE=;
	b=byPBext7it8wMv/ljt6oGpHuVmhMA7IeqnRzANGGt/4I6XX9D0mEMT7oE6gTgyhY
	sFe4GxDSm67iL/MJTfKPMbT6wc+RV6V6Ti3XYrtWyycd45f/9GqNvrhvcB0zsjZvBD7
	TvLPnFNYYpG/9/Wwbac414MSjDbJTApHzbEMESt8=
Content-Type: multipart/mixed; boundary="===============5433842047308798226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 1cea0da3e24ba71f872a28008ae4d2cd7634a7e7 FAILED
Message-ID: <010101934123849e-68a068b1-293f-4fe4-8ca9-c755a201346a-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207333

--===============5433842047308798226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *1cea0da3e24ba71f872a28008ae4d2cd7634a7e7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 1cea0da3e24ba71f872a28008ae4d2cd7634a7e7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:04a9c81f4bd7c92d4607e17820ad6dcb6fa16b14"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 1cea0da3e24ba71f872a28008ae4d2cd7634a7e7
WARNING: Command 'git rebase 1cea0da3e24ba71f872a28008ae4d2cd7634a7e7' failed:
Failed to merge submodule third_party/ktx
CONFLICT (submodule): Merge conflict in third_party/ktx
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/ktx), and either merge commit f09926bc
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
--===============5433842047308798226==--

