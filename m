Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A64C7EE39
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8867.1749993283379952987
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lGlabP4r;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NVsUbott;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019773ba5cd9-a3a448bc-dbdf-4a6d-b564-41e49179665e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xe9sccx5QP2dNjvZUmro/mx37y5SIIH3QW2nQT5G+fo=;
	b=lGlabP4r8e1wheHyyJTbgQ+3dNMT6kWe5wvVtAe2NDFpeNjJZ6cpDhIL6MwRG1tm
	pguPcu+it0ylstB11hHxKhY4B2V7D8TrzC9H3hyzJMA60ysK68Z2D5L3XZY1O6Oc441
	KHQ7T0+kTBCSMzPeuJ4Kh2CKULOP10i4m0TXLqRE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xe9sccx5QP2dNjvZUmro/mx37y5SIIH3QW2nQT5G+fo=;
	b=NVsUbottPSuchSr+gA6wkqSGlHM1mRhPf736L5kcr6v1PCZkdmPQ7BM0XRiA9G2s
	UwytHiNuTVY0ECN07FETSYtfN9juklI0egsfLYHnpJYBw07Xynu4LCT1Auuxe9kFnR+
	X9+vcl9U3pLN755U3Rqd0nnly6BvvbPLVL1nFAvk=
Content-Type: multipart/mixed; boundary="===============5357650149717975128=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bindgen-cli: upgrading to 0.72.0 FAILED
Message-ID: <0101019773ba5cd9-a3a448bc-dbdf-4a6d-b564-41e49179665e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218667

--===============5357650149717975128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bindgen-cli* to *0.72.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade bindgen-cli -V 0.72.0 -S d0e7d6b5b763e93dd38f9ece05230979ede95a0a
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1910 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:d8864ad51c3a413af84b775b11df2ca5a9ebf35c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 9 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision d0e7d6b5b763e93dd38f9ece05230979ede95a0a was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5357650149717975128==--

