Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3A7C25B5F
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.17591.1690907329176044908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fYNxXiTi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EX7Mo64X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010189b1ee3ee0-f62aac8a-c692-43e0-9581-b0e3addd45ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1SUsU9UFT7E/xCGeypONhv90OGoMm7TUaBydJg+AaP4=;
	b=fYNxXiTiKXSd2THhjEeC4noRZG6WZMcT4cPrM7rHhZcVeRMBduch1onjacRi7JTW
	DECVikbPPPivtLsEvhDY3E5AuurEMVHgdlb8NeTAaItxYuQHaLNjd9HeVSPD4kblzLP
	A3nscuZVi7Y70FFEvFGvK5Ur+Blql+v6zp+ETZ4U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1SUsU9UFT7E/xCGeypONhv90OGoMm7TUaBydJg+AaP4=;
	b=EX7Mo64XI0ZWaP6ggcWl01iVWgisrZD3zeIRfG5adKWmcSIEw9ZiN0Ph9gbfNVll
	DYfzDcFYsqHuTLwC01m2S5v2Luhb4fdXZ6fikRnaVhaLlsICLHT8Q9/j4VIeIFRWcJk
	sboYPo0zZhcjpm1ESyk7m9vtrfuCONNT2YwzmKIU=
Content-Type: multipart/mixed; boundary="===============8996312855981995715=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Lukasz Majewski <lukma@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-tests: upgrading to 2.38 FAILED
Message-ID: <01010189b1ee3ee0-f62aac8a-c692-43e0-9581-b0e3addd45ec-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185263

--===============8996312855981995715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-tests* to *2.38* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade glibc-tests -V 2.38 -S 78ca34d8c55eee6b0664f9c1d30fcca71077b843
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:23:49.176944)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:37dfea4a99015745a13107286874111b2a6f0789"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 30 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

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
--===============8996312855981995715==--

