Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0328BD0EE12
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:06 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.53348.1728588939720987541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QcVBHe8z;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pjTzX7oM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019277ee4d8a-8a0de9fc-591f-4bd7-af75-d9c9d78634dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588959;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8ae2GIkUUtaYuFtLrkZ/Z7BGQwntRXeGoKVGipQD4qs=;
	b=QcVBHe8zWlbzzSfXBSvt6F3TnVZgpaQoyyvS3tkrynJvhioPDE2811ToCImcqNqV
	rAVEnVFWYy/5uqdy8EQErVyHeTxUZvJmmbJEzc5A+Vung5SsOc3IGFSPB2mjwiSJXHD
	D+GiZZRVXLXppCJwfZVK6M4ougUeo9fRVk0QP7ng=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588959;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8ae2GIkUUtaYuFtLrkZ/Z7BGQwntRXeGoKVGipQD4qs=;
	b=pjTzX7oM99mrzyzfk7wGnvKv96iV/zo+xZi2m02nxA4Okot3mrK+QXpHaKG7mzvS
	yOxAb89XngsCjN7LZVbS7tJw3kM+WkxhGUgIrpkj16B9qex7hwg4hPu0f6BCDQw0Jdn
	ewj5EEFYB33/LI+EVUar1EEiOXfYFtEd7qVWLiLY=
Content-Type: multipart/mixed; boundary="===============5687121112565218166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tiff: upgrading to 4.7.0 FAILED
Message-ID: <0101019277ee4d8a-8a0de9fc-591f-4bd7-af75-d9c9d78634dd-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205492

--===============5687121112565218166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tiff* to *4.7.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe tiff failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:e7138fab0acf2315d8e59c204e9e94e4806ddfbf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:e7138fab0acf2315d8e59c204e9e94e4806ddfbf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-sqc2vsgu: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-_j_0ksjn/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-_j_0ksjn/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  18% |######                              | ETA:  0:00:00
Adding changed files:  37% |#############                       | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://download.osgeo.org/libtiff/tiff-4.7.0.tar.gz...
INFO: Rebasing devtool onto 6cac90df4d684bb6d0a570789a1a1d51d18c417c
WARNING: Command 'git rebase 6cac90df4d684bb6d0a570789a1a1d51d18c417c' failed:
Auto-merging libtiff/tif_dirread.c
CONFLICT (content): Merge conflict in libtiff/tif_dirread.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/tiff
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/tiff/tiff_4.7.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5687121112565218166==--

