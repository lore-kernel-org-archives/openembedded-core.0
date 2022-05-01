Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACE8C4708D
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.2320.1651434541544190390
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=K6mFl2uA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010180812b5857-e045e5bb-3e4f-402a-b395-63645a7a47bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CWru9LABo6+nWAOVOW5lMaFDWntmEbxmfKYplAtwgw0=;
	b=K6mFl2uAWJOyckAB+hV+sTuVO1Q9vqtv6mVyb+nEGyGyge36LV7slE7CBM7H4VW1
	B4B1ZGR+TCGOnwdRNC3y0fTf7s9E50AHEZN1FOcatx+2YbIgq2IgDzPjyg1WdNk4spV
	hFvHrw10DmHIqnCeLM0wM8mIFUnepXo13C70k3hs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CWru9LABo6+nWAOVOW5lMaFDWntmEbxmfKYplAtwgw0=;
	b=fFNeJkD3mAG9JSbMizkg9DR+DfZXbCgV2wM+LUrobYjcKiD5Cr2fEqk5XOGsuYxB
	6vWpXK+UbIk0JT22SjyTuO6fA6OfBrU5F/0Q1glIhHflkzQsMnJxnZ8Zq2VMwKaAwoh
	az6WtxSpIHYZE4VZEYNnJD3c/vJ3KRiE3ZLIWCXA=
Content-Type: multipart/mixed; boundary="===============6841881557380784093=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.6.2 FAILED
Message-ID: 
 <01010180812b5857-e045e5bb-3e4f-402a-b395-63645a7a47bf-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165130

--===============6841881557380784093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.6.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libhandy -V 1.6.2 -S f050453109db05621b9a47b9931fe1b571905e67
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1642 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7b332f45d4799bb43c771c841944949943ea0945"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7b332f45d4799bb43c771c841944949943ea0945"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision f050453109db05621b9a47b9931fe1b571905e67 was found on multiple branches: 
  libhandy-1-6
  msvc-1-6
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6841881557380784093==--

