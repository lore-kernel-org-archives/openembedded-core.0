Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D3CC8303A
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8891.1749993284377014534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xjWW6Uyi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WuGoibq1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019773ba9f26-b6c01e9d-8e1b-429b-b3c0-277021f9c580-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qIquBN1MDvC5uKhP172SsrYcw6l/M3fCcSKRe3mbp9U=;
	b=xjWW6UyisQuf4EAeIIt4VS18/T4RhUMZ3vH67wlQ4vif5THlrsrCSBgMySD/OKuO
	wcTz1gF2dx5LH9zzTTUmpMSUUmD7V5svj3PSEx+aJB0qeA80Ti9IknaB2/UJz+ee7Gp
	h54fs5HhKMA4O4grYQwmw8IejzhGiG3oeZO6nHfs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qIquBN1MDvC5uKhP172SsrYcw6l/M3fCcSKRe3mbp9U=;
	b=WuGoibq1yAX7go43JzT5X+zQ7miBHV+dVh31tbDobTthf6laX15Kl+Adp0KwSCX1
	+WLEY5x2bC35FzRdA+7XH819tsGpODe5wv7+k8Fxpk4XDFzblYCwouF4JAe8IIgiLq2
	CsXPnqkL4kClTYe2QObJvkpT2yP35vVlF0aJyuP0=
Content-Type: multipart/mixed; boundary="===============7107036262317853428=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 20.1.3 FAILED
Message-ID: <0101019773ba9f26-b6c01e9d-8e1b-429b-b3c0-277021f9c580-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218722

--===============7107036262317853428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *20.1.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade spirv-llvm-translator -V 20.1.3 -S 834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1910 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:a49f3e8bd66af12a6fd930f29ac4d7f1a97f583f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b was found on multiple branches: 
  backport/pr-3104-to-llvm_release_200
  backport/pr-3183-to-llvm_release_200
  llvm_release_200
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7107036262317853428==--

