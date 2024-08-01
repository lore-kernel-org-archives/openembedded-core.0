Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5399C5474B
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.75486.1722536823636237147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gnOUw+Wx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=aPPRD3lE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f3224b5-bfa36772-511c-4c15-85de-a3ae87cd307b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5xia2zkwzXnDUOVnhtMehndjddq5S02Ol96mYpdrD84=;
	b=gnOUw+WxU8VpkfFxerKBdJVRubc8gtaUm9WADWscXTPQhY9u6vNOzIs/QLTMTd/G
	C6KI6RP51bqjC91WfrO/4vBKP1+iMjpO2FVi8siLB9OSuNbo8QgFha9d+wxQGclf07f
	09bbi8Re6OOJaHgoipiprdrFkEy21K7XGeaISIbM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5xia2zkwzXnDUOVnhtMehndjddq5S02Ol96mYpdrD84=;
	b=aPPRD3lEI7ysKehf4cDrUO1fbDB6xBEUFXh5eLDveygHQvGx3oWXBKS94Vf7RFJ2
	9Y2z90zoGyVsKuVlA2uSsVpLEnt7Aq754JxUCdIU3mJ03AaSPmkfF45f24CfYuuFnyo
	1ZESj4tDhkhVEvpq3ej27lnxrs28s0eb/9foV31k=
Content-Type: multipart/mixed; boundary="===============5452009722099724495=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cracklib: upgrading to 2.10.1 FAILED
Message-ID: <010101910f3224b5-bfa36772-511c-4c15-85de-a3ae87cd307b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202823

--===============5452009722099724495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cracklib* to *2.10.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe cracklib failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-6a07a1b7ccb67e4a5b53ef0ea58661becdce4ad4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6a07a1b7ccb67e4a5b53ef0ea58661becdce4ad4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 52dcc1114c1fba795735ae34b4fd5e3013ae70ae
WARNING: Command 'git rebase 52dcc1114c1fba795735ae34b4fd5e3013ae70ae' failed:
Auto-merging src/lib/packlib.c
CONFLICT (content): Merge conflict in src/lib/packlib.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/cracklib
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/cracklib/cracklib_2.10.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5452009722099724495==--

