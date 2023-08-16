Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD68EC3DA6F
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.174047.1692224351565921036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZWhmEDpV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LfYpdUfC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a006e6ecc-5cab1637-afc0-42dd-8612-3b8d08dde8a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uekLud5wf6bGXS/u0QtlA9wtytYrz2cqusCjz4AGh6o=;
	b=ZWhmEDpVoPdM7GbqLw3p5ojboTrcwMTxWU9YknV5MO/GEgsTzRUw6fkpOkcMYQY+
	httYFDkvI6hNB4bwTkJR/tGSRUnL8l3/Mf97I+0+Omqz1n8XAoA8cudyy7Gcp6u3aUO
	GnI81iohzyAXZQoVCA9sqngK9Rd8SaNx0TMD+n2s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uekLud5wf6bGXS/u0QtlA9wtytYrz2cqusCjz4AGh6o=;
	b=LfYpdUfCZNUh+UN422yxfoyOYB1cBw5wD6021nV8A6Ai2q9owrBpszpbP51izX3y
	mMDh09amQ9n0YLhk4UWmo5dKc3kDQvrd3+fi561KLTYLJLzjZPCtVDCeKcR9iTkoVo2
	2JrP9qn+njd4TDuMqavkA3sftK9v9sIQJ18wtRZY=
Content-Type: multipart/mixed; boundary="===============1675267242701152211=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bmap-tools: upgrading to 3.7 FAILED
Message-ID: <0101018a006e6ecc-5cab1637-afc0-42dd-8612-3b8d08dde8a3-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186257

--===============1675267242701152211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bmap-tools* to *3.7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade bmap-tools -V 3.7 -S d84a6fd202fe246a0bc19ed2082e41bcdd75fb13
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
meta-yocto-bsp       = "tmp-auh-upgrades:440b17381d719dac43ec249cf67b928398b9d133"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision d84a6fd202fe246a0bc19ed2082e41bcdd75fb13 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1675267242701152211==--

