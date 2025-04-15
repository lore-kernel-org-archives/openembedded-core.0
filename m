Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4925C369C9
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:32:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.20169.1744723974036455324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CJJ0Osul;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=l48Q4tyA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019639a71570-6bc163e5-cdd1-4423-9bf2-c729a110b77f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723973;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=unsBCC25rgxEkDd+otp/aG7AEVSWI3JBmhR/TxV/aTc=;
	b=CJJ0OsulHnOGBVFRuYkentNqK6g1R0qkkKLRes/ZCwqAsxFREZQH6e7SjNlbZ8+7
	WHFvG9NHkZKSVif+qoxdWYpKMTDnEm4aNxvqUM4iJdEwKX2zlI3CfoX393yuZzpTOL4
	/ZCRdTg11BNaLIZ7GXfRd7/fK0FYFbUmZ8fn2Amw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723973;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=unsBCC25rgxEkDd+otp/aG7AEVSWI3JBmhR/TxV/aTc=;
	b=l48Q4tyAV0WAZHnqVG2FAqeY35Zynw6MUl2Wyki68C6RE2Na4U5ZPsnkL9eKphLH
	2jc8dZp2nNhyJgW/c28BWJdT2epV9xzArYSGytHbmmCBM53vye+aFcEjTL7aRqyiAs/
	j7T1WUDWln4BIWA81S6tZEf2zY748TlmiLy1Mi3I=
Content-Type: multipart/mixed; boundary="===============6920373880397082434=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202502 FAILED
Message-ID: <0101019639a71570-6bc163e5-cdd1-4423-9bf2-c729a110b77f-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214865

--===============6920373880397082434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202502* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202502 -S fbe0805b2091393406952e84724188f8c1941837
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:feaf4cf7105a59879a3054f642fa939419cf8a03"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto fbe0805b2091393406952e84724188f8c1941837
ERROR: Execution of 'git rev-list devtool-base..f4153a09f87cbb9c826d8fc12c74642bb2d879ea' failed with exit code 128:
fatal: Invalid revision range devtool-base..f4153a09f87cbb9c826d8fc12c74642bb2d879ea



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6920373880397082434==--

