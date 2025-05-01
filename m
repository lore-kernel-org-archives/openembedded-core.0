Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF71DC3ABDD
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1813.1746113625333866688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UjjoUDp1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=njThJsEr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101968c7b7af4-d2c75ed1-8efe-4984-be45-bb02fa44759a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3TvIoB6bMkupSHD50yXvYEqQmVnsz2/SCj7mDMntjnM=;
	b=UjjoUDp1xUX548EsBZYNZaM91hPTLt2K3TYSxKVnaRUEvxCLcgaLZ8yBJ9ZkRjCR
	suLDdzRzZy4sSvxoQwdmeDNBn76qB4+ZYq+deAox+lYJDfbVBIdIy/vaPXGNCSxY6Pg
	QIGui15N3SFuBDQV3rs6w2KXIGiDoPZOx0d0gtmE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3TvIoB6bMkupSHD50yXvYEqQmVnsz2/SCj7mDMntjnM=;
	b=njThJsErAby2NqOr2H2EnWuzde6bGsxXzRcV74Pd6CXdOWIdxw1ZfRD7Wqm2tnCV
	HW9K1nInINLqQcJjjKchj2hiFedF4zoqd0JzGE8nZOhz6V1SxEtbvS29l6AoB8ueCp3
	z0MfelSv1TPHobYOR053cEh8zp0kEc0jA5xVU1Ho=
Content-Type: multipart/mixed; boundary="===============1423371995145949040=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia: upgrading to 1.8.0 FAILED
Message-ID: <010101968c7b7af4-d2c75ed1-8efe-4984-be45-bb02fa44759a-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215835

--===============1423371995145949040==
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
workspace            = "tmp-auh-upgrades:74765b884b940118470a17e042a41815c3ab759d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 29545a41b24cb09e37aa85722a333e0924166d13' failed with exit code 128:
fatal: unable to read tree (29545a41b24cb09e37aa85722a333e0924166d13)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1423371995145949040==--

