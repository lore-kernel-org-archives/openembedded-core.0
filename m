Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63E7C678DF
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20661.1672605966727682574
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iuPJL9ak;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101856f15a5b0-60ed6ef1-b475-4152-bdf9-ab13a81cd364-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PMqD7xdPJilChMAPN2IjH2WlX1Pi8Sgc17OToKRoS3M=;
	b=iuPJL9akLW6xYtIYQdybBtC+Cf+rTSffwXgoxaaS0nzHg/J8+B0BGePX/KjTJ7U7
	2AtcmKuNpiJZGDu8f0A+7NJxV0nzFLF9dgy+aOOnt0fzWowduUkwPpsKyI6xYDjmuBZ
	K10Q57GYFMwnuC4AtoQd5QIlbvO2CE6emt1Sv9II=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PMqD7xdPJilChMAPN2IjH2WlX1Pi8Sgc17OToKRoS3M=;
	b=Mh0FYOBNevzzJKWn5pK8356FcSCwtVSmvpOwGuPQLE3uFjcifybkKjhdaGIYkxI5
	OXhOFNSIqLp9GkiIYB2xATrbV3SkqqijeJP1a+Hv/w1iN4/Bc+otI+lF65denoT7fEY
	dtU5R0nKkQc7y8S8GMbhv1Bg214j0KLeSgn1ulFE=
Content-Type: multipart/mixed; boundary="===============5789489178246908179=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk+3: upgrading to 3.24.36 FAILED
Message-ID: <010101856f15a5b0-60ed6ef1-b475-4152-bdf9-ab13a81cd364-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175281

--===============5789489178246908179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk+3* to *3.24.36* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gtk+3 -V 3.24.36
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (12:51:57.272110)
NOTE: Directory listing: ['conf', 'tmp', 'cache', 'downloads', 'buildhistory', 'sstate-cache', 'workspace', 'upgrade-helper', 'bitbake-cookerdaemon.log']
NOTE: Retrying server connection (#1)... (12:51:57.440845)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f8c9980e27de19462748aa70c6dde34b1b70cded"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1690 entries from dependency cache.
Parsing recipes...done.
Parsing of 894 .bb files complete (892 cached, 2 parsed). 1691 targets, 36 skipped, 0 masked, 0 errors.

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
meta-yocto-bsp       = "tmp-auh-upgrades:f8c9980e27de19462748aa70c6dde34b1b70cded"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   6% |##                                  | ETA:  0:00:02
Adding changed files:  12% |####                                | ETA:  0:00:01
Adding changed files:  18% |######                              | ETA:  0:00:01
Adding changed files:  24% |########                            | ETA:  0:00:00
Adding changed files:  30% |###########                         | ETA:  0:00:00
Adding changed files:  37% |#############                       | ETA:  0:00:00
Adding changed files:  43% |###############                     | ETA:  0:00:00
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  55% |####################                | ETA:  0:00:00
Adding changed files:  61% |######################              | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://ftp.gnome.org/pub/gnome/sources/gtk+/3.24/gtk+-3.24.36.tar.xz...
INFO: Rebasing devtool onto 8ec8af855cf532770fc126767c65fe5605c53cc6
WARNING: Command 'git rebase 8ec8af855cf532770fc126767c65fe5605c53cc6' failed:
CONFLICT (modify/delete): config.h.meson deleted in HEAD and modified in a65ea5a (Do not try to initialize GL without libGL).  Version a65ea5a (Do not try to initialize GL without libGL) of config.h.meson left in tree.
CONFLICT (modify/delete): gdk/x11/Makefile.am deleted in HEAD and modified in a65ea5a (Do not try to initialize GL without libGL).  Version a65ea5a (Do not try to initialize GL without libGL) of gdk/x11/Makefile.am left in tree.
Auto-merging meson.build

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
config.h.meson: needs merge
gdk/x11/Makefile.am: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5789489178246908179==--

