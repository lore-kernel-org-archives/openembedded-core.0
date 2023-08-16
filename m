Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC65AC27C78
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.173800.1692224343876250445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FUUIRWzl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LIq6EIMc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a006e69ef-eb614c6f-35fb-4152-8f3b-f957fa6c8cd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fiCNV/JvvIzhIJKwXIqJgcjmVDw4TClXg7iHfukx2QM=;
	b=FUUIRWzlCn53tG7kpDGYoXCWqBD7olBfIgBhaOzpSKJOYUE0WeJz3eHDCCUaaiVl
	pBZmwwgQ30SZbzyCcfbZWyNEy6MdaSTORvn4EO2Q9qd+e1os1+NOq15wchNYY6waKOy
	WRZpon5yJ3UV8qZKEo1qXzZMzt0T2L2kTi6Z1qv0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fiCNV/JvvIzhIJKwXIqJgcjmVDw4TClXg7iHfukx2QM=;
	b=LIq6EIMc+74t/LSnncXBM970BSQXmuqKbFoBhAJbwnYGrFvD5iWva5e+MCC/2F7R
	M7jO1G/cbKmdS8Cwtv2MsiOJ4JJUvD3AOEu0GB8Ka3/cjKHVi/KHGqEvBxVS4aOVkp5
	H0oMUpL4Qpb5Iismn+kpovhDk7TakL/o6cInXVTA=
Content-Type: multipart/mixed; boundary="===============7817563672190029486=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.250.1 FAILED
Message-ID: <0101018a006e69ef-eb614c6f-35fb-4152-8f3b-f957fa6c8cd9-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186223

--===============7817563672190029486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.250.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-loader -V 1.3.250.1 -S f372068d09fc13bcf54b8c81274f37aa5f46aea3
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1805 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:94b172f42163a712853d0bd1d3d80659991a892c"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision f372068d09fc13bcf54b8c81274f37aa5f46aea3 was found on multiple branches: 
  sdk-1.3.250
  stabilized_release_2023_05
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7817563672190029486==--

