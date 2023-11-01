Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48135C05032
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8649.1698848703575674379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IuZGKq9R;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ULDF266u;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460e4d-06269452-1934-44f8-8d7d-d91646ef1a6b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V9Iq8jf6RQ4LjfgYgYVgaTiTdh+dCVav8Xeyr8VE6TQ=;
	b=IuZGKq9RMpywD77n77lnGyLQg8i818cd06T3kzdbmRi7bRtkKTBJwNaZSlNoO3gw
	oKRxKyDI9tvJM8OwLfSgpHyJXH4E5bn7kgfuF6rLZy0eAaTOCJjqgdCWoOEyfDqw/W5
	mJNiWGMt00bdVNdnGYwNi1QvsAuFYITdbni1y0Nc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V9Iq8jf6RQ4LjfgYgYVgaTiTdh+dCVav8Xeyr8VE6TQ=;
	b=ULDF266uf0XClpFAWqiq0HQMg2U7nCp32Mm/y64eRDA2hfGntslC6MzIIZmdWpei
	+6mtQkeyInCzzNtRL5QgF6h/nps1QWHrwdy71bwtgwjWN0/HmNGD7obCw0h+Q7eOhhG
	q/9TdOf11lvHu6+GHftbtFfwFz/olEt5wMLyg86w=
Content-Type: multipart/mixed; boundary="===============3735169736718279530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bmap-tools: upgrading to 3.7 FAILED
Message-ID: <0101018b8b460e4d-06269452-1934-44f8-8d7d-d91646ef1a6b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190020

--===============3735169736718279530==
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
NOTE: Retrying server connection (#1)... (13:59:22.578371)
Loading cache...done.
Loaded 1843 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d93cc66c569d116ee8ac5cde7d214756159dff8d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d93cc66c569d116ee8ac5cde7d214756159dff8d"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision d84a6fd202fe246a0bc19ed2082e41bcdd75fb13 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3735169736718279530==--

