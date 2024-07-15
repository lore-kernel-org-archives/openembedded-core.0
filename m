Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0686DC54799
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1304.1721071146525341490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Dhdr32eC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GQx+BYBi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010190b7d5935f-c688d01d-4132-4b63-9bf6-58768894d71e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i3NehBlVTJ9Ncej1QIJ7usEOQ4dKcsWrqcR16IlkP4g=;
	b=Dhdr32eCVst5Db0WsffZ8Mtff1s7F6d4I5k8GzDoeElLJWQZ843ZVmzw0lU/DELD
	tV4UvvG4cE6wh+PLDkWcHiOcuD8m/Lu3wm8KBB8NmmwBGB/f41RamqFXrRGV7gbqdyp
	N3aNXD66gd5IX6bgYCt10zPcPAIrCB79wz66zjkc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i3NehBlVTJ9Ncej1QIJ7usEOQ4dKcsWrqcR16IlkP4g=;
	b=GQx+BYBi10kQY2xancrXa2Eye0wcQeLj8WYSTU2HQITerwCFcu7z1JiCwfH+aKmO
	EUiSI4nliKDgUIqmxGbjFkr6PMK5AaOMaZrQ6XG3gwFBPSxXfQk/3HgAeiIrZ/RuDBq
	exVcsNjX5M8OoXMjQYSPxoIK6UynqyHokEg3c+Ls=
Content-Type: multipart/mixed; boundary="===============3499181046820028218=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdb: upgrading to 15.1 FAILED
Message-ID: <01010190b7d5935f-c688d01d-4132-4b63-9bf6-58768894d71e-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201968

--===============3499181046820028218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdb* to *15.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gdb failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-e9bb518713cd820dc747bdb204f7b03123c5aec1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e9bb518713cd820dc747bdb204f7b03123c5aec1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 8 Local 8 Mirrors 0 Missed 0 Current 25 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-e9bb518713cd820dc747bdb204f7b03123c5aec1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e9bb518713cd820dc747bdb204f7b03123c5aec1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 8 Mirrors 0 Missed 1 Current 19 (88% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-5mdf9xx3: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-8u4rj2gx/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-8u4rj2gx/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:16
Adding changed files:   2% |                                    | ETA:  0:00:15
Adding changed files:   3% |#                                   | ETA:  0:00:13
Adding changed files:   4% |#                                   | ETA:  0:00:14
Adding changed files:   5% |#                                   | ETA:  0:00:14
Adding changed files:   6% |##                                  | ETA:  0:00:15
Adding changed files:   7% |##                                  | ETA:  0:00:14
Adding changed files:   8% |###                                 | ETA:  0:00:14
Adding changed files:   9% |###                                 | ETA:  0:00:13
Adding changed files:  10% |###                                 | ETA:  0:00:14
Adding changed files:  11% |####                                | ETA:  0:00:13
Adding changed files:  12% |####                                | ETA:  0:00:12
Adding changed files:  14% |#####                               | ETA:  0:00:12
Adding changed files:  15% |#####                               | ETA:  0:00:12
Adding changed files:  16% |#####                               | ETA:  0:00:11
Adding changed files:  17% |######                              | ETA:  0:00:11
Adding changed files:  18% |######                              | ETA:  0:00:11
Adding changed files:  19% |#######                             | ETA:  0:00:11
Adding changed files:  20% |#######                             | ETA:  0:00:10
Adding changed files:  21% |#######                             | ETA:  0:00:10
Adding changed files:  22% |########                            | ETA:  0:00:10
Adding changed files:  23% |########                            | ETA:  0:00:09
Adding changed files:  24% |########                            | ETA:  0:00:09
Adding changed files:  25% |#########                           | ETA:  0:00:09
Adding changed files:  27% |#########                           | ETA:  0:00:09
Adding changed files:  28% |##########                          | ETA:  0:00:08
Adding changed files:  29% |##########                          | ETA:  0:00:08
Adding changed files:  30% |##########                          | ETA:  0:00:08
Adding changed files:  31% |###########                         | ETA:  0:00:07
Adding changed files:  32% |###########                         | ETA:  0:00:07
Adding changed files:  33% |############                        | ETA:  0:00:07
Adding changed files:  34% |############                        | ETA:  0:00:07
Adding changed files:  35% |############                        | ETA:  0:00:07
Adding changed files:  36% |#############                       | ETA:  0:00:06
Adding changed files:  37% |#############                       | ETA:  0:00:06
Adding changed files:  38% |##############                      | ETA:  0:00:06
Adding changed files:  39% |##############                      | ETA:  0:00:06
Adding changed files:  41% |##############                      | ETA:  0:00:06
Adding changed files:  42% |###############                     | ETA:  0:00:06
Adding changed files:  43% |###############                     | ETA:  0:00:06
Adding changed files:  44% |###############                     | ETA:  0:00:05
Adding changed files:  45% |################                    | ETA:  0:00:05
Adding changed files:  46% |################                    | ETA:  0:00:05
Adding changed files:  47% |#################                   | ETA:  0:00:05
Adding changed files:  48% |#################                   | ETA:  0:00:05
Adding changed files:  49% |#################                   | ETA:  0:00:05
Adding changed files:  50% |##################                  | ETA:  0:00:05
Adding changed files:  51% |##################                  | ETA:  0:00:05
Adding changed files:  52% |###################                 | ETA:  0:00:04
Adding changed files:  54% |###################                 | ETA:  0:00:04
Adding changed files:  55% |###################                 | ETA:  0:00:04
Adding changed files:  56% |####################                | ETA:  0:00:04
Adding changed files:  57% |####################                | ETA:  0:00:04
Adding changed files:  58% |#####################               | ETA:  0:00:04
Adding changed files:  59% |#####################               | ETA:  0:00:04
Adding changed files:  60% |#####################               | ETA:  0:00:04
Adding changed files:  61% |######################              | ETA:  0:00:03
Adding changed files:  62% |######################              | ETA:  0:00:03
Adding changed files:  63% |######################              | ETA:  0:00:03
Adding changed files:  64% |#######################             | ETA:  0:00:03
Adding changed files:  65% |#######################             | ETA:  0:00:03
Adding changed files:  67% |########################            | ETA:  0:00:03
Adding changed files:  68% |########################            | ETA:  0:00:03
Adding changed files:  69% |########################            | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  72% |##########################          | ETA:  0:00:02
Adding changed files:  73% |##########################          | ETA:  0:00:02
Adding changed files:  74% |##########################          | ETA:  0:00:02
Adding changed files:  75% |###########################         | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:02
Adding changed files:  77% |############################        | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  83% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:10
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/gdb/gdb-15.1.tar.xz...
INFO: Rebasing devtool onto 9320e1df82af2848e076988d2d797c9a147cf889
WARNING: Command 'git rebase 9320e1df82af2848e076988d2d797c9a147cf889' failed:
Auto-merging gdbserver/Makefile.in
CONFLICT (content): Merge conflict in gdbserver/Makefile.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/gdb
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gdb/gdb_15.1.bb
WARNING: Version is pinned to 14.% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3499181046820028218==--

