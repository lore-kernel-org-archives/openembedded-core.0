Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0F1CDB488
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.102720.1697399115768735422
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HNZY6r98;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EjvcS4VF;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b34df108e-e7716d1e-c1c7-46db-b380-69403dab3b26-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399116;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kspVKQGrgkUO+KUeEg3LQESGxtUh4o67plgC4XceNVM=;
	b=HNZY6r98Eq5REwdfUhZOOkpnkhskPt/ARnKTxsAV6Q1leb7Ty8aglfjvHJFHMR3c
	uURlCZ5N6FnEb1UXNkRG83aTgB2QQPvprr6r8s497SZLARFR5UCR5qE0DJBzirkmKw8
	uHbfDk8Fa0Uq4+Wp2z5oZbOM6J9LawlDjgFnCyIc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399116;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kspVKQGrgkUO+KUeEg3LQESGxtUh4o67plgC4XceNVM=;
	b=EjvcS4VF9Z4tDMIRhU3zs5ELUtuoM2itgkJ0D0GBlHKl68VFcHC76MaeC+7Rx9gb
	LfPnTv1tbAM3CqEwg+cAY1mOVX+Nxvv4MjIdqwPVtzTOiq5muxSZRbaBIWy0IJE+LHw
	i/0KK19pVdjSvD4VpF55LEzYB2f79F4J6xKJrdJg=
Content-Type: multipart/mixed; boundary="===============3965261851533918930=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bmap-tools: upgrading to 3.7 FAILED
Message-ID: <0101018b34df108e-e7716d1e-c1c7-46db-b380-69403dab3b26-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189242

--===============3965261851533918930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bmap-tools* to *3.7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade bmap-tools -V 3.7 -S d84a6fd202fe246a0bc19ed2082e41bcdd75fb13
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1846 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-89a8968b7ff008effb4ff550f6f6f0a79e43b6af"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:89a8968b7ff008effb4ff550f6f6f0a79e43b6af"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision d84a6fd202fe246a0bc19ed2082e41bcdd75fb13 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3965261851533918930==--

