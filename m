Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE72C369BB
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18072.1743511394822083804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Aw2cdg/f;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jubInYS4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f1609683-40262279-ad3e-4e90-a4cd-fd05ef3d3720-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KCgV5n5+S6xwRLyxrFkcnPtbmHtwAF7KpsSFPhEqoWM=;
	b=Aw2cdg/fnguRhwNy65zoRZzxlVitzFnmWZj6N6oWp9pFkHJ7T/Iy23iquUDJc6HZ
	YomEw6vECEIT/Zri7G6UswwS7+vaF2FJSMbpL0LVtA3Ig0pixosvLIl95klbIUEBvGl
	UFibRAjpCzAov5R0wjPAX81MrUcYGZJl8eDGURSY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KCgV5n5+S6xwRLyxrFkcnPtbmHtwAF7KpsSFPhEqoWM=;
	b=jubInYS4Dt1uGiVRIhreEolJMpEMqvxw/12jyEGTbO95e80LOc751iI/rKUd9uov
	Da9djVrKuFeV35VRwLBeemQiXVJMpjSAVKPSBL8CtWN/EQ5/4hBbcV0P5ZZwK+J6/Z3
	GhYOZxXHquedcTDGwHOifjCBaYRgVo2gc3QytzMg=
Content-Type: multipart/mixed; boundary="===============0648170439656524086=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patch: upgrading to 2.8 FAILED
Message-ID: <01010195f1609683-40262279-ad3e-4e90-a4cd-fd05ef3d3720-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214053

--===============0648170439656524086==
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
Loaded 1886 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:aeecf715ebc43dca0ef8a4934b3107c06b8f2565"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 9 Mirrors 0 Missed 2 Current 18 (81% match, 93% complete)
done.
NOTE: Executing Tasks
WARNING: patch: the directory ${WORKDIR}/patch-${PV} (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/patch/2.7.6/devtooltmp-7c_142iu/workdir/patch-2.7.6) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
WARNING: No source unpacked to S - either the patch recipe doesn't use any source or the correct source directory could not be determined
Log data follows:
| rm: cannot remove '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/patch/2.7.6/devtooltmp-7c_142iu/workdir/sources-unpack': Directory not empty
NOTE: Tasks Summary: Attempted 95 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401084114.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401084114.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Command '['rm', '-rf', '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/patch/2.7.6/devtooltmp-7c_142iu/workdir/sources-unpack']' returned non-zero exit status 1.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/patch/2.7.6/devtooltmp-7c_142iu/temp/log.do_unpack.3499256
ERROR: Extracting source for patch failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0648170439656524086==--

