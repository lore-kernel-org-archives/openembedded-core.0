Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064E3C369D9
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18073.1743511395133513718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WA1+qYdQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DViZN1g8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f160cf8c-e0c85b8f-2561-4348-9eeb-8c56f02bd5ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/aMVmTnQXc4Z73hGFyZlMA7G1nqSk3IukIl0EyeHQNI=;
	b=WA1+qYdQFp9pOQPTYOyzNqCcUBjwI3Q8HXkyLnltoi9vJdKTluNuoV6YlvjyDUii
	/WE42PpQhWrI6vGvsMpnoFeOkTlSJcMSXVJnjSDtltc95v4EI9WRgk1xzlEBrWAtzhT
	fI7c8NTGlMiQfa5ykcZlbcUTceOotsMxUBX9g6tg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/aMVmTnQXc4Z73hGFyZlMA7G1nqSk3IukIl0EyeHQNI=;
	b=DViZN1g8N/Ck+hXQ3f73UmfE1yNTMto/99i09AXVmSB2xR7J/38GZt0hpOHb5lRU
	dawB4Kvr3wVz9XxMPSpA4eJeXn5RnH6GD+g/9Xp2aElde0v7S08I7wj8reZylt1iJDV
	wJS+R8ZEP544ILszWU0BTliWNDEB/LOVhAUE7Vbo=
Content-Type: multipart/mixed; boundary="===============8709149789607316218=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 59202da150e7433c87b44f430e3fd4ccade49fe3 FAILED
Message-ID: <01010195f160cf8c-e0c85b8f-2561-4348-9eeb-8c56f02bd5ba-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214101

--===============8709149789607316218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *59202da150e7433c87b44f430e3fd4ccade49fe3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 59202da150e7433c87b44f430e3fd4ccade49fe3
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:ceea15b57bca5a2462e50d68dbe62be512062553"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 59202da150e7433c87b44f430e3fd4ccade49fe3
ERROR: Execution of 'git rev-list devtool-base..8db8ce9c528330f0b1261b07531b009732b08731' failed with exit code 128:
fatal: Invalid revision range devtool-base..8db8ce9c528330f0b1261b07531b009732b08731



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8709149789607316218==--

