Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D027CD98C9
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1566.1780328135645243064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a0Xr+GbL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P3hpGnAE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e83d3b080-9a0e28bf-e5df-49a6-9526-6c3eaf7db3ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lz8Y1ag/4oBB8PdE8UItreFeSUpHjjCTkB3MFbA/t5c=;
	b=a0Xr+GbLoPYVX+mr28b50k0kZ3A7k8+nI8+rdCbfMGmgZeJ888gLGC62+IwaAaN9
	W27JZKUna2fQyYmUuFEoC0g9Hj4LJcxcIvMbu98xcuDYQaWDm2aqTyPnvYEPwCUeORC
	cPiwalkG3ffwLQFMDonc/oZ6YpvMvn5fKU0NMH8Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lz8Y1ag/4oBB8PdE8UItreFeSUpHjjCTkB3MFbA/t5c=;
	b=P3hpGnAEKI8horZQPXUtiaHQcaRx2s6xAkNaisPpxGJgvLULCNFR2yqdHiEiJELI
	5kNhOFYo/h3/3a6y6pwUqUb5t5d+/IhJB+iszzkwwzr/WsIK3ogBPS03FrAdecZ+GZJ
	+YOfV13sHk5MuUutJNoT+bLrPDTXqf7+nij/KowY=
Content-Type: multipart/mixed; boundary="===============6676520546633010349=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 1ba657c3b088bc6672acb3d9851b076e3ec7d3ea
 FAILED
Message-ID: <0101019e83d3b080-9a0e28bf-e5df-49a6-9526-6c3eaf7db3ee-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237924

--===============6676520546633010349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *1ba657c3b088bc6672acb3d9851b076e3ec7d3ea* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe piglit failed.
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
DISTRO_VERSION       = "6.0.99+snapshot-6cda9288ebb14553cfc05f6fb054511aa3b54263"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6cda9288ebb14553cfc05f6fb054511aa3b54263"
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
INFO: Rebasing devtool onto 1ba657c3b088bc6672acb3d9851b076e3ec7d3ea
WARNING: Command 'git rebase 1ba657c3b088bc6672acb3d9851b076e3ec7d3ea' failed:
Auto-merging tests/util/piglit-test-pattern.cpp
CONFLICT (content): Merge conflict in tests/util/piglit-test-pattern.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/piglit
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/piglit/piglit_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6676520546633010349==--

