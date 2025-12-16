Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7268D5E393
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17188.1765872139220084245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dk0K1k1X;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TMoQ8I2B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262ed25f-dc2515c7-caf6-42f6-b82f-2f342219b7e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XHPSfyagPmmMRBp0zy0Vi5rVi3Un9Rm6eBwg8FUsoeg=;
	b=dk0K1k1XOK5SPt/0az2WqhgapNXZOcRJ4y2LsLgdjXdu36dDK2DTt4q/h404bdwd
	pmmTt+kofG/beyrbSVchfo5Lm0nMhde62PeQ5W8NHSfLPaLG2MAj68Skq7jv+5M+oWP
	qMEi06PO0NGfwMsS0FewiACpQ+16iCxp8bthMx9o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XHPSfyagPmmMRBp0zy0Vi5rVi3Un9Rm6eBwg8FUsoeg=;
	b=TMoQ8I2BDsebV1JDHEO/SA1TJ1TH70dQ76IExOufXAIIxHUaFkF9+uRwWCrgVQiT
	iiF+bSSSQrbjakdDinC2nYoFWkPw/ljm6FmtyQ0Smo0P3RnF4300YNM6mp0oFAPwxg8
	tYqFuc/BKe73GED43zzGNrIMYuJDIvlOxLDLNqS0=
Content-Type: multipart/mixed; boundary="===============3704712581090830897=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.4.335.0 FAILED
Message-ID: <0101019b262ed25f-dc2515c7-caf6-42f6-b82f-2f342219b7e4-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227879

--===============3704712581090830897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-validation-layers* to *1.4.335.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vulkan-validation-layers failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e80eb9eef1ac300602ac042dde54359692774354"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:e80eb9eef1ac300602ac042dde54359692774354"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
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
INFO: Rebasing devtool onto 2e94023f2581aaa7f5a4d6fe0ee670d9b5e10187
WARNING: Command 'git rebase 2e94023f2581aaa7f5a4d6fe0ee670d9b5e10187' failed:
Auto-merging layers/core_checks/cc_pipeline_graphics.cpp
CONFLICT (content): Merge conflict in layers/core_checks/cc_pipeline_graphics.cpp
Auto-merging layers/core_checks/core_validation.h
CONFLICT (content): Merge conflict in layers/core_checks/core_validation.h
Auto-merging tests/unit/dynamic_state.cpp
Auto-merging tests/unit/vertex_input_positive.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/vulkan-validation-layers
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/vulkan-validation-layers/vulkan-validation-layers_1.4.335.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3704712581090830897==--

