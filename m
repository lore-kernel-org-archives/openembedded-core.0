Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE479D10DD0
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.149798.1733047553199512490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BT657J59;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jgYUAGEW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019381af3a55-fbbfde2d-a848-4312-99dc-ac5f26892a98-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047564;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xH/tmBYdCc70PV1r7bEdPUEvrm+kxo0uHpQhE2gdTbA=;
	b=BT657J59FMsNh2rCDrRhjKBWlh6WZFWzL9HnHfvy4ZV6Ux492SbelRqVySrOt1jZ
	H3FYFS+dBmXaE1vkt2RUOKuLaVX1tc0TYuD8H8uHauxUrYJk/g7wc++LzROAGsfQYbl
	FGAFh92z86MMAofm4pI17w3LU1jEO18rZQXfzdiM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047564;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xH/tmBYdCc70PV1r7bEdPUEvrm+kxo0uHpQhE2gdTbA=;
	b=jgYUAGEWVnA3UfCMazUKDFzCXLHAcCC2NeKf6VMDbIBmS7UbQdF7BgVxzcAI5xZj
	5cGcstE0G/GC8L9Nuqm3hU//DRPCy/YwM8e3RQehKLapFW/6KDlUjWw4VQ6vDiw+DXU
	IvqRoSnMUdHasZV9wZp3Gfu0LlWzz0OYlC5kWkuI=
Content-Type: multipart/mixed; boundary="===============1229212643143712033=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 06924b56d837e5306791caccb5cb3311ebd0b0e1 FAILED
Message-ID: <0101019381af3a55-fbbfde2d-a848-4312-99dc-ac5f26892a98-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208091

--===============1229212643143712033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *06924b56d837e5306791caccb5cb3311ebd0b0e1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 06924b56d837e5306791caccb5cb3311ebd0b0e1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:312464b1d766946dbb67b91765e85bdc0fb1ef86"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 06924b56d837e5306791caccb5cb3311ebd0b0e1
WARNING: Command 'git rebase 06924b56d837e5306791caccb5cb3311ebd0b0e1' failed:
Failed to merge submodule third_party/ktx
CONFLICT (submodule): Merge conflict in third_party/ktx
Recursive merging with submodules currently only supports trivial cases.
Please manually handle the merging of each conflicted submodule.
This can be accomplished with the following steps:
 - go to submodule (third_party/ktx), and either merge commit 93803f46
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
--===============1229212643143712033==--

