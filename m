Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1482AC25B5E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.17590.1690907328990527750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MwPn0vnk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PmcBJE10;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010189b1ee3edd-79ca2492-30e6-4e74-a1fa-1b23d5240d82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jTQpP3ZIe6L8T1POuddw1LJi9cEPKKlO8ZLomcT58BA=;
	b=MwPn0vnk01Xv9KxuUM9Tct7aQFlgm9wKpnVrc5T10RWBrj+CY7XTWFSA8EcomSXD
	xZWqRM66X15OO7mXJnPA8bPuFAbWT9EC5ZR38pfFR3JPGKo/O0ZOb21uEr5Hv5PJMuq
	HcchSl7H7ad7tTViVp+01ToYAGNwx9wtGcgnkR7A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jTQpP3ZIe6L8T1POuddw1LJi9cEPKKlO8ZLomcT58BA=;
	b=PmcBJE10LFIEnaec/VEz+HwJsuAyBv7m9uHPkQ49tt6b4FyHH/KKnNIMAvhs8yrG
	6iuzaLWxfUEAXu9xMpl+j9hZ6D5JPz9jjhHUOHSyk6veJEzzkx9Je+S8OnHwEVkQDRs
	SHF6l6Zh99PxJ1vINVBJsFCeo6/YrHAvg9xd+Cf8=
Content-Type: multipart/mixed; boundary="===============5560058069541050749=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext: upgrading to 0.22 FAILED
Message-ID: <01010189b1ee3edd-79ca2492-30e6-4e74-a1fa-1b23d5240d82-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185262

