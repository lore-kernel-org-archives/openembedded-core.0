Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B598EE9A052
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1406.1771440093880767134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H+HOW+9w;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mj0mAniX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c720f0db9-cd14f163-5ce1-464e-b02f-64871400b3ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cBuGv96iG7u5RUIBAK1sd2uKR+SkgnbNw6QQhw2FsKU=;
	b=H+HOW+9w2nQSX1GjhWUdr2vyyrZu+DoICcY9jerZSGUpdPMoq/uaQdR6EfPp5/Gy
	+bAJnruIeJ0k5H+17/hFukV1GyuRS4HOeICgIjrtH8hojWAYGxbieURgs9h12I5jvyB
	FJeMKEg+sLuqOddh6i0RYGi2DmrUHJI7x/mzKiPc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cBuGv96iG7u5RUIBAK1sd2uKR+SkgnbNw6QQhw2FsKU=;
	b=mj0mAniXPDcMxeKAoN+tlKs+v1BmPe0dXQk+dTkdRPMf5OwKJCtA1EU0Zx7mhLC0
	/CfhZeHnY74I25rmPlk9PwFPWLRok/P3Nn2MDNMO+qXhup1KBUTXJosf+rRoYIDJKas
	YqG1dzzMeTVMgBVu45gMiNB+8F3mKLUZYqGoPtdU=
Content-Type: multipart/mixed; boundary="===============5091262098986039672=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vte: upgrading to 0.82.3 FAILED
Message-ID: <0101019c720f0db9-cd14f163-5ce1-464e-b02f-64871400b3ef-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231407

--===============5091262098986039672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vte* to *0.82.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vte -V 0.82.3
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-33f0fc5af2641f3046b98cbf062fcde5481374b6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:33f0fc5af2641f3046b98cbf062fcde5481374b6"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1953 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-33f0fc5af2641f3046b98cbf062fcde5481374b6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:33f0fc5af2641f3046b98cbf062fcde5481374b6"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//vte/0.82/vte-0.82.3.tar.xz;name=archive...
ERROR: Execution of 'git checkout devtool-patched -b devtool' failed with exit code 128:
fatal: 'subprojects/fast_float/.git' not recognized as a git repository



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5091262098986039672==--

