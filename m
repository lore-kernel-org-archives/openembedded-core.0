Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573EBCD8CAD
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:49 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1557.1780328132711460937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ag4ePEuB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=efIS4qh/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d3a3a1-2cc929b1-137d-4f1a-991e-616fb553c4ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=33GqFGckeKWsm+zo3VaFbovdV4ttaShr8v0+mjdW9H8=;
	b=ag4ePEuBbcppeF6etJcbiOjOKeqW/yyoqAuLuIua1MTxADhf/kDym5z+fgFUhnTX
	X1UZ0tN62rIXPNEnpCsinefspn4noDLii83yzD5YQDHZrGmGLcrlE/RSHRHys4+AIc1
	yFbGqGlPu5xy7zTCc3FFOnnVKdL3BM2eMPBIPgNA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=33GqFGckeKWsm+zo3VaFbovdV4ttaShr8v0+mjdW9H8=;
	b=efIS4qh/5r+9CYi+OUh0W6lQEr2TeBHuqsjyXU9QPLhgsJ+L9zR8C4v8hX6xhTUK
	LobeHvSRUeoXsJHnTy3IHPbwpttmmjMr4DqyYD2GcXh5W0thCB13zGT50fK9u1KOjDV
	n51JCmKDYcVJ83v6Qnah21BW/M2I0pWLiu840vcY=
Content-Type: multipart/mixed; boundary="===============4537480516358730682=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libsolv: upgrading to 0.7.39 FAILED
Message-ID: <0101019e83d3a3a1-2cc929b1-137d-4f1a-991e-616fb553c4ac-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237906

--===============4537480516358730682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.39* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libsolv failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f53bfd3ebe431e3d47dc99f99320681640ecb252"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f53bfd3ebe431e3d47dc99f99320681640ecb252"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2f58c6f86edd978d6bdbd87dce9c85388e9b9dcc
WARNING: Command 'git rebase 2f58c6f86edd978d6bdbd87dce9c85388e9b9dcc' failed:
Auto-merging src/repopage.c
CONFLICT (content): Merge conflict in src/repopage.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libsolv
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libsolv/libsolv_0.7.39.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4537480516358730682==--

