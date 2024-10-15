Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68E7CFC293
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:15:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11792.1728994550362789892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TuixfHfE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Kj39wzyY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010192901b1fa9-381b9f78-affc-4a11-afea-f15cd7fe5e39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3nqhYx2NyIgZMFVFcQGD+Jj8jwn3jOmU0cEBzBI1tHg=;
	b=TuixfHfEMJGixKo95GqL2R5sFCMfgyvYf0nBAlbXGaapvafEFVWzpd1Nic55O6PC
	uYiRgH6hLCFgafNu9dP5m3/OTy3AM/vcsAc8nBhdEJ3vssESYlwl+rqYrqSfbZ0Y7ml
	gajrZ/IDjHkESxbYtBcO9AbKNDQBlnecbDB8jKZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3nqhYx2NyIgZMFVFcQGD+Jj8jwn3jOmU0cEBzBI1tHg=;
	b=Kj39wzyY+0lixuGoZzy+ATZP6lU2OATyziuevg2AH7D6Z0TiEvVRO1QxhU20dCwX
	NiMdUynzsM3ZrW7qCcW9Repk+35Lo6LWdtVEVngW/sH2JxV7SAve2ebQ0doBuAQxT3y
	jlXkYeIFZOZP6ssf6baZXm8aQT9UCjMYgk6LVb9g=
Content-Type: multipart/mixed; boundary="===============8691063916704039740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] busybox: upgrading to 1.37.0 FAILED
Message-ID: <01010192901b1fa9-381b9f78-affc-4a11-afea-f15cd7fe5e39-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205821

--===============8691063916704039740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *busybox* to *1.37.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe busybox failed.
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
workspace            = "tmp-auh-upgrades:eee03042390aae28cd9bac6b4f1c8705ba48b5c9"

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
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:eee03042390aae28cd9bac6b4f1c8705ba48b5c9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-skgvckue: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-3uf12f8w/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-3uf12f8w/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  21% |#######                             | ETA:  0:00:00
Adding changed files:  43% |###############                     | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://busybox.net/downloads/busybox-1.37.0.tar.bz2;name=tarball...
INFO: Rebasing devtool onto e07e9098f92bf349bf9904c26d00307ebdb0f2c6
WARNING: Command 'git rebase e07e9098f92bf349bf9904c26d00307ebdb0f2c6' failed:
Auto-merging editors/awk.c
CONFLICT (content): Merge conflict in editors/awk.c
Auto-merging testsuite/awk.tests

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto e07e9098f92bf349bf9904c26d00307ebdb0f2c6
WARNING: Command 'git rebase e07e9098f92bf349bf9904c26d00307ebdb0f2c6' failed:
Auto-merging editors/awk.c
CONFLICT (content): Merge conflict in editors/awk.c
Auto-merging testsuite/awk.tests

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-x86 onto e07e9098f92bf349bf9904c26d00307ebdb0f2c6
WARNING: Command 'git rebase e07e9098f92bf349bf9904c26d00307ebdb0f2c6' failed:
Auto-merging editors/awk.c
CONFLICT (content): Merge conflict in editors/awk.c
Auto-merging testsuite/awk.tests

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/busybox
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/busybox/busybox_1.37.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8691063916704039740==--

