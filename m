Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C9BCA0EC7
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.12185.1752594945837280735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gkL+zR9B;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ELbzS0gC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101980ecc9529-de19b45c-037b-4fc8-8eff-9a0f11082744-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594945;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fcI9vBKFvdZEgo6v/yT19Ffgf4yU9mJbfdJjXKr7hm4=;
	b=gkL+zR9BR28rVrTwcRddFC6/ZERMBReSYjpD3IxpQfE6lvvogNdDKFF0aPWVtQ+b
	ScPnWd0PBs08irO52WYkOrQiAHvN/4xWEJUIvO7Hc4RW6giZ+37ifurCQjaW/QlkiZH
	erRRYnoLi678/GVhIBYHW6jF8FHMoU59MRV+4QE8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594945;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fcI9vBKFvdZEgo6v/yT19Ffgf4yU9mJbfdJjXKr7hm4=;
	b=ELbzS0gCXiQQr+GKUgJ8oY8qZcqBafAdRcYZbVy04BHW/6gfXRLHh//ok1Oh6uHO
	efA2l8dkcc1sDVQIQS6X/disSfVKyD2i4ozpyS7ZhOqEeL/IMP3btEbIs1gpuXmsOG+
	wylLRMbBeAc7KYSr6yWKUkr46FkZEjMkJ0ucaAAI=
Content-Type: multipart/mixed; boundary="===============6983942939613041433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 8b405629c4a5215871be932097e099c05ec5cb2e FAILED
Message-ID: <010101980ecc9529-de19b45c-037b-4fc8-8eff-9a0f11082744-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220360

--===============6983942939613041433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *8b405629c4a5215871be932097e099c05ec5cb2e* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 8b405629c4a5215871be932097e099c05ec5cb2e
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
DISTRO_VERSION       = "5.2.99+snapshot-70facaf9c90d42f9e1ecdcacd1a52da80d4db337"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:70facaf9c90d42f9e1ecdcacd1a52da80d4db337"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 8b405629c4a5215871be932097e099c05ec5cb2e' failed with exit code 128:
fatal: unable to read tree (8b405629c4a5215871be932097e099c05ec5cb2e)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6983942939613041433==--

