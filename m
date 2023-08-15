Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063B9C27C5E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.129653.1692086043511257358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c10/I+rA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=d6DMYKmz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010189f8300076-98ce8884-8dd4-4d8e-b6c9-7a4fadc19a9b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t5mN0AmfK/xHfjSeCJUrnCp+5v9t6G5EnKrmb9SGyNk=;
	b=c10/I+rAn650pG0d/NVc2CEV2EDLdo2THml2Q7r+000nzQuwFA6olzrU2MArpGN8
	1z7EEO6OibY+ZBX7psXnCXb6EtlkNG+4tlfL6JCiZXFKfJuRlOj6EVEBalTd5D0EJIi
	5VyKQUXCTLv7I1ecII9PDNpjVNaUsJBSlJuQbaRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t5mN0AmfK/xHfjSeCJUrnCp+5v9t6G5EnKrmb9SGyNk=;
	b=d6DMYKmzQV5UaiBEmIXso/m8Xfl4fu4MeXRTW8ghEpdvCaD/ULMVD/FFAn+FnuAL
	J69qGu9l19R/owW+4QFe/tq0y+lQ3wqwGopelnzRayhABhvR8julZvKRLDc7XUbR8kR
	zQSGMjmGLxvy9sYMVCgRN6ZYK2mKjyZ6nrRWCM2Y=
Content-Type: multipart/mixed; boundary="===============0753664339630483574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 9fd7daa707c37689879391242abc42be737c78e2 FAILED
Message-ID: <01010189f8300076-98ce8884-8dd4-4d8e-b6c9-7a4fadc19a9b-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186002

--===============0753664339630483574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *9fd7daa707c37689879391242abc42be737c78e2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 9fd7daa707c37689879391242abc42be737c78e2
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (06:52:31.829574)
Loading cache...done.
Loaded 1805 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:350fca31274618f5c89a3d3e815a355516da84fc"
workspace            = "master:d151ba95f69d7224241fb8c76c90bbe4b2fd9563"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 9fd7daa707c37689879391242abc42be737c78e2' failed with exit code 128:
fatal: reference is not a tree: 9fd7daa707c37689879391242abc42be737c78e2



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0753664339630483574==--

