Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B525C05031
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8662.1698848704901501752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d745gpym;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dpDU6zJY;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460e53-595d397c-c313-49cf-bae2-9f7a9f6ee978-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9dLYqZPvU/B85Af0By9bYp3NaNqxaRDuyOtt6yLyvbs=;
	b=d745gpymG9zwzDSLtmHt/T/H+ZaznDUtE8qefDOBlGLTRvwPwK8qsP49PBZmeB1F
	bxNat99AmF0TvwvKX3nqCPdA50Qu17DVvsrjCUADJeb2pEC0C4YqHf3VqIYKTYBZ0LM
	oz84R5Lh6M0ZmKeXdn9Ds0qCF/SjMj59ePuVH4uk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9dLYqZPvU/B85Af0By9bYp3NaNqxaRDuyOtt6yLyvbs=;
	b=dpDU6zJY4HJdWA16Mar5ELuWSdtmIt7EQCCPOiRm/Qf5HEzy64ncjBXCWyVgY/E6
	cby0McylfcE8Bxu8Nbdy22y9fWNUXBn81HZ05IjOyYGnFDlDoW1VbjmuN+nrmeOV2JN
	tRziu/MQz15SjXCT3qE/xzb/lcDCxiaVyqci8Ur4=
Content-Type: multipart/mixed; boundary="===============2520384383178015807=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.42.1 FAILED
Message-ID: <0101018b8b460e53-595d397c-c313-49cf-bae2-9f7a9f6ee978-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190023

