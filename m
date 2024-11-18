Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72057D60D00
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4894.1731964684310811232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KO4qwfIC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cOoWr2AF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101934123f3d0-4c56cd77-7dfd-41c0-84cc-1d7e79683e62-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964695;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=psTEc8Q7G0AgoLsZYqWNHv5/Hk6Mt/T64ayBRDUF1Wg=;
	b=KO4qwfIC/yeSbPjAjk95qq7B8jSc/mWS2+CNDRaSw1ej9YUaMQDitAb0VIip+IS8
	TweQzefwpqhkM9V3tXa6EXhx38fzt+Caq2sAnClcp6BCtCrRP6rrbki9hlGleVcR1e6
	o6LQnbRQhnJGX78t3Ab+A7F2UjoYHmsb/Arqr1wo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964695;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=psTEc8Q7G0AgoLsZYqWNHv5/Hk6Mt/T64ayBRDUF1Wg=;
	b=cOoWr2AFdRFHPUbT7QlK3REiONnKjfaV2GZJ1VypD0lv2muLzPqFMxKLAqrRtaCE
	mMyk1IMYrhCw64eAK+Xg2iOvAgbI7Jskagks+myb+aMwAD4lNJTuidPEhlPcsV0bEj5
	wnrjY1hdHg3RnlQcKDTOrMM6tOtGKRsDTvJBMICE=
Content-Type: multipart/mixed; boundary="===============1048873717046609148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] utfcpp: upgrading to 4.0.6 FAILED
Message-ID: <010101934123f3d0-4c56cd77-7dfd-41c0-84cc-1d7e79683e62-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207370

--===============1048873717046609148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.0.6* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade utfcpp -V 4.0.6 -S b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:703a29f8e8679781131ececa95868fec2a3b6352"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0
ERROR: Execution of 'git rev-list devtool-base..c4ad4af0946b73ce1a40cbc72205d15d196c7e06' failed with exit code 128:
fatal: Invalid revision range devtool-base..c4ad4af0946b73ce1a40cbc72205d15d196c7e06



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1048873717046609148==--

