Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132BBC32766
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4052.1659679409011275378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VdP9lGXb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101826c9a00f8-d9116062-7aa6-4bc1-ada7-2d43fe360aa4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lGKBh3aK/QolrCDDO16V9wEqmEtRr5dAlj5b60f2md0=;
	b=VdP9lGXbbqvBEWwHnG1yxJqKWsPrPY6DqZsegz5zi/UZNxVKfAKO2uNmgzG+KCdu
	imlEkgUoqTlMQdoMIsYa3LboofsTxaaRmGJlphEBLIKcfNC4pqEiZActIja3BgES1Jp
	2TC6Fq8Cz3X5I8NZSDVCJYXuQH/oSBkueKX9UwuU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lGKBh3aK/QolrCDDO16V9wEqmEtRr5dAlj5b60f2md0=;
	b=JAApntssmJ4BXu8rdrS5cmRTnd82aPb3CIJPO16+wqTl9xAbs1z2pSZEu/pem+uF
	ZqiTETlgAKatXNwENPySwNfaDkcpF2d+65Gz5Yc6ypVKMf9Q5cgEc4b6og9Pvj062VL
	7korZqNPeus/Cbqkowfl6MPyUcIK9O+HWBNQNaDE=
Content-Type: multipart/mixed; boundary="===============9215908757303515636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 5.1 FAILED
Message-ID: 
 <010101826c9a00f8-d9116062-7aa6-4bc1-ada7-2d43fe360aa4-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168909

--===============9215908757303515636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ffmpeg* to *5.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ffmpeg failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-04615edc6105688d1b11493f912b3dd618f3977e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:04615edc6105688d1b11493f912b3dd618f3977e"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (887 cached, 2 parsed). 1660 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-04615edc6105688d1b11493f912b3dd618f3977e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:04615edc6105688d1b11493f912b3dd618f3977e"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:03
Adding changed files:   7% |##                                  | ETA:  0:00:03
Adding changed files:  11% |###                                 | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  18% |######                              | ETA:  0:00:02
Adding changed files:  22% |#######                             | ETA:  0:00:02
Adding changed files:  25% |#########                           | ETA:  0:00:02
Adding changed files:  29% |##########                          | ETA:  0:00:02
Adding changed files:  33% |###########                         | ETA:  0:00:01
Adding changed files:  36% |#############                       | ETA:  0:00:01
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  44% |###############                     | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:01
Adding changed files:  51% |##################                  | ETA:  0:00:01
Adding changed files:  55% |###################                 | ETA:  0:00:01
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.ffmpeg.org/releases/ffmpeg-5.1.tar.xz...
INFO: Rebasing devtool onto 45206078f662b94ab8bd32577d4db46535ceeccc
WARNING: Command 'git rebase 45206078f662b94ab8bd32577d4db46535ceeccc' failed:
Auto-merging libavutil/x86/tx_float.asm
CONFLICT (content): Merge conflict in libavutil/x86/tx_float.asm
Auto-merging libavutil/x86/pixelutils.asm
Auto-merging libavutil/x86/float_dsp.asm

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/ffmpeg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/ffmpeg/ffmpeg_5.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9215908757303515636==--

