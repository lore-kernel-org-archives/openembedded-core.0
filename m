Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF885C369C4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:32:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.20163.1744723971422604722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VfarEMu0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Lfx4sZJX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019639a71690-582c9a14-1472-41aa-b343-78147431a065-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723973;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/X9Bg6sX3qw30GN1Tjccyol7hIsg3QnXENIN74ZZgE0=;
	b=VfarEMu0p0+YnwVvmjkmkevBtKx96pZ3Di5ddjbghx7w3i3jy0rYq8PuZa43AoTJ
	lyO8vukQRQ6aHRuk0HCxzOw/GkNs6xeaFjaEZLpnhSO2kQp4REW2/RzeYH0n4xaknS4
	IS2onZHbXgiJyxGBTEDY/dSyB5Z+yTjXfPCquygg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723973;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/X9Bg6sX3qw30GN1Tjccyol7hIsg3QnXENIN74ZZgE0=;
	b=Lfx4sZJXMdqyyEuD8R5oFxC4maPXXFnAi+nxFukvs24m5fgc4FO6OBONoMIo8u8p
	TVhj9+cwMNF4p64+emF8y+/YBJHhxtb1Lt4/+QPQMC8pdmWNbhfLlmGt4vFzexIhg/C
	Vx/V1D2dnp8PjjrvFh8D6XVcO4wEQBD+jTWc4d0s=
Content-Type: multipart/mixed; boundary="===============0725146694836894409=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patch: upgrading to 2.8 FAILED
Message-ID: <0101019639a71690-582c9a14-1472-41aa-b343-78147431a065-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214866

--===============0725146694836894409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *patch* to *2.8* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade patch -V 2.8
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:964c9c6e2214e9db587f64b1d28812f62f89116a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 9 Mirrors 0 Missed 2 Current 18 (81% match, 93% complete)
done.
NOTE: Executing Tasks
WARNING: patch: the directory ${WORKDIR}/patch-${PV} (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/patch/2.7.6/devtooltmp-mn978cx0/workdir/patch-2.7.6) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
WARNING: No source unpacked to S - either the patch recipe doesn't use any source or the correct source directory could not be determined
Log data follows:
| rm: cannot remove '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/patch/2.7.6/devtooltmp-mn978cx0/workdir/sources-unpack': Directory not empty
NOTE: Tasks Summary: Attempted 95 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415072009.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415072009.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Command '['rm', '-rf', '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/patch/2.7.6/devtooltmp-mn978cx0/workdir/sources-unpack']' returned non-zero exit status 1.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/patch/2.7.6/devtooltmp-mn978cx0/temp/log.do_unpack.1840136
ERROR: Extracting source for patch failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0725146694836894409==--

