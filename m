Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10089C87FE2
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.7533.1685693432784147975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bqIMGfc6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b2890a6-f8da1d3c-968f-40ea-8124-37bbc66c0f1c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pR6WOc0YZxIuNyp/+b3SiCROFjw22QjUfLN151RDbWU=;
	b=bqIMGfc6rfBAAvXXZhtzTzv2ZOT6ywm4x0R0YfvXGPiJ/bM7GKLkIRRRmH+NPGKL
	LrnqNcgghF00Xc9fZygkotDJbwd1U0P3aUblIMptB+iDC9Q0KWYBSoYaF5xMnOIPEWz
	FKP/Pgg+XfNV3/T1F+Cdc0Ft+U8k7QUgTaFU6x4A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pR6WOc0YZxIuNyp/+b3SiCROFjw22QjUfLN151RDbWU=;
	b=C4dnsAe7MwNPSZ/h4ACiuN5TTpGb2q2VXCwbmtKK7L4kd/akdJIlUaMLVw4XugNx
	hRjC5s2NGLFijnFPkrLf5J/FWM8SX+cYvTIoQoNiC/X3jIKCmGrAOowuXuqnUb0rgmp
	x1l9/j3Sld5yjgCquznNS+J7/MCmUe3x8K4SHP3Y=
Content-Type: multipart/mixed; boundary="===============8600492269362634460=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.40.2 FAILED
Message-ID: <010101887b2890a6-f8da1d3c-968f-40ea-8124-37bbc66c0f1c-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182269

