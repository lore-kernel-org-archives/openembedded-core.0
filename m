Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955C5D1F9C6
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11814.1728994565238030173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YEmXUVtI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ATytEBr8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010192901b6de4-526a2691-ae53-4f87-aac9-5e11357b6164-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q4F4GxF+/tqPlOKUyXHVn1lj/6WKKjaMQS0YHFKn+vU=;
	b=YEmXUVtIwRUV6aknPFLLL3JlGLcWuTW/vjR+o19Qp+HqXdi0qEX41xW6u5Ib4EXJ
	3bo66AoVoxAaGm3SndOBw+7wOVa7D6aD2TR6ktJezMoLKXEvP6oEQKKeLMCWH//nPSy
	7hDBHAkGVeZjkuY2ppFQnutjpuejQgeUzbxG3QCQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q4F4GxF+/tqPlOKUyXHVn1lj/6WKKjaMQS0YHFKn+vU=;
	b=ATytEBr8PIYIrxle6W8dRYA2PfuxiwIkqwmJhI3vRUb9P2AWknjQWZZlGgH5xVN3
	8oVFNgV7+/pOceDFyoIVQFwh6KKe1ckTYXnLWRv9xFiZ+56zmwKP5hfeE0NnEiteT7v
	/wA1dRAIDTHX/TKJhcSG7JjW09RNh35qlbQBqcYg=
Content-Type: multipart/mixed; boundary="===============3098788269606421843=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 7d15e86ce7ff99d6ee10cec98bc8b3f16021053c FAILED
Message-ID: <01010192901b6de4-526a2691-ae53-4f87-aac9-5e11357b6164-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205886

--===============3098788269606421843==
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
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:3fe9aa8dc7eeacff6b7a6e760f61fec78ccb23ec"

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
 - go to submodule (third_party/ktx), and either merge commit 5df22318
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
--===============3098788269606421843==--

