Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721A9CAC5A3
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:47 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.30897.1757937285701477369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fbENdAV3;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RcQyql70;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101994d3a381a-91771f9d-a032-419c-905e-df1dadd4db9f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OiYM1OfEyGnPnn32uAL/Fv7G6120EPl5BuGmafKuHEs=;
	b=fbENdAV3NJ1CId0PPF+ZUfddM+HkhCahPicczLh5hYABFvvOHGgdg43mUqSKOPdx
	Kqt3Ekuo1W5diY5YY4FMXwFERAAPIq/Edz3fxT15/ShGPxA+ZmPOl9ruwryAunS2e+U
	Z0txtBRFkZRQKJegY0H/kbxPriQsG+y1hto2gOJ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OiYM1OfEyGnPnn32uAL/Fv7G6120EPl5BuGmafKuHEs=;
	b=RcQyql70JLiaZrhmopE+ZayKzeZMOR4BTNI9A/GTuF4sCk7c5RdOXZedI6qyFHtt
	cW7l5sZSz+FrPOAvgvfXtrvH7rsfrJqhykaeHN3SbK0uxEizo5XfYYH5UG9ZqJjvWCY
	r8QPCOZRm1YJ65IKuPZPTGW5RK3pRhqfGlcQ6Kag=
Content-Type: multipart/mixed; boundary="===============7781379715876836991=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 ca271338190ded05fc544764d6e84289cedf1354 FAILED
Message-ID: <010101994d3a381a-91771f9d-a032-419c-905e-df1dadd4db9f-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223439

--===============7781379715876836991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *ca271338190ded05fc544764d6e84289cedf1354* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S ca271338190ded05fc544764d6e84289cedf1354
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
DISTRO_VERSION       = "5.2.99+snapshot-049708a3aa97f47adb090420ec3609f3e78d5657"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:049708a3aa97f47adb090420ec3609f3e78d5657"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout ca271338190ded05fc544764d6e84289cedf1354' failed with exit code 128:
fatal: unable to read tree (ca271338190ded05fc544764d6e84289cedf1354)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7781379715876836991==--