--===============8600492269362634460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.40.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe webkitgtk failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (04:56:38.883044)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:851e56a1bdfa9a771f21d2ebbe1ffcf752f3a503"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (896 cached, 2 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
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
meta-yocto-bsp       = "tmp-auh-upgrades:851e56a1bdfa9a771f21d2ebbe1ffcf752f3a503"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:35
Adding changed files:   1% |                                    | ETA:  0:00:27
Adding changed files:   2% |                                    | ETA:  0:00:23
Adding changed files:   2% |#                                   | ETA:  0:00:21
Adding changed files:   3% |#                                   | ETA:  0:00:20
Adding changed files:   4% |#                                   | ETA:  0:00:19
Adding changed files:   4% |#                                   | ETA:  0:00:19
Adding changed files:   5% |##                                  | ETA:  0:00:18
Adding changed files:   6% |##                                  | ETA:  0:00:21
Adding changed files:   7% |##                                  | ETA:  0:00:20
Adding changed files:   7% |##                                  | ETA:  0:00:20
Adding changed files:   8% |###                                 | ETA:  0:00:19
Adding changed files:   9% |###                                 | ETA:  0:00:19
Adding changed files:   9% |###                                 | ETA:  0:00:18
Adding changed files:  10% |###                                 | ETA:  0:00:18
Adding changed files:  11% |####                                | ETA:  0:00:17
Adding changed files:  12% |####                                | ETA:  0:00:17
Adding changed files:  12% |####                                | ETA:  0:00:16
Adding changed files:  13% |####                                | ETA:  0:00:16
Adding changed files:  14% |#####                               | ETA:  0:00:16
Adding changed files:  14% |#####                               | ETA:  0:00:16
Adding changed files:  15% |#####                               | ETA:  0:00:16
Adding changed files:  16% |#####                               | ETA:  0:00:15
Adding changed files:  16% |######                              | ETA:  0:00:15
Adding changed files:  17% |######                              | ETA:  0:00:15
Adding changed files:  18% |######                              | ETA:  0:00:15
Adding changed files:  19% |######                              | ETA:  0:00:14
Adding changed files:  19% |#######                             | ETA:  0:00:14
Adding changed files:  20% |#######                             | ETA:  0:00:14
Adding changed files:  21% |#######                             | ETA:  0:00:14
Adding changed files:  21% |#######                             | ETA:  0:00:14
Adding changed files:  22% |########                            | ETA:  0:00:13
Adding changed files:  23% |########                            | ETA:  0:00:13
Adding changed files:  24% |########                            | ETA:  0:00:13
Adding changed files:  24% |########                            | ETA:  0:00:13
Adding changed files:  25% |#########                           | ETA:  0:00:13
Adding changed files:  26% |#########                           | ETA:  0:00:13
Adding changed files:  26% |#########                           | ETA:  0:00:12
Adding changed files:  27% |#########                           | ETA:  0:00:12
Adding changed files:  28% |##########                          | ETA:  0:00:12
Adding changed files:  28% |##########                          | ETA:  0:00:12
Adding changed files:  29% |##########                          | ETA:  0:00:12
Adding changed files:  30% |##########                          | ETA:  0:00:12
Adding changed files:  31% |###########                         | ETA:  0:00:11
Adding changed files:  31% |###########                         | ETA:  0:00:11
Adding changed files:  32% |###########                         | ETA:  0:00:11
Adding changed files:  33% |###########                         | ETA:  0:00:11
Adding changed files:  33% |############                        | ETA:  0:00:11
Adding changed files:  34% |############                        | ETA:  0:00:11
Adding changed files:  35% |############                        | ETA:  0:00:11
Adding changed files:  36% |############                        | ETA:  0:00:10
Adding changed files:  36% |#############                       | ETA:  0:00:10
Adding changed files:  37% |#############                       | ETA:  0:00:10
Adding changed files:  38% |#############                       | ETA:  0:00:10
Adding changed files:  38% |#############                       | ETA:  0:00:10
Adding changed files:  39% |##############                      | ETA:  0:00:10
Adding changed files:  40% |##############                      | ETA:  0:00:10
Adding changed files:  40% |##############                      | ETA:  0:00:10
Adding changed files:  41% |###############                     | ETA:  0:00:10
Adding changed files:  42% |###############                     | ETA:  0:00:09
Adding changed files:  43% |###############                     | ETA:  0:00:09
Adding changed files:  43% |###############                     | ETA:  0:00:09
Adding changed files:  44% |################                    | ETA:  0:00:09
Adding changed files:  45% |################                    | ETA:  0:00:09
Adding changed files:  45% |################                    | ETA:  0:00:09
Adding changed files:  46% |################                    | ETA:  0:00:09
Adding changed files:  47% |#################                   | ETA:  0:00:09
Adding changed files:  48% |#################                   | ETA:  0:00:09
Adding changed files:  48% |#################                   | ETA:  0:00:09
Adding changed files:  49% |#################                   | ETA:  0:00:08
Adding changed files:  50% |##################                  | ETA:  0:00:08
Adding changed files:  50% |##################                  | ETA:  0:00:08
Adding changed files:  51% |##################                  | ETA:  0:00:08
Adding changed files:  52% |##################                  | ETA:  0:00:08
Adding changed files:  52% |###################                 | ETA:  0:00:08
Adding changed files:  53% |###################                 | ETA:  0:00:08
Adding changed files:  54% |###################                 | ETA:  0:00:08
Adding changed files:  55% |###################                 | ETA:  0:00:08
Adding changed files:  55% |####################                | ETA:  0:00:08
Adding changed files:  56% |####################                | ETA:  0:00:07
Adding changed files:  57% |####################                | ETA:  0:00:07
Adding changed files:  57% |####################                | ETA:  0:00:07
Adding changed files:  58% |#####################               | ETA:  0:00:07
Adding changed files:  59% |#####################               | ETA:  0:00:07
Adding changed files:  60% |#####################               | ETA:  0:00:07
Adding changed files:  60% |#####################               | ETA:  0:00:07
Adding changed files:  61% |######################              | ETA:  0:00:07
Adding changed files:  62% |######################              | ETA:  0:00:06
Adding changed files:  62% |######################              | ETA:  0:00:06
Adding changed files:  63% |######################              | ETA:  0:00:06
Adding changed files:  64% |#######################             | ETA:  0:00:06
Adding changed files:  64% |#######################             | ETA:  0:00:06
Adding changed files:  65% |#######################             | ETA:  0:00:06
Adding changed files:  66% |#######################             | ETA:  0:00:06
Adding changed files:  67% |########################            | ETA:  0:00:06
Adding changed files:  67% |########################            | ETA:  0:00:05
Adding changed files:  68% |########################            | ETA:  0:00:05
Adding changed files:  69% |########################            | ETA:  0:00:05
Adding changed files:  69% |#########################           | ETA:  0:00:05
Adding changed files:  70% |#########################           | ETA:  0:00:05
Adding changed files:  71% |#########################           | ETA:  0:00:05
Adding changed files:  72% |#########################           | ETA:  0:00:05
Adding changed files:  72% |##########################          | ETA:  0:00:05
Adding changed files:  73% |##########################          | ETA:  0:00:04
Adding changed files:  74% |##########################          | ETA:  0:00:04
Adding changed files:  74% |##########################          | ETA:  0:00:04
Adding changed files:  75% |###########################         | ETA:  0:00:04
Adding changed files:  76% |###########################         | ETA:  0:00:04
Adding changed files:  76% |###########################         | ETA:  0:00:04
Adding changed files:  77% |###########################         | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:03
Adding changed files:  80% |############################        | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  82% |#############################       | ETA:  0:00:03
Adding changed files:  83% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:18
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.40.2.tar.xz...
INFO: Rebasing devtool onto c593332ed904a676dd0ebbc5baacc5601455239a
WARNING: Command 'git rebase c593332ed904a676dd0ebbc5baacc5601455239a' failed:
Auto-merging Source/WebCore/platform/graphics/SourceBrush.cpp
CONFLICT (content): Merge conflict in Source/WebCore/platform/graphics/SourceBrush.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/webkitgtk
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/webkitgtk/webkitgtk_2.40.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8600492269362634460==--

