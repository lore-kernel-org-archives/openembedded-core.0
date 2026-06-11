Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24257CD98F2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50609.1781195500092651335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TG9x3a9u;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4t3Pqh3z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019eb7866d90-aeabcad7-24f1-4177-a501-ef3957a2e9f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=unbdJ3YFHLSTBZ4AT1kfHssGMxzLMU9v4+dqtEhHtkM=;
	b=TG9x3a9u3G5BCHReTyjzAyHm82OAmbyL5AZwAarPPKmh6FYe43DWDZBNe4YWbjgD
	05JQuEJTB0GVcIdMbWWVpDp4i9rdZ2B7wbcGKkkRaLmhMMs47y4bvA6irmGoOXU8Coa
	1Z4tvZCxrFzR7Y64x5F81ypUYZKrd3A0iYiBSpLc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=unbdJ3YFHLSTBZ4AT1kfHssGMxzLMU9v4+dqtEhHtkM=;
	b=4t3Pqh3ziAjXnG72QY7ojSVoL1CaWBn15dbhAqX5vzpFZ2LkCGadZWrizGTyqrUA
	SlKVN6a4qqKLC7UVA3oAk5e0H5oRuMkSEirHizfN5lLITk+yplKKLVLVPHMYYG3Hxcm
	CQw+nNVaqAwrcdY7irB6PdDAHrNbJYf9dvp5F2TE=
Content-Type: multipart/mixed; boundary="===============8192168066074124324=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] createrepo-c: upgrading to 1.2.4 FAILED
Message-ID: <0101019eb7866d90-aeabcad7-24f1-4177-a501-ef3957a2e9f6-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238475

--===============8192168066074124324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *createrepo-c* to *1.2.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe createrepo-c failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9544b33457a28084b0d5a5cf9ed4ff290c620c1e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9544b33457a28084b0d5a5cf9ed4ff290c620c1e"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 47ab8a418fb3abd58ef3760a7eace1481610c659
WARNING: Command 'git rebase 47ab8a418fb3abd58ef3760a7eace1481610c659' failed:
Auto-merging src/python/CMakeLists.txt
CONFLICT (content): Merge conflict in src/python/CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/createrepo-c
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/createrepo-c/createrepo-c_1.2.4.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/createrepo-c.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8192168066074124324==--

