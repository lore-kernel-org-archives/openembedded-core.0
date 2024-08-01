Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8736FC5472F
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.75486.1722536823636237147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=h7RSAWlI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bxTJqu39;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f32097d-ff4a353b-f3e0-47d9-9abb-ea61e921e528-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9qXooo/QV2HZNqXaVWaVhJhDwJgcYMD+NUw7azB67vQ=;
	b=h7RSAWlI5xTd364J4w8k07rtRu7aVEXUSpAZ/6oNGL5KTA75ioWEZu0YdMsLk6Gp
	bWkCvhut0vl5Ys/ZRTkBxPiHCQe9jJwJQV2Wt3fhYcaKpzdWWSpEcPGEN0X1Afy/oPJ
	hCnK8gJfAEWtdV5AHbSVwWkDrcUyHupc9G4uDATg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9qXooo/QV2HZNqXaVWaVhJhDwJgcYMD+NUw7azB67vQ=;
	b=bxTJqu39fsntTnSLREeNkvbI7LhkjOreK3f/njHdjo2Ep3mEtif4CbMifxnEfbme
	VYT2tHzaOX3KMNx2FdnH6xdLj+mOXrc7NxRtVj5gvuFBXuTYmFgPMlNHhIm8QRE8deZ
	pa3lYHkqBihbKKgoAK4tHDim5CIDRAeGVXlsDjDc=
Content-Type: multipart/mixed; boundary="===============3792485256268615781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202405 FAILED
Message-ID: <010101910f32097d-ff4a353b-f3e0-47d9-9abb-ea61e921e528-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202782

--===============3792485256268615781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202405* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202405 -S 3e722403cd16388a0e4044e705a2b34c841d76ca
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-673920ce704e80c8fe2aaf7763f50d3c6fd1fda6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:673920ce704e80c8fe2aaf7763f50d3c6fd1fda6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 3e722403cd16388a0e4044e705a2b34c841d76ca
ERROR: Execution of 'git rev-list devtool-base..b64af41c3276f97f0e181920400ee056b9c88037' failed with exit code 128:
fatal: Invalid revision range devtool-base..b64af41c3276f97f0e181920400ee056b9c88037



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3792485256268615781==--

