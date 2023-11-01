Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BBEC16AB3
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8663.1698848705063740353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P36LkbQx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gII0Cb+M;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460cd3-5d20dae0-d813-4936-9d01-e7cefd6bbb2b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yWOS82H437+R1gUSmiQxS7VoarePq+U2OqOXk3pHNjY=;
	b=P36LkbQxKVuWwZlyoSv/8oSbxm+gulgqZsIZg7U9kqfR2MpTtfMJ5sS4cGcZkMU+
	Z2sc8Ia/Ni7FhAnSnjVYhox3NP5A6pGVOHzKCOsyvKG5w3iF4acsYByk7/WK7EbPAFb
	6HizMdqZoySeNhvlEqU5f1Tg3yAhFkKbePYciY/U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yWOS82H437+R1gUSmiQxS7VoarePq+U2OqOXk3pHNjY=;
	b=gII0Cb+MJpogY9RdOsSVW4+iY22y5Wqgdo3suHsOz4ws5kCjqchS6jchbuVnQLez
	OnHQCoWpD9+mHF9x3Ys+xSYNnfrtYbut7U7pX1jDDOxp5vpiRMDukUuKByayPgUqsZp
	oq4IJkHzXsfuxk7kLeNc1yUejgjLiBpVfbsWAmew=
Content-Type: multipart/mixed; boundary="===============5762288742380402124=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.268.0 FAILED
Message-ID: <0101018b8b460cd3-5d20dae0-d813-4936-9d01-e7cefd6bbb2b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190010

--===============5762288742380402124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.268.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-loader -V 1.3.268.0 -S f4c838e2e7358fc450f8112119bbdbb5b03e03fa
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:09:12.826634)
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-59734f71c2a6c7bc4624d2e2aeefa19c743e6444"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:59734f71c2a6c7bc4624d2e2aeefa19c743e6444"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision f4c838e2e7358fc450f8112119bbdbb5b03e03fa was found on multiple branches: 
  stabilized_release_2023_10
  vulkan-sdk-1.3.268
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5762288742380402124==--

