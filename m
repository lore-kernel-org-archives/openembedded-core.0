Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18F3C5B55A
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11051.1747312321404627514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CnG4J6Uz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oZj15QR0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010196d3ee21bd-002a3b62-5162-4b8b-8c08-37b5c654f20e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gq1v+dy20qQhFFo3PXWgpLqdKPxKRTIGNryx8FkHUhI=;
	b=CnG4J6UzsXZTq3cS4IiE0k8SCASSVj7FgEIBLXtxz+5jCwWdHW4pCVWgHS510BQb
	bmFdTZXG/8B7Qx7XHzAUwn0QEd8HBuXGnv8mpPZ0eokL1EVD5DUz9dV6KfUwtSRm5t8
	rJwjyfXwbzrqNZHskSTb9pBpRxnTTWhN2BpUXzrY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gq1v+dy20qQhFFo3PXWgpLqdKPxKRTIGNryx8FkHUhI=;
	b=oZj15QR08hb/Llu8B478VMxTVsqRl86GcvVi2ZRiBYfEKzfQCg0TmwSiGa5/dwHm
	AJsMKbfZHbil5gRryRTixR3pcsqGHM1snvOYj58i3+NZHCMJWPeBn/9ECXw3sqV5B+q
	n6Sq16UjSfjZy3yV86z4SCcyc+bh0l2LXr42gS+4=
Content-Type: multipart/mixed; boundary="===============5444410373154136651=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 f8bc3a00c46867f81091612ae6792ad64e1c7af9 FAILED
Message-ID: <01010196d3ee21bd-002a3b62-5162-4b8b-8c08-37b5c654f20e-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216634

--===============5444410373154136651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *f8bc3a00c46867f81091612ae6792ad64e1c7af9* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S f8bc3a00c46867f81091612ae6792ad64e1c7af9
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:af9d4362a2e70f6978a0bf04b02e95702ba749d2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout f8bc3a00c46867f81091612ae6792ad64e1c7af9' failed with exit code 128:
fatal: unable to read tree (f8bc3a00c46867f81091612ae6792ad64e1c7af9)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5444410373154136651==--

