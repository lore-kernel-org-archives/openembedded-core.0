Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5E3C369CB
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.18061.1743511402834266144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fqeGXVXA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VR0Cb5CZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010195f160b65e-7ae1abb7-1567-4e0b-9795-cb5d5126262c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9eTjZGLoAFWa2I9z8mp6d78DXCuYrd1jwpICNYZ5I08=;
	b=fqeGXVXAbmPL/amo25Kk+FMPyfU5eISWino9xdhqTTQuX8MFh865tFr17saTV8yK
	RyGjvWjRV75ha0EsNE1w1Mr6ASBKL9FSXBP5lfs6l2l3wfWoafCvfjzOoxk0sAI96Iq
	ZBM2a1D6zSNcMF0Oun9kIzA99kkWRn5FoVrE+TNc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9eTjZGLoAFWa2I9z8mp6d78DXCuYrd1jwpICNYZ5I08=;
	b=VR0Cb5CZbwkzUD7/dR0b5YCcQCfRJHL4m4xasvXfpab+A6ru0+8gB+7xNTqGvb4Q
	yZXmwso973vwdY3ZoQ+++9gcrR5F40V+r62Xs85n507/xDJc3XhLhL6+xq5PdJ8wi6C
	i93mcbM5KrQxEp85OqJ+ZtfttHRfwesHNyPky47I=
Content-Type: multipart/mixed; boundary="===============0138756359791104940=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 37143547a6dcf01c2657f3d472d3ef50d6e23633 FAILED
Message-ID: <01010195f160b65e-7ae1abb7-1567-4e0b-9795-cb5d5126262c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214081

--===============0138756359791104940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *37143547a6dcf01c2657f3d472d3ef50d6e23633* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rpm-sequoia-crypto-policy -S 37143547a6dcf01c2657f3d472d3ef50d6e23633
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
workspace            = "tmp-auh-upgrades:f63b6fbfe1ba3df3eae9d012a208cd87547f577e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 37143547a6dcf01c2657f3d472d3ef50d6e23633' failed with exit code 128:
fatal: unable to read tree (37143547a6dcf01c2657f3d472d3ef50d6e23633)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0138756359791104940==--

