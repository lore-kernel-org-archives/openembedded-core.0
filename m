Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0AED60046
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4790.1731964607557674668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fjrU4PJN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Gr0BHvzm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101934122a8b2-ecc431fa-134d-4f3d-b84f-3595664c8f63-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964610;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yeZzX/313bnsPmh+QxQ17FH5q2ZCE6VOdc+m0VAp41o=;
	b=fjrU4PJN3TZaGc5+/SNx9OrSgc2x9H8gUilkDjIJVaq5OGf1SqO7S5Ar7MNT9W0s
	vLULajqzEK1to1f8u3lM8VBNVYX61oY2qeLiI5Wj7TjXuvpR4hjp7mgCO5PMHVta0KQ
	Ad9RBToEKm53c03SLJ3BWO6SwhbT3NT9L5PGUZsQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964610;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yeZzX/313bnsPmh+QxQ17FH5q2ZCE6VOdc+m0VAp41o=;
	b=Gr0BHvzmjJQFWvAbv2X4FkDu9TCwjMmYCLjTYWSxBbRkhM3qFkh1Cez81buL1VvS
	U5hSTi3RLXl54dB8AeE4e9LxJVDTPzZGqEUo5toyvoRJZZciYSxqCDAtKm0aCjGQb4D
	u7DYVLSzqsi9BNCaq8pPl1ofPkhC1M+yqVIyDCRg=
Content-Type: multipart/mixed; boundary="===============5726312503970270405=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 3.11 FAILED
Message-ID: <010101934122a8b2-ecc431fa-134d-4f3d-b84f-3595664c8f63-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207254

--===============5726312503970270405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysvinit* to *3.11* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe sysvinit failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6823f2c8d0f8b6bd91cd2cc7bd29383d3134020a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6823f2c8d0f8b6bd91cd2cc7bd29383d3134020a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-zgn4f9e5: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-6jjmgl1p/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-6jjmgl1p/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/slicer69/sysvinit/releases//download/3.11/sysvinit-3.11.tar.xz...
INFO: Rebasing devtool onto 45e253fef8d2ff84dba99945f29fbeb11749d607
WARNING: Command 'git rebase 45e253fef8d2ff84dba99945f29fbeb11749d607' failed:
Auto-merging src/Makefile
CONFLICT (content): Merge conflict in src/Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/sysvinit
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/sysvinit/sysvinit_3.11.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5726312503970270405==--

