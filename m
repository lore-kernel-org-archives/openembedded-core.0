Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E594C83F3C
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.12163.1752594932097233024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AU43FwwZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=De/kh6UK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101980ecc5ecb-92da45a3-d438-4f95-9df6-7029449af490-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594931;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w1AilX92u+ykYCoG7EJ02kGy6faCxQPelZcIcSy+PQ8=;
	b=AU43FwwZ7GtWUMlBsBx76UxRkwgisrlnseA5ZAUn664j43vApqfKhjmlj0gxS2Gk
	ew2OB7tXanH0G5OuboKA50ceB/twvpuM38mQGzajDnesX5zKeGw3LOA8aoo8TmDNPeW
	/hfAMUisugl7KMthfOtXqaQcY3cK5YQ12cfQrR6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594931;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w1AilX92u+ykYCoG7EJ02kGy6faCxQPelZcIcSy+PQ8=;
	b=De/kh6UKVYrnfSYHyqm1APGPv5qUuOeOo8aGuz2A0cA8B02Va8yVqohU0SV6ne0C
	0M1iTB093Aqlif8uXHglTonDFNaua10EM0S3jMjNEMJIz887bbo2PVxFOinSzPi5GaC
	AI8p8EA7V4IgiIYrFDDPg1/D60b0GU+1vDuY7KE0=
Content-Type: multipart/mixed; boundary="===============1371599457410991034=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-20.1.7: upgrading to 20.1.8 FAILED
Message-ID: <010101980ecc5ecb-92da45a3-d438-4f95-9df6-7029449af490-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220312

--===============1371599457410991034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm-project-source-20.1.7* to *20.1.8* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm-project-source-20.1.7 -V 20.1.8
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c1d1f88d1986235584bf8dcb6d0d090e90513877"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c1d1f88d1986235584bf8dcb6d0d090e90513877"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 112 tasks of which 110 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715065607.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715065607.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/llvm-project-20.1.7.src"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work-shared/llvm-project-source-20.1.7-r0/devtooltmp-wn82wym_/temp/log.do_unpack.1568176
ERROR: Extracting source for llvm-project-source-20.1.7 failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1371599457410991034==--

