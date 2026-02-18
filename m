Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39468E9A04E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1403.1771440091438776725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UULAcgYR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=M7okWqdN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c720eae0a-ab43c42c-b54b-4e12-a9ad-6b4c8b9ff5f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440090;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FGmqufl0qndYeg6wz88xONdcqMvno4UIRSUp+meulDM=;
	b=UULAcgYRoIhtBUptpwQbOFW5Yt9U7pOsTrNGz355ClFOAZ/Z9yObPMF3w7bAD6si
	Y/yRZ9PVSmQlQPDPl0ginnbBYVZdhILOFZ/IFywZV4IcLxlZL+KEcjkaIAns2qEW56F
	7pdlwXtHRlws+2BSuh/p33zPI2NO6aJWzr9doCDg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440090;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FGmqufl0qndYeg6wz88xONdcqMvno4UIRSUp+meulDM=;
	b=M7okWqdN0lUR25OsWTcqNkchxxW8v+sEMsIpWXyZ42LEU7yvD9kDc+jldDdZcd0b
	2XZuxYNQg+N0GuEM0UC5IUym9MXJ575BxlRuVl2o5ze5H+JYAyPPn/rWy3qF5erId0J
	vVCLPCseBF1zAv3NwWgKWKHbIqCUVsYNVu5tkQDQ=
Content-Type: multipart/mixed; boundary="===============0998629826198724317=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext,gettext-minimal-native: upgrading to 1.0,1.0 FAILED
Message-ID: <0101019c720eae0a-ab43c42c-b54b-4e12-a9ad-6b4c8b9ff5f8-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231317

--===============0998629826198724317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gettext,gettext-minimal-native* to *1.0,1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gettext failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-1c302ecc0d60916bc83dcd3e57a82cc22c9ab70a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:1c302ecc0d60916bc83dcd3e57a82cc22c9ab70a"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 18 Local 18 Mirrors 0 Missed 0 Current 12 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1953 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-1c302ecc0d60916bc83dcd3e57a82cc22c9ab70a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:1c302ecc0d60916bc83dcd3e57a82cc22c9ab70a"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:40
Adding changed files:   3% |#                                   | ETA:  0:00:22
Adding changed files:   5% |#                                   | ETA:  0:00:15
Adding changed files:   7% |##                                  | ETA:  0:00:12
Adding changed files:   8% |###                                 | ETA:  0:00:10
Adding changed files:  10% |###                                 | ETA:  0:00:09
Adding changed files:  12% |####                                | ETA:  0:00:08
Adding changed files:  14% |#####                               | ETA:  0:00:07
Adding changed files:  15% |#####                               | ETA:  0:00:06
Adding changed files:  17% |######                              | ETA:  0:00:06
Adding changed files:  19% |######                              | ETA:  0:00:05
Adding changed files:  21% |#######                             | ETA:  0:00:05
Adding changed files:  22% |########                            | ETA:  0:00:05
Adding changed files:  24% |########                            | ETA:  0:00:04
Adding changed files:  26% |#########                           | ETA:  0:00:04
Adding changed files:  28% |##########                          | ETA:  0:00:04
Adding changed files:  29% |##########                          | ETA:  0:00:04
Adding changed files:  31% |###########                         | ETA:  0:00:04
Adding changed files:  33% |############                        | ETA:  0:00:03
Adding changed files:  35% |############                        | ETA:  0:00:03
Adding changed files:  36% |#############                       | ETA:  0:00:03
Adding changed files:  38% |#############                       | ETA:  0:00:03
Adding changed files:  40% |##############                      | ETA:  0:00:03
Adding changed files:  42% |###############                     | ETA:  0:00:03
Adding changed files:  43% |###############                     | ETA:  0:00:02
Adding changed files:  45% |################                    | ETA:  0:00:02
Adding changed files:  47% |#################                   | ETA:  0:00:02
Adding changed files:  49% |#################                   | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  52% |##################                  | ETA:  0:00:02
Adding changed files:  54% |###################                 | ETA:  0:00:02
Adding changed files:  56% |####################                | ETA:  0:00:02
Adding changed files:  57% |####################                | ETA:  0:00:02
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  63% |######################              | ETA:  0:00:01
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  66% |########################            | ETA:  0:00:01
Adding changed files:  68% |########################            | ETA:  0:00:01
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  72% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  86% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/gettext/gettext-1.0.tar.gz...
INFO: Rebasing devtool onto 3f87ef6cfe7abbf7a84ec00b6fbd33403c338a4c
WARNING: Command 'git rebase 3f87ef6cfe7abbf7a84ec00b6fbd33403c338a4c' failed:
Auto-merging gettext-tools/gnulib-m4/selinux-selinux-h.m4
CONFLICT (content): Merge conflict in gettext-tools/gnulib-m4/selinux-selinux-h.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 3f87ef6cfe7abbf7a84ec00b6fbd33403c338a4c
WARNING: Command 'git rebase 3f87ef6cfe7abbf7a84ec00b6fbd33403c338a4c' failed:
Auto-merging gettext-tools/gnulib-m4/selinux-selinux-h.m4
CONFLICT (content): Merge conflict in gettext-tools/gnulib-m4/selinux-selinux-h.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gettext
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gettext/gettext_1.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0998629826198724317==--

