Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789B6C88CB7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.24021.1677681914238595727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Tu7X02Dh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101869da26cf9-330b7d54-0128-4dff-bf36-5dd6331f89c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RU5F+/IxFCaMRPWuFcb/1SKUXRsWP3YPDkIHY8PlFpY=;
	b=Tu7X02DhU4JQ33I2kIWZhb/q/rHDnp6Ucv0Y11zoeyKFkwN99TaOsd8NYN5giRzS
	HqBwKhWmAVJu8DdIWtifGRe8+wpW9fw/OVxDXJc5KxtANTFtOWryOJugMCC1kCJGbNs
	298KQnPncJe+W+92Azyaut0IUaoP0mkYU6Nu7qpI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RU5F+/IxFCaMRPWuFcb/1SKUXRsWP3YPDkIHY8PlFpY=;
	b=hPu61Bs6yd4ZVDJyOoJrG2ECi8LemeiQGcOQyraNskhURx/TZLjvkgCh+xP18gMT
	SrT5BWVmzmCi30CjZ58g8mnyGHqgBqaRZo3/1JJHLJPjxXRpaUEtvjyl+A6eK5CEZ/r
	y0M0lhKFRi/0005aUzD2pWF6jlwYC98O883epTnQ=
Content-Type: multipart/mixed; boundary="===============6228372109506720481=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 253 FAILED
Message-ID: <010101869da26cf9-330b7d54-0128-4dff-bf36-5dd6331f89c8-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177896

--===============6228372109506720481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *253* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade systemd-boot -V 253 -S 477fdc5afed0457c43d01f3d7ace7209f81d3995
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:32:42.457174)
Loading cache...done.
Loaded 1697 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0a96198be305e9ef9e7af2fbec88d3cc64d5a831"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0a96198be305e9ef9e7af2fbec88d3cc64d5a831"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 477fdc5afed0457c43d01f3d7ace7209f81d3995
WARNING: Command 'git rebase 477fdc5afed0457c43d01f3d7ace7209f81d3995' failed:
Auto-merging docs/ENVIRONMENT.md
CONFLICT (modify/delete): src/basic/util.c deleted in HEAD and modified in 83a772aae2 (Revert "initrd: extend SYSTEMD_IN_INITRD to accept non-ramfs rootfs").  Version 83a772aae2 (Revert "initrd: extend SYSTEMD_IN_INITRD to accept non-ramfs rootfs") of src/basic/util.c left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
src/basic/util.c: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6228372109506720481==--

