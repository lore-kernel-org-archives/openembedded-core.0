Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DBED47CAE
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1464.1768526740207822311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GvfhBdIN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mUPwxa3u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019bc468778f-ff59a352-6a94-4e20-8da7-e3d0cb3bb2a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SexDypBAaeqgrBUAMAKaxXjxqakc+L4I0UJ3JIUB6n4=;
	b=GvfhBdIN3F+sHOnoDEVXxLsd5uYGCZm37RhtxYgZ7HboPfMwz0DdwlffXJnXVxGg
	XU51LIPrqfmeGYg8mMPfWbkm45q9x6NAQaiq2yij4rtkcQh07wxwcDgVIrHTltkT3vX
	R17ucrX1JSU0I0gckV7fNdem8lKCfpgXWVEOnn54=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SexDypBAaeqgrBUAMAKaxXjxqakc+L4I0UJ3JIUB6n4=;
	b=mUPwxa3uT0rFjXlT8XR0wcYLgS2N8AGOvekO56ClRF+Z27/pXQ8faALQA+GXMorB
	CxhjPOPYT0Y+BfkBv6gwnpS6e2hmmqUnFfUFxk8Eb2hqcpLtXJtgGvRjfMvvT7m77fe
	nl30/bNkOzEB7FJYMWcukci6NOgqD5+8SqpmYSBs=
Content-Type: multipart/mixed; boundary="===============2566521134507797882=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-boot-native,systemd-boot,systemd,systemd-systemctl-native: upgrading
 to 259,259,259,259 FAILED
Message-ID: <0101019bc468778f-ff59a352-6a94-4e20-8da7-e3d0cb3bb2a4-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229444

--===============2566521134507797882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot-native,systemd-boot,systemd,systemd-systemctl-native* to *259,259,259,259* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot-native failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-beb0a16ac408d741213b635ab6151f5a921bd129"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:beb0a16ac408d741213b635ab6151f5a921bd129"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 9ca433482f2281d71718718705ca8cd3bf562ad6
WARNING: Command 'git rebase 9ca433482f2281d71718718705ca8cd3bf562ad6' failed:
Auto-merging mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf
CONFLICT (content): Merge conflict in mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot-native/systemd-boot-native_259.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2566521134507797882==--

