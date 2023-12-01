Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77A0C18E17
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.22332.1701436492423314173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GaEcu01C;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DWNtAOqG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c25848851-f1affd49-5aeb-4576-8caa-5589ce19cf15-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MjQQSlFqyy35jlsFZw8fRarRB5b5NgGTfMzXLkLi2B4=;
	b=GaEcu01CUG7zGO9wRAgEexSY3LV+WwGPkm9qZ6B+LmC28jPsI1Y6zbMq4EJ9SeOk
	Svrt1rREvuJ8y13vXfJj5DGBRQJq+vsdG/AiF0euHET7ky0y2MJhrac4ZsC7dbOmpNz
	nzO9wehQMC3/shzLtAkiqNgO+MAEzmJwGiUw1BHA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MjQQSlFqyy35jlsFZw8fRarRB5b5NgGTfMzXLkLi2B4=;
	b=DWNtAOqGhfV/P6hOiCz+h/rC3gvcNXblAvnnHcw4eLg8gHfNZg6JRrfqZcSr1V94
	4AWKECG4mbtOsaBJZdvqr50B8O8T3DGKkIVNGHUQwR/q6rkscGiOifpFDowDaG07U0i
	BUgNq/1Cwangtz3lZYy25mf3uGjnx2d9klgNjknA=
Content-Type: multipart/mixed; boundary="===============0182584174355607658=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-bootchart: upgrading to 235 FAILED
Message-ID: <0101018c25848851-f1affd49-5aeb-4576-8caa-5589ce19cf15-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191627

--===============0182584174355607658==
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
Loaded 1848 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3120744dc3473547b114abbebcef283403472f92"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3120744dc3473547b114abbebcef283403472f92"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
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
--===============0182584174355607658==--

