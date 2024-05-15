Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF60BC27C77
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1237.1715794337433276753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DRJtxz4o;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ChN+D3A5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f7d4fe425-e256c8ad-1172-4bc2-9e66-0957df5e6c9c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uFZrp4GEry6ebbB6IoATrxt8xS3l9EReZviOeZQWEYM=;
	b=DRJtxz4oowsxHLMr8nyc8CY7327KvAiGzcQCkN2+Z46jVRXY5FywTLZ34RPxQQps
	W5+PSebztWqzbPaEcPT+Pc0TTtiddB74k3Rcpr/JW+ESp/jFaMeoWmi04y+tVm7Fc2G
	yheHO1BIy4KHXuKv/HYKyrOqLMBQVDHr71uRLFvE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uFZrp4GEry6ebbB6IoATrxt8xS3l9EReZviOeZQWEYM=;
	b=ChN+D3A5WGyEgFfQsGP9vppEw+Vo4KOFlUfVhvQSmIo4eM2CF5k5ICZ73LnB+EqE
	lGzBjPPQcmwgEgRLQG4Ccti0VJE2LS1/egRU5Q6uu0rXvBAHCgGdfdTIuwM7kjKYAMq
	4JApor6b+6foMpUGMLcX/npXzq32EQIMkY6Brc4w=
Content-Type: multipart/mixed; boundary="===============8665868191379301461=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.283.0 FAILED
Message-ID: <0101018f7d4fe425-e256c8ad-1172-4bc2-9e66-0957df5e6c9c-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199367

--===============8665868191379301461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.283.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-loader -V 1.3.283.0 -S 720be5198aad4696381d2e3eeadc131c9f56bdc6
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-95d13be355049e35a604a7c09c52cdff052fad0f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:95d13be355049e35a604a7c09c52cdff052fad0f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 720be5198aad4696381d2e3eeadc131c9f56bdc6 was found on multiple branches: 
  stabilized_release_2024_04
  vulkan-sdk-1.3.283
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8665868191379301461==--

