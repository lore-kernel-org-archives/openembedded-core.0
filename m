Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16566E9A04B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:36 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1410.1771440094592340505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1YsvH3a8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bfKinkza;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c720ebb06-ebdfada0-6426-4d1b-ac78-c41318017baf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440094;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ve5FBwn0/LlZ2dgnC41LKTgLZI6jvRDTVnzv29jotvE=;
	b=1YsvH3a8aBEf+ZWMLGd45WSJdSa5gePsn+v4LjrhHIUNrU66j5E6rZ5xYW7ayZs3
	zN8PAeRCyOfAv3ggpbCj125sk4aZseZt6YpIU37p7qw9kv2uLJlRIhJNWVBfHI8qWyd
	ks9dtPubbWbYORYGjJgB+jJAujeEDtP/O7FExK28=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440094;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ve5FBwn0/LlZ2dgnC41LKTgLZI6jvRDTVnzv29jotvE=;
	b=bfKinkzaIVDUaHni3Ej68B6wk5kR0YjoG4wnpzmoxLIjDq4OWWB4RClpKar3dFAv
	GirNMMouMaD8U0QB9LfB/veUPU4EsK39DuWJBFr/dcCScgtB/oUw1c07fMu/coyiwjx
	KwwEJbCCa5X+y5B1m/PidTGz2U38DKV3y+pND62Q=
Content-Type: multipart/mixed; boundary="===============5533244647877720589=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-21.1.8: upgrading to 22.1.0 FAILED
Message-ID: <0101019c720ebb06-ebdfada0-6426-4d1b-ac78-c41318017baf-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231322

--===============5533244647877720589==
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
Loaded 1952 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-0dbc300ff37660960f604b020bd9afe190dab7a3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0dbc300ff37660960f604b020bd9afe190dab7a3"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 112 tasks of which 110 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218095705.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218095705.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/llvm-project-21.1.8.src"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work-shared/llvm-project-source-21.1.8-r1/devtooltmp-kbb4rghb/temp/log.do_unpack.542044
ERROR: Extracting source for llvm-project-source-21.1.8 failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5533244647877720589==--