--===============2520384383178015807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.42.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe webkitgtk failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (13:57:12.848837)
NOTE: Directory listing: ['conf', 'cache', 'downloads', 'upgrade-helper', 'buildhistory', 'tmp', 'sstate-cache', 'workspace', 'bitbake-cookerdaemon.log']
NOTE: Retrying server connection (#1)... (13:57:13.090204)
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d93cc66c569d116ee8ac5cde7d214756159dff8d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d93cc66c569d116ee8ac5cde7d214756159dff8d"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 31 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1842 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d93cc66c569d116ee8ac5cde7d214756159dff8d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d93cc66c569d116ee8ac5cde7d214756159dff8d"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 2 Mirrors 0 Missed 1 Current 25 (66% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:37
Adding changed files:   1% |                                    | ETA:  0:00:26
Adding changed files:   2% |                                    | ETA:  0:00:25
Adding changed files:   2% |#                                   | ETA:  0:00:23
Adding changed files:   3% |#                                   | ETA:  0:00:21
Adding changed files:   4% |#                                   | ETA:  0:00:20
Adding changed files:   5% |#                                   | ETA:  0:00:19
Adding changed files:   5% |##                                  | ETA:  0:00:19
Adding changed files:   6% |##                                  | ETA:  0:00:18
Adding changed files:   7% |##                                  | ETA:  0:00:18
Adding changed files:   7% |##                                  | ETA:  0:00:17
Adding changed files:   8% |###                                 | ETA:  0:00:17
Adding changed files:   9% |###                                 | ETA:  0:00:17
Adding changed files:  10% |###                                 | ETA:  0:00:17
Adding changed files:  10% |###                                 | ETA:  0:00:16
Adding changed files:  11% |####                                | ETA:  0:00:16
Adding changed files:  12% |####                                | ETA:  0:00:16
Adding changed files:  13% |####                                | ETA:  0:00:16
Adding changed files:  13% |####                                | ETA:  0:00:16
Adding changed files:  14% |#####                               | ETA:  0:00:16
Adding changed files:  15% |#####                               | ETA:  0:00:16
Adding changed files:  15% |#####                               | ETA:  0:00:16
Adding changed files:  16% |#####                               | ETA:  0:00:15
Adding changed files:  17% |######                              | ETA:  0:00:15
Adding changed files:  18% |######                              | ETA:  0:00:15
Adding changed files:  18% |######                              | ETA:  0:00:15
Adding changed files:  19% |#######                             | ETA:  0:00:15
Adding changed files:  20% |#######                             | ETA:  0:00:15
Adding changed files:  20% |#######                             | ETA:  0:00:14
Adding changed files:  21% |#######                             | ETA:  0:00:14
Adding changed files:  22% |########                            | ETA:  0:00:14
Adding changed files:  23% |########                            | ETA:  0:00:14
Adding changed files:  23% |########                            | ETA:  0:00:14
Adding changed files:  24% |########                            | ETA:  0:00:13
Adding changed files:  25% |#########                           | ETA:  0:00:13
Adding changed files:  26% |#########                           | ETA:  0:00:13
Adding changed files:  26% |#########                           | ETA:  0:00:13
Adding changed files:  27% |#########                           | ETA:  0:00:13
Adding changed files:  28% |##########                          | ETA:  0:00:13
Adding changed files:  28% |##########                          | ETA:  0:00:12
Adding changed files:  29% |##########                          | ETA:  0:00:12
Adding changed files:  30% |##########                          | ETA:  0:00:12
Adding changed files:  31% |###########                         | ETA:  0:00:12
Adding changed files:  31% |###########                         | ETA:  0:00:12
Adding changed files:  32% |###########                         | ETA:  0:00:12
Adding changed files:  33% |###########                         | ETA:  0:00:11
Adding changed files:  34% |############                        | ETA:  0:00:11
Adding changed files:  34% |############                        | ETA:  0:00:11
Adding changed files:  35% |############                        | ETA:  0:00:11
Adding changed files:  36% |#############                       | ETA:  0:00:11
Adding changed files:  36% |#############                       | ETA:  0:00:11
Adding changed files:  37% |#############                       | ETA:  0:00:11
Adding changed files:  38% |#############                       | ETA:  0:00:11
Adding changed files:  39% |##############                      | ETA:  0:00:11
Adding changed files:  39% |##############                      | ETA:  0:00:11
Adding changed files:  40% |##############                      | ETA:  0:00:11
Adding changed files:  41% |##############                      | ETA:  0:00:10
Adding changed files:  41% |###############                     | ETA:  0:00:10
Adding changed files:  42% |###############                     | ETA:  0:00:10
Adding changed files:  43% |###############                     | ETA:  0:00:10
Adding changed files:  44% |###############                     | ETA:  0:00:10
Adding changed files:  44% |################                    | ETA:  0:00:10
Adding changed files:  45% |################                    | ETA:  0:00:10
Adding changed files:  46% |################                    | ETA:  0:00:10
Adding changed files:  47% |################                    | ETA:  0:00:10
Adding changed files:  47% |#################                   | ETA:  0:00:10
Adding changed files:  48% |#################                   | ETA:  0:00:09
Adding changed files:  49% |#################                   | ETA:  0:00:09
Adding changed files:  49% |#################                   | ETA:  0:00:09
Adding changed files:  50% |##################                  | ETA:  0:00:09
Adding changed files:  51% |##################                  | ETA:  0:00:09
Adding changed files:  52% |##################                  | ETA:  0:00:09
Adding changed files:  52% |###################                 | ETA:  0:00:09
Adding changed files:  53% |###################                 | ETA:  0:00:09
Adding changed files:  54% |###################                 | ETA:  0:00:09
Adding changed files:  54% |###################                 | ETA:  0:00:08
Adding changed files:  55% |####################                | ETA:  0:00:08
Adding changed files:  56% |####################                | ETA:  0:00:08
Adding changed files:  57% |####################                | ETA:  0:00:08
Adding changed files:  57% |####################                | ETA:  0:00:08
Adding changed files:  58% |#####################               | ETA:  0:00:08
Adding changed files:  59% |#####################               | ETA:  0:00:08
Adding changed files:  60% |#####################               | ETA:  0:00:07
Adding changed files:  60% |#####################               | ETA:  0:00:07
Adding changed files:  61% |######################              | ETA:  0:00:07
Adding changed files:  62% |######################              | ETA:  0:00:07
Adding changed files:  62% |######################              | ETA:  0:00:07
Adding changed files:  63% |######################              | ETA:  0:00:07
Adding changed files:  64% |#######################             | ETA:  0:00:07
Adding changed files:  65% |#######################             | ETA:  0:00:06
Adding changed files:  65% |#######################             | ETA:  0:00:06
Adding changed files:  66% |#######################             | ETA:  0:00:06
Adding changed files:  67% |########################            | ETA:  0:00:06
Adding changed files:  68% |########################            | ETA:  0:00:06
Adding changed files:  68% |########################            | ETA:  0:00:06
Adding changed files:  69% |#########################           | ETA:  0:00:06
Adding changed files:  70% |#########################           | ETA:  0:00:05
Adding changed files:  70% |#########################           | ETA:  0:00:05
Adding changed files:  71% |#########################           | ETA:  0:00:05
Adding changed files:  72% |##########################          | ETA:  0:00:05
Adding changed files:  73% |##########################          | ETA:  0:00:05
Adding changed files:  73% |##########################          | ETA:  0:00:05
Adding changed files:  74% |##########################          | ETA:  0:00:05
Adding changed files:  75% |###########################         | ETA:  0:00:04
Adding changed files:  75% |###########################         | ETA:  0:00:04
Adding changed files:  76% |###########################         | ETA:  0:00:04
Adding changed files:  77% |###########################         | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:04
Adding changed files:  79% |############################        | ETA:  0:00:04
Adding changed files:  80% |############################        | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  82% |#############################       | ETA:  0:00:03
Adding changed files:  83% |#############################       | ETA:  0:00:03
Adding changed files:  83% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:03
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:20
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.42.1.tar.xz...
INFO: Rebasing devtool onto 448189eea653ee634b7b68666b6b2b6859f5056f
WARNING: Command 'git rebase 448189eea653ee634b7b68666b6b2b6859f5056f' failed:
Auto-merging Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp
CONFLICT (content): Merge conflict in Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/webkitgtk
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/webkitgtk/webkitgtk_2.42.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2520384383178015807==--

