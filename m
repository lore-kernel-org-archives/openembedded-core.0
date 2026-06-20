Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE075CDB46C
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 05:56:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1576.1781935002864144831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 22:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZwlMTi7t;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZAbx/iM0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ee39a514c-bc3908e4-0665-404a-9c42-a15a3f552502-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781935002;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tOpR4NPq9y7oiFbz1r3FATpNnlzxzeRzZxr2Mf5WWHE=;
	b=ZwlMTi7tsFzUicj2Wbd4P1wJwpXVp30ULNe1NsOQjYprB4VVV3ZeN6k/smajvu2d
	W/TSdNowRLhEFcwqL5V4kV432AkvtHc2OlhGkb2qfBPEE6ZubcI80CuemnRwAJaFcdz
	lH+DSoczE4baYdZaARBZxuz4KmDePJfat7zuqkmc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781935002;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tOpR4NPq9y7oiFbz1r3FATpNnlzxzeRzZxr2Mf5WWHE=;
	b=ZAbx/iM0RxSYHett/cBGUeOgmBeHoT9EWaywk09IvGwQp3IoqoX66Gx9izCnAi6G
	5kXZKKVKNtLDNzoznsAaXGQF1DjYDjnBHl/xQsujCcoMOqC8mEOFT9CK3ObE0Ne5LaL
	134aDebvlIGSS408O9f04MvH6NKc2gDa8PGbDEYM=
Content-Type: multipart/mixed; boundary="===============6709678167329787478=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd,systemd-systemctl-native,systemd-boot-native,systemd-boot: upgrading
 to 261,261,261,261 FAILED
Message-ID: <0101019ee39a514c-bc3908e4-0665-404a-9c42-a15a3f552502-000000@us-west-2.amazonses.com>
Date: Sat, 20 Jun 2026 05:56:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.20-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 05:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239196

--===============6709678167329787478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd,systemd-systemctl-native,systemd-boot-native,systemd-boot* to *261,261,261,261* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-d595615c6a027b80d6f7ea80ab25e85e97b2436f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d595615c6a027b80d6f7ea80ab25e85e97b2436f"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto de9dbc37ad4aa637e200ac02a0545095997055df
WARNING: Command 'git rebase de9dbc37ad4aa637e200ac02a0545095997055df' failed:
Auto-merging mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf
CONFLICT (content): Merge conflict in mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd/systemd_261.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6709678167329787478==--

