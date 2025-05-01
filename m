Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF5EC54F32
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1806.1746113613097356396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XgIylug0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=l2+VT3gY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7b86de-6dadf643-3592-4645-8701-d15dc63ff48e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1MkMOD7tK+zXSpdZCEU4/Yird89XN0h+pJ/dlotgmqg=;
	b=XgIylug02ilHm8iinoJtyue+A8eUO+B92KxsGF5EZO1ZxFkItnztfRrU1TjM6ukS
	rFqz3gse5Z52MWHCE9Sz1JdALG8mBOCm0t8H6m703GIS6H9MrU7zwtG/Udm7NHRj+n/
	Uqkz/hyoooYhZsnNE0qvxuEp/SQqj6XX4W/QP5DA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1MkMOD7tK+zXSpdZCEU4/Yird89XN0h+pJ/dlotgmqg=;
	b=l2+VT3gYPefqChfAzzg4MHX6XMcZJ4ADu4mbsPXuM8lkgCGpMaSrWQUyIUzcFCcF
	xJFNtAcMMF+cs2PFm5fUWRGcqHMN/++0dycQoll6Z1Zuf7W5yqvpIGABGB5UcgE/2bI
	D2WPx7zcSvlLxQF1XaF3Jm2de6K6rw7Jlq2KL7p8=
Content-Type: multipart/mixed; boundary="===============1717640516312470379=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 f8bc3a00c46867f81091612ae6792ad64e1c7af9 FAILED
Message-ID: <010101968c7b86de-6dadf643-3592-4645-8701-d15dc63ff48e-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215845

--===============1717640516312470379==
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
Loaded 1897 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:aa362f6b2e78887bba4c20016e197c62e857b4a8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout f8bc3a00c46867f81091612ae6792ad64e1c7af9' failed with exit code 128:
fatal: unable to read tree (f8bc3a00c46867f81091612ae6792ad64e1c7af9)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1717640516312470379==--

