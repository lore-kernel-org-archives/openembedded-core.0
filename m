Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84871C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:50:03 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167393.1783403394067245227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dIHt/FPc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Bj5h223g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f3b203067-28567cdf-29da-4026-a3fd-2a5cb1428057-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783403393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H5Fp9vb8jS6T2QYkjWunu8livQ6eUDhjN81uCLw50d0=;
	b=dIHt/FPc+uCNvxQnDTBsyCUpSJWG1DiCqGqgxRA0GWVWqwe+LC0nL90RKmSrxT5B
	anMKddCJtdOdAiF4LhYm624sIJZrkvORLHt+HLkl9A9RoE0NjYUACVtHr4K7yIlKQmq
	ray/UbjuGVN7a4aHnHZui898B++4fAets4nFlHBY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783403393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H5Fp9vb8jS6T2QYkjWunu8livQ6eUDhjN81uCLw50d0=;
	b=Bj5h223gC4tYEjDEYt7ykU/Jxr+upcG0zohUKFNOCxit0ZFAQzbsGYPC+AyvEIXw
	p1MbFu3TXOOAQT/Ub2leELckUiPNG4VIqAxKV9eeMof5Ky+vFrXCPdqT2OyMT5gpvqb
	UK2au67dCd5oTVeaGUs+bzhtoCV9o9O8U2fPcCTQ=
Content-Type: multipart/mixed; boundary="===============2798985878288341371=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot-tools,u-boot: upgrading to 2026.07,2026.07 FAILED
Message-ID: <0101019f3b203067-28567cdf-29da-4026-a3fd-2a5cb1428057-000000@us-west-2.amazonses.com>
Date: Tue, 7 Jul 2026 05:49:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.07-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240351

--===============2798985878288341371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *u-boot-tools,u-boot* to *2026.07,2026.07* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade u-boot -V 2026.07 -S ece349ade2973e220f524ce59e59711cc919263f
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1979 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (951 cached, 1 parsed). 1982 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4c6d47c608965907acbec70ac2eee2119c13e6d4"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4c6d47c608965907acbec70ac2eee2119c13e6d4"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
ERROR: Execution of 'git fetch' failed with exit code 128:
remote: GitLab is not responding
fatal: unable to access 'https://source.denx.de/u-boot/u-boot.git/': The requested URL returned error: 502



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2798985878288341371==--

