Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC40C531C9
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 05:53:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34890.1784958787987062769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 22:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yglr2OEM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=c6puisdz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f97d59d98-bd62431a-0702-411c-a59a-629dc321eb75-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784958787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9c/hUS5+U3p3FZjC7asOYjpcIzrv3JoehYaggc/Z5gs=;
	b=Yglr2OEMWxSP/C5ZsYjXojm+BxK64gyKdDdElXEcs8viRiJC9FxMmsDqnEWg2qfq
	noPFD6FikSxR7pES+PLqlEbbUeiPID9upy46psE4w6wCzUaMz91HDOQL8xbFNRJOh8m
	EIXYDlz9ITW9p84N9JA0siL0MH0tq1M4ZVAwfG0I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784958787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9c/hUS5+U3p3FZjC7asOYjpcIzrv3JoehYaggc/Z5gs=;
	b=c6puisdzuF0O+923+2PYipIk0WeVi8Yt1tjGQn8QFPgwQ9vJ79bpr4qKTKaXP3YI
	QMf51nrMk1fvCoNTQznIgvC+lMC8n37m8vAe1TGM+82ubdoGplsjr7qPgbxcZZcXoTc
	9soijJy04m56Bsd0qTMCjWbZQTl8txq72NpT6ZaU=
Content-Type: multipart/mixed; boundary="===============4723964903124001812=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cross-localedef-native,glibc,glibc-testsuite: upgrading to
 2.44,2.44,2.44 FAILED
Message-ID: <0101019f97d59d98-bd62431a-0702-411c-a59a-629dc321eb75-000000@us-west-2.amazonses.com>
Date: Sat, 25 Jul 2026 05:53:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.25-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 05:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241958

--===============4723964903124001812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cross-localedef-native,glibc,glibc-testsuite* to *2.44,2.44,2.44* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cross-localedef-native -V 2.44 -S 84df13f8ebc1fb95ace9e5529694d73f6fa04e39
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 953 .bb files complete (0 cached, 953 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9d89b3b802bab144afa30e03b0411ae58232ef11"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9d89b3b802bab144afa30e03b0411ae58232ef11"
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

INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git fetch' failed with exit code 128:
error: RPC failed; HTTP 502 curl 22 The requested URL returned error: 502
fatal: the remote end hung up unexpectedly



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4723964903124001812==--

