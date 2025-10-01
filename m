Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980B6CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.18061.1759325531760427663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yMMukLd8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Iq1efUt/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101999ff92bd1-eb1e095e-36dd-4ddb-a190-22b421fb83fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325531;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KnDCfiLs61CL/YVJG0RC6SpPWO9f9hNslFz+wgZ/+t4=;
	b=yMMukLd8hSpmE0rOcqB/j/46I647ISFwgIhctKc96zohbacMEDT4AKDgMHCw2Bp+
	npAKCFkxHoGhFmrBaTNRsOamQ4hmJrChIwQWaB95EgOqgTY6dPI1tXG/f37HtBRWncy
	OzIF9D4ZrBkPuRvLizLvcqY5oAvyGsPNA2qOM5Og=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325531;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KnDCfiLs61CL/YVJG0RC6SpPWO9f9hNslFz+wgZ/+t4=;
	b=Iq1efUt/QVdI7NS/2koS3qcEQzrKItAhpLk1ie8bmAXZgaxQAHEkamPG0gO3kkw/
	+iUZt93NAaSInZipacmDcvGqyxIEMOzhg85lvMoQdMcxV/zh/FvJIxvhz8ZMXo0x5t+
	o8Vkg9+GasAo309pZGteygmAx2wpGz17ZIz3afAU=
Content-Type: multipart/mixed; boundary="===============0784041258499296760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-21.1.1: upgrading to 21.1.2 FAILED
Message-ID: <010101999ff92bd1-eb1e095e-36dd-4ddb-a190-22b421fb83fa-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224212

--===============0784041258499296760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm-project-source-21.1.1* to *21.1.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm-project-source-21.1.1 -V 21.1.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6f12a747b0988df28b1615a155d0b12a1c8d5bd1"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6f12a747b0988df28b1615a155d0b12a1c8d5bd1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 112 tasks of which 110 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001055451.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001055451.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/llvm-project-21.1.1.src"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work-shared/llvm-project-source-21.1.1-r0/devtooltmp-tfmfye9s/temp/log.do_unpack.1443918
ERROR: Extracting source for llvm-project-source-21.1.1 failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0784041258499296760==--

