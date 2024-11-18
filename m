Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BD6D60CF3
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4679.1731964633083259581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hDHq/gFx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UzHD5wO8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934123e019-59da32a2-07ba-4d6b-9a8e-87955980eef8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E4kjQIVadT4eqTBWcNYVkY8msfwBOrGPxeNAtK5s3sA=;
	b=hDHq/gFxAJchjAdDVL5L4sk8lr8XVqCvgxBL0lWswmO3EwygRE1+rXp52B2CUe69
	x2U6CeJteGzLhfzcTKgjPgl/vIewhXQ17RHlDcgcEpwrLjYnfgRBcVV1o28zJPFp8Hz
	gyyVj457a2CRFwS15CtklGaFIpkXMxwE9QXYUKlU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E4kjQIVadT4eqTBWcNYVkY8msfwBOrGPxeNAtK5s3sA=;
	b=UzHD5wO8FE4ussEstRrikWs20VhojD6AGB0TD61ceozH9zN3zoFo9u4FYrNfwpXp
	2tmEv61dloN0n5uw9Mgu5aFMSDF6O06Rx1y6+tFqYOyGDeLBU3s1cpgbSapkZSDc5TH
	0++r89gr46BRqQps+SJunkz4YX9zbnMduZ7OOlPI=
Content-Type: multipart/mixed; boundary="===============0769830997190973510=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libgit2: upgrading to 1.8.4 FAILED
Message-ID: <010101934123e019-59da32a2-07ba-4d6b-9a8e-87955980eef8-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207364

--===============0769830997190973510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgit2* to *1.8.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libgit2 -V 1.8.4 -S 3f4182d15eab74a302718f2de454ffadb1995626
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:55d148edc2139b63f9705fc37b0eb04b8baad630"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 3f4182d15eab74a302718f2de454ffadb1995626 was found on multiple branches: 
  cmn/backport-diff-header
  maint/v1.8
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0769830997190973510==--

