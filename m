Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BB3E776DA
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.64737.1696183991423961769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Kqvm6WXt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Wo3I+YRG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018aec71ba16-27aadb6d-0e97-41b9-a63b-19db5db699fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=kLr4jUR+c2U7mBUOn9ik6NAUfT62QOPCNmNWcKKwilk=;
	b=Kqvm6WXtYTjLvCSIVJ6pAkz340OMLsTX4P7FqurJPH2sC00f3hMtz5x0Om+l1Kon
	VMJMLlpk2vlsUkgWgxsecGV3Vb9wYV7Lm6IRH458Ye6e3J39uioopMkogpGFgsOm2w+
	BVLthMeJUyWtJYDBpuqwJbkRsXNvt7up7sRaMKBg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=kLr4jUR+c2U7mBUOn9ik6NAUfT62QOPCNmNWcKKwilk=;
	b=Wo3I+YRG8N6dEJsebTi1v+4g0f87ZafTvC431ur8HyyoEuXRmQpO/PL36oNWJxAD
	DteEdlK0gTVugJhVFFsCKAB4M0M0hsqzjOS6WiDbsS/+vl+2fHEQEBHYlb33Klzpo6y
	yTP8ceRMHoZm8jWdvmNj/ImH5Lev0rW+l75RFGZk=
Content-Type: multipart/mixed; boundary="===============5194046736253806293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.19.0 FAILED
Message-ID: <0101018aec71ba16-27aadb6d-0e97-41b9-a63b-19db5db699fd-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188547

--===============5194046736253806293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.19.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-43fec4c35ea81bdd8eb06a06069d9e98d5995207"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:43fec4c35ea81bdd8eb06a06069d9e98d5995207"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
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
--===============5194046736253806293==--

