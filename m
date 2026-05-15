Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872DBCD4F54
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34824.1778851228960723657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A8BCqmSE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FgIsm+JT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e2bcbe431-0c549ae4-8ae7-47a6-b04d-d4f6d6eed57b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iC5Et2wG1r0GLMJf0t1VdNvzj9gjr1b9dYAgeazgnCg=;
	b=A8BCqmSE6XoNrtFcnOXMoUtjYBB+POffRmph4aD2sVeywFe5+Qu4Sf3hEJYaGibL
	+hgPbY/MnXae5dKOZGaDWdhpsPOn1YTZPO2sWX/QDRuiJ5toM/DvV/Wu+2c7aEKgpgn
	0MZF5VCpklWNeEkAJxozNnsMi6UwwoCZ4zl8DhKY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iC5Et2wG1r0GLMJf0t1VdNvzj9gjr1b9dYAgeazgnCg=;
	b=FgIsm+JTCcfZiqM1cXGQL5ufZFhSDTKE6bk+rX1jMGKBx/uPRfgvOMOVvn+WMSDZ
	BHY6wHR8r3w/FXxBX2SPzEG+vnbff/qR453eDk7puBmjT/AiGGKceS6GzNEQNjZV3jg
	QtoEYgs3r10KrlnILzMM4Knt8INK5zIB0dh7f97k=
Content-Type: multipart/mixed; boundary="===============4537996575321940871=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 4.0.1 FAILED
Message-ID: <0101019e2bcbe431-0c549ae4-8ae7-47a6-b04d-d4f6d6eed57b-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237165

--===============4537996575321940871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libical* to *4.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libical failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-3593e0f540a5e4e3049ecd449cfa94b9fe9df2c2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3593e0f540a5e4e3049ecd449cfa94b9fe9df2c2"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

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
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-3593e0f540a5e4e3049ecd449cfa94b9fe9df2c2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3593e0f540a5e4e3049ecd449cfa94b9fe9df2c2"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   4% |#                                   | ETA:  0:00:03
Adding changed files:   8% |##                                  | ETA:  0:00:02
Adding changed files:  12% |####                                | ETA:  0:00:02
Adding changed files:  16% |#####                               | ETA:  0:00:02
Adding changed files:  20% |#######                             | ETA:  0:00:01
Adding changed files:  24% |########                            | ETA:  0:00:01
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  32% |###########                         | ETA:  0:00:01
Adding changed files:  36% |#############                       | ETA:  0:00:01
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  44% |################                    | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  52% |###################                 | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  69% |########################            | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/libical/libical/releases//download/v4.0.1/libical-4.0.1.tar.gz...
INFO: Rebasing devtool onto de7429887804f8bc1b09a007e3e3fcf911b5641a
WARNING: Command 'git rebase de7429887804f8bc1b09a007e3e3fcf911b5641a' failed:
Auto-merging cmake/modules/GObjectIntrospectionMacros.cmake
CONFLICT (content): Merge conflict in cmake/modules/GObjectIntrospectionMacros.cmake

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libical
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libical/libical_4.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4537996575321940871==--

