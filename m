Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D58CC88CB9
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.107886.1682976349700546316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XjikwZtF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010187d935225e-b74b2a22-f77a-4606-a28a-4eeff16d0b46-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pwGOVt+gnihZyeIZ/z2i0BE3yckSrJ0+4w2kItVXulg=;
	b=XjikwZtF6yDT6QBLLFaZ4K+JSMrVzfW+vvluLWwUMykcBbxczjSMujIfHO3DSOL+
	RZMsM2qoBVqDIqZrdKkpTw0oVkpkLmv4sS+0rb5LgBxDz5X85tTSJNid//W28NKMlrB
	O0zmMiUUKTShz1TzvNzYltqemmcm+HiSCkC95mHM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pwGOVt+gnihZyeIZ/z2i0BE3yckSrJ0+4w2kItVXulg=;
	b=rt0oTm8OmDg4GEZKvs734jFz5KxBx9lL3fdhjcHJ03OJldlYvGGEgz3ov2fFKDaD
	YyI7i6gh8hSqtnPN2ofxRV6xML+Or6u0oT4ysqPjMMv/Hq65OL+aML4IT631TTncYKN
	XryRBp0RxuLEAYiEZIBqtTIJ4m1eQDRvRCbf1FQo=
Content-Type: multipart/mixed; boundary="===============2681256426676349554=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 8.0.0 FAILED
Message-ID: <01010187d935225e-b74b2a22-f77a-4606-a28a-4eeff16d0b46-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180640

--===============2681256426676349554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *8.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:10:24.308238)
Loading cache...done.
Loaded 1799 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c99e1ba459baab"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1800 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c99e1ba459baab"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:24
Adding changed files:   3% |#                                   | ETA:  0:00:16
Adding changed files:   5% |##                                  | ETA:  0:00:14
Adding changed files:   7% |##                                  | ETA:  0:00:12
Adding changed files:   9% |###                                 | ETA:  0:00:11
Adding changed files:  11% |####                                | ETA:  0:00:10
Adding changed files:  13% |####                                | ETA:  0:00:10
Adding changed files:  15% |#####                               | ETA:  0:00:10
Adding changed files:  17% |######                              | ETA:  0:00:09
Adding changed files:  19% |######                              | ETA:  0:00:09
Adding changed files:  21% |#######                             | ETA:  0:00:09
Adding changed files:  23% |########                            | ETA:  0:00:08
Adding changed files:  25% |#########                           | ETA:  0:00:08
Adding changed files:  26% |#########                           | ETA:  0:00:08
Adding changed files:  28% |##########                          | ETA:  0:00:08
Adding changed files:  30% |###########                         | ETA:  0:00:08
Adding changed files:  32% |###########                         | ETA:  0:00:08
Adding changed files:  34% |############                        | ETA:  0:00:08
Adding changed files:  36% |#############                       | ETA:  0:00:07
Adding changed files:  38% |#############                       | ETA:  0:00:07
Adding changed files:  40% |##############                      | ETA:  0:00:07
Adding changed files:  42% |###############                     | ETA:  0:00:07
Adding changed files:  44% |###############                     | ETA:  0:00:06
Adding changed files:  46% |################                    | ETA:  0:00:06
Adding changed files:  48% |#################                   | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  51% |##################                  | ETA:  0:00:06
Adding changed files:  53% |###################                 | ETA:  0:00:06
Adding changed files:  55% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  69% |########################            | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  80% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:13
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-8.0.0.tar.xz...
INFO: Rebasing devtool onto 23ffab1c61a6641ed9aafbb66a5e13ef71342202
WARNING: Command 'git rebase 23ffab1c61a6641ed9aafbb66a5e13ef71342202' failed:
Auto-merging tests/unit/meson.build
CONFLICT (content): Merge conflict in tests/unit/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 23ffab1c61a6641ed9aafbb66a5e13ef71342202
WARNING: Command 'git rebase 23ffab1c61a6641ed9aafbb66a5e13ef71342202' failed:
Auto-merging tests/unit/meson.build
CONFLICT (content): Merge conflict in tests/unit/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 23ffab1c61a6641ed9aafbb66a5e13ef71342202
WARNING: Command 'git rebase 23ffab1c61a6641ed9aafbb66a5e13ef71342202' failed:
Auto-merging tests/unit/meson.build
CONFLICT (content): Merge conflict in tests/unit/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/qemu
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/qemu/qemu_8.0.0.bb
WARNING: Version is pinned to 7.2% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2681256426676349554==--