--===============5560058069541050749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gettext* to *0.22* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gettext -V 0.22
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:17:52.320223)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:37dfea4a99015745a13107286874111b2a6f0789"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 30 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.

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
meta-yocto-bsp       = "tmp-auh-upgrades:37dfea4a99015745a13107286874111b2a6f0789"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:22
Adding changed files:   1% |                                    | ETA:  0:00:15
Adding changed files:   2% |                                    | ETA:  0:00:13
Adding changed files:   2% |#                                   | ETA:  0:00:12
Adding changed files:   3% |#                                   | ETA:  0:00:11
Adding changed files:   4% |#                                   | ETA:  0:00:10
Adding changed files:   5% |#                                   | ETA:  0:00:10
Adding changed files:   5% |##                                  | ETA:  0:00:10
Adding changed files:   6% |##                                  | ETA:  0:00:09
Adding changed files:   7% |##                                  | ETA:  0:00:10
Adding changed files:   8% |##                                  | ETA:  0:00:10
Adding changed files:   8% |###                                 | ETA:  0:00:09
Adding changed files:   9% |###                                 | ETA:  0:00:09
Adding changed files:  10% |###                                 | ETA:  0:00:09
Adding changed files:  11% |####                                | ETA:  0:00:09
Adding changed files:  11% |####                                | ETA:  0:00:08
Adding changed files:  12% |####                                | ETA:  0:00:08
Adding changed files:  13% |####                                | ETA:  0:00:08
Adding changed files:  14% |#####                               | ETA:  0:00:08
Adding changed files:  14% |#####                               | ETA:  0:00:08
Adding changed files:  15% |#####                               | ETA:  0:00:07
Adding changed files:  16% |#####                               | ETA:  0:00:07
Adding changed files:  17% |######                              | ETA:  0:00:07
Adding changed files:  17% |######                              | ETA:  0:00:07
Adding changed files:  18% |######                              | ETA:  0:00:07
Adding changed files:  19% |#######                             | ETA:  0:00:07
Adding changed files:  20% |#######                             | ETA:  0:00:07
Adding changed files:  20% |#######                             | ETA:  0:00:07
Adding changed files:  21% |#######                             | ETA:  0:00:07
Adding changed files:  22% |########                            | ETA:  0:00:07
Adding changed files:  23% |########                            | ETA:  0:00:06
Adding changed files:  23% |########                            | ETA:  0:00:06
Adding changed files:  24% |########                            | ETA:  0:00:06
Adding changed files:  25% |#########                           | ETA:  0:00:06
Adding changed files:  26% |#########                           | ETA:  0:00:06
Adding changed files:  26% |#########                           | ETA:  0:00:06
Adding changed files:  27% |#########                           | ETA:  0:00:06
Adding changed files:  28% |##########                          | ETA:  0:00:06
Adding changed files:  29% |##########                          | ETA:  0:00:06
Adding changed files:  29% |##########                          | ETA:  0:00:06
Adding changed files:  30% |###########                         | ETA:  0:00:06
Adding changed files:  31% |###########                         | ETA:  0:00:06
Adding changed files:  32% |###########                         | ETA:  0:00:06
Adding changed files:  32% |###########                         | ETA:  0:00:06
Adding changed files:  33% |############                        | ETA:  0:00:06
Adding changed files:  34% |############                        | ETA:  0:00:05
Adding changed files:  35% |############                        | ETA:  0:00:05
Adding changed files:  35% |############                        | ETA:  0:00:06
Adding changed files:  36% |#############                       | ETA:  0:00:06
Adding changed files:  37% |#############                       | ETA:  0:00:06
Adding changed files:  38% |#############                       | ETA:  0:00:06
Adding changed files:  38% |##############                      | ETA:  0:00:06
Adding changed files:  39% |##############                      | ETA:  0:00:06
Adding changed files:  40% |##############                      | ETA:  0:00:06
Adding changed files:  41% |##############                      | ETA:  0:00:06
Adding changed files:  41% |###############                     | ETA:  0:00:06
Adding changed files:  42% |###############                     | ETA:  0:00:06
Adding changed files:  43% |###############                     | ETA:  0:00:06
Adding changed files:  44% |###############                     | ETA:  0:00:05
Adding changed files:  44% |################                    | ETA:  0:00:05
Adding changed files:  45% |################                    | ETA:  0:00:05
Adding changed files:  46% |################                    | ETA:  0:00:05
Adding changed files:  47% |#################                   | ETA:  0:00:05
Adding changed files:  47% |#################                   | ETA:  0:00:05
Adding changed files:  48% |#################                   | ETA:  0:00:05
Adding changed files:  49% |#################                   | ETA:  0:00:05
Adding changed files:  50% |##################                  | ETA:  0:00:05
Adding changed files:  50% |##################                  | ETA:  0:00:05
Adding changed files:  51% |##################                  | ETA:  0:00:05
Adding changed files:  52% |##################                  | ETA:  0:00:04
Adding changed files:  53% |###################                 | ETA:  0:00:04
Adding changed files:  53% |###################                 | ETA:  0:00:04
Adding changed files:  54% |###################                 | ETA:  0:00:04
Adding changed files:  55% |###################                 | ETA:  0:00:04
Adding changed files:  56% |####################                | ETA:  0:00:04
Adding changed files:  56% |####################                | ETA:  0:00:04
Adding changed files:  57% |####################                | ETA:  0:00:04
Adding changed files:  58% |#####################               | ETA:  0:00:04
Adding changed files:  59% |#####################               | ETA:  0:00:04
Adding changed files:  59% |#####################               | ETA:  0:00:04
Adding changed files:  60% |#####################               | ETA:  0:00:03
Adding changed files:  61% |######################              | ETA:  0:00:03
Adding changed files:  62% |######################              | ETA:  0:00:03
Adding changed files:  62% |######################              | ETA:  0:00:03
Adding changed files:  63% |######################              | ETA:  0:00:03
Adding changed files:  64% |#######################             | ETA:  0:00:03
Adding changed files:  65% |#######################             | ETA:  0:00:03
Adding changed files:  65% |#######################             | ETA:  0:00:03
Adding changed files:  66% |########################            | ETA:  0:00:03
Adding changed files:  67% |########################            | ETA:  0:00:03
Adding changed files:  68% |########################            | ETA:  0:00:03
Adding changed files:  68% |########################            | ETA:  0:00:03
Adding changed files:  69% |#########################           | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  72% |##########################          | ETA:  0:00:02
Adding changed files:  73% |##########################          | ETA:  0:00:02
Adding changed files:  74% |##########################          | ETA:  0:00:02
Adding changed files:  74% |##########################          | ETA:  0:00:02
Adding changed files:  75% |###########################         | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:02
Adding changed files:  77% |###########################         | ETA:  0:00:02
Adding changed files:  77% |############################        | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  80% |############################        | ETA:  0:00:01
Adding changed files:  80% |#############################       | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  83% |#############################       | ETA:  0:00:01
Adding changed files:  83% |##############################      | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:09

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz...
INFO: Rebasing devtool onto 4fcc7573073a3dffdbf255fd39a1233f6959cff1
WARNING: Command 'git rebase 4fcc7573073a3dffdbf255fd39a1233f6959cff1' failed:
CONFLICT (modify/delete): gettext-runtime/gnulib-m4/largefile.m4 deleted in HEAD and modified in 59c5f76 (autoconf: Upgrade to 2.72c).  Version 59c5f76 (autoconf: Upgrade to 2.72c) of gettext-runtime/gnulib-m4/largefile.m4 left in tree.
CONFLICT (modify/delete): gettext-tools/gnulib-m4/largefile.m4 deleted in HEAD and modified in 59c5f76 (autoconf: Upgrade to 2.72c).  Version 59c5f76 (autoconf: Upgrade to 2.72c) of gettext-tools/gnulib-m4/largefile.m4 left in tree.
CONFLICT (modify/delete): libtextstyle/gnulib-m4/largefile.m4 deleted in HEAD and modified in 59c5f76 (autoconf: Upgrade to 2.72c).  Version 59c5f76 (autoconf: Upgrade to 2.72c) of libtextstyle/gnulib-m4/largefile.m4 left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
gettext-runtime/gnulib-m4/largefile.m4: needs merge
gettext-tools/gnulib-m4/largefile.m4: needs merge
libtextstyle/gnulib-m4/largefile.m4: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5560058069541050749==--

