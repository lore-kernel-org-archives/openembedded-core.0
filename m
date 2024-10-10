Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078B4D1A447
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.53300.1728588981179503807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bgdhtI85;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=b2U6NRa8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019277ee9f9b-d3d35624-6dfd-4139-adc1-aa594188041c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588980;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+N7I8ipgH7uYrfjHRy483Cyq29+JHktrYNHt8y5lBcs=;
	b=bgdhtI85LMuj1f5ehBSwb+04XLbKHBXfLYVv5RSaUK0RbpFoOkEBJrsDaDWPX9Un
	76kajWtKxG7SFUBjJ4kFLImORbO1lW8mXaeQ2JiamZ+Mz8VEsfdreatAjgfTT+Ha2EJ
	bdFYgh2jpTmzWvEryy2JtpV2CdE3mJmDANY0HLhs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588980;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+N7I8ipgH7uYrfjHRy483Cyq29+JHktrYNHt8y5lBcs=;
	b=b2U6NRa82NmoP2rvp3eDaziqLj30DRftvzt8zQL8WqQM81UcGe1HI/37yvgqsFdO
	8YN1xEhiSQTT1Or4L4rgq5UHfcN1HrQjYCUvoTVVuTUNbkKiP1RAGgtzzlIncCCsh+Z
	pqcOLtSk1CcAhlSCL2zllurtoZ+Qm7YGwMYorqWs=
Content-Type: multipart/mixed; boundary="===============5044369459103166964=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] openssl: upgrading to 3.3.2 FAILED
Message-ID: <0101019277ee9f9b-d3d35624-6dfd-4139-adc1-aa594188041c-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205558

--===============5044369459103166964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssl* to *3.3.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe openssl failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:2dc5457c4310bd620e0f94e94ab12bf0d0594729"

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
workspace            = "tmp-auh-upgrades:2dc5457c4310bd620e0f94e94ab12bf0d0594729"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-bvm8tjbx: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-pcq4p_q8/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-pcq4p_q8/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  44% |###############                     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching http://www.openssl.org/source/openssl-3.3.2.tar.gz...
INFO: Rebasing devtool onto a45445859f6a95d47b0524b88df0463a5586bde0
WARNING: Command 'git rebase a45445859f6a95d47b0524b88df0463a5586bde0' failed:
Auto-merging test/helpers/handshake.c
CONFLICT (content): Merge conflict in test/helpers/handshake.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto a45445859f6a95d47b0524b88df0463a5586bde0
WARNING: Command 'git rebase a45445859f6a95d47b0524b88df0463a5586bde0' failed:
Auto-merging test/helpers/handshake.c
CONFLICT (content): Merge conflict in test/helpers/handshake.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/openssl
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/openssl/openssl_3.3.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5044369459103166964==--

