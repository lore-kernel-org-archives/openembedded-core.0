Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F184CC83F39
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12162.1752594932041578220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vI+jNYWA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oBsY9uc4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101980ecc5ed8-09f84dbd-6e20-4aaa-b4b7-ef8743161bbe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594931;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NxPJ9l03OnD1EwphzsUzN9yzQMcrwtNJhjG8M6zJ7Qo=;
	b=vI+jNYWAbCFftIXHk5SOym5QLFf5jZJ8ojNUlPsrC4+761/an+b6P0j8ehZOc1jG
	1MSeX0NR+oIxxP+LCCPFKTgbdXNdMCqCOjB0z9KnRTOdCTOTf2t4dNs5mVkTOI3Mqsi
	dZp2qaOh0bnHNWw12LCtqnrAtj1uQ8ZBaLOUlrlI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594931;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NxPJ9l03OnD1EwphzsUzN9yzQMcrwtNJhjG8M6zJ7Qo=;
	b=oBsY9uc4V5CVYW/YQUnQOYL2kttiV3c4jfDBm0vPEsIOQIiBiQBlZmqae/pUA98Z
	7QX3hDVj3E+q+lrSV1u3M0R3NEQ0vg8TE5IT7cd8q+Prvk4ObMTN/3ii+ruwUf5vUta
	aV6DQ9q4slX9TMxVUX0/rj3TvN8If2m1+Q9GTiaU=
Content-Type: multipart/mixed; boundary="===============5219983638367414567=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 4.0.3,4.0.3 FAILED
Message-ID: <010101980ecc5ed8-09f84dbd-6e20-4aaa-b4b7-ef8743161bbe-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220311

--===============5219983638367414567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *4.0.3,4.0.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe cmake failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c1d1f88d1986235584bf8dcb6d0d090e90513877"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c1d1f88d1986235584bf8dcb6d0d090e90513877"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1929 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c1d1f88d1986235584bf8dcb6d0d090e90513877"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c1d1f88d1986235584bf8dcb6d0d090e90513877"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:07
Adding changed files:   3% |#                                   | ETA:  0:00:05
Adding changed files:   5% |##                                  | ETA:  0:00:04
Adding changed files:   7% |##                                  | ETA:  0:00:04
Adding changed files:   9% |###                                 | ETA:  0:00:04
Adding changed files:  11% |####                                | ETA:  0:00:03
Adding changed files:  13% |####                                | ETA:  0:00:03
Adding changed files:  15% |#####                               | ETA:  0:00:03
Adding changed files:  17% |######                              | ETA:  0:00:03
Adding changed files:  19% |######                              | ETA:  0:00:03
Adding changed files:  21% |#######                             | ETA:  0:00:03
Adding changed files:  23% |########                            | ETA:  0:00:03
Adding changed files:  25% |#########                           | ETA:  0:00:03
Adding changed files:  27% |#########                           | ETA:  0:00:03
Adding changed files:  28% |##########                          | ETA:  0:00:02
Adding changed files:  30% |###########                         | ETA:  0:00:02
Adding changed files:  32% |###########                         | ETA:  0:00:02
Adding changed files:  34% |############                        | ETA:  0:00:02
Adding changed files:  36% |#############                       | ETA:  0:00:02
Adding changed files:  38% |#############                       | ETA:  0:00:02
Adding changed files:  40% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  44% |###############                     | ETA:  0:00:02
Adding changed files:  46% |################                    | ETA:  0:00:02
Adding changed files:  48% |#################                   | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  52% |##################                  | ETA:  0:00:01
Adding changed files:  54% |###################                 | ETA:  0:00:01
Adding changed files:  55% |####################                | ETA:  0:00:01
Adding changed files:  57% |####################                | ETA:  0:00:01
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  63% |######################              | ETA:  0:00:01
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://cmake.org/files/v4.0/cmake-4.0.3.tar.gz...
INFO: Rebasing devtool onto cdfed888d6fa1d289c94eea9271f98bf449ea9a1
WARNING: Command 'git rebase cdfed888d6fa1d289c94eea9271f98bf449ea9a1' failed:
Auto-merging Modules/CMakeDetermineCompilerABI.cmake
CONFLICT (content): Merge conflict in Modules/CMakeDetermineCompilerABI.cmake

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto cdfed888d6fa1d289c94eea9271f98bf449ea9a1
WARNING: Command 'git rebase cdfed888d6fa1d289c94eea9271f98bf449ea9a1' failed:
Auto-merging Modules/CMakeDetermineCompilerABI.cmake
CONFLICT (content): Merge conflict in Modules/CMakeDetermineCompilerABI.cmake

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/cmake
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/cmake/cmake_4.0.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5219983638367414567==--

