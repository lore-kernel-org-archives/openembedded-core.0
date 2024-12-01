Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDE1D10DB3
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.148758.1733047553851607681
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZfmrXObN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zgmuRxSv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019381af0c1d-66973e8b-a93e-45ff-bda6-ec1aeaf3e313-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dc4z3+UkRTn0GR7LQReHGjiznOhk5IFEyxRWwJLwoM8=;
	b=ZfmrXObN8pI+T8+52uZ6+vVS0HEep2lM0QAnSFUuMpVAnkNWyqZy9aUQCKKcsCOC
	RYrhoSbYWf8dvbGHATx/0N4VOCe6b5oAsa3AIqNs/LftMc9kj9HTlxIhWbiZmcsaSyx
	x8zMxM9ENsywEO8++8XSK+aLe5+wz5ArdOY0vP4o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dc4z3+UkRTn0GR7LQReHGjiznOhk5IFEyxRWwJLwoM8=;
	b=zgmuRxSva4cJQ7Vla7QU4dxWtjGHON8A1RJsi+STd1FYYlZe+Bi1Ho53u+WZNYO5
	ssXcySAPUTdQrPwBHls6jYG6QpMyXwypLCcErQ0kdKkNgSNkPjqUIMlw8jc0aUXF+zt
	FdQEwVmtxSZV6NdmIZzRLIF3WzuSxkBO/QIqvVB0=
Content-Type: multipart/mixed; boundary="===============0153449237729954769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rt-tests,hwlatdetect: upgrading to 2.8,2.8 FAILED
Message-ID: <0101019381af0c1d-66973e8b-a93e-45ff-bda6-ec1aeaf3e313-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208057

--===============0153449237729954769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rt-tests,hwlatdetect* to *2.8,2.8* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rt-tests -V 2.8 -S c8b918c53cd57fdcbb6df153064d1b2e5cc329e8
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:6925c68dd64f9b4d5d9722c10c2d59d55080e111"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision c8b918c53cd57fdcbb6df153064d1b2e5cc329e8 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0153449237729954769==--

