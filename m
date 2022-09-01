Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D38ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.12468.1662040788161816739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PkJdF+Ic;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182f959ca02-5d6e4074-7967-4ab6-a222-47f285560c2f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=AQyQ5dTu/VyiLodEOresDUbGamGZyHw3SnDoSPBcD2A=;
	b=PkJdF+Icqe66UsbRD4afurFvvwsd+Fs1nyekhYLpF7LJhv8s57wbBwDFsyRqnbW1
	rPkN6jkfbEyX6ryhXoxQtU3wbXkAnsUNgO2XHP6esn+kimwmRuOsamMxzaN1SBVoYzI
	w+tQjM4rwZtcWG0DuoEFyMXOMPGvmpWSbfayDVlQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=AQyQ5dTu/VyiLodEOresDUbGamGZyHw3SnDoSPBcD2A=;
	b=S/KaKqq2LpYOZzEMMtNCr4CixPRYGTx/chSloq85rdiRteZEAnALpd7qH5C2oP00
	3zBMxwya84ybWwtfT8f9VwAcHNGlySJxvbcdp7EvO/3TC8Z7OilpuBl0PW8ashaEDuL
	xDLKv1j9eO+AQnbvrh89Wc+Bsj+2YRZG4+xDXp48=
Content-Type: multipart/mixed; boundary="===============3956295150008898510=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] pinentry: upgrading to 1.2.1 FAILED
Message-ID: 
 <01010182f959ca02-5d6e4074-7967-4ab6-a222-47f285560c2f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170218

--===============3956295150008898510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pinentry* to *1.2.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe pinentry failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-da4ead305e16fcbc501fedaa2c9e46aaff7ba24c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:da4ead305e16fcbc501fedaa2c9e46aaff7ba24c"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-da4ead305e16fcbc501fedaa2c9e46aaff7ba24c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:da4ead305e16fcbc501fedaa2c9e46aaff7ba24c"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/pinentry/pinentry-1.2.1.tar.bz2...
INFO: Rebasing devtool onto b113cf10f1711be633b428f5289635e20f29d020
WARNING: Command 'git rebase b113cf10f1711be633b428f5289635e20f29d020' failed:
Auto-merging m4/gpg-error.m4
CONFLICT (content): Merge conflict in m4/gpg-error.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/pinentry
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/pinentry/pinentry_1.2.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3956295150008898510==--

