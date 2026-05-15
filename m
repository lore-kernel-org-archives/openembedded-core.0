Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C3BCD4851
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:22 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34745.1778851219799133556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fzN1CJdj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q+UdCIBZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e2bcb85ca-c8570e9c-fc95-4386-99fd-4bc4375730a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6g8V9nlQdaKKooifmJeRIGfr1cVi61iOXG7GtGiHPas=;
	b=fzN1CJdjyLusTG4zbhXudxZfcL6sDNN84CCPcAGHcvJ7LMTf223w+QiTd7ZrTCpi
	FCpzSL5xa+TuQss843K3KYcxPNeaSR13uwHHcXXn7s+oOEs5Vdjyjk0jyd3sxidtmVn
	lzWcL7rHdwNKzB/fxdazY6ndDhMsCSlfXHlPi1k8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6g8V9nlQdaKKooifmJeRIGfr1cVi61iOXG7GtGiHPas=;
	b=q+UdCIBZi6tW4HRd07YJglVBzb8Zl0+PK52ZlodoY/GmrNibRz1h8opQnN4HP4pe
	lGRggVTjJTzUyuqwunY2SSKo42rhh/0ii/FqADC6KhSvxIyQ863nOvdySpwvP1ARB5V
	X1t93eQb+ADq5lTllvhIpzDBMWKmm36B8TeWZiVE=
Content-Type: multipart/mixed; boundary="===============2505946113195534074=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-systemctl-native,systemd-boot,systemd,systemd-boot-native: upgrading
 to 260.1,260.1,260.1,260.1 FAILED
Message-ID: <0101019e2bcb85ca-c8570e9c-fc95-4386-99fd-4bc4375730a6-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237080

--===============2505946113195534074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-systemctl-native,systemd-boot,systemd,systemd-boot-native* to *260.1,260.1,260.1,260.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-systemctl-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-11c852ece75605328103b77451ef56df6a123065"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:11c852ece75605328103b77451ef56df6a123065"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c0a5a2516d28601fb3afc1a77d7b42fcfe38fced
WARNING: Command 'git rebase c0a5a2516d28601fb3afc1a77d7b42fcfe38fced' failed:
Auto-merging .semaphore/semaphore-runner.sh
CONFLICT (content): Merge conflict in .semaphore/semaphore-runner.sh

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-systemctl-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-systemctl-native/systemd-systemctl-native_260.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2505946113195534074==--

