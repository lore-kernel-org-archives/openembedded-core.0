Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C770D79777
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29049.1769951564186798889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xJQvJ7NH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ewnKM6y8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c19558e3e-e2c2fa1a-bab0-43ea-b7f1-74e61413bb78-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sCRXclXD4WgrRBIc8GCBfvcEmuTZyuysbnhwrjgeEys=;
	b=xJQvJ7NHsQk7khSPCbEsII0XZcHUG8/QtBYVQzXXD2tkbdhpuM3R6Sn79Tyxza6X
	udwmOztuLhcAC5qzVb6SIdgbg/4Cv2ogT5sezpozsDcxJjLrgRXRAYXdak0LIVGlwwo
	Bm5MwAwikm47Xf4HG3sX/tJHaUexft0PrOSYxo7Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sCRXclXD4WgrRBIc8GCBfvcEmuTZyuysbnhwrjgeEys=;
	b=ewnKM6y8wuENuof9obAm9QAx0QdeRkIVi84qdz0l1mRA06AKNwPBKbwB6H06Y9Nf
	MD7gOX6pWbNSXDNRiPNLf6rS83ub2lRIwlDnutn1py8i/AVhqsFCMxSpjluBT1EURsj
	pCfVxGx7UsLl5BIEY4u2YOEVrTGgBm6JoYFVjsso=
Content-Type: multipart/mixed; boundary="===============8683983579886115701=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-21.1.8: upgrading to 22.1.0 FAILED
Message-ID: <0101019c19558e3e-e2c2fa1a-bab0-43ea-b7f1-74e61413bb78-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230261

--===============8683983579886115701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm-project-source-21.1.8* to *22.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm-project-source-21.1.8 -V 22.1.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1957 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-58b9f90779d1227e30a7de4948b10e49fb5b5ac1"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:58b9f90779d1227e30a7de4948b10e49fb5b5ac1"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 112 tasks of which 110 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201052349.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201052349.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/llvm-project-21.1.8.src"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work-shared/llvm-project-source-21.1.8-r1/devtooltmp-2yv4t264/temp/log.do_unpack.1040471
ERROR: Extracting source for llvm-project-source-21.1.8 failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8683983579886115701==--

