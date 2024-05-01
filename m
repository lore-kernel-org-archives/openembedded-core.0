Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FC8C25B77
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1123.1714579217039879267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Kw+oASDm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PHY6k7TJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f34e29868-57d8f776-a52f-4d76-823d-dbb22e428572-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oceyD3pUzFjyvP4RCkCI3mG5oMTEElYjD9R1xgMHSXQ=;
	b=Kw+oASDm8Q7szMwpIbETdBe9cMauHFY6sr9puVWC9AecazHLt+35AhNk7PwO8Y8Y
	f2tbtF6/Y05gwSTDZpV811pcV7XyMrqVRQVL6wHRgChA6/6tRxJb+zaAVpkXy5GbffT
	f5zoNl0g50UbGbZIosJHtN4gJZ5Zsx2NPy+t5Jig=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oceyD3pUzFjyvP4RCkCI3mG5oMTEElYjD9R1xgMHSXQ=;
	b=PHY6k7TJ6lg52mI4D2J4nBWbxj6aRXZnYq4m9iq7QmvaKfq9BD3PgnwwArp5A9X6
	PU6OiPs7pigJYpL243gIsxqCSyZrads4bz4fdO73VhobLJtMVG3cs+mwXISxEr+qWx1
	83rogUu0c8D3u4Wg4nLVmSsdl10w6dRRqO1SdSF8=
Content-Type: multipart/mixed; boundary="===============1675224357668604624=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] boost: upgrading to 1.85.0 FAILED
Message-ID: <0101018f34e29868-57d8f776-a52f-4d76-823d-dbb22e428572-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198874

