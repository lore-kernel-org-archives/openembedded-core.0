Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFB5C4450A
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 05:19:43 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.899.1784351976248680072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 22:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jCb2O4BU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JGj+ju2w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f73aa675d-70e02699-6f76-4907-9a9f-34a5d2458682-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784351975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u8WavZ823qh5LCixw5PYmRk1M9LuhShXcp++w4Bz3rs=;
	b=jCb2O4BU3faQQJx5U0Jy39/w8WSBJ30WoT2BKvf81In9xHSiAgD7Cl/Dqw1uu8ih
	Fzf7kLEtVCqPhXjYn+e7oz2v+uIFZkuBb0ZjGH116oOtW8Ffb1T6vc9xejnhfx6v6ce
	IM51zXl5W65cxdqxZPG80uYt+M/HKxDiuobTnwiI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784351975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u8WavZ823qh5LCixw5PYmRk1M9LuhShXcp++w4Bz3rs=;
	b=JGj+ju2wrxZFNm776viKvrW5F7eDzHCiNUc9xvesgrTPhqP4H9ySIe/T9tla6w/P
	DS4ZBI7UCMFqx+26S+Sin1UZnUSmpQSHxLGTZo2UcReE3geThig/7Ed9h1Rn4/KSpaR
	G+wtOLHtN6p8LXsOaGEshoiWFq0y9/iGRHJ0cRKg=
Content-Type: multipart/mixed; boundary="===============2957942756041831112=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtool-cross,nativesdk-libtool,libtool,libtool-native:
 upgrading to 2.6.2,2.6.2,2.6.2,2.6.2 FAILED
Message-ID: <0101019f73aa675d-70e02699-6f76-4907-9a9f-34a5d2458682-000000@us-west-2.amazonses.com>
Date: Sat, 18 Jul 2026 05:19:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 05:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241233

--===============2957942756041831112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtool-cross,nativesdk-libtool,libtool,libtool-native* to *2.6.2,2.6.2,2.6.2,2.6.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libtool-cross failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-171af3b2915dd076c8d1b205ff75eac1ebd5a586"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:171af3b2915dd076c8d1b205ff75eac1ebd5a586"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 18 Local 18 Mirrors 0 Missed 0 Current 12 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-171af3b2915dd076c8d1b205ff75eac1ebd5a586"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:171af3b2915dd076c8d1b205ff75eac1ebd5a586"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/libtool/libtool-2.6.2.tar.gz...
INFO: Rebasing devtool onto 380a1181d0a24a0e98e98bb8ed656b536ff82f8f
WARNING: Command 'git rebase 380a1181d0a24a0e98e98bb8ed656b536ff82f8f' failed:
Auto-merging Makefile.am
CONFLICT (content): Merge conflict in Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libtool-cross
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libtool-cross/libtool-cross_2.6.2.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libtool-cross.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2957942756041831112==--

