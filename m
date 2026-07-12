Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E0AC44509
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 06:31:41 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9639.1783837893996591784
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 23:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kngx2cdr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tac6xa3u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f55062ca5-6c0363d8-5056-45c8-ba52-2654ddf711c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783837895;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=DC8sDrKFk4Fcws68d73hYiYvzns3NENdiX8tzbiLZ78=;
	b=kngx2cdrb4IIdIfUMjjki0DCvzyDmNule6rUTev7uUbZg5O9pAymE3WV/whGRC1X
	W7xp81LyUrcitO45Z9/JIDNuDj7OgQAghLPs2DAKI7IThAZXtLTuWGDzAz7pebt9dY1
	LXzGGtHxFzebFZUX9+RjXxQ5YHx0aWb1G2XZHRkQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783837895;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=DC8sDrKFk4Fcws68d73hYiYvzns3NENdiX8tzbiLZ78=;
	b=tac6xa3uAiw7VXPzCvjIuNFrcmbrOtiSKtrpfsvLS3cMsJS/zMU1XQ2swrZzbjIQ
	LIuIbMtWZCuRpzwx2TC+H+tvzx84if0M+a+Rm5hyMlu70gn0wO2hOHtMq3nO4gtiRVQ
	U5aJIg0jV8o/0G77Oj9ZMD3mTG5Q+w/B7V6rrha4=
Content-Type: multipart/mixed; boundary="===============4430777776890505190=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk-doc: upgrading to 1.36.1 FAILED
Message-ID: <0101019f55062ca5-6c0363d8-5056-45c8-ba52-2654ddf711c2-000000@us-west-2.amazonses.com>
Date: Sun, 12 Jul 2026 06:31:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.12-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 06:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240761

--===============4430777776890505190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk-doc* to *1.36.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gtk-doc -V 1.36.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1979 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0284bfcf6681bc6c9197c2952aa60a3686d4bf64"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0284bfcf6681bc6c9197c2952aa60a3686d4bf64"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
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
DISTRO_VERSION       = "6.0.99+snapshot-0284bfcf6681bc6c9197c2952aa60a3686d4bf64"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0284bfcf6681bc6c9197c2952aa60a3686d4bf64"
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
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//gtk-doc/1.36/gtk-doc-1.36.1.tar.xz;name=archive...
INFO: Rebasing devtool onto 98a6c96839c1e64ff91de9ed0c61edf21023dc19
WARNING: Command 'git rebase 98a6c96839c1e64ff91de9ed0c61edf21023dc19' failed:
CONFLICT (modify/delete): configure.ac deleted in HEAD and modified in 8d43499 (Do not error out if xsltproc is not found.).  Version 8d43499 (Do not error out if xsltproc is not found.) of configure.ac left in tree.

INFO: Rebasing devtool-override-class-native onto 98a6c96839c1e64ff91de9ed0c61edf21023dc19
ERROR: Execution of 'git checkout devtool-override-class-native' failed with exit code 1:
error: you need to resolve your current index first
configure.ac: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4430777776890505190==--

