Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A346C48288
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4586.1704114719522619721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NhLo7tTR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aGHq+z3N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018cc5270c25-bec1126e-4948-42c9-97cb-d388e99febad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d/Js2WNZuwoyO5dm2Zkw22U/Ld+muJQRoCBT1H9omvg=;
	b=NhLo7tTRAUAu710RzsK7FJiOx8e4I6BMpWQv5cTB96g4rcSFBsK3BIYeaK55IaFD
	UCLz/fxYWMO7lksXf1rDjcdPZeFAyoNbchxd2j3is1GRF72v5EQdtmkevtaLT4iOKoR
	O/2+jnk/kujl546emKtttuJ39eofzAhLaFxvNTi4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d/Js2WNZuwoyO5dm2Zkw22U/Ld+muJQRoCBT1H9omvg=;
	b=aGHq+z3NI5XPBdctwNR5K0qqsbjH5P/3paIGbDmhbCkGxnAGJgQ7lev1OileOXKu
	QFaszUrdnaX7xcHdoPIN9gcy67EApKUzB41kgDIgKs1za4dUAjpI7mv1FDQRZpPU/s+
	qQgJkgtUaqWAkk6Y8WgyfXIiAuU6sMeabxeOxnvw=
Content-Type: multipart/mixed; boundary="===============8628263836292814783=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-bootchart: upgrading to 235 FAILED
Message-ID: <0101018cc5270c25-bec1126e-4948-42c9-97cb-d388e99febad-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193145

--===============8628263836292814783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-bootchart* to *235* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-bootchart failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-93d9344535f50c10db9f31f44b6b9bce5b977132"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:93d9344535f50c10db9f31f44b6b9bce5b977132"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7
WARNING: Command 'git rebase 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7' failed:
Auto-merging src/architecture.h
CONFLICT (content): Merge conflict in src/architecture.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7
WARNING: Command 'git rebase 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7' failed:
Auto-merging src/architecture.h
CONFLICT (content): Merge conflict in src/architecture.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-bootchart
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-bootchart/systemd-bootchart_235.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8628263836292814783==--

