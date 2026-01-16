Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8C1D47CB9
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1426.1768526740384283148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OknUltpx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fVdq/Qon;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019bc46877d4-0dcc3a57-3c8e-45b6-aab3-0ea990b3d67e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1T0GRS6CzDB8KJ/wk41H2lQf4EqcChex5B2i515KZoU=;
	b=OknUltpxaEW2rjzTu+uxkjAYzjmZiTzPSksoUPsEVPV9nehTUUbQwuHnEvJwuuSn
	eK80NBxyTODfzmUTZvV0ZhcsRErDzi5C0KnFOlCYN6MKn9zbD26H8aOt7CgjaPDs3NM
	80ilGjrGRagl4ej2YiEh7Kg9f2pKzni09F9e3PnM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1T0GRS6CzDB8KJ/wk41H2lQf4EqcChex5B2i515KZoU=;
	b=fVdq/QonE32SQbNgjOnIw6Ah1XlPMF63+s4HDE1nMbOuyT6BXDssuo6OnxCZ71wp
	zOBgJtwThf0UBP07I36e7pP15GlhYHsNtly4B18EVWb0Z3lcDKgtMgzPHDX87OvJ0Y7
	C+p6lu7miQOtjS6K8yhfHVgrB8HCEt9JtAswZdXs=
Content-Type: multipart/mixed; boundary="===============5706268785163991647=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdb-cross-x86_64,gdb-cross-canadian-x86-64,gdb: upgrading to
 17.1,17.1,17.1 FAILED
Message-ID: <0101019bc46877d4-0dcc3a57-3c8e-45b6-aab3-0ea990b3d67e-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229446

--===============5706268785163991647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdb-cross-x86_64,gdb-cross-canadian-x86-64,gdb* to *17.1,17.1,17.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gdb-cross-x86_64 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1955 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-beb0a16ac408d741213b635ab6151f5a921bd129"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:beb0a16ac408d741213b635ab6151f5a921bd129"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 15 Local 15 Mirrors 0 Missed 0 Current 12 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1956 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-beb0a16ac408d741213b635ab6151f5a921bd129"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:beb0a16ac408d741213b635ab6151f5a921bd129"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 16 Local 15 Mirrors 0 Missed 1 Current 12 (93% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:11
Adding changed files:   2% |                                    | ETA:  0:00:10
Adding changed files:   3% |#                                   | ETA:  0:00:09
Adding changed files:   4% |#                                   | ETA:  0:00:09
Adding changed files:   5% |#                                   | ETA:  0:00:10
Adding changed files:   6% |##                                  | ETA:  0:00:09
Adding changed files:   7% |##                                  | ETA:  0:00:09
Adding changed files:   8% |###                                 | ETA:  0:00:09
Adding changed files:   9% |###                                 | ETA:  0:00:09
Adding changed files:  10% |###                                 | ETA:  0:00:08
Adding changed files:  11% |####                                | ETA:  0:00:10
Adding changed files:  12% |####                                | ETA:  0:00:09
Adding changed files:  13% |####                                | ETA:  0:00:09
Adding changed files:  14% |#####                               | ETA:  0:00:08
Adding changed files:  15% |#####                               | ETA:  0:00:08
Adding changed files:  17% |######                              | ETA:  0:00:08
Adding changed files:  18% |######                              | ETA:  0:00:07
Adding changed files:  19% |######                              | ETA:  0:00:07
Adding changed files:  20% |#######                             | ETA:  0:00:07
Adding changed files:  21% |#######                             | ETA:  0:00:07
Adding changed files:  22% |########                            | ETA:  0:00:07
Adding changed files:  23% |########                            | ETA:  0:00:07
Adding changed files:  24% |########                            | ETA:  0:00:06
Adding changed files:  25% |#########                           | ETA:  0:00:06
Adding changed files:  26% |#########                           | ETA:  0:00:06
Adding changed files:  27% |#########                           | ETA:  0:00:06
Adding changed files:  28% |##########                          | ETA:  0:00:06
Adding changed files:  29% |##########                          | ETA:  0:00:05
Adding changed files:  30% |###########                         | ETA:  0:00:05
Adding changed files:  31% |###########                         | ETA:  0:00:05
Adding changed files:  32% |###########                         | ETA:  0:00:05
Adding changed files:  34% |############                        | ETA:  0:00:05
Adding changed files:  35% |############                        | ETA:  0:00:05
Adding changed files:  36% |#############                       | ETA:  0:00:05
Adding changed files:  37% |#############                       | ETA:  0:00:04
Adding changed files:  38% |#############                       | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:04
Adding changed files:  40% |##############                      | ETA:  0:00:04
Adding changed files:  41% |##############                      | ETA:  0:00:04
Adding changed files:  42% |###############                     | ETA:  0:00:04
Adding changed files:  43% |###############                     | ETA:  0:00:04
Adding changed files:  44% |################                    | ETA:  0:00:04
Adding changed files:  45% |################                    | ETA:  0:00:04
Adding changed files:  46% |################                    | ETA:  0:00:03
Adding changed files:  47% |#################                   | ETA:  0:00:03
Adding changed files:  48% |#################                   | ETA:  0:00:03
Adding changed files:  50% |##################                  | ETA:  0:00:03
Adding changed files:  51% |##################                  | ETA:  0:00:03
Adding changed files:  52% |##################                  | ETA:  0:00:03
Adding changed files:  53% |###################                 | ETA:  0:00:03
Adding changed files:  54% |###################                 | ETA:  0:00:03
Adding changed files:  55% |###################                 | ETA:  0:00:03
Adding changed files:  56% |####################                | ETA:  0:00:03
Adding changed files:  57% |####################                | ETA:  0:00:03
Adding changed files:  58% |#####################               | ETA:  0:00:02
Adding changed files:  59% |#####################               | ETA:  0:00:02
Adding changed files:  60% |#####################               | ETA:  0:00:02
Adding changed files:  61% |######################              | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  63% |######################              | ETA:  0:00:02
Adding changed files:  64% |#######################             | ETA:  0:00:02
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  68% |########################            | ETA:  0:00:02
Adding changed files:  69% |########################            | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  72% |##########################          | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  80% |#############################       | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:07
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/gdb/gdb-17.1.tar.xz...
INFO: Rebasing devtool onto 085bc9e6a31687ef04e74d6ec13da8c888ff4330
WARNING: Command 'git rebase 085bc9e6a31687ef04e74d6ec13da8c888ff4330' failed:
Auto-merging readline/readline/tcap.h
CONFLICT (content): Merge conflict in readline/readline/tcap.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gdb-cross-x86_64
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gdb-cross-x86_64/gdb-cross-x86_64_17.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5706268785163991647==--

