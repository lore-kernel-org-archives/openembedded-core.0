Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF20FC25B7C
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.810.1686887483449222380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WuzBpgM6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544e7e-707dfb19-49e5-405d-a64d-5fd3a642ed20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F6v9j//as8RaJDYrxJtDZ7tLMOS5X1EpQRFFVI8p5vQ=;
	b=WuzBpgM6TzWfIKc4Yt180v5sAcRf+UW13BRj1hJwEQaVqenDhPul/+ss7wrSYvk1
	yteZJjsI3iHdPBXwg/DNx3KgmgiAr1Oimo9Wt+RyKkc0i9BIiRYlibH8C643LACTVzH
	QgJfGe4SyJo2DjuyMUuhDw1M5cMMcZB4jCRgAwvk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F6v9j//as8RaJDYrxJtDZ7tLMOS5X1EpQRFFVI8p5vQ=;
	b=q5cONNmsnilAzN1xxrCvDqejynuepsvos4sT5e5UXCOdsH7Ko9oftef9ysKhsurV
	erZCHK5jbuXmGU888+YYJuk50H/VKZi74EHhqaETgDtRUD0ZUzOHg/9ot1qXwfQCNus
	pJvSnXnNefdDDEN5qeDNpiaeMUPC7yCQILHHn2T8=
Content-Type: multipart/mixed; boundary="===============8717301881644292902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.40.2 FAILED
Message-ID: <01010188c2544e7e-707dfb19-49e5-405d-a64d-5fd3a642ed20-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182978

