Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE6BC83F17
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:05 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8861.1749993279951664391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=goHKSCNr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JS9Ua6y+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019773ba89bc-51a3984a-fa1b-4d7d-a08a-f2af294b8c00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tXiTQ1kcQFhIvsmIRlW4w6HQ3a4k+WtRz/4i8pFOFwo=;
	b=goHKSCNrijswNL/dF8ZYaIC6byvv7bYsW2vCHk+U9Qe+hYJssein+9PkGn5z6M/b
	FoEZQMWLlodIeSv3YZKLH1NfAiVLJQDv+QYdtnXUDUzY5vNRqsQ1tuzBVH7A6dr+mt5
	VV32W0Abu3pwd40vG3ZdWFfJjEl9QqlbDHVgGKic=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tXiTQ1kcQFhIvsmIRlW4w6HQ3a4k+WtRz/4i8pFOFwo=;
	b=JS9Ua6y+Tu4LccPOr89lU97x09w/79U/JBg6ApjXB/1jOnV10GAY/Wx3Gpvs2EZl
	ZG8g31AKj6nAVsC9kxo331+CWAaTgW63D5Xz4el+Dd4TG9tuTxPImqjGbPaj75TQ560
	csewMhsFZ63ZnnTwUxVegcb7jftfS7zocK8B6Hsg=
Content-Type: multipart/mixed; boundary="===============1825288877068996378=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 8b405629c4a5215871be932097e099c05ec5cb2e FAILED
Message-ID: <0101019773ba89bc-51a3984a-fa1b-4d7d-a08a-f2af294b8c00-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218703

--===============1825288877068996378==
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
Loaded 1910 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:4213d5a3b0378ab51045d67514b32316ce9a1c34"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
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
--===============1825288877068996378==--

