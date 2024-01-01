Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308AEC47E49
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:07 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.4600.1704114720289110576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eSErJ8vG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EZv9xkD+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018cc5270c30-35d1a14e-9185-49dc-a914-5d209d23bb90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mUNjBwj+XBtVfASYDj2gCEJxDOU6htm/jNSr6ZaQH2U=;
	b=eSErJ8vGg2vb9k5gJh395puMo1q8DEcPvNZ9oUk4FF0WoetVaoAqvOc74W1tl2up
	oXSmVKexL/F+c/4QyAlzhmxfMnPgW7k68atdQ8vpVwvi31hr772Emyc6YQkIoIT1gmy
	cgY310NWyf3itzEDxqiHCfyxjR1sUxgvHc9GSLDg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mUNjBwj+XBtVfASYDj2gCEJxDOU6htm/jNSr6ZaQH2U=;
	b=EZv9xkD+mHxGjcD9Ns8fUW0QA9382B02u7OnlB37wsSqw2loomqQgMn5OcjS7hEk
	t6hQsvkQ/a37sJ1kIkBizGIWD1SB77Alb3J5G4bK4aSyCIQFTRntrISSEyVVtDqkzcL
	hgOhBINnQXNIQgJO2wUQmLl3XGPE7GCgBrbr7YvE=
Content-Type: multipart/mixed; boundary="===============0715568925275498443=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 8.2.0 FAILED
Message-ID: <0101018cc5270c30-35d1a14e-9185-49dc-a914-5d209d23bb90-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193151

