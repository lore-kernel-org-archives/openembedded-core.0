Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D17C7EE37
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.30000.1675272853928444061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H2Oy5dFI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101860e0b161e-8e129416-f3bb-440d-acef-64719687cbbc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jyvvxr9zw/Ljf32q48jYsOLuXLuiVUn24vKhhjGYdJ8=;
	b=H2Oy5dFIPNe4+wy9qD+/Pj/H2mW1RwKT8kjvPq4dlD+11tgLaNiRRHzP2YPPorq1
	Q81Dmqj+zpknt/LEIiDr5EmyRHCiFFuohxWLXXRHbVa71Jb2NtKiudDRoPklZEBRBSV
	Jh+7JEzdagjUeGE5YpWjfsEIWgPC4I9957DDD72I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jyvvxr9zw/Ljf32q48jYsOLuXLuiVUn24vKhhjGYdJ8=;
	b=a4BhLquJnmGJCa6F4RcHCKwA+I9ZPOpXyUEXAE8RoreRjyeAfWg93C5oFxtN0wTp
	dudWtbYTyf2YiDjzNKAQR4WISIkEIu6OpLYUZEP5mdny6ib1XZbxRmpmRrg07K0g1hx
	xdotuZoAVntpl0cXdX7k2ebmCesgzpz9SjOvQBhE=
Content-Type: multipart/mixed; boundary="===============4863752754394967449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-testsuite: upgrading to 2.37 FAILED
Message-ID: <010101860e0b161e-8e129416-f3bb-440d-acef-64719687cbbc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176574

--===============4863752754394967449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-testsuite* to *2.37* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade glibc-testsuite -V 2.37 -S 2412deae1af0ca37b096ff73517486e7d1e9fe46
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:06:01.918326)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a3654d799019e8817e72da09d14ae699331dc7c4"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2412deae1af0ca37b096ff73517486e7d1e9fe46
WARNING: Command 'git rebase 2412deae1af0ca37b096ff73517486e7d1e9fe46' failed:
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS
Auto-merging dlfcn/dlopen.c

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Could not decode SRC_URI: The URL: '${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4863752754394967449==--

