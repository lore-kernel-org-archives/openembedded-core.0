Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227A0E74918
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.64728.1696183990449736726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JIG6ooP/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y6+qQMhd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018aec71bf13-36418a9b-f4b5-460f-aae8-70fc4f1b0354-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W7ccq2uEv+/pAIoi9Z4kpkInE97tzTEtLRyhFBwsWss=;
	b=JIG6ooP/Nxa/+6OOKO3G9JWkaWjjcGya8OPkQXtMxDCX6p2BGstF6wgGcy6rYkYU
	Yq/N3Ys3+wXj5ZtiMN5Fv70XSVmTxZi90NxXm2c60WSGw/FaVQ64Gixw8C1O/urQFXF
	CdWReNae91UIYK4hoT9xMEx5pT7mKmHc5r4pYSeY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W7ccq2uEv+/pAIoi9Z4kpkInE97tzTEtLRyhFBwsWss=;
	b=Y6+qQMhdCsvEbUCryn4WeTTU0HPMpsfM5dnHmMpyu3jIcUNWFcIX1+FnqHvJbuGq
	GnDxhZbCbWe5UtI29X4sBPEolUNeZnXSksR/CQjcaOEtPkqv+XZhKq7WxepEFArxWt2
	7cpMqxKvJj2SC06g4XCi09otx77kxgSyiuXp4xNc=
Content-Type: multipart/mixed; boundary="===============3622837139037667865=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bmap-tools: upgrading to 3.7 FAILED
Message-ID: <0101018aec71bf13-36418a9b-f4b5-460f-aae8-70fc4f1b0354-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188572

--===============3622837139037667865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bmap-tools* to *3.7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade bmap-tools -V 3.7 -S d84a6fd202fe246a0bc19ed2082e41bcdd75fb13
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (18:01:21.898321)
Loading cache...done.
Loaded 1845 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-264d9e4f8dd82d98567897db36ebe0048d9a5063"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:264d9e4f8dd82d98567897db36ebe0048d9a5063"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision d84a6fd202fe246a0bc19ed2082e41bcdd75fb13 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3622837139037667865==--

