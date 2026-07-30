Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E7BC54FD2
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 05:45:06 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5296.1785390300837843353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 22:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N99HXgeL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4M8P1RNQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019fb18dfa80-33a9b6ef-8758-4144-b93c-48fe6dd1af76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785390299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7wBwqLYUFQGmLkFBg8q3+NCPfNO3STdI36ZIfINOzNc=;
	b=N99HXgeLCC13moPsPr17XJD+BXj5/s4Tcu50zq2ri8wn9h8NB4She/vxx7UU2KLF
	shMKBTUE9NFlPC0IvF0T+FJyV79n867xeUYTm1vFVEDFndgYq8moyTIoGOeSOQ6EVbg
	BCVPwDgnQDoe63XS6cw2S5TYVioJuRSYzDf6fWD4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785390299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7wBwqLYUFQGmLkFBg8q3+NCPfNO3STdI36ZIfINOzNc=;
	b=4M8P1RNQd78pyzMTDQ50Ie4rtXhtJbY+57bekR9JN5ps2NX3NZmtAM2g67FI/O+Z
	PFwFd6/cqIzZ4xaGgzRC+3BD8FxBlpFFdoQOhF5x2mzirNBgTzw2WRxA3wDWhHG9REK
	YQCQRSIRU3Hfy5PKYpgneq2B/6xu2LEW1XvlSiAI=
Content-Type: multipart/mixed; boundary="===============3835576394361294865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 binutils-crosssdk-x86_64-pokysdk-linux,binutils-cross-canadian-x86-64:
 upgrading to 2.47,2.47 FAILED
Message-ID: <0101019fb18dfa80-33a9b6ef-8758-4144-b93c-48fe6dd1af76-000000@us-west-2.amazonses.com>
Date: Thu, 30 Jul 2026 05:44:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.30-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242312

--===============3835576394361294865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *binutils-crosssdk-x86_64-pokysdk-linux,binutils-cross-canadian-x86-64* to *2.47,2.47* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade binutils-crosssdk-x86_64-pokysdk-linux -V 2.47 -S 6ce87bbc521cf46eaee9a1f7ef61cee2cdfb3e32
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1983 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-7a0b83cb193e1d63f1d14d0e66ca18e0c7712bf1"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7a0b83cb193e1d63f1d14d0e66ca18e0c7712bf1"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
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
ERROR: Execution of 'git fetch' failed with exit code 128:
error: RPC failed; HTTP 429 curl 22 The requested URL returned error: 429
fatal: the remote end hung up unexpectedly



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3835576394361294865==--

