Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F292C83F07
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1407.1751386804871394331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hfVIebiJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nTDEKw/5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010197c6ca0bad-41e8becf-68a3-420e-b32f-d14a24b4c59d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=afibk/7EAcUtiGJb97lYv8xf8ER3Mm/rUFYmQOZ38u8=;
	b=hfVIebiJsfgdSfSSr9ZGCRh79W/19uULVtlmBunlTvcDel4OsE0vumogUcQEeAly
	2wnylDQnrnRqz2PnriQYDshSzmEuCiy3hYo3x2LNFC0p2t3n6/R30gOjuQm1mJaCFvS
	RDAVLCzD8rBZeGifNuDNpJGGVx2MTDUSq0uWWBsg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=afibk/7EAcUtiGJb97lYv8xf8ER3Mm/rUFYmQOZ38u8=;
	b=nTDEKw/59j2Vd/fdAwggANPe/UT6GhE7CJZ7A2rqGQ4/9e0zctonlB3h/k0nLgM4
	7xfPU5ebe2Pxnxf0QF180jTr9dTjIJQEnMPagmXlzbZt+CJWHKQfyZHCXajzik4LaWs
	7g6K4joyGuLobD/8xK9ujX3eFGcS1a2f0IdCD/o0=
Content-Type: multipart/mixed; boundary="===============0939869135092108247=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 8b405629c4a5215871be932097e099c05ec5cb2e FAILED
Message-ID: <01010197c6ca0bad-41e8becf-68a3-420e-b32f-d14a24b4c59d-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219655

--===============0939869135092108247==
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
Loaded 1917 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-efe56f75419b290fb34e30a6e318eaf89354ee0d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:efe56f75419b290fb34e30a6e318eaf89354ee0d"

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
--===============0939869135092108247==--

