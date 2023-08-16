Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE76CC3DA5E
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.174021.1692224342358739658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fPqJ9m7S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZsCrsj8H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a006e48c8-db6f9d06-e48f-4bd8-a88a-73ea1b535687-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TaC8lsmt4p/zHy7l+qHL9aaDzKuuQiGCSAv3Smf1FkQ=;
	b=fPqJ9m7Sm50oSMU0i7CAnfSbnbp3OugEU8Y9VfOUhYDxq/GNJfdxB/kehq7FWFA/
	bfo9V75FFGMwfvsBBCAwJIr5dDs+Uo7t5nVgQxjvbEIw1i7LyKYF0++JCJFxhCJwPD5
	kLt0T8wdZ6XydZyrlCwzhf3u5anuX6Gyh/rSRyHU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TaC8lsmt4p/zHy7l+qHL9aaDzKuuQiGCSAv3Smf1FkQ=;
	b=ZsCrsj8HqqgZWiB6EBq1VnvYhrHv0DU8yGcJs/YScq6eg4NtY9sEvTUoctZvY/tX
	FeDlgftS2ulsD90I4RZD/ecYpZpHa0kWA2wD2oaCgrvKo3vu02KcLsWMmARKg7hGIi7
	ENnvBXtGUKaWxz1o6V5B09UryI5wFgzxl8BftLgc=
Content-Type: multipart/mixed; boundary="===============7628512138607382259=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc: upgrading to 2.38 FAILED
Message-ID: <0101018a006e48c8-db6f9d06-e48f-4bd8-a88a-73ea1b535687-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186156

--===============7628512138607382259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc* to *2.38* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade glibc -V 2.38 -S 78ca34d8c55eee6b0664f9c1d30fcca71077b843
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (00:29:33.029977)
Loading cache...done.
Loaded 1805 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:774f46b5df332375bd05eadff796c636c2730c66"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 30 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 78ca34d8c55eee6b0664f9c1d30fcca71077b843
WARNING: Command 'git rebase 78ca34d8c55eee6b0664f9c1d30fcca71077b843' failed:
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS
Auto-merging time/Makefile
Auto-merging time/strftime_l.c

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Could not decode SRC_URI: The URL: '${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7628512138607382259==--

