Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559C4CD98D8
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50606.1781195498768837415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L+9rrfr+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KJuQIwvq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019eb7869ddd-d7b5b986-b47b-4ac9-9f08-eeb9a9151c97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c0Dm5Oh2AFJ7lI2v4jbpycyW/A+myBgxMkavVTg8lGg=;
	b=L+9rrfr+fORXYeQ3xZUdvAkMP6AGETzvajI+/aFPvoUlXLOPw+yA50yWWRAf5sKX
	FgMkqBXH8DmfX7E58fRixO2awoLsV92z2SQIuhoP8U/AzN/RPw2+kXWyl8DO46K09Zi
	CClo4Nwr3dQMenlToQAm/SsOnmjkzVKm8VJ9sBds=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c0Dm5Oh2AFJ7lI2v4jbpycyW/A+myBgxMkavVTg8lGg=;
	b=KJuQIwvqp5KcaC25D1YxL/p5KDJyEq6XySiuZeuJ5y15nLGNY8SeQFd2dI6ZyKzK
	i/y0UNhlZEt89yZLIscYkij/qF4nUmsCKPv0tNWJPkoJMvXtcRDncn6Mwl8H8az7CR/
	mou1xGmOCGAQevvHVjC5t1nMK4z+lPzAZlEqDh/0=
Content-Type: multipart/mixed; boundary="===============0755879579904157885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gtk-doc: upgrading to 1.36.1 FAILED
Message-ID: <0101019eb7869ddd-d7b5b986-b47b-4ac9-9f08-eeb9a9151c97-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238522

--===============0755879579904157885==
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
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-7f5b2ff913ed04ad3baf56004c4a177b2f7ffc59"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7f5b2ff913ed04ad3baf56004c4a177b2f7ffc59"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-7f5b2ff913ed04ad3baf56004c4a177b2f7ffc59"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:7f5b2ff913ed04ad3baf56004c4a177b2f7ffc59"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
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
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//gtk-doc/1.36/gtk-doc-1.36.1.tar.xz;name=archive...
INFO: Rebasing devtool onto 75076d305aeb1f6bff32ce96ff354e7febab2b06
WARNING: Command 'git rebase 75076d305aeb1f6bff32ce96ff354e7febab2b06' failed:
CONFLICT (modify/delete): configure.ac deleted in HEAD and modified in 0db4497 (Do not error out if xsltproc is not found.).  Version 0db4497 (Do not error out if xsltproc is not found.) of configure.ac left in tree.

INFO: Rebasing devtool-override-class-native onto 75076d305aeb1f6bff32ce96ff354e7febab2b06
ERROR: Execution of 'git checkout devtool-override-class-native' failed with exit code 1:
error: you need to resolve your current index first
configure.ac: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0755879579904157885==--

