Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050EECDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 05:09:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36452.1782104955148692478
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 22:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=q7RjStzw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=01Hgz2HE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019eedbb9551-3133ad3c-ecf6-4b8c-8f67-dd13df97bcda-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782104954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CNuJ/yBxVnXdF370LY5cWg/c/x+Qil4hByDSyqDOb1o=;
	b=q7RjStzw6zz/P8g2wrim24YfsqlMP1A9pRQzkIAk+XDc4qjFS91VloeFR397Ej73
	ziVXVoLWvjWFsdUG8yBq0t3qFe94S3ByaPph7JQG3fZywItgGhkYb1g7GKgPuMpDIQA
	WuE9N/kYVpuj/3K6AcqTAvAQvasQiJG8Ah/WIRWQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782104954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CNuJ/yBxVnXdF370LY5cWg/c/x+Qil4hByDSyqDOb1o=;
	b=01Hgz2HET8Clql25Hi0ZbS6mvQcck0iMzudc5yFZghsVpaoXJl50akom/L3uHe3O
	InYdblKtxmtFmOEPFZ6g9Lwbfr2R9AAhtjsZXvfZ1H7KLQoQ+POM9pbd0qc/QSt2H0n
	j6HYy8I4yz00iyG9a09M8ffeFe7IlAH0guwIYerQ=
Content-Type: multipart/mixed; boundary="===============0734884189506042842=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.5.0 FAILED
Message-ID: <0101019eedbb9551-3133ad3c-ecf6-4b8c-8f67-dd13df97bcda-000000@us-west-2.amazonses.com>
Date: Mon, 22 Jun 2026 05:09:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.22-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 05:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239263

--===============0734884189506042842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.5.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-numpy -V 2.5.0
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
DISTRO_VERSION       = "6.0.99+snapshot-dd458059aea314e8747bb663a8745f73ee1c0b66"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:dd458059aea314e8747bb663a8745f73ee1c0b66"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-dd458059aea314e8747bb663a8745f73ee1c0b66"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:dd458059aea314e8747bb663a8745f73ee1c0b66"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  10% |###                                 | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:00
Adding changed files:  31% |###########                         | ETA:  0:00:00
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  63% |#######################             | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/numpy/numpy/releases/download/v2.5.0/numpy-2.5.0.tar.gz...
INFO: Rebasing devtool onto a035d6213d4c256255c4e8ff56b942d0184e6b21
WARNING: Command 'git rebase a035d6213d4c256255c4e8ff56b942d0184e6b21' failed:
CONFLICT (modify/delete): numpy/distutils/system_info.py deleted in HEAD and modified in 26c23a4 (Don't search /usr and so on for libraries by default to).  Version 26c23a4 (Don't search /usr and so on for libraries by default to) of numpy/distutils/system_info.py left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
numpy/distutils/system_info.py: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0734884189506042842==--

