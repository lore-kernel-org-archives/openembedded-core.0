Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A60C369D3
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20173.1744723975601500833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BGzWFWXi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ceE0FvH3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019639a73002-ade48b28-61dc-4688-8ecb-779082f17c39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723980;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=taeMtwkLW3hvEPH52xxX6l1/05283aESZe5is1ZFqaA=;
	b=BGzWFWXidyURddU7jO6uqnIhKQSSvSPTn7g7rEmsffjIRndpapcx5bzouDpgiNGT
	OlLqK9zKKrZ2bS39GPzHKY3OP+AgXWkdMHdErqUpp3SbtXx2K4W5TvpNZwILYb98/h6
	R1UFZ36ztpaGu7vO0Ulf3/XPYaGOFHZv2ZwQU6ew=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723980;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=taeMtwkLW3hvEPH52xxX6l1/05283aESZe5is1ZFqaA=;
	b=ceE0FvH3AfgEc2byTw7i1CxPB/TopQjIEx/56CXi93O5nBh+oc/YyyPtVBjYzAbK
	03bT9/pBIotunJRT9beDL1O324SruyJ/sxHNlQJgPNb0akKJqsMaTHo2mTGy092ZHa+
	SdiItnVcqX1LJWongRZ71Psroo72SL7ykhvln06E=
Content-Type: multipart/mixed; boundary="===============2523080496732122744=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.20.1 FAILED
Message-ID: <0101019639a73002-ade48b28-61dc-4688-8ecb-779082f17c39-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214890

--===============2523080496732122744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm* to *4.20.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4bdc159161f7a82d68c564c0f1ebe376563efc4b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c8dc5ea575a2e9c1488036d12f4b75f6a5a49120
WARNING: Command 'git rebase c8dc5ea575a2e9c1488036d12f4b75f6a5a49120' failed:
Auto-merging lib/rpmscript.c
CONFLICT (content): Merge conflict in lib/rpmscript.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_4.20.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2523080496732122744==--

