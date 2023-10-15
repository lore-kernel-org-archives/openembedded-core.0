Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37263C04AB2
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.102661.1697399113972548689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b5/fh0ft;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JeWMWdRT;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b34df0acc-a26c8b44-e0f5-4b40-87d2-bd9f9ee45ea9-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xd+1zKNgF58dhE3dATVomLas9I3X3D1Mxqh9XpCXw+s=;
	b=b5/fh0ftr/KqP+tVfD5d/7sDRXxO2pOKGt+sX3LlKLZmiq+Cu7MuG4MUJYSCpeGM
	GllGh3WMor5zkq+2njrVLPJUaWrQNRkgvMDsiEwjSAFb4Cbenr3H/Sv8g0BO8hZlz1d
	ZmtMW2k35Q7uWdyzFKXKTy9G8pUUZa6R2xED8Fmg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xd+1zKNgF58dhE3dATVomLas9I3X3D1Mxqh9XpCXw+s=;
	b=JeWMWdRTvHQ0EhRy0qBfH+jjkmwcRDGBjJm9J94Fv6JLNmG4p+y4JqD/vsm4LBAN
	RyhAGJ+lBg6K2Yt4HM3K8L/sNX44KEg83ZolHieUg1k100loW4oJDv36ODGnvoDA5I1
	w9+7atpNRg4lBT/A4LsIbH+SgNK7guZFZKS//+y4=
Content-Type: multipart/mixed; boundary="===============7525153524193446232=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.19.0 FAILED
Message-ID: <0101018b34df0acc-a26c8b44-e0f5-4b40-87d2-bd9f9ee45ea9-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189195

--===============7525153524193446232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.19.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (12:58:18.291672)
Loading cache...done.
Loaded 1845 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-8192f941999fe94cb42c67e396cadf8d0d81100f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8192f941999fe94cb42c67e396cadf8d0d81100f"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 66ac70a597ba95517dfb8495e9e1a9ef254c37ea
WARNING: Command 'git rebase 66ac70a597ba95517dfb8495e9e1a9ef254c37ea' failed:
Auto-merging python/header-py.c
CONFLICT (content): Merge conflict in python/header-py.c
Auto-merging python/rpmds-py.c
CONFLICT (content): Merge conflict in python/rpmds-py.c
CONFLICT (modify/delete): python/rpmfi-py.c deleted in HEAD and modified in 84cda9af2 (Add bunch of deprecation/obsoletion warnings to python bindings).  Version 84cda9af2 (Add bunch of deprecation/obsoletion warnings to python bindings) of python/rpmfi-py.c left in tree.
Auto-merging python/rpmmodule.c
CONFLICT (content): Merge conflict in python/rpmmodule.c
Auto-merging python/rpmts-py.c
CONFLICT (content): Merge conflict in python/rpmts-py.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rpm/rpm_4.19.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7525153524193446232==--

