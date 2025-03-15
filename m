Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D564AC36002
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:42 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.10338.1742048300015176170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fS3SF7vu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hS4AWrJn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101959a2bc3ee-389bf540-4dc5-4ce9-94eb-8a1b10b334a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048314;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n6R6/lDIrnVPX+T5UWwIRVaka07bhoEYR+tKAJCtso0=;
	b=fS3SF7vu32geCOTegKM+rZsL50pECFvVXfReiPJ9SBurCa+a4zQRdWjFB7wLQw3y
	XmvsVWaUAfBO8cVCr7062yWNt6qG/nT7qE+He2TTXT1cor0pm/BVreCNNtSIqDa5QT3
	1cJBGZzQGFsuZzjV5zeCIHtWrrbeCup9mj5uW3jE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048314;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n6R6/lDIrnVPX+T5UWwIRVaka07bhoEYR+tKAJCtso0=;
	b=hS4AWrJnRvZIOo2lwL8e7v1lXjhFK7fvJGDjFShg0Hoe5UVynv9D1LDtYECHGV9q
	SYoyrWXVNSSYSQvJnQ886P7895/PH5CtR0BQ9NBWrUElNA6hYtszZYwYA7fZhYGqG6j
	fbeHfSOSmtJUKEbtVjGV1PV+mfcSJfYd++X+Cx2s=
Content-Type: multipart/mixed; boundary="===============3356335248006576089=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmod: upgrading to 34.1 FAILED
Message-ID: <010101959a2bc3ee-389bf540-4dc5-4ce9-94eb-8a1b10b334a6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212957

--===============3356335248006576089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kmod* to *34.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe kmod failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:32efa7393b5095acba65927cbe6b9a020194cfc7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c4f9d944940550b0cb36e071bca995706c1bb6fa
WARNING: Command 'git rebase c4f9d944940550b0cb36e071bca995706c1bb6fa' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/kmod
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/kmod/kmod_34.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3356335248006576089==--

