Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A3AD0EE15
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.53266.1728588946703167204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X5A2egeV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bM6FJg57;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019277eefe5b-291af3b5-45ff-4b76-b5a4-0ae06a338c0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728589004;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sh+lRQg7wD+7qtOuhs1JRiKvzBosguCjY1aLPojQzLk=;
	b=X5A2egeVH6SfvvlOzrIK/Cenn5/PIbhPkX9DOQw7mjJOnCwjAYRa+K4l2ffIB1iV
	BXJdeODJ67pmUGRn1eOpuDuOTiKJcnK8MVFPOeSuygI/+/4HLHgcG0uv3uSAgZpi6Rp
	xUDdv6DvtJu6z6hVQOEL1EYDhuQuaW2hnjNjdv7E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728589004;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sh+lRQg7wD+7qtOuhs1JRiKvzBosguCjY1aLPojQzLk=;
	b=bM6FJg573XFDEp7Pp+SVbmBAox8yytNY0PBBZZsrEJg8illZe1s7ukJrLTtOwkDf
	1gNGNeWYLN89BEvQFcgpaNTByw7vreRuRLGjJvOrsWoCxz5ILhkh6kZ8ykhBbmoNFTJ
	NhPAzvV6Km5WAWnVanMeC7rpb8vcQ1hsSoJwsOjQ=
Content-Type: multipart/mixed; boundary="===============6070805034564756629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.59.1 FAILED
Message-ID: <0101019277eefe5b-291af3b5-45ff-4b76-b5a4-0ae06a338c0f-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205637

--===============6070805034564756629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librsvg* to *2.59.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade librsvg -V 2.59.1
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
workspace            = "tmp-auh-upgrades:6f5a73be43a79b1dfe40d3ac9a31ee1d4cb22a05"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
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
workspace            = "tmp-auh-upgrades:6f5a73be43a79b1dfe40d3ac9a31ee1d4cb22a05"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-iu2oe1mo: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-w2lmyuja/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-w2lmyuja/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  27% |##########                          | ETA:  0:00:00
Adding changed files:  55% |####################                | ETA:  0:00:00
Adding changed files:  83% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//librsvg/2.59/librsvg-2.59.1.tar.xz;name=archive...
INFO: Rebasing devtool onto efdbc7db9501fe4e9c33d5e29c65dac5dfab8d7d
WARNING: Command 'git rebase efdbc7db9501fe4e9c33d5e29c65dac5dfab8d7d' failed:
CONFLICT (modify/delete): Makefile.am deleted in HEAD and modified in ca59f25 (Makefile.am: pass rust target to cargo also when not cross compiling).  Version ca59f25 (Makefile.am: pass rust target to cargo also when not cross compiling) of Makefile.am left in tree.
CONFLICT (modify/delete): configure.ac deleted in HEAD and modified in ca59f25 (Makefile.am: pass rust target to cargo also when not cross compiling).  Version ca59f25 (Makefile.am: pass rust target to cargo also when not cross compiling) of configure.ac left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
Makefile.am: needs merge
configure.ac: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6070805034564756629==--

