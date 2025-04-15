Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C77C369D1
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20154.1744723976760592660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GENjLECS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=s5ndpYgB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019639a72f13-47dab8cb-9a64-4b98-9209-0c00e06dca49-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723980;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0O4Jl68GwLBAN/xNcUcm80ArePB4YrUSfsVeWleGTYA=;
	b=GENjLECSuo2ZFOey0C4Mr6BNZx6U5yEXUneRvag+jYt4mVpFbiaN/5pTgTcZbtw3
	6fapTybPw6YZrew0ld1v/yOgTbessbhNgsVxAm8dxvXaVokmxA4gAeNG/QiuFVaD4yz
	k0dhCsacFjKJBpRi7u8ttS38DGEYskljZrNYlySk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723980;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0O4Jl68GwLBAN/xNcUcm80ArePB4YrUSfsVeWleGTYA=;
	b=s5ndpYgBflf7dz3ohNF0QA1Bq7xo3Npum2wI9gSLi4u8Z1EWaXaLUq6vf2tJEMMB
	vHCTnb0mD6siB5oHeDUkEbCJ93jj52Jv+Oh58T/8h1KnO8QdY0OmibUYZrB41LCiOQh
	mhPOqDKR+TYJsYJIj/3QEozriTfuwADYIn+2CCs0=
Content-Type: multipart/mixed; boundary="===============3216964187739766458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia: upgrading to 1.8.0 FAILED
Message-ID: <0101019639a72f13-47dab8cb-9a64-4b98-9209-0c00e06dca49-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214891

--===============3216964187739766458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia* to *1.8.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rpm-sequoia -V 1.8.0 -S 29545a41b24cb09e37aa85722a333e0924166d13
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
workspace            = "tmp-auh-upgrades:4bdc159161f7a82d68c564c0f1ebe376563efc4b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 29545a41b24cb09e37aa85722a333e0924166d13' failed with exit code 128:
fatal: unable to read tree (29545a41b24cb09e37aa85722a333e0924166d13)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3216964187739766458==--