--===============1675224357668604624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *boost* to *1.85.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe boost failed.
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
DISTRO_VERSION       = "5.0+snapshot-65668c9330b3ae03ad9655b3b53a778fac4c9e42"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:65668c9330b3ae03ad9655b3b53a778fac4c9e42"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-65668c9330b3ae03ad9655b3b53a778fac4c9e42"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:65668c9330b3ae03ad9655b3b53a778fac4c9e42"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:01:07
Adding changed files:   1% |                                    | ETA:  0:00:48
Adding changed files:   1% |                                    | ETA:  0:00:42
Adding changed files:   2% |                                    | ETA:  0:00:40
Adding changed files:   2% |#                                   | ETA:  0:00:37
Adding changed files:   3% |#                                   | ETA:  0:00:36
Adding changed files:   4% |#                                   | ETA:  0:00:34
Adding changed files:   4% |#                                   | ETA:  0:00:34
Adding changed files:   5% |#                                   | ETA:  0:00:33
Adding changed files:   5% |##                                  | ETA:  0:00:32
Adding changed files:   6% |##                                  | ETA:  0:00:32
Adding changed files:   7% |##                                  | ETA:  0:00:31
Adding changed files:   7% |##                                  | ETA:  0:00:31
Adding changed files:   8% |###                                 | ETA:  0:00:31
Adding changed files:   8% |###                                 | ETA:  0:00:31
Adding changed files:   9% |###                                 | ETA:  0:00:31
Adding changed files:  10% |###                                 | ETA:  0:00:31
Adding changed files:  10% |###                                 | ETA:  0:00:30
Adding changed files:  11% |####                                | ETA:  0:00:30
Adding changed files:  11% |####                                | ETA:  0:00:30
Adding changed files:  12% |####                                | ETA:  0:00:30
Adding changed files:  13% |####                                | ETA:  0:00:30
Adding changed files:  13% |####                                | ETA:  0:00:30
Adding changed files:  14% |#####                               | ETA:  0:00:29
Adding changed files:  14% |#####                               | ETA:  0:00:29
Adding changed files:  15% |#####                               | ETA:  0:00:29
Adding changed files:  16% |#####                               | ETA:  0:00:29
Adding changed files:  16% |######                              | ETA:  0:00:29
Adding changed files:  17% |######                              | ETA:  0:00:29
Adding changed files:  17% |######                              | ETA:  0:00:29
Adding changed files:  18% |######                              | ETA:  0:00:28
Adding changed files:  19% |######                              | ETA:  0:00:28
Adding changed files:  19% |#######                             | ETA:  0:00:28
Adding changed files:  20% |#######                             | ETA:  0:00:28
Adding changed files:  20% |#######                             | ETA:  0:00:28
Adding changed files:  21% |#######                             | ETA:  0:00:27
Adding changed files:  22% |#######                             | ETA:  0:00:27
Adding changed files:  22% |########                            | ETA:  0:00:27
Adding changed files:  23% |########                            | ETA:  0:00:27
Adding changed files:  23% |########                            | ETA:  0:00:27
Adding changed files:  24% |########                            | ETA:  0:00:26
Adding changed files:  25% |#########                           | ETA:  0:00:26
Adding changed files:  25% |#########                           | ETA:  0:00:26
Adding changed files:  26% |#########                           | ETA:  0:00:25
Adding changed files:  26% |#########                           | ETA:  0:00:25
Adding changed files:  27% |#########                           | ETA:  0:00:25
Adding changed files:  28% |##########                          | ETA:  0:00:25
Adding changed files:  28% |##########                          | ETA:  0:00:24
Adding changed files:  29% |##########                          | ETA:  0:00:24
Adding changed files:  29% |##########                          | ETA:  0:00:24
Adding changed files:  30% |###########                         | ETA:  0:00:24
Adding changed files:  31% |###########                         | ETA:  0:00:23
Adding changed files:  31% |###########                         | ETA:  0:00:23
Adding changed files:  32% |###########                         | ETA:  0:00:23
Adding changed files:  32% |###########                         | ETA:  0:00:22
Adding changed files:  33% |############                        | ETA:  0:00:22
Adding changed files:  34% |############                        | ETA:  0:00:22
Adding changed files:  34% |############                        | ETA:  0:00:22
Adding changed files:  35% |############                        | ETA:  0:00:21
Adding changed files:  35% |############                        | ETA:  0:00:21
Adding changed files:  36% |#############                       | ETA:  0:00:21
Adding changed files:  37% |#############                       | ETA:  0:00:21
Adding changed files:  37% |#############                       | ETA:  0:00:21
Adding changed files:  38% |#############                       | ETA:  0:00:20
Adding changed files:  38% |##############                      | ETA:  0:00:20
Adding changed files:  39% |##############                      | ETA:  0:00:20
Adding changed files:  40% |##############                      | ETA:  0:00:20
Adding changed files:  40% |##############                      | ETA:  0:00:19
Adding changed files:  41% |##############                      | ETA:  0:00:19
Adding changed files:  41% |###############                     | ETA:  0:00:19
Adding changed files:  42% |###############                     | ETA:  0:00:19
Adding changed files:  43% |###############                     | ETA:  0:00:18
Adding changed files:  43% |###############                     | ETA:  0:00:18
Adding changed files:  44% |###############                     | ETA:  0:00:18
Adding changed files:  44% |################                    | ETA:  0:00:18
Adding changed files:  45% |################                    | ETA:  0:00:18
Adding changed files:  46% |################                    | ETA:  0:00:17
Adding changed files:  46% |################                    | ETA:  0:00:17
Adding changed files:  47% |#################                   | ETA:  0:00:17
Adding changed files:  47% |#################                   | ETA:  0:00:17
Adding changed files:  48% |#################                   | ETA:  0:00:17
Adding changed files:  49% |#################                   | ETA:  0:00:16
Adding changed files:  49% |#################                   | ETA:  0:00:16
Adding changed files:  50% |##################                  | ETA:  0:00:16
Adding changed files:  50% |##################                  | ETA:  0:00:16
Adding changed files:  51% |##################                  | ETA:  0:00:15
Adding changed files:  52% |##################                  | ETA:  0:00:15
Adding changed files:  52% |###################                 | ETA:  0:00:15
Adding changed files:  53% |###################                 | ETA:  0:00:15
Adding changed files:  53% |###################                 | ETA:  0:00:15
Adding changed files:  54% |###################                 | ETA:  0:00:15
Adding changed files:  55% |###################                 | ETA:  0:00:14
Adding changed files:  55% |####################                | ETA:  0:00:14
Adding changed files:  56% |####################                | ETA:  0:00:14
Adding changed files:  56% |####################                | ETA:  0:00:14
Adding changed files:  57% |####################                | ETA:  0:00:14
Adding changed files:  58% |####################                | ETA:  0:00:13
Adding changed files:  58% |#####################               | ETA:  0:00:13
Adding changed files:  59% |#####################               | ETA:  0:00:13
Adding changed files:  59% |#####################               | ETA:  0:00:13
Adding changed files:  60% |#####################               | ETA:  0:00:13
Adding changed files:  61% |######################              | ETA:  0:00:12
Adding changed files:  61% |######################              | ETA:  0:00:12
Adding changed files:  62% |######################              | ETA:  0:00:12
Adding changed files:  62% |######################              | ETA:  0:00:12
Adding changed files:  63% |######################              | ETA:  0:00:12
Adding changed files:  64% |#######################             | ETA:  0:00:11
Adding changed files:  64% |#######################             | ETA:  0:00:11
Adding changed files:  65% |#######################             | ETA:  0:00:11
Adding changed files:  65% |#######################             | ETA:  0:00:11
Adding changed files:  66% |#######################             | ETA:  0:00:11
Adding changed files:  67% |########################            | ETA:  0:00:10
Adding changed files:  67% |########################            | ETA:  0:00:10
Adding changed files:  68% |########################            | ETA:  0:00:10
Adding changed files:  68% |########################            | ETA:  0:00:10
Adding changed files:  69% |#########################           | ETA:  0:00:10
Adding changed files:  70% |#########################           | ETA:  0:00:09
Adding changed files:  70% |#########################           | ETA:  0:00:09
Adding changed files:  71% |#########################           | ETA:  0:00:09
Adding changed files:  71% |#########################           | ETA:  0:00:09
Adding changed files:  72% |##########################          | ETA:  0:00:09
Adding changed files:  73% |##########################          | ETA:  0:00:09
Adding changed files:  73% |##########################          | ETA:  0:00:08
Adding changed files:  74% |##########################          | ETA:  0:00:08
Adding changed files:  74% |##########################          | ETA:  0:00:08
Adding changed files:  75% |###########################         | ETA:  0:00:08
Adding changed files:  76% |###########################         | ETA:  0:00:08
Adding changed files:  76% |###########################         | ETA:  0:00:07
Adding changed files:  77% |###########################         | ETA:  0:00:07
Adding changed files:  77% |############################        | ETA:  0:00:07
Adding changed files:  78% |############################        | ETA:  0:00:07
Adding changed files:  79% |############################        | ETA:  0:00:07
Adding changed files:  79% |############################        | ETA:  0:00:06
Adding changed files:  80% |############################        | ETA:  0:00:06
Adding changed files:  80% |#############################       | ETA:  0:00:06
Adding changed files:  81% |#############################       | ETA:  0:00:06
Adding changed files:  82% |#############################       | ETA:  0:00:06
Adding changed files:  82% |#############################       | ETA:  0:00:05
Adding changed files:  83% |##############################      | ETA:  0:00:05
Adding changed files:  83% |##############################      | ETA:  0:00:05
Adding changed files:  84% |##############################      | ETA:  0:00:05
Adding changed files:  85% |##############################      | ETA:  0:00:05
Adding changed files:  85% |##############################      | ETA:  0:00:04
Adding changed files:  86% |###############################     | ETA:  0:00:04
Adding changed files:  86% |###############################     | ETA:  0:00:04
Adding changed files:  87% |###############################     | ETA:  0:00:04
Adding changed files:  88% |###############################     | ETA:  0:00:04
Adding changed files:  88% |###############################     | ETA:  0:00:03
Adding changed files:  89% |################################    | ETA:  0:00:03
Adding changed files:  89% |################################    | ETA:  0:00:03
Adding changed files:  90% |################################    | ETA:  0:00:03
Adding changed files:  91% |################################    | ETA:  0:00:03
Adding changed files:  91% |#################################   | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  93% |#################################   | ETA:  0:00:02
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:34
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://boostorg.jfrog.io/artifactory/main/release/1.85.0/source/boost_1_85_0.tar.bz2...
INFO: Rebasing devtool onto b793540940aea8ea656794e47d23744d6a9af811
WARNING: Command 'git rebase b793540940aea8ea656794e47d23744d6a9af811' failed:
Auto-merging libs/math/build/Jamfile.v2
CONFLICT (content): Merge conflict in libs/math/build/Jamfile.v2

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/boost
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/boost/boost_1.85.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1675224357668604624==--

