Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD028CA0EE0
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.12177.1752594941000742249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PbiD4odQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lhAIDHjU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101980eccbac5-8e4fa910-7505-4ec6-9220-032dfc59bb18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594955;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=07rpVRiGeSxDYUPJbLNXvCVaDOppo8b+NAoVqztUufk=;
	b=PbiD4odQEsHZc0AvWHuwtmEV0r9dEXEC+yj8fmGkf5g1mFwXrB0J6dsZwsbL89es
	EGf7ov5XL2ii0wI6ZGlzk1rcBNSvxvYWu+j6oBgACuVPzU4WlNZq6OUxHco3j9hplJb
	H3RX0DLDiQTcs6glDrm+CwcmGdOgp53QRnQbhJfA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594955;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=07rpVRiGeSxDYUPJbLNXvCVaDOppo8b+NAoVqztUufk=;
	b=lhAIDHjUyEqkfFAh5AVqf03L8lM36I1dlIYDXpj1zVjWR0TFCAOJxvwQNKiLhSiI
	Agb4WYX58bY/F27a6kWfSK33NxcizsDSbM8h9m2xCbj2O2mPj58yqoxAnthxUy09aWU
	G9bw0Q6legTLQW08R63SCyDjRhN6vcY346mJE8Z0=
Content-Type: multipart/mixed; boundary="===============2735531422624518569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 2.0.0 FAILED
Message-ID: <010101980eccbac5-8e4fa910-7505-4ec6-9220-032dfc59bb18-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220395

--===============2735531422624518569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gpgme* to *2.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gpgme failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9d9048d2dde49a0557a4b79cd091928d20f3a343"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9d9048d2dde49a0557a4b79cd091928d20f3a343"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1929 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9d9048d2dde49a0557a4b79cd091928d20f3a343"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9d9048d2dde49a0557a4b79cd091928d20f3a343"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  18% |######                              | ETA:  0:00:00
Adding changed files:  36% |#############                       | ETA:  0:00:00
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.0.0.tar.bz2...
INFO: Rebasing devtool onto d7bce8ca050d6561a130e8ec5a7bc9095dd18b29
WARNING: Command 'git rebase d7bce8ca050d6561a130e8ec5a7bc9095dd18b29' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging src/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gpgme
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gpgme/gpgme_2.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2735531422624518569==--

