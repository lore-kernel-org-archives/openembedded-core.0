Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CD2CED602
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12124.1763224726915891392
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Gwb9PLAV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gDvisjRk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a886260ca-9824198e-12dd-415e-83e4-bc38ffab1fa2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zk+a8wq4/XDXEbPQCvftL6H7kdijqu7Sbyyx+fYf+Lc=;
	b=Gwb9PLAV+16elc+HQCQEIfkj9wCVpM/SvHNpxxm9oadqVZIww/R3JAACK+NzScHp
	qgOK2cK+wIA3CJ+az6gKj+fHHj5kHDdJJTM42vKZXOYuMFezux82LhW11Mh1agJoGzr
	bet1OYiM9aTb+cj40hwUAEM0oZJznSIt8ySATl1Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zk+a8wq4/XDXEbPQCvftL6H7kdijqu7Sbyyx+fYf+Lc=;
	b=gDvisjRkWXqwRDuZK4k7b0QuRLJ9OpZM1OZhts1/A4x40CPn1F4hFkKKUkAMY05Z
	7JEcLwEjfsOjDTYchoYh0U3Qc+9+thOi5GS8lVwh/M7Am+oiEy2luPMTP6/BEt86/zs
	Z1mjcgL3pODTwYBJq6SC1n+Crco7xc+HBUomrkEE=
Content-Type: multipart/mixed; boundary="===============3466646510489468542=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 7f05d217867b2af52b0a28c6d1c91df97e1b5b39 FAILED
Message-ID: <0101019a886260ca-9824198e-12dd-415e-83e4-bc38ffab1fa2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226394

--===============3466646510489468542==
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
Loaded 1944 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c0826fae905fb3bc017f15bcac21b11688ae6ff6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c0826fae905fb3bc017f15bcac21b11688ae6ff6"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 7f05d217867b2af52b0a28c6d1c91df97e1b5b39' failed with exit code 128:
fatal: unable to read tree (7f05d217867b2af52b0a28c6d1c91df97e1b5b39)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3466646510489468542==--

