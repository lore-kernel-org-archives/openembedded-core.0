Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C027110F6FAD
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14743.1775054158428791199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=a2FEsSeH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zSgxApkM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d49792f32-584776ec-f062-4fbb-a322-b6749a377fde-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054172;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L5SxiEIykw+VEfmNSzlVWq3nOuPihJpjJaImwLwgvUA=;
	b=a2FEsSeHuZe2rsu+yePMzv47jdUqeWH5alaqWWkoGZMKC1mUUO80BUS6zcW933eM
	W6tpTzFmpBzcfLVjC/COYVsKZ4f4x+j5P6ok/pq+89dsECNczi/3KASCDjhVE9eDIKg
	RR+R3AGaUkpKW+Dybc6uAazy/LJN7aQB3s8ykVRk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054172;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L5SxiEIykw+VEfmNSzlVWq3nOuPihJpjJaImwLwgvUA=;
	b=zSgxApkMmFd6C1tkxe6FKJBAPsRZ97E5ndRQruli9fGFAeMGitbfkyn4dTZ+KLM6
	AM+fqB/ldttpRNNJMx9K94YHIod4XnPWuTBpSbmhdtNNdwJnC9atmYwUzfhzYhvASCv
	9L0nl+DlJzK78yxOaz66uKP9QXW7C70RkpNBwFcM=
Content-Type: multipart/mixed; boundary="===============7540464361086943605=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 83c1871bc5936e4a759fa18d43226b122b4cef51
 FAILED
Message-ID: <0101019d49792f32-584776ec-f062-4fbb-a322-b6749a377fde-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234415

--===============7540464361086943605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *83c1871bc5936e4a759fa18d43226b122b4cef51* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe piglit failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-3f582bee4649d514bf760da354409436c9b4fbde"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3f582bee4649d514bf760da354409436c9b4fbde"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 83c1871bc5936e4a759fa18d43226b122b4cef51
WARNING: Command 'git rebase 83c1871bc5936e4a759fa18d43226b122b4cef51' failed:
Auto-merging tests/util/piglit-test-pattern.cpp
CONFLICT (content): Merge conflict in tests/util/piglit-test-pattern.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/piglit
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/piglit/piglit_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7540464361086943605==--