--===============8717301881644292902==
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
NOTE: Previous bitbake instance shutting down?, waiting to retry... (22:50:58.706478)
NOTE: Directory listing: ['conf', 'upgrade-helper', 'bitbake-cookerdaemon.log', 'buildhistory', 'workspace', 'cache', 'tmp', 'downloads', 'sstate-cache']
NOTE: Retrying server connection (#1)... (22:50:58.821253)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.

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
meta-yocto-bsp       = "tmp-auh-upgrades:941449f3a0ed0e3180add76fbeab29e27cb9d472"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1803 targets, 36 skipped, 0 masked, 0 errors.

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
meta-yocto-bsp       = "tmp-auh-upgrades:941449f3a0ed0e3180add76fbeab29e27cb9d472"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:40
Adding changed files:   1% |                                    | ETA:  0:00:36
Adding changed files:   2% |                                    | ETA:  0:00:33
Adding changed files:   2% |#                                   | ETA:  0:00:29
Adding changed files:   3% |#                                   | ETA:  0:00:27
Adding changed files:   4% |#                                   | ETA:  0:00:26
Adding changed files:   4% |#                                   | ETA:  0:00:28
Adding changed files:   5% |##                                  | ETA:  0:00:26
Adding changed files:   6% |##                                  | ETA:  0:00:29
Adding changed files:   7% |##                                  | ETA:  0:00:27
Adding changed files:   7% |##                                  | ETA:  0:00:26
Adding changed files:   8% |###                                 | ETA:  0:00:26
Adding changed files:   9% |###                                 | ETA:  0:00:25
Adding changed files:   9% |###                                 | ETA:  0:00:25
Adding changed files:  10% |###                                 | ETA:  0:00:24
Adding changed files:  11% |####                                | ETA:  0:00:23
Adding changed files:  12% |####                                | ETA:  0:00:23
Adding changed files:  12% |####                                | ETA:  0:00:22
Adding changed files:  13% |####                                | ETA:  0:00:22
Adding changed files:  14% |#####                               | ETA:  0:00:22
Adding changed files:  14% |#####                               | ETA:  0:00:22
Adding changed files:  15% |#####                               | ETA:  0:00:22
Adding changed files:  16% |#####                               | ETA:  0:00:22
Adding changed files:  16% |######                              | ETA:  0:00:21
Adding changed files:  17% |######                              | ETA:  0:00:21
Adding changed files:  18% |######                              | ETA:  0:00:21
Adding changed files:  19% |######                              | ETA:  0:00:21
Adding changed files:  19% |#######                             | ETA:  0:00:20
Adding changed files:  20% |#######                             | ETA:  0:00:20
Adding changed files:  21% |#######                             | ETA:  0:00:20
Adding changed files:  21% |#######                             | ETA:  0:00:20
Adding changed files:  22% |########                            | ETA:  0:00:20
Adding changed files:  23% |########                            | ETA:  0:00:19
Adding changed files:  24% |########                            | ETA:  0:00:19
Adding changed files:  24% |########                            | ETA:  0:00:19
Adding changed files:  25% |#########                           | ETA:  0:00:18
Adding changed files:  26% |#########                           | ETA:  0:00:18
Adding changed files:  26% |#########                           | ETA:  0:00:18
Adding changed files:  27% |#########                           | ETA:  0:00:18
Adding changed files:  28% |##########                          | ETA:  0:00:17
Adding changed files:  28% |##########                          | ETA:  0:00:17
Adding changed files:  29% |##########                          | ETA:  0:00:17
Adding changed files:  30% |##########                          | ETA:  0:00:17
Adding changed files:  31% |###########                         | ETA:  0:00:16
Adding changed files:  31% |###########                         | ETA:  0:00:16
Adding changed files:  32% |###########                         | ETA:  0:00:16
Adding changed files:  33% |###########                         | ETA:  0:00:16
Adding changed files:  33% |############                        | ETA:  0:00:16
Adding changed files:  34% |############                        | ETA:  0:00:16
Adding changed files:  35% |############                        | ETA:  0:00:15
Adding changed files:  36% |############                        | ETA:  0:00:15
Adding changed files:  36% |#############                       | ETA:  0:00:15
Adding changed files:  37% |#############                       | ETA:  0:00:15
Adding changed files:  38% |#############                       | ETA:  0:00:15
Adding changed files:  38% |#############                       | ETA:  0:00:14
Adding changed files:  39% |##############                      | ETA:  0:00:14
Adding changed files:  40% |##############                      | ETA:  0:00:14
Adding changed files:  40% |##############                      | ETA:  0:00:14
Adding changed files:  41% |###############                     | ETA:  0:00:14
Adding changed files:  42% |###############                     | ETA:  0:00:14
Adding changed files:  43% |###############                     | ETA:  0:00:14
Adding changed files:  43% |###############                     | ETA:  0:00:14
Adding changed files:  44% |################                    | ETA:  0:00:13
Adding changed files:  45% |################                    | ETA:  0:00:13
Adding changed files:  45% |################                    | ETA:  0:00:13
Adding changed files:  46% |################                    | ETA:  0:00:13
Adding changed files:  47% |#################                   | ETA:  0:00:13
Adding changed files:  48% |#################                   | ETA:  0:00:13
Adding changed files:  48% |#################                   | ETA:  0:00:13
Adding changed files:  49% |#################                   | ETA:  0:00:13
Adding changed files:  50% |##################                  | ETA:  0:00:13
Adding changed files:  50% |##################                  | ETA:  0:00:12
Adding changed files:  51% |##################                  | ETA:  0:00:12
Adding changed files:  52% |##################                  | ETA:  0:00:12
Adding changed files:  52% |###################                 | ETA:  0:00:12
Adding changed files:  53% |###################                 | ETA:  0:00:12
Adding changed files:  54% |###################                 | ETA:  0:00:12
Adding changed files:  55% |###################                 | ETA:  0:00:11
Adding changed files:  55% |####################                | ETA:  0:00:11
Adding changed files:  56% |####################                | ETA:  0:00:11
Adding changed files:  57% |####################                | ETA:  0:00:11
Adding changed files:  57% |####################                | ETA:  0:00:11
Adding changed files:  58% |#####################               | ETA:  0:00:11
Adding changed files:  59% |#####################               | ETA:  0:00:10
Adding changed files:  60% |#####################               | ETA:  0:00:10
Adding changed files:  60% |#####################               | ETA:  0:00:10
Adding changed files:  61% |######################              | ETA:  0:00:10
Adding changed files:  62% |######################              | ETA:  0:00:10
Adding changed files:  62% |######################              | ETA:  0:00:09
Adding changed files:  63% |######################              | ETA:  0:00:09
Adding changed files:  64% |#######################             | ETA:  0:00:09
Adding changed files:  64% |#######################             | ETA:  0:00:09
Adding changed files:  65% |#######################             | ETA:  0:00:09
Adding changed files:  66% |#######################             | ETA:  0:00:08
Adding changed files:  67% |########################            | ETA:  0:00:08
Adding changed files:  67% |########################            | ETA:  0:00:08
Adding changed files:  68% |########################            | ETA:  0:00:08
Adding changed files:  69% |########################            | ETA:  0:00:08
Adding changed files:  69% |#########################           | ETA:  0:00:07
Adding changed files:  70% |#########################           | ETA:  0:00:07
Adding changed files:  71% |#########################           | ETA:  0:00:07
Adding changed files:  72% |#########################           | ETA:  0:00:07
Adding changed files:  72% |##########################          | ETA:  0:00:07
Adding changed files:  73% |##########################          | ETA:  0:00:06
Adding changed files:  74% |##########################          | ETA:  0:00:06
Adding changed files:  74% |##########################          | ETA:  0:00:06
Adding changed files:  75% |###########################         | ETA:  0:00:06
Adding changed files:  76% |###########################         | ETA:  0:00:06
Adding changed files:  76% |###########################         | ETA:  0:00:06
Adding changed files:  77% |###########################         | ETA:  0:00:05
Adding changed files:  78% |############################        | ETA:  0:00:05
Adding changed files:  79% |############################        | ETA:  0:00:05
Adding changed files:  79% |############################        | ETA:  0:00:05
Adding changed files:  80% |############################        | ETA:  0:00:05
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  82% |#############################       | ETA:  0:00:04
Adding changed files:  83% |##############################      | ETA:  0:00:04
Adding changed files:  84% |##############################      | ETA:  0:00:04
Adding changed files:  84% |##############################      | ETA:  0:00:04
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  87% |###############################     | ETA:  0:00:03
Adding changed files:  88% |###############################     | ETA:  0:00:03
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  91% |################################    | ETA:  0:00:02
Adding changed files:  91% |#################################   | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:26
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.40.2.tar.xz...
INFO: Rebasing devtool onto 223fe3cfe223e531c0ee05f6fc0a71644b1c42a7
WARNING: Command 'git rebase 223fe3cfe223e531c0ee05f6fc0a71644b1c42a7' failed:
Auto-merging Source/WebCore/platform/graphics/SourceBrush.cpp
CONFLICT (content): Merge conflict in Source/WebCore/platform/graphics/SourceBrush.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/webkitgtk
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/webkitgtk/webkitgtk_2.40.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8717301881644292902==--

