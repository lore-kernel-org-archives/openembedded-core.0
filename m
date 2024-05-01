Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A9DC27C65
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:21 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1136.1714579216716783836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GS0qFF2v;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZpGyag1b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f34e29674-01225257-f8bb-4812-baec-d68c00428def-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PJhVY2DT+q3UoyxUz3/Ci9DakivHPSqHbXWMum0eTqc=;
	b=GS0qFF2vN3KB7ve5iCbl3XquUCTovpS9ieTFxc1WCJnjtH/kEUNnsV98Gha2A1Cl
	RQJ2ewgtMQTwlum2pNRMVvdAY2nrh/SNT3HzOhLPEsSiOn19+aoefY4PC7MDbYiD5sb
	clgPY0241geTR/slFU5LwXYsamOb9DGY5PTE5GxE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PJhVY2DT+q3UoyxUz3/Ci9DakivHPSqHbXWMum0eTqc=;
	b=ZpGyag1bRlAGO5iZxynLs5+Ukt4kckFJkREbGrDFWclIg7N2zGlf9VeqN7eYihCs
	/3M2ecpkSkV/Od5nIwkI8187r2e2hAt2J7zI3+DcI/iuMOVwGRTUjLnweFeg6LGOQO6
	XNS/B8Cve6e4OLm4/VIbJsNLfD+Meljar7GWj4zI=
Content-Type: multipart/mixed; boundary="===============4841872963278567410=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 db55e980ecb994f5cfa769954b2a812d8f9bc235 FAILED
Message-ID: <0101018f34e29674-01225257-f8bb-4812-baec-d68c00428def-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198850

--===============4841872963278567410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *db55e980ecb994f5cfa769954b2a812d8f9bc235* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S db55e980ecb994f5cfa769954b2a812d8f9bc235
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-6842d6c5b3ad476829cf51bdb5d427ad3084e80a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6842d6c5b3ad476829cf51bdb5d427ad3084e80a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto db55e980ecb994f5cfa769954b2a812d8f9bc235
WARNING: Command 'git rebase db55e980ecb994f5cfa769954b2a812d8f9bc235' failed:
Failed to merge submodule third_party/spdlog
CONFLICT (submodule): Merge conflict in third_party/spdlog
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/spdlog), and either merge commit 48af842a
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
--===============4841872963278567410==--

