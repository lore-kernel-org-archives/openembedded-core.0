Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0065C3DA46
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:27 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1283.1715794338464214457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=O26BGmtQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2bIY1FjC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f7d4fe79e-b3296b72-ca75-40af-9495-0a6402cd300a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=pWEdAzZ8aqNvJYjJhiUO0gUIhGPseRWMaoS2Xgk6q/g=;
	b=O26BGmtQz70JYboBvo1ay1SraQeiFtLZauS2b5icPn3VeFECTFE/B5UKKZ9l1VWo
	AbQsT5107FysLUbKbuOHuTcqqtyyvAWZRRZ2724z6BtJQsqp6jui9AudDqeH6/p22Zs
	PvecOvPV6j4s+JERT1PWi6gG5hQHcb7g6nanlV8I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=pWEdAzZ8aqNvJYjJhiUO0gUIhGPseRWMaoS2Xgk6q/g=;
	b=2bIY1FjCMBD6gVZU62VH5v1d5mpo8KoWXStvryL9JCq6Ffs7rgNVo/GlbXJPtwhX
	Ixg74elyT0J4MCpBhCediaS4+PTkO4lN/JQEwLHNH6G4GtXJ3JnTILVu+YJ0ehYUDjQ
	OWriuQAl1gfFexlwcnitJ54PAVJd+B81patfQQwY=
Content-Type: multipart/mixed; boundary="===============8550860905415848388=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.8.0 FAILED
Message-ID: <0101018f7d4fe79e-b3296b72-ca75-40af-9495-0a6402cd300a-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199412

--===============8550860905415848388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgit2 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-fac07e24e3c9b4dd71892533a64258c2200cab9c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fac07e24e3c9b4dd71892533a64258c2200cab9c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto d74d491481831ddcd23575d376e56d2197e95910
WARNING: Command 'git rebase d74d491481831ddcd23575d376e56d2197e95910' failed:
Auto-merging docs/changelog.md
CONFLICT (content): Merge conflict in docs/changelog.md

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libgit2
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libgit2/libgit2_1.8.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8550860905415848388==--

