Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9303C3DA40
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2113.1719853076277315540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=e+Jw9sIN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=HCVdeEfB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101906f3b510c-db4a2b1a-a22f-4de1-a0aa-ed4b59714b14-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zOQfxw1RqZpIPBoibIa2k0owsFYE3XzrsWNEtwfMAtw=;
	b=e+Jw9sINjJDqjSsLBup/K2weamRsMFAKZjB73o+oEBdDxOz6T6HKgCnhsgm6fWoJ
	Msn4KghDu3qBgmeKPejd92wgGjvoQ1+y5fpON7nBQAxr4uT/LBi32Q9v5WFaU7NZnFo
	7d8epzi8E6bvDAzrjk4zc4NqBmxn58sHxDLbw47E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zOQfxw1RqZpIPBoibIa2k0owsFYE3XzrsWNEtwfMAtw=;
	b=HCVdeEfBlC9qJ0E1t0hcVO8Y0c118tZO0snToh60/HI4W4nQ4jnojkMzHLe4zVFV
	6rwMYY/2M2ZbLlsf5gXHBq2Cbwvb/+twiV8gmnK2oBkh5FzWS9SIt/J7y4BUbxPoLJn
	DkJVs3Muqs9mFOfRb9vyu4PttaeMhaHAwF8Fhox4=
Content-Type: multipart/mixed; boundary="===============1367168801552557883=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 7.0.1 FAILED
Message-ID: <010101906f3b510c-db4a2b1a-a22f-4de1-a0aa-ed4b59714b14-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201375

--===============1367168801552557883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ffmpeg* to *7.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ffmpeg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-9b3218dcf3af44b85aee8e09ecbd3741362fdc5c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9b3218dcf3af44b85aee8e09ecbd3741362fdc5c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-9b3218dcf3af44b85aee8e09ecbd3741362fdc5c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9b3218dcf3af44b85aee8e09ecbd3741362fdc5c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-9u1vf5ml: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-gleizf7q/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-gleizf7q/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   4% |#                                   | ETA:  0:00:03
Adding changed files:   9% |###                                 | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  19% |######                              | ETA:  0:00:02
Adding changed files:  24% |########                            | ETA:  0:00:01
Adding changed files:  29% |##########                          | ETA:  0:00:01
Adding changed files:  33% |############                        | ETA:  0:00:01
Adding changed files:  38% |#############                       | ETA:  0:00:01
Adding changed files:  43% |###############                     | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:01
Adding changed files:  58% |####################                | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  72% |##########################          | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.ffmpeg.org/releases/ffmpeg-7.0.1.tar.xz...
INFO: Rebasing devtool onto 17f8cca323cb5f4c4ba16156399cca98f1b5f722
WARNING: Command 'git rebase 17f8cca323cb5f4c4ba16156399cca98f1b5f722' failed:
Auto-merging configure
Auto-merging libavcodec/Makefile
Auto-merging libavcodec/vulkan_av1.c
CONFLICT (content): Merge conflict in libavcodec/vulkan_av1.c
Auto-merging libavcodec/vulkan_decode.c
Auto-merging libavcodec/vulkan_decode.h
Auto-merging libavcodec/vulkan_video.c
CONFLICT (content): Merge conflict in libavcodec/vulkan_video.c
Auto-merging libavcodec/vulkan_video.h
Auto-merging libavutil/hwcontext_vulkan.c
Auto-merging libavutil/vulkan_loader.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/ffmpeg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/ffmpeg/ffmpeg_7.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1367168801552557883==--

