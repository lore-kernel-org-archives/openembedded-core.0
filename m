Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B49E7719C
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11333.1735723940986855423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=d+ebWJQM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=p7K9NJUD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010194213579e5-e2f93736-e8a3-4066-b33c-12117289ea0e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723940;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P8oWLk3XF13EysKkS/F8T8qTwomFAm7Ih5lD7XVFm+c=;
	b=d+ebWJQM/xOdy/mHQp/BesWY05SheiQpxTGqQ/y/fns/91T8c8cUlQkk1AT7YA46
	EThs3gCtl4dbWJfT4J59mxhLs5NEUTKGjizfSiY5KkHFgs1WErrgL85q7+ZHXcOfX0p
	U833BKg3f/Ct+omI98zoYgFVdqeNyvhQRVGINkDE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723940;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P8oWLk3XF13EysKkS/F8T8qTwomFAm7Ih5lD7XVFm+c=;
	b=p7K9NJUDyUGSYjzssjH+NH/pTPou3RziahPymzNh93zlRem+f1ynfiWfh8Hs7VnR
	EHMXy+gNntag35l5a3fU00LQHbrd+BxhvkHPPJBa9PdjMtRtZMLl3IrizcZrbFb8LeH
	2b6Hr3bK58AOxwVJbOilj/A9sOWUnzBBQUcoJoK4=
Content-Type: multipart/mixed; boundary="===============3576454255830615075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus: upgrading to 1.16.0 FAILED
Message-ID: <01010194213579e5-e2f93736-e8a3-4066-b33c-12117289ea0e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209203

--===============3576454255830615075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dbus* to *1.16.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade dbus -V 1.16.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:ab8164c7fbe1bf9197571afb1baefcab3a970cc3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:ab8164c7fbe1bf9197571afb1baefcab3a970cc3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-udez3nfu: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-765v9b5w/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-765v9b5w/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  20% |#######                             | ETA:  0:00:00
Adding changed files:  41% |##############                      | ETA:  0:00:00
Adding changed files:  61% |######################              | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://dbus.freedesktop.org/releases/dbus/dbus-1.16.0.tar.xz...
INFO: Rebasing devtool onto b6d4dde566e7ad60dee6eac4256689842f6cd54b
WARNING: Command 'git rebase b6d4dde566e7ad60dee6eac4256689842f6cd54b' failed:
CONFLICT (modify/delete): configure.ac deleted in HEAD and modified in 2c5f0d0 (buildsys: hardcode socketdir to /tmp).  Version 2c5f0d0 (buildsys: hardcode socketdir to /tmp) of configure.ac left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
configure.ac: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3576454255830615075==--

