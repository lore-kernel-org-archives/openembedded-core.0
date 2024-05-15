Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A8FC3DA5D
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:30 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1257.1715794339369911671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PKsl9LsF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ubXtIT5s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fe444-5687e6e0-95c2-4eef-a039-db15efff0229-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VcqVwqhgaqElb+WbIj8AJC1BFf5yzor6/xPN8Vs0ZgE=;
	b=PKsl9LsFizo4H2N5zqju77QTwwsgEB1PPZl/c5cohyHiW/GhXwxxhi3nDplfrVzC
	mMkFCommX2YOKyNMC8PctAScNgwnIW7PPsIYNXvaRgokhrLMids/AzDyRxNn7agTbs4
	4kkFabml7hzkaTUtWEXbsXhqeT/y+/y+jUt1xoBM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VcqVwqhgaqElb+WbIj8AJC1BFf5yzor6/xPN8Vs0ZgE=;
	b=ubXtIT5s7dwN9WWS4mFGGx0AL5NTMjlw/3guF+7xKZ4AxXZf4XLHv2KTEEvM8NTO
	cT2inQlLqM9KzErPSGjCG1v31W92VnI0HR5UcvbsvR+fQNjI8D/wzyt5L98KEGPQZEc
	V1H5wtjmcVzMnie1yZBkEydFN9tCMMlXJqlaaZTg=
Content-Type: multipart/mixed; boundary="===============4738008529490754036=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 c9356f62e4472d25b734115dc9cea2bbc200ca64 FAILED
Message-ID: <0101018f7d4fe444-5687e6e0-95c2-4eef-a039-db15efff0229-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199385

--===============4738008529490754036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *c9356f62e4472d25b734115dc9cea2bbc200ca64* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S c9356f62e4472d25b734115dc9cea2bbc200ca64
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
DISTRO_VERSION       = "5.0+snapshot-95d13be355049e35a604a7c09c52cdff052fad0f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:95d13be355049e35a604a7c09c52cdff052fad0f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c9356f62e4472d25b734115dc9cea2bbc200ca64
WARNING: Command 'git rebase c9356f62e4472d25b734115dc9cea2bbc200ca64' failed:
Failed to merge submodule third_party/spdlog
CONFLICT (submodule): Merge conflict in third_party/spdlog
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/spdlog), and either merge commit dcef1b45
   or update to an existing commit which has merged those changes
 - come back to superproject and run:

      git add third_party/spdlog

   to record the above merge or update
 - resolve any other conflicts in the superproject
 - commit the resulting index in the superproject

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Execution of 'git rev-list devtool-base..ee839b65f277ecaf26e4d3fd9877d9f37ced17d2' failed with exit code 128:
fatal: Invalid revision range devtool-base..ee839b65f277ecaf26e4d3fd9877d9f37ced17d2



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4738008529490754036==--

