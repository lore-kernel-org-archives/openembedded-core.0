Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A5CC55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:23:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10706.1785824635884500464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GyISIexA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wd/9UBMN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019fcb7166a8-e6965d34-419e-4aeb-b32e-e7930493d791-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785824635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UYOSd91VqSzWCcWWjvXUrxk2A3g3/ssFVj3fFOcjUKg=;
	b=GyISIexAWe41iFm9jeZO2T6CKec0BBQqyF0VxKJpPxO8ZrMfRPwmnNOnfFOGCPxi
	p6WtqX73UMQsjDxbyFe93theAVQARe+ecePTZh13ptlkC7DuZzEhOfzGwDZG9S1La4W
	jz+744Y6gMen6RVsVrjehaTz5WCylxTqAoKXaSJQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785824635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UYOSd91VqSzWCcWWjvXUrxk2A3g3/ssFVj3fFOcjUKg=;
	b=wd/9UBMNlplVewhT4pxjxMZ/q+92p5EbCQieOUUkCs4kB336hlWgo9UvDQ0Xcan1
	/wk2PqnFaRb3PGo8pbGSX+I1HkTOkLdSw7MvkyoqqSDZ6/IeubxqmV3SCTY1OAQug2+
	Ky2nGl0ZvCoopZwTxqy2Ifo1Qvi491sRZrrrKdsY=
Content-Type: multipart/mixed; boundary="===============8404292904977372516=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jan Schmidt <jan@centricular.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-rs: upgrading to 1.29.2 FAILED
Message-ID: <0101019fcb7166a8-e6965d34-419e-4aeb-b32e-e7930493d791-000000@us-west-2.amazonses.com>
Date: Tue, 4 Aug 2026 06:23:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.04-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242704

--===============8404292904977372516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-rs* to *1.29.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gstreamer1.0-plugins-rs -V 1.29.2 -S 2859bf0fa0097651193ea4b80532d7ffe46b11e9
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1988 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-2faf8e366df74aded7898904b72317521a08e2f6"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2faf8e366df74aded7898904b72317521a08e2f6"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 2859bf0fa0097651193ea4b80532d7ffe46b11e9' failed with exit code 128:
fatal: unable to read tree (2859bf0fa0097651193ea4b80532d7ffe46b11e9)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8404292904977372516==--

