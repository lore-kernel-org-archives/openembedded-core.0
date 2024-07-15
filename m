Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FDAC3DA70
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1361.1721071146299283167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RS4LAv64;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MNhZwIKN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d59f2a-759d12a1-b1ee-4205-bfcd-fe7bcee186be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LZlbSP5Hj4NeSyLB4FT+Xs5ZblgAU/OHjXF7IY4xecY=;
	b=RS4LAv64Loo+PL2h6KQxhpTnqzVxKhitfya252WxjZcbnzypE2SyolRzvgsuwJLS
	FJ6LruT+jr2EiPeeILeLM7u3qm5GwYe8Hw6+7PVzYVFnvhIjdi4PE3gYx+hrvuIl78p
	NqdJRdkyScUmlw24qgokSMQUUmJek/6S0N6l1LRs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LZlbSP5Hj4NeSyLB4FT+Xs5ZblgAU/OHjXF7IY4xecY=;
	b=MNhZwIKNJPvVgTpcqJR/nLtVTmpop8zJTjYKHZhZnOqQcYvI1EnHWGAaMWKfg0rg
	6ZaYJqJvbJCaFdIVKNj/9hHPUb2B4USFjVz3iKFJNmhIHY5dU6xv5pqxKQRVfS7xTNv
	4+cgAerkNTM8eRtPZEAyvvoenPHcOQ6cBP66/uP8=
Content-Type: multipart/mixed; boundary="===============3120357144782861400=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.25.5 FAILED
Message-ID: <01010190b7d59f2a-759d12a1-b1ee-4205-bfcd-fe7bcee186be-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202053

--===============3120357144782861400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *p11-kit* to *0.25.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade p11-kit -V 0.25.5 -S 0dd113361057e477f40ff4d8788f3e7e400af5f9
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-51db4f397215f98a55dff165232822c2d748f410"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:51db4f397215f98a55dff165232822c2d748f410"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0dd113361057e477f40ff4d8788f3e7e400af5f9
ERROR: Execution of 'git rev-list devtool-base..f973d0f6acebbe7ab2f4ab027b5adb32b97a758a' failed with exit code 128:
fatal: Invalid revision range devtool-base..f973d0f6acebbe7ab2f4ab027b5adb32b97a758a



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3120357144782861400==--

