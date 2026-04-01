Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C1D10FCAFC
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:08 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14649.1775054158767052482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rGN08QLV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H7bSjSuB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d49792014-1ae5ab8c-8cdc-4ed8-af7f-8f6978d5c60e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OjotFEx7GiKpyB1ivnitmVdtvNWTxIotr+w3hA9Fxo4=;
	b=rGN08QLV2G3sOyhuCfHEuYUDzyMUlFZVtpZKxzBOk5iJawW6SBeKeES+vBxTicMC
	UhxCfLDrhzJec0crKrEMximXaOScDxeo5wUXMWfGDYwbRNIKrZeWg9CfsYymoSppQod
	goJKeFgF7hbM/6opa46vjyc7g5UFSLDqdNLLfrb8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OjotFEx7GiKpyB1ivnitmVdtvNWTxIotr+w3hA9Fxo4=;
	b=H7bSjSuB23VbjTfqFL+ebd5vxMJrq/TNkbHU6eifd5jG7Udcu308EJLLPmPgeRVj
	ZPMhILyNS0RfF4+ZDlHRJbwLRdJnFZpXkrf7fNyK5PlcHX4w6d3brM3bAAxm8FlVNpe
	OVuPJoLPS6NiK8dBIzyvuyHdSL51KBJ8gSWns6aM=
Content-Type: multipart/mixed; boundary="===============5906677126476427512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mdadm: upgrading to 4.6 FAILED
Message-ID: <0101019d49792014-1ae5ab8c-8cdc-4ed8-af7f-8f6978d5c60e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234402

--===============5906677126476427512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mdadm* to *4.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mdadm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-deb3d168e9e4a1187a541d8e8c86e5815369ffad"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:deb3d168e9e4a1187a541d8e8c86e5815369ffad"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8b414a0d4753693d67b9a5822994e5f0c91b0b0a
WARNING: Command 'git rebase 8b414a0d4753693d67b9a5822994e5f0c91b0b0a' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mdadm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mdadm/mdadm_4.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5906677126476427512==--

