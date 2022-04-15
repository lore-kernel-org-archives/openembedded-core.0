Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE40C38A2B
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.11729.1650052688302249203
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dhbL9Wbe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101802ecde6ff-a3577734-a6de-497f-9890-aa6607354c37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D2UG6FNMFAC+QAQN9nv7lps3Uzizv9ZLLTDSUiXg9gg=;
	b=dhbL9WbeWxJNInpNCCiQC0q4xvhgsJr4auQPECRIETNo3mvcYaR04L1tvcsLj2Y6
	gZfMAYn+ZaxqqNay02vaXuNLiw+p3CzpWAR1Wv561MvuH9o0+rQYB23y4zwK2x45Zn0
	zn6/wcoFetCwxXNMs+LiZPegEN4o3T1wBPNXw4GQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D2UG6FNMFAC+QAQN9nv7lps3Uzizv9ZLLTDSUiXg9gg=;
	b=JsQJ86O90Pzck65f45W1QZXOeK3yDzK1IFW6HFgszowI3CH/H1vBpfqzyD7Ebpsy
	Dlj8Vex6QpqlziLr3TtPL4MD8Ngg2LsJvgpVr0uD7iWBqhZO2/cD5xdHupNCYHwR0Zt
	I+Pg7NuQNBOvlgv9q0ewr8q8/YV8E+s5kcgajK6M=
Content-Type: multipart/mixed; boundary="===============7274914154290967684=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] squashfs-tools: upgrading to 4.5.1 FAILED
Message-ID: 
 <010101802ecde6ff-a3577734-a6de-497f-9890-aa6607354c37-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164475

--===============7274914154290967684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *squashfs-tools* to *4.5.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade squashfs-tools -V 4.5.1 -S afdd63fc386919b4aa40d573b0a6069414d14317
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1641 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:109bac4713d7df55aea5101e75fcd0441ea2bb6f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout afdd63fc386919b4aa40d573b0a6069414d14317' failed with exit code 1:
error: Your local changes to the following files would be overwritten by checkout:
	squashfs-tools/Makefile
	squashfs-tools/unsquash-1.c
	squashfs-tools/unsquash-1234.c
	squashfs-tools/unsquash-2.c
	squashfs-tools/unsquash-3.c
	squashfs-tools/unsquash-4.c
	squashfs-tools/unsquashfs.c
	squashfs-tools/unsquashfs.h
Please commit your changes or stash them before you switch branches.
error: The following untracked working tree files would be overwritten by checkout:
	squashfs-tools/unsquash-12.c
Please move or remove them before you switch branches.
Aborting



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7274914154290967684==--

