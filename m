Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321C5C3DA65
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1297.1721071145994729933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bL+WXFoc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=aUS8fCxH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010190b7d59131-e968c492-9e13-4690-8435-23c3ef746a97-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vo98U+IDTPwXmVSj+PI2CvbHkQbPuVccqhdZoNoQJ1w=;
	b=bL+WXFoc++Wp4MEvOUmaKcewF3QcP3epdLTDAo+qpoYFHsf+6xU08bXxUAdNPBw4
	1oxneQGCXpgJMk2+bZm5cT7LqL/MncOiNodSrzuH6OFfaH0BiRXbQD2EbS+CzK/PJji
	+gqnJzU4KkrGoRbH6vEsX3hwWBbiS7GpJFl5+OO0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vo98U+IDTPwXmVSj+PI2CvbHkQbPuVccqhdZoNoQJ1w=;
	b=aUS8fCxHzeopgxrT0d2S5Nx/emgq37/Eib69oN0JStZRKiIU0wcEJDnZbVYoFvEF
	V9F/dPAGxel9YQ0p/NwQDy8awlqUGIbUg5dX3KjEWPYShu82lbeK11Kn1BD3xhgkkJh
	x6d5BHZFsa5vRf1KBwlK1u2x+eFp3bSf197GYNV4=
Content-Type: multipart/mixed; boundary="===============0430699085522999290=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] automake: upgrading to 1.17 FAILED
Message-ID: <01010190b7d59131-e968c492-9e13-4690-8435-23c3ef746a97-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201954

--===============0430699085522999290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *automake* to *1.17* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade automake -V 1.17
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-1902de790669bf395831cd462d9fe010ccdce850"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1902de790669bf395831cd462d9fe010ccdce850"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 9 Mirrors 0 Missed 5 Current 15 (64% match, 82% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| rm: cannot remove '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.16.5/devtooltmp-jlo7ympb/workdir/sources-unpack/automake-1.16.5': Directory not empty
NOTE: Tasks Summary: Attempted 80 tasks of which 66 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715083603.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715083603.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: CalledProcessError(1, ['rm', '-rf', '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.16.5/devtooltmp-jlo7ympb/workdir/sources-unpack'])
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.16.5/devtooltmp-jlo7ympb/temp/log.do_unpack.233647
ERROR: Extracting source for automake failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0430699085522999290==--

