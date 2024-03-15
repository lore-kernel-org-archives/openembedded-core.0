Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE05C54ED8
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1250.1710522012666851723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e7Nb6Yo8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FnQrrvLF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e430e90a3-f496890e-787e-4f63-abdb-3e333da4ae8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ESxkAmn97x5OtMlGgQoTwXkIWMKseyH7gtahA7f2qC0=;
	b=e7Nb6Yo8SDCihxT4982bcVa9uUA0tI+tcUVODhEGMnelMm3sZEQaHjm8Qt0keMd7
	POuolSSOcc6iNDtM588EVaKt8mzM8cage1seAit32gV1uPw079dqy07gBKmmj2SdUjX
	mwybiZDyBq6YxxHkWW/nIlH3XcnKLIwPiAT1WW74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ESxkAmn97x5OtMlGgQoTwXkIWMKseyH7gtahA7f2qC0=;
	b=FnQrrvLF1N8MiyMucuZ1v/gNkLF8BPlrHqsQiekl0mEOZOjo607W3r5T+zgIzF6/
	x/EcL2GfqOAS8/XZc/MKWLpyAkTQr3MFTp06uMvXiegtvXI3mAjVtuTM467gmycFDz5
	QZ5piSzQhbekMbYiPf1smMT/Td6bqwz4XhpaoceU=
Content-Type: multipart/mixed; boundary="===============6696756646399127788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.3.0 FAILED
Message-ID: <0101018e430e90a3-f496890e-787e-4f63-abdb-3e333da4ae8f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197190

--===============6696756646399127788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ruby* to *3.3.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ruby failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-296947b23ab615ab760247f08842bcd51c9c9ab5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:296947b23ab615ab760247f08842bcd51c9c9ab5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (921 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-296947b23ab615ab760247f08842bcd51c9c9ab5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:296947b23ab615ab760247f08842bcd51c9c9ab5"

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
Adding changed files:   1% |                                    | ETA:  0:00:11
Adding changed files:   2% |                                    | ETA:  0:00:08
Adding changed files:   4% |#                                   | ETA:  0:00:07
Adding changed files:   5% |#                                   | ETA:  0:00:06
Adding changed files:   6% |##                                  | ETA:  0:00:06
Adding changed files:   8% |##                                  | ETA:  0:00:06
Adding changed files:   9% |###                                 | ETA:  0:00:05
Adding changed files:  10% |###                                 | ETA:  0:00:05
Adding changed files:  12% |####                                | ETA:  0:00:05
Adding changed files:  13% |####                                | ETA:  0:00:05
Adding changed files:  15% |#####                               | ETA:  0:00:05
Adding changed files:  16% |#####                               | ETA:  0:00:05
Adding changed files:  17% |######                              | ETA:  0:00:05
Adding changed files:  19% |######                              | ETA:  0:00:05
Adding changed files:  20% |#######                             | ETA:  0:00:04
Adding changed files:  21% |#######                             | ETA:  0:00:04
Adding changed files:  23% |########                            | ETA:  0:00:04
Adding changed files:  24% |########                            | ETA:  0:00:04
Adding changed files:  25% |#########                           | ETA:  0:00:04
Adding changed files:  27% |#########                           | ETA:  0:00:04
Adding changed files:  28% |##########                          | ETA:  0:00:04
Adding changed files:  30% |##########                          | ETA:  0:00:04
Adding changed files:  31% |###########                         | ETA:  0:00:03
Adding changed files:  32% |###########                         | ETA:  0:00:03
Adding changed files:  34% |############                        | ETA:  0:00:03
Adding changed files:  35% |############                        | ETA:  0:00:03
Adding changed files:  36% |#############                       | ETA:  0:00:03
Adding changed files:  38% |#############                       | ETA:  0:00:03
Adding changed files:  39% |##############                      | ETA:  0:00:03
Adding changed files:  40% |##############                      | ETA:  0:00:03
Adding changed files:  42% |###############                     | ETA:  0:00:03
Adding changed files:  43% |###############                     | ETA:  0:00:03
Adding changed files:  45% |################                    | ETA:  0:00:03
Adding changed files:  46% |################                    | ETA:  0:00:02
Adding changed files:  47% |#################                   | ETA:  0:00:02
Adding changed files:  49% |#################                   | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  51% |##################                  | ETA:  0:00:02
Adding changed files:  53% |###################                 | ETA:  0:00:02
Adding changed files:  54% |###################                 | ETA:  0:00:02
Adding changed files:  55% |####################                | ETA:  0:00:02
Adding changed files:  57% |####################                | ETA:  0:00:02
Adding changed files:  58% |#####################               | ETA:  0:00:02
Adding changed files:  60% |#####################               | ETA:  0:00:02
Adding changed files:  61% |######################              | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  64% |#######################             | ETA:  0:00:02
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  66% |########################            | ETA:  0:00:01
Adding changed files:  68% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:01
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  72% |##########################          | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  80% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  83% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:05
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.0.tar.gz...
INFO: Rebasing devtool onto a4bc96126f2cf35a539ae3a26c9da54a7aae2b91
WARNING: Command 'git rebase a4bc96126f2cf35a539ae3a26c9da54a7aae2b91' failed:
Auto-merging common.mk
CONFLICT (content): Merge conflict in common.mk

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/ruby
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/ruby/ruby_3.3.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6696756646399127788==--

