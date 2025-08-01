Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D33FC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.88620.1754057264734113254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ywzekyIJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RjqMn0Wq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019865f5cb8f-93b0d98a-b5a8-4488-9134-c17b31e6e90c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057264;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q3msF+KusQgExMSZt4T+TFBGqaRj6r75A+UitfRnU7A=;
	b=ywzekyIJx5Po4Tmk9lCU+XE2gRQ7B3dBgSsOCdCd9UoLnvF738DGoqeWvI9FChp2
	yHnv48TO7rmCMB1thahQuohqW6VfqJPoJSkSrGc0CegXZ/8OaPJVXibo7HazwCQeN95
	gEsG8zT0JR3Hz3/m7b9JyNOfomh8Zh8DCkrb9omc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057264;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q3msF+KusQgExMSZt4T+TFBGqaRj6r75A+UitfRnU7A=;
	b=RjqMn0Wq+Q7EjGNaR7CZ+pXnVx73+sM9TtJKzj42aEd7y3hczdI2nu8CwYw3l1BM
	5XWbQdm2u7gjQjwBUPFkzeFhk/Fe54a0OY2XOQT9f3zxKs1vRfIadLeuqo/Tit8dCpV
	p6fB9+rmcaLVxuL6gv0GHLMWV82/c3RmEjyc5IJA=
Content-Type: multipart/mixed; boundary="===============3805435514427428275=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-20.1.8: upgrading to 21.1.0 FAILED
Message-ID: <0101019865f5cb8f-93b0d98a-b5a8-4488-9134-c17b31e6e90c-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221249

--===============3805435514427428275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm-project-source-20.1.8* to *21.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm-project-source-20.1.8 -V 21.1.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9fef71c588346e64467893a1ab4977fe58f4d96a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9fef71c588346e64467893a1ab4977fe58f4d96a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 112 tasks of which 110 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801063245.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801063245.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/llvm-project-20.1.8.src"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work-shared/llvm-project-source-20.1.8-r0/devtooltmp-5nh_i1ch/temp/log.do_unpack.2263444
ERROR: Extracting source for llvm-project-source-20.1.8 failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3805435514427428275==--

