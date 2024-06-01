Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C5CC27C53
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.42229.1717263217979766766
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IPZjE+dH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SY8mz0ns;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018fd4dd321b-6d17fb85-5d9e-4ce8-bb97-9cd46b91532c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263217;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=E0kVZzFU0fnmRwJp7cAJ9cGWyPqkGhtRlmoP1KVAvy8=;
	b=IPZjE+dHajZ/QzM5TTwXQqMebOP7Cb3NwaX9x2GpFRFrwJWmmHaQEfGa2JRlpdJS
	0Z03regCyvQOzS+exGZ+8djmXZ4X0/dBG0dFxDmEecCXeLWBa7dLMr+ncQKrAnrvogY
	Ah0Yv4yyURqLKhqVM2U16TMimgVL4beqzQqJ33Cs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263217;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=E0kVZzFU0fnmRwJp7cAJ9cGWyPqkGhtRlmoP1KVAvy8=;
	b=SY8mz0nsudv9Tbpot718HZExO6fU5WTnHwbA1SUWxdP5bkSncGGrtQG8fDcyb1/6
	/vXO7mZ3FapjTQpvlRTep3A8At078hJ/wB33yWnJSfe3IjIloHCiv8OQ0Ozwo8tpZqn
	L80eRINS3OsjfuKjSY2CIAKuEycPHLqjatf0Ta6A=
Content-Type: multipart/mixed; boundary="===============1607230430057197906=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202405 FAILED
Message-ID: <0101018fd4dd321b-6d17fb85-5d9e-4ce8-bb97-9cd46b91532c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200121

--===============1607230430057197906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202405* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202405 -S 3e722403cd16388a0e4044e705a2b34c841d76ca
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ccae41205ea081644777c7d558c3edd1caa5af76"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ccae41205ea081644777c7d558c3edd1caa5af76"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 3e722403cd16388a0e4044e705a2b34c841d76ca
ERROR: Execution of 'git rev-list devtool-base..b64af41c3276f97f0e181920400ee056b9c88037' failed with exit code 128:
fatal: Invalid revision range devtool-base..b64af41c3276f97f0e181920400ee056b9c88037



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1607230430057197906==--

