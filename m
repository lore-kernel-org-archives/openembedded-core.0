Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27ADCD4F21
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15606.1777645529533463501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GGFN+w1C;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dg2AfvWv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee80cb-95f95e53-e088-484b-9694-be6308717a16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c8yvYErjBrzMYQLf+qQNsOuh0+ICCglPguuwr0KM/tM=;
	b=GGFN+w1CEIbhyodNTZzAXid/V5BjHXqGf6UaKvOz+UcBVbTvineYu0lEckkYkYpe
	ocW2MycrV+NaeSbQfZ4G+pox0lRcGA9A495/oJ/a82sN2B5BYis7gsr5rV1ggOlEXyv
	/ctxdq6bhPc/q2YnjN6zqH2LbhLEsyEzuIXm9F5I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c8yvYErjBrzMYQLf+qQNsOuh0+ICCglPguuwr0KM/tM=;
	b=dg2AfvWv6m+GzHSVwWy/Ysd1RAHlJlbuFQ4xntrfpqcn0hqXGSN/JMGcLPuPW/D5
	oMI36CgJTf/Lwde/XlpRZZvMdZqd6Bye83F13GrVSZ7dZFYqH2TWoYIMfcTuljU3hoE
	57vxvywb0j+LT0r4i/0vjii8Jmr3vFBaGerdUGt8=
Content-Type: multipart/mixed; boundary="===============6334457323616813354=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.31.1 FAILED
Message-ID: <0101019de3ee80cb-95f95e53-e088-484b-9694-be6308717a16-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236280

--===============6334457323616813354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.31.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libinput failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-676d9f01245b30431c7442dba733efaa949f8d9b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:676d9f01245b30431c7442dba733efaa949f8d9b"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 1920686963fe224f7d2f4fe195cbed651e11d455
WARNING: Command 'git rebase 1920686963fe224f7d2f4fe195cbed651e11d455' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libinput
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libinput/libinput_1.31.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6334457323616813354==--

