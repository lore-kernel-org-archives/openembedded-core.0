Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE337C2D0D1
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.42216.1717263218698328650
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LGy4uaDw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NyQTDLN+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018fd4dd35c6-7928110e-90f2-430f-b49b-7ba91f525888-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q9n8QOQmGvqm0vo8o2rpyCX1xWu5rZMLCbdAtd4yi/k=;
	b=LGy4uaDwm5VQ7CxCAReYBNAyzvETNHAw+85Wmf4TTlPAGz4twED/UAKeZP+r2fQC
	J3akDXWJfZfKDJvbZeUJpyiGHc7BKFUGJMpMhr7sVTvLRsrT0SjG8kZ7d35e02Va4lf
	cqRPTBtNtD/rWHdJ6uYW4k/GOs5Y/5ybHOJSjXxY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q9n8QOQmGvqm0vo8o2rpyCX1xWu5rZMLCbdAtd4yi/k=;
	b=NyQTDLN+IWHHTA/lGpclhINl5ojWhoUffjYTK0KeKIQ4gJFh8Hp9xP+Fn2Hq4B8e
	CQ3++s8P2fV80vOid5DW2uPh7Kgvxlvrh0WpTW4yhgFtbDLFcEN3eOu+G0IHBFLFa1p
	/fQ3V9csmftBNoulqPoLv0FP49EMnrFlkX8dFsRI=
Content-Type: multipart/mixed; boundary="===============0677953887140249166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 9.0.0 FAILED
Message-ID: <0101018fd4dd35c6-7928110e-90f2-430f-b49b-7ba91f525888-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200143

--===============0677953887140249166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *9.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-616ccc902d718bbfd89691a069efde7bfae7c04d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:616ccc902d718bbfd89691a069efde7bfae7c04d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-616ccc902d718bbfd89691a069efde7bfae7c04d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:616ccc902d718bbfd89691a069efde7bfae7c04d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-10c6c7ck: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-3w1w_l2f/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-3w1w_l2f/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:12
Adding changed files:   6% |##                                  | ETA:  0:00:08
Adding changed files:   9% |###                                 | ETA:  0:00:07
Adding changed files:  13% |####                                | ETA:  0:00:07
Adding changed files:  16% |#####                               | ETA:  0:00:06
Adding changed files:  19% |#######                             | ETA:  0:00:06
Adding changed files:  22% |########                            | ETA:  0:00:06
Adding changed files:  26% |#########                           | ETA:  0:00:05
Adding changed files:  29% |##########                          | ETA:  0:00:05
Adding changed files:  32% |###########                         | ETA:  0:00:05
Adding changed files:  35% |############                        | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:04
Adding changed files:  42% |###############                     | ETA:  0:00:04
Adding changed files:  45% |################                    | ETA:  0:00:04
Adding changed files:  49% |#################                   | ETA:  0:00:03
Adding changed files:  52% |##################                  | ETA:  0:00:03
Adding changed files:  55% |###################                 | ETA:  0:00:03
Adding changed files:  58% |#####################               | ETA:  0:00:03
Adding changed files:  62% |######################              | ETA:  0:00:03
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  68% |########################            | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  75% |###########################         | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:08
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-9.0.0.tar.xz...
INFO: Rebasing devtool onto 262d4400a0925f7167b9283389f008785cb265c4
WARNING: Command 'git rebase 262d4400a0925f7167b9283389f008785cb265c4' failed:
Auto-merging linux-user/mmap.c
CONFLICT (content): Merge conflict in linux-user/mmap.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 262d4400a0925f7167b9283389f008785cb265c4
WARNING: Command 'git rebase 262d4400a0925f7167b9283389f008785cb265c4' failed:
Auto-merging linux-user/mmap.c
CONFLICT (content): Merge conflict in linux-user/mmap.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 262d4400a0925f7167b9283389f008785cb265c4
WARNING: Command 'git rebase 262d4400a0925f7167b9283389f008785cb265c4' failed:
Auto-merging linux-user/mmap.c
CONFLICT (content): Merge conflict in linux-user/mmap.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/qemu
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/qemu/qemu_9.0.0.bb
WARNING: Version is pinned to 8.2% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0677953887140249166==--

