Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE18C5473D
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.75740.1722536824022174707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bDnw3v2Z;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1mQQWhfK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101910f320960-ac4a9f31-3599-4264-b541-ca627e11a72f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=73ERU3ckLaNbVjh3/9cUpQpwPDeZx3rbQWlkUyJUD58=;
	b=bDnw3v2ZnbePPvK20lAsd0xCUHgROu7nnBEEX9CReWSZgP5Moker2BeK34rt5A8/
	85yUSJHRgw7+rG8OUFU411CkrhyiWLyOITl/paheJnPo0TArLLYqke4vlhq08O9GZZK
	9zc9tfYIiLEpy1MJqOJAlmyKlIPhh37d3gbmYA0E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=73ERU3ckLaNbVjh3/9cUpQpwPDeZx3rbQWlkUyJUD58=;
	b=1mQQWhfK0cf2UzWsW3D4rbQYUPv76f5tIhcZWsQC1ujwulQiAOW+9Al2iKbum3kb
	LhqEQh+rr1b+IRWM9ceVsdOsA6RWHcVOlqzFvpq9k8RwqcRKjW7inLwztM/GciDaYYl
	HRvp9TGsabI8j3e1oQQ9JAnn+NmvMw11EEObcoig=
Content-Type: multipart/mixed; boundary="===============7100952405453471368=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] automake: upgrading to 1.17 FAILED
Message-ID: <010101910f320960-ac4a9f31-3599-4264-b541-ca627e11a72f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202783

--===============7100952405453471368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *automake* to *1.17* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade automake -V 1.17
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-673920ce704e80c8fe2aaf7763f50d3c6fd1fda6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:673920ce704e80c8fe2aaf7763f50d3c6fd1fda6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 9 Mirrors 0 Missed 5 Current 15 (64% match, 82% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| rm: cannot remove '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.16.5/devtooltmp-gxtskbfh/workdir/sources-unpack/automake-1.16.5': Directory not empty
NOTE: Tasks Summary: Attempted 80 tasks of which 66 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801090510.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801090510.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: CalledProcessError(1, ['rm', '-rf', '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.16.5/devtooltmp-gxtskbfh/workdir/sources-unpack'])
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.16.5/devtooltmp-gxtskbfh/temp/log.do_unpack.1688638
ERROR: Extracting source for automake failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7100952405453471368==--

