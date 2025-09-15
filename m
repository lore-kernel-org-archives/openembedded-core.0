Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02582CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:37 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.30911.1757937272301687583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mpTkPKq6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=d8tWQjjy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101994d3a02e7-d7491af2-9aaf-4da6-bd5b-7c225f0c86c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eZL6gt7jGbKPS/RxeFNE1r+3qdIlonhJomnb6Knt9nc=;
	b=mpTkPKq6a/V/DAWfIPFpmvXxt/C88raQXbma6XE50CNwbBAN87wZUNfKknEDi1t4
	iBGIrBkXUEYEoesu0MGqWbDsfOVm9C4NjICZrPJ+uDXC2HZFQWP+8IxVunQTBC/0ZYJ
	rvETwOxLT8+Smj+lbqURP8NSIrx2UaMyNJUVET+I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eZL6gt7jGbKPS/RxeFNE1r+3qdIlonhJomnb6Knt9nc=;
	b=d8tWQjjyAYTVe5EiKY69Qsbhb3LZqC+SIT5JYBhN70vUUj2g2GWuihXUv/jqiv4H
	b2wQdNa8vzU8XX3S4YyHv4b09KgR1XIIJQbLMFxyEsNQ5BEnlsxFDRWCIDiL97P5g4n
	DS8MYpROvbSXkSSX69oUAQCR3qB1UUvpjwp2qsUU=
Content-Type: multipart/mixed; boundary="===============8285741163380788670=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-21.1.0: upgrading to 21.1.1 FAILED
Message-ID: <010101994d3a02e7-d7491af2-9aaf-4da6-bd5b-7c225f0c86c7-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223403

--===============8285741163380788670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm-project-source-21.1.0* to *21.1.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm-project-source-21.1.0 -V 21.1.1
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
DISTRO_VERSION       = "5.2.99+snapshot-8cb99b0eabe9a1148a7d83002c99228e79ee1c38"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8cb99b0eabe9a1148a7d83002c99228e79ee1c38"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 112 tasks of which 110 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915051709.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915051709.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/llvm-project-21.1.0.src"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work-shared/llvm-project-source-21.1.0-r0/devtooltmp-hij74939/temp/log.do_unpack.1100055
ERROR: Extracting source for llvm-project-source-21.1.0 failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8285741163380788670==--

