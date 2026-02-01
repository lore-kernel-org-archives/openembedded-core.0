Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88467D73E86
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:55 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29184.1769951561247612160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=c/Z134tu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=inurHGZb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c1955b605-513a58f3-4690-4008-9b75-b2f4b0e2f410-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4PYs7b/v03P1w6dtXm/3TKOirm75A9R/o51pEm15wnw=;
	b=c/Z134tuXzSaKXeK52XF+pEMYxFk7MAVT968NSDt6DjwzU89MP3amVn2TIfoB4uC
	Bfcpbz9p4XWLuU6X0TIWeM7fUqZsJAj5UdiwByybc120QzoIxKWoIGSYLvAfbcXCvu6
	7O6gB/9Q68C7tjXXLcutkMyIpbMtpco6q0yS0M5Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4PYs7b/v03P1w6dtXm/3TKOirm75A9R/o51pEm15wnw=;
	b=inurHGZbC1R9jOdMz2s90S3PB41vz+iikQJ7zpeDIx9sjWZjs8VYbFlx7mNoNrG1
	+lD8rTg1ZbC8L0lroacMcVQ0eFuP5rWc6YdNySuS83es/sp0i2KBfOjXqLfSUJJaC2q
	aj2IHYbYeIivR4ZrEVTQO/u596BD9O3vImd4ZqV8=
Content-Type: multipart/mixed; boundary="===============5776728188116885815=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20260130 FAILED
Message-ID: <0101019c1955b605-513a58f3-4690-4008-9b75-b2f4b0e2f410-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230301

--===============5776728188116885815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ltp* to *20260130* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ltp failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1957 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-c15062d0163004cbee33b6cbb7b06b8017d7c9f0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c15062d0163004cbee33b6cbb7b06b8017d7c9f0"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 6a60ae592cd375f004df0694efc7d50ddae9aa5e
WARNING: Command 'git rebase 6a60ae592cd375f004df0694efc7d50ddae9aa5e' failed:
Auto-merging configure.ac
Auto-merging testcases/kernel/syscalls/listmount/listmount04.c
CONFLICT (content): Merge conflict in testcases/kernel/syscalls/listmount/listmount04.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/ltp
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/ltp/ltp_20260130.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5776728188116885815==--

