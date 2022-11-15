Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA621C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5323.1668517536764453370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YorvXfKB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101847b65242b-7ada2629-2407-4e9f-973b-fbf4ff65a256-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KNWsYdHT8qk/mVcz97C+/60NrphwHV7dXjP3qzqCi84=;
	b=YorvXfKBqjRO1qMiaX3kB37L31Gb2Ir2ECNJ9g/QKKnivjajQvFeGx49vWt16DsQ
	nuGHOpzbn/WOpfG45r/a4V/ZO5CiVfmCB/OKF/APqJ8OYrgWBX+fv1iJoqzFJWol/aG
	zfBVlM9SVmTG4o30xVV59biLIgnYVX9txXiHBzuI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KNWsYdHT8qk/mVcz97C+/60NrphwHV7dXjP3qzqCi84=;
	b=j49+7h5v9TSufjtRN8YmRsy+fDDMrzPdvceQsD7JiasLzWd8pfzj3k+gn4Es24PB
	nVsSRuq6Bknrh3JRHPuhQCCzwOmz5wqRSdw/cZnbNgy2C5wKRMW3TQfuYMvMFAugohq
	AWASRhUfSkXu/uSUhXefihkc+T8N13GUOmnxpQBI=
Content-Type: multipart/mixed; boundary="===============2125923717677159892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.38.2 FAILED
Message-ID: <010101847b65242b-7ada2629-2407-4e9f-973b-fbf4ff65a256-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173332

--===============2125923717677159892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.38.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade webkitgtk -V 2.38.2
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bea53ab800f953d65f03cdf5c14d82b9123e434f"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (886 cached, 2 parsed). 1666 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bea53ab800f953d65f03cdf5c14d82b9123e434f"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:29
Adding changed files:   1% |                                    | ETA:  0:00:20
Adding changed files:   2% |                                    | ETA:  0:00:17
Adding changed files:   3% |#                                   | ETA:  0:00:16
Adding changed files:   3% |#                                   | ETA:  0:00:15
Adding changed files:   4% |#                                   | ETA:  0:00:14
Adding changed files:   5% |#                                   | ETA:  0:00:13
Adding changed files:   6% |##                                  | ETA:  0:00:13
Adding changed files:   6% |##                                  | ETA:  0:00:13
Adding changed files:   7% |##                                  | ETA:  0:00:12
Adding changed files:   8% |###                                 | ETA:  0:00:12
Adding changed files:   9% |###                                 | ETA:  0:00:12
Adding changed files:   9% |###                                 | ETA:  0:00:12
Adding changed files:  10% |###                                 | ETA:  0:00:12
Adding changed files:  11% |####                                | ETA:  0:00:11
Adding changed files:  12% |####                                | ETA:  0:00:11
Adding changed files:  13% |####                                | ETA:  0:00:11
Adding changed files:  13% |####                                | ETA:  0:00:11
Adding changed files:  14% |#####                               | ETA:  0:00:11
Adding changed files:  15% |#####                               | ETA:  0:00:11
Adding changed files:  16% |#####                               | ETA:  0:00:11
Adding changed files:  16% |######                              | ETA:  0:00:10
Adding changed files:  17% |######                              | ETA:  0:00:10
Adding changed files:  18% |######                              | ETA:  0:00:10
Adding changed files:  19% |######                              | ETA:  0:00:10
Adding changed files:  19% |#######                             | ETA:  0:00:10
Adding changed files:  20% |#######                             | ETA:  0:00:10
Adding changed files:  21% |#######                             | ETA:  0:00:10
Adding changed files:  22% |#######                             | ETA:  0:00:10
Adding changed files:  22% |########                            | ETA:  0:00:10
Adding changed files:  23% |########                            | ETA:  0:00:09
Adding changed files:  24% |########                            | ETA:  0:00:09
Adding changed files:  25% |#########                           | ETA:  0:00:09
Adding changed files:  26% |#########                           | ETA:  0:00:09
Adding changed files:  26% |#########                           | ETA:  0:00:09
Adding changed files:  27% |#########                           | ETA:  0:00:09
Adding changed files:  28% |##########                          | ETA:  0:00:09
Adding changed files:  29% |##########                          | ETA:  0:00:09
Adding changed files:  29% |##########                          | ETA:  0:00:09
Adding changed files:  30% |###########                         | ETA:  0:00:09
Adding changed files:  31% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:08
Adding changed files:  33% |############                        | ETA:  0:00:08
Adding changed files:  34% |############                        | ETA:  0:00:08
Adding changed files:  35% |############                        | ETA:  0:00:08
Adding changed files:  35% |############                        | ETA:  0:00:08
Adding changed files:  36% |#############                       | ETA:  0:00:08
Adding changed files:  37% |#############                       | ETA:  0:00:08
Adding changed files:  38% |#############                       | ETA:  0:00:08
Adding changed files:  39% |##############                      | ETA:  0:00:08
Adding changed files:  39% |##############                      | ETA:  0:00:08
Adding changed files:  40% |##############                      | ETA:  0:00:08
Adding changed files:  41% |##############                      | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:07
Adding changed files:  43% |###############                     | ETA:  0:00:07
Adding changed files:  44% |###############                     | ETA:  0:00:07
Adding changed files:  45% |################                    | ETA:  0:00:07
Adding changed files:  45% |################                    | ETA:  0:00:07
Adding changed files:  46% |################                    | ETA:  0:00:07
Adding changed files:  47% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  49% |#################                   | ETA:  0:00:07
Adding changed files:  49% |#################                   | ETA:  0:00:07
Adding changed files:  50% |##################                  | ETA:  0:00:07
Adding changed files:  51% |##################                  | ETA:  0:00:07
Adding changed files:  52% |##################                  | ETA:  0:00:06
Adding changed files:  52% |###################                 | ETA:  0:00:06
Adding changed files:  53% |###################                 | ETA:  0:00:06
Adding changed files:  54% |###################                 | ETA:  0:00:06
Adding changed files:  55% |###################                 | ETA:  0:00:06
Adding changed files:  55% |####################                | ETA:  0:00:06
Adding changed files:  56% |####################                | ETA:  0:00:06
Adding changed files:  57% |####################                | ETA:  0:00:06
Adding changed files:  58% |####################                | ETA:  0:00:06
Adding changed files:  58% |#####################               | ETA:  0:00:06
Adding changed files:  59% |#####################               | ETA:  0:00:06
Adding changed files:  60% |#####################               | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:05
Adding changed files:  64% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:05
Adding changed files:  66% |#######################             | ETA:  0:00:05
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  69% |#########################           | ETA:  0:00:04
Adding changed files:  70% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  72% |##########################          | ETA:  0:00:04
Adding changed files:  73% |##########################          | ETA:  0:00:04
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  77% |###########################         | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:03
Adding changed files:  80% |############################        | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:15

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.38.2.tar.xz...
INFO: Rebasing devtool onto fc045ed05c0f58aebe55179808336e4990faef9b
WARNING: Command 'git rebase fc045ed05c0f58aebe55179808336e4990faef9b' failed:
CONFLICT (modify/delete): Source/cmake/FindGObjectIntrospection.cmake deleted in HEAD and modified in e5862811 (FindGObjectIntrospection.cmake: prefix variables obtained from pkg-config with PKG_CONFIG_SYSROOT_DIR). Version e5862811 (FindGObjectIntrospection.cmake: prefix variables obtained from pkg-config with PKG_CONFIG_SYSROOT_DIR) of Source/cmake/FindGObjectIntrospection.cmake left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
Source/cmake/FindGObjectIntrospection.cmake: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2125923717677159892==--

