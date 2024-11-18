Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD44D591C3
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:59 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.4649.1731964609737650023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SKgAK+gy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=F01Ixsk0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101934122a2d4-5be68965-e2ef-49aa-827f-9d381df43c6f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964609;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ildCi462qRRE0typWxBcXzAAWA2pOgv9o06GYbJD5QQ=;
	b=SKgAK+gyHBO6PPaSrzXL2qj8zIOey6Nyaw+BRliRqcxX6EvnDdaDYAAnmjOXDZk0
	7DJyWVXfeSR7QMDsB/kopkA0XuOA0cnfVkhJre+tmvJ5BTf7r2MNNy/uIsFDzM2gvev
	KqHeNrP3BTHijMbda4fbjuziYKuaVqbSvbxDIiYY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964609;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ildCi462qRRE0typWxBcXzAAWA2pOgv9o06GYbJD5QQ=;
	b=F01Ixsk0+/CwVaEBtOwMcLnD5kjI/MQq8d8FEEMxugAqurHBodmwE/vw+8q9BhjD
	j5KdDEZtNGsA9FNI6x7Ankb/OE6nqbpAsNv7eMh0tSFPADqY+bLzg5wcIFegYtwCAnO
	qyUBeEnpTlys1LnCkcUUEWnzpir3jjw6QkOXqyXI=
Content-Type: multipart/mixed; boundary="===============6108339132051234078=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202408.01 FAILED
Message-ID: <010101934122a2d4-5be68965-e2ef-49aa-827f-9d381df43c6f-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207251

--===============6108339132051234078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202408.01* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202408.01 -S 4dfdca63a93497203f197ec98ba20e2327e4afe4
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c0406ccb4b4c5f6d000349d037767835353b28bd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4dfdca63a93497203f197ec98ba20e2327e4afe4
ERROR: Execution of 'git rev-list devtool-base..b64af41c3276f97f0e181920400ee056b9c88037' failed with exit code 128:
fatal: Invalid revision range devtool-base..b64af41c3276f97f0e181920400ee056b9c88037



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6108339132051234078==--

