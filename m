Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6D7C54ECE
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.36628.1709330716575545155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WOWtw9+f;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nsRQmq+9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dfc0cd826-6d68df2a-855d-4edc-8b4b-04d0e3744ba1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BD3TIlz0mjHUrr/XXgL3i3X1vQbwpFhFSXaffiE0dDM=;
	b=WOWtw9+fxYu1l/HKI+FkP5dkwdaHfAkmP/FMi3nMm8IvM8vPO2XXPYQwugE6jfgf
	9AIqrpBCBsFr0c19TUOFiYHWEguNIWuDvIylFdU54yzvhZZ58eboC4Ke5YQK/+QiKfN
	bkvFiTbz7UysYfxH5GtEcGDOlwuErFsI6fivsRzw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BD3TIlz0mjHUrr/XXgL3i3X1vQbwpFhFSXaffiE0dDM=;
	b=nsRQmq+9uBXooN9AIHhCrx+iPNbSZQj5rExjW4smgc09K4+tGqOOd7vpr+ZwYWAq
	rhm4VTbbbR89DEdd3CTswIqyZcj4xR+JzH5vtkEgXfnvpAXiJWa1zqaE8OOXVjzy7yW
	MLhzxo7oKyoO/TKJGqC5Wrji6FhNDsOsyp+LHgbM=
Content-Type: multipart/mixed; boundary="===============2510384411285034149=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk+3: upgrading to 3.24.41 FAILED
Message-ID: <0101018dfc0cd826-6d68df2a-855d-4edc-8b4b-04d0e3744ba1-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196492

--===============2510384411285034149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk+3* to *3.24.41* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gtk+3 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1863 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d86494c0073b209b87656f61d5da390fd1936a75"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d86494c0073b209b87656f61d5da390fd1936a75"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1863 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (915 cached, 2 parsed). 1864 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d86494c0073b209b87656f61d5da390fd1936a75"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d86494c0073b209b87656f61d5da390fd1936a75"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 5 Local 4 Mirrors 0 Missed 1 Current 23 (80% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://ftp.gnome.org/pub/gnome/sources/gtk+/3.24/gtk+-3.24.41.tar.xz...
INFO: Rebasing devtool onto 7200099d3cf48dd9a174a28b283e069bfacc53f9
WARNING: Command 'git rebase 7200099d3cf48dd9a174a28b283e069bfacc53f9' failed:
Auto-merging gdk/gdkdisplay.c
Auto-merging gdk/gdkgl.c
CONFLICT (content): Merge conflict in gdk/gdkgl.c
Auto-merging gdk/gdkglcontext.c
Auto-merging gdk/gdkwindow.c
Auto-merging meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/gtk+3
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gtk+3/gtk+3_3.24.41.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2510384411285034149==--