--===============0715568925275498443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *8.2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1848 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7ee6010c5a22b3655b92b44db69253892aedb131"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7ee6010c5a22b3655b92b44db69253892aedb131"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (912 cached, 2 parsed). 1848 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7ee6010c5a22b3655b92b44db69253892aedb131"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7ee6010c5a22b3655b92b44db69253892aedb131"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 8 Local 7 Mirrors 0 Missed 1 Current 20 (87% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:51
Adding changed files:   1% |                                    | ETA:  0:00:47
Adding changed files:   2% |                                    | ETA:  0:00:39
Adding changed files:   2% |#                                   | ETA:  0:00:35
Adding changed files:   3% |#                                   | ETA:  0:00:32
Adding changed files:   4% |#                                   | ETA:  0:00:30
Adding changed files:   5% |#                                   | ETA:  0:00:29
Adding changed files:   5% |##                                  | ETA:  0:00:28
Adding changed files:   6% |##                                  | ETA:  0:00:27
Adding changed files:   7% |##                                  | ETA:  0:00:26
Adding changed files:   8% |##                                  | ETA:  0:00:26
Adding changed files:   8% |###                                 | ETA:  0:00:25
Adding changed files:   9% |###                                 | ETA:  0:00:24
Adding changed files:  10% |###                                 | ETA:  0:00:24
Adding changed files:  11% |####                                | ETA:  0:00:23
Adding changed files:  11% |####                                | ETA:  0:00:23
Adding changed files:  12% |####                                | ETA:  0:00:22
Adding changed files:  13% |####                                | ETA:  0:00:22
Adding changed files:  14% |#####                               | ETA:  0:00:21
Adding changed files:  14% |#####                               | ETA:  0:00:21
Adding changed files:  15% |#####                               | ETA:  0:00:21
Adding changed files:  16% |#####                               | ETA:  0:00:20
Adding changed files:  17% |######                              | ETA:  0:00:20
Adding changed files:  17% |######                              | ETA:  0:00:20
Adding changed files:  18% |######                              | ETA:  0:00:20
Adding changed files:  19% |#######                             | ETA:  0:00:19
Adding changed files:  20% |#######                             | ETA:  0:00:19
Adding changed files:  20% |#######                             | ETA:  0:00:19
Adding changed files:  21% |#######                             | ETA:  0:00:19
Adding changed files:  22% |########                            | ETA:  0:00:18
Adding changed files:  23% |########                            | ETA:  0:00:18
Adding changed files:  23% |########                            | ETA:  0:00:18
Adding changed files:  24% |########                            | ETA:  0:00:18
Adding changed files:  25% |#########                           | ETA:  0:00:18
Adding changed files:  26% |#########                           | ETA:  0:00:17
Adding changed files:  26% |#########                           | ETA:  0:00:17
Adding changed files:  27% |#########                           | ETA:  0:00:17
Adding changed files:  28% |##########                          | ETA:  0:00:17
Adding changed files:  29% |##########                          | ETA:  0:00:17
Adding changed files:  29% |##########                          | ETA:  0:00:16
Adding changed files:  30% |###########                         | ETA:  0:00:16
Adding changed files:  31% |###########                         | ETA:  0:00:16
Adding changed files:  32% |###########                         | ETA:  0:00:16
Adding changed files:  32% |###########                         | ETA:  0:00:16
Adding changed files:  33% |############                        | ETA:  0:00:15
Adding changed files:  34% |############                        | ETA:  0:00:15
Adding changed files:  35% |############                        | ETA:  0:00:15
Adding changed files:  35% |############                        | ETA:  0:00:15
Adding changed files:  36% |#############                       | ETA:  0:00:15
Adding changed files:  37% |#############                       | ETA:  0:00:14
Adding changed files:  38% |#############                       | ETA:  0:00:14
Adding changed files:  38% |##############                      | ETA:  0:00:14
Adding changed files:  39% |##############                      | ETA:  0:00:14
Adding changed files:  40% |##############                      | ETA:  0:00:14
Adding changed files:  41% |##############                      | ETA:  0:00:14
Adding changed files:  41% |###############                     | ETA:  0:00:13
Adding changed files:  42% |###############                     | ETA:  0:00:13
Adding changed files:  43% |###############                     | ETA:  0:00:13
Adding changed files:  44% |###############                     | ETA:  0:00:13
Adding changed files:  44% |################                    | ETA:  0:00:13
Adding changed files:  45% |################                    | ETA:  0:00:12
Adding changed files:  46% |################                    | ETA:  0:00:12
Adding changed files:  47% |################                    | ETA:  0:00:12
Adding changed files:  47% |#################                   | ETA:  0:00:12
Adding changed files:  48% |#################                   | ETA:  0:00:12
Adding changed files:  49% |#################                   | ETA:  0:00:12
Adding changed files:  50% |##################                  | ETA:  0:00:12
Adding changed files:  50% |##################                  | ETA:  0:00:11
Adding changed files:  51% |##################                  | ETA:  0:00:11
Adding changed files:  52% |##################                  | ETA:  0:00:11
Adding changed files:  53% |###################                 | ETA:  0:00:11
Adding changed files:  53% |###################                 | ETA:  0:00:11
Adding changed files:  54% |###################                 | ETA:  0:00:11
Adding changed files:  55% |###################                 | ETA:  0:00:10
Adding changed files:  56% |####################                | ETA:  0:00:10
Adding changed files:  56% |####################                | ETA:  0:00:10
Adding changed files:  57% |####################                | ETA:  0:00:10
Adding changed files:  58% |#####################               | ETA:  0:00:10
Adding changed files:  59% |#####################               | ETA:  0:00:10
Adding changed files:  59% |#####################               | ETA:  0:00:10
Adding changed files:  60% |#####################               | ETA:  0:00:09
Adding changed files:  61% |######################              | ETA:  0:00:09
Adding changed files:  62% |######################              | ETA:  0:00:09
Adding changed files:  62% |######################              | ETA:  0:00:09
Adding changed files:  63% |######################              | ETA:  0:00:09
Adding changed files:  64% |#######################             | ETA:  0:00:09
Adding changed files:  65% |#######################             | ETA:  0:00:09
Adding changed files:  65% |#######################             | ETA:  0:00:09
Adding changed files:  66% |#######################             | ETA:  0:00:08
Adding changed files:  67% |########################            | ETA:  0:00:08
Adding changed files:  68% |########################            | ETA:  0:00:08
Adding changed files:  68% |########################            | ETA:  0:00:08
Adding changed files:  69% |#########################           | ETA:  0:00:08
Adding changed files:  70% |#########################           | ETA:  0:00:07
Adding changed files:  71% |#########################           | ETA:  0:00:07
Adding changed files:  71% |#########################           | ETA:  0:00:07
Adding changed files:  72% |##########################          | ETA:  0:00:07
Adding changed files:  73% |##########################          | ETA:  0:00:07
Adding changed files:  74% |##########################          | ETA:  0:00:06
Adding changed files:  74% |##########################          | ETA:  0:00:06
Adding changed files:  75% |###########################         | ETA:  0:00:06
Adding changed files:  76% |###########################         | ETA:  0:00:06
Adding changed files:  77% |###########################         | ETA:  0:00:06
Adding changed files:  77% |############################        | ETA:  0:00:05
Adding changed files:  78% |############################        | ETA:  0:00:05
Adding changed files:  79% |############################        | ETA:  0:00:05
Adding changed files:  80% |############################        | ETA:  0:00:05
Adding changed files:  80% |#############################       | ETA:  0:00:05
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  82% |#############################       | ETA:  0:00:04
Adding changed files:  83% |#############################       | ETA:  0:00:04
Adding changed files:  83% |##############################      | ETA:  0:00:04
Adding changed files:  84% |##############################      | ETA:  0:00:04
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  86% |##############################      | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  87% |###############################     | ETA:  0:00:03
Adding changed files:  88% |###############################     | ETA:  0:00:03
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  91% |################################    | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:27
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-8.2.0.tar.xz...
INFO: Rebasing devtool onto 2469623bbe9e1571f5584b18c839f91b5daae79a
WARNING: Command 'git rebase 2469623bbe9e1571f5584b18c839f91b5daae79a' failed:
Auto-merging configure
CONFLICT (content): Merge conflict in configure

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 2469623bbe9e1571f5584b18c839f91b5daae79a
WARNING: Command 'git rebase 2469623bbe9e1571f5584b18c839f91b5daae79a' failed:
Auto-merging configure
CONFLICT (content): Merge conflict in configure

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 2469623bbe9e1571f5584b18c839f91b5daae79a
WARNING: Command 'git rebase 2469623bbe9e1571f5584b18c839f91b5daae79a' failed:
Auto-merging configure
CONFLICT (content): Merge conflict in configure

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/qemu
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/qemu/qemu_8.2.0.bb
WARNING: Version is pinned to 8.1% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0715568925275498443==--

