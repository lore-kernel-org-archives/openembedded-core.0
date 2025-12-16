Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50011D5CCA0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17394.1765872135549692799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RqHFBbDY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TK6TL/Ce;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262eb681-bc86066a-efdf-4b48-972c-a9008e940ced-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mqy03k/O6NQIbSID951mg+OmB1E1dk+/rc9JBI0bX0g=;
	b=RqHFBbDYKRFZcahMQ2hXHRFWZJ5sURX07k/ZjK53xnSA+1FVaRQOv3LToQpnHtMa
	xXkHpGwtjiE/NKTpd4S4sj7gDkrTn7T7SNX/rfvnOKXoiN2f995ZKij5A3g77ANWi6Q
	KjlBvEDywhVjbSdUsQCjhgvpOym7w12Xi6V/e0q0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mqy03k/O6NQIbSID951mg+OmB1E1dk+/rc9JBI0bX0g=;
	b=TK6TL/Ce721mcXrtcq/OKgprk8hETFXYy0Q9F0Dw4N1UgL/luH4hW1DEa+3d1cn4
	P9BmuYYjeq/LvAIAG6wu3L6Wql+8gIsscDTMQj+Rar9hOo38ALVFIXR/5endRCe4BbO
	WPfHArAyYye8cR4MybNOBXA/e57qYr8UZSzRVroA=
Content-Type: multipart/mixed; boundary="===============5289014246836520599=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 7f05d217867b2af52b0a28c6d1c91df97e1b5b39 FAILED
Message-ID: <0101019b262eb681-bc86066a-efdf-4b48-972c-a9008e940ced-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227847

--===============5289014246836520599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *7f05d217867b2af52b0a28c6d1c91df97e1b5b39* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 7f05d217867b2af52b0a28c6d1c91df97e1b5b39
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-bdad60adf714ed539e8c832bf19013d00c7212d8"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:bdad60adf714ed539e8c832bf19013d00c7212d8"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 7f05d217867b2af52b0a28c6d1c91df97e1b5b39' failed with exit code 128:
fatal: unable to read tree (7f05d217867b2af52b0a28c6d1c91df97e1b5b39)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5289014246836520599==--

