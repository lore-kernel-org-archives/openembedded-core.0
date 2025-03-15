Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7E4C35FFC
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10350.1742048286063781878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Fg3lmaQS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cMoaf64h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101959a2b9586-47e380a3-1a67-4443-8c18-d758ccae03bb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lfhKJ0mBS8i1A7lzrT65P9dk+2kZjW+kF5tBHtn6/io=;
	b=Fg3lmaQSkXqTfU/DeqZ0IZ4qIgUZw5uCwvmsj0fThBRC0rEUpsfqMvvfl2Vvjd9b
	T4c4hozn1AoGgeT+KUqX6B2zUAw/iBdqul7y3/ElbzwCqXmnFMxjlEcA8VQ8pAic32T
	+lDkLvuE/dV79nG8/jTNhPl3ib+4v56GYClYA+Nc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lfhKJ0mBS8i1A7lzrT65P9dk+2kZjW+kF5tBHtn6/io=;
	b=cMoaf64h+nViNI0QFYypNtlNQzGmGabKdLcEUYk5ArMaRFXKJ1jKYASdKlE2qxQX
	o9kxlKuFK5SLybrKHzxQCbjgyFG+UVA+2M00od2JWxCPUacqClFsI8QySbiQiUnnWDW
	HB+0S44PcIp51yO4IMGMLcJxda9/iGc/CFRjnBEM=
Content-Type: multipart/mixed; boundary="===============4350675829852426158=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 a35b0fa19ccfe823962bfbef2db2abcbaab7762b FAILED
Message-ID: <010101959a2b9586-47e380a3-1a67-4443-8c18-d758ccae03bb-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212923

--===============4350675829852426158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *a35b0fa19ccfe823962bfbef2db2abcbaab7762b* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rpm-sequoia-crypto-policy -S a35b0fa19ccfe823962bfbef2db2abcbaab7762b
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:13c70029ab6c1019f55f32449b0aab10097ce460"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout a35b0fa19ccfe823962bfbef2db2abcbaab7762b' failed with exit code 128:
fatal: reference is not a tree: a35b0fa19ccfe823962bfbef2db2abcbaab7762b



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4350675829852426158==--

