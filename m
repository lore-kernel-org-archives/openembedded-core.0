Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF81FEFCBBD
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28791.1773582111946183869
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZlGjIpYb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zv+bxe+m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019cf1bb5b9d-37f8804c-cc60-45d1-a727-1dee602cf7ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U57os+I3Gyiy5pBBRQUUeFdvTm9a+uy8+RcOBOKUP7s=;
	b=ZlGjIpYbfjH0gj3XDVNKThEP0GXSFjqgmj5Afpvhl53mY69qHbjFDgEwbeT1QY9P
	ZCyksMgXyXxUnOw0ZC+49+LEocFkoRJkvfmvBdNnm28V/YVRILL+3oWuoNQ9+Qmaorq
	wgNTgH9NsRlmFuiyzKznSe6sZ0K3XHhZvUeyiuRs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U57os+I3Gyiy5pBBRQUUeFdvTm9a+uy8+RcOBOKUP7s=;
	b=zv+bxe+mIUnfgenwBx9zsT2R1nBIKw+jVELRQ2H6soBNYbUKCDDBIl3faQlmSb3D
	UyvTRBZvKmrDcJRVDOYHOSNpYlAwtrjw59MAjzGltE9LR51e09awW14Az9d0vJEtDc0
	TMjGaTAaLeKMMKNX0BXoGkX1h1e5e0SgJ8OZrHMU=
Content-Type: multipart/mixed; boundary="===============7507519567303271472=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] rt-tests,hwlatdetect: upgrading to 2.10,2.10 FAILED
Message-ID: <0101019cf1bb5b9d-37f8804c-cc60-45d1-a727-1dee602cf7ca-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233125

--===============7507519567303271472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rt-tests,hwlatdetect* to *2.10,2.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rt-tests failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1971 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-c7b5a9d9267ef6c157b5b3df5ab9f25ff34c448a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c7b5a9d9267ef6c157b5b3df5ab9f25ff34c448a"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 40b14a2aac9449dfb07d4f9b4bd873fc3ea62f28
WARNING: Command 'git rebase 40b14a2aac9449dfb07d4f9b4bd873fc3ea62f28' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rt-tests
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rt-tests/rt-tests_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7507519567303271472==--

