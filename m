Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2214C87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.88616.1754057261605930845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W2G2daPN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=syC9lS5l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019865f5e251-84c725a1-22ef-4345-b9b9-b9f9d7997e30-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K4DdoOfuQRsGSCmamiZorcsqI8urBQ973DMUEFBXKU4=;
	b=W2G2daPNdVGM0cKkQZA3Szf3+xjTkb6vCh4CZ3y5iJG9z3+jHx+YTzZMfvI24S+g
	P7O9x0K4iF/qlB3bmPqSi69V/cFYMVdOxEHKAnyfV6UIV8dTosJK8Hy6IWImCb+wZAi
	uKdNl4CiTZOIjtrftU9E/MEwd/i8EdEXGnZo9gsw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057269;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K4DdoOfuQRsGSCmamiZorcsqI8urBQ973DMUEFBXKU4=;
	b=syC9lS5ly2WFBUi2aKgRngbMeyJX1r3sPi66w1G6exXsMzuv/r6bE2Yn0q+GEArB
	dCJcVc5hWqpG1AM0q8X3NYQzZ8/zvZhgK/GOMF5uwlqYVIOFFyxleuLVLqvNU5SPFBZ
	JPGOv0eDCPFSBWVaww4tv0tMgPp5FCdBkMa6SE7w=
Content-Type: multipart/mixed; boundary="===============7288318432921836520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] automake: upgrading to 1.18.1 FAILED
Message-ID: <0101019865f5e251-84c725a1-22ef-4345-b9b9-b9f9d7997e30-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221266

--===============7288318432921836520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *automake* to *1.18.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade automake -V 1.18.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-59a59f3bbd4cf3d0ed310c67850f8ebf58b83b43"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:59a59f3bbd4cf3d0ed310c67850f8ebf58b83b43"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 9 Mirrors 0 Missed 5 Current 15 (64% match, 82% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 80 tasks of which 66 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801090106.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801090106.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Command '['rm', '-rf', '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.17/devtooltmp-lwlzi6ut/workdir/sources']' returned non-zero exit status 1.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.17/devtooltmp-lwlzi6ut/temp/log.do_unpack.1294641
ERROR: Extracting source for automake failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7288318432921836520==--

