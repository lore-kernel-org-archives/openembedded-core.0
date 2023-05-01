Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D562BC87FE2
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.107423.1682976349652056934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NCToN3rm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010187d9351baf-d6c14ff3-28a8-477f-a1ca-2cada41cd158-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a11ihDEwHGrpFunsM5H+G76eIwB1x4Sx8GydYPCoBwI=;
	b=NCToN3rmsxlZ2KsE6idyfu0Z8Z3bF7AUVJmS7xPojFtn5l/+Yfl33b6ycmZleo2c
	olG5SUWSUbTd8bBU3CivXDpa5d825+JoSsngy0yMKvB/yUT1u2fW26/Nfvsuk/i33KI
	q3sMEuqBCHN32oGWung/S3+6F9bbX+ByKTTcXdps=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a11ihDEwHGrpFunsM5H+G76eIwB1x4Sx8GydYPCoBwI=;
	b=VUZr4nepCPVkZxzeXE/2rLzFCdwLJIno+1ASOY/L6tYUftR/9ZUH6LaJZqk0WC8H
	HTbh5olfbPNOrla6RpnGcch3rZzQHphmlrPCsUEbJWvGrBaq6yyYkf/EfenKyyAvolO
	kD1FiB8Wt9RzBkdXTVWcNvd8icHIlM0z027aclmY=
Content-Type: multipart/mixed; boundary="===============3688758492025404887=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Weinberger <richard@nod.at>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.6 FAILED
Message-ID: <01010187d9351baf-d6c14ff3-28a8-477f-a1ca-2cada41cd158-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180602

--===============3688758492025404887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *erofs-utils* to *1.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe erofs-utils failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:52:59.534284)
Loading cache...done.
Loaded 1799 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:89edc3ea73026199cc4beb9e54aaab9b13233b46"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 21710612d35cd952490959bfa6ea9fe87aaa52dd
WARNING: Command 'git rebase 21710612d35cd952490959bfa6ea9fe87aaa52dd' failed:
Auto-merging lib/inode.c
CONFLICT (content): Merge conflict in lib/inode.c
Auto-merging lib/xattr.c
Auto-merging mkfs/main.c
CONFLICT (content): Merge conflict in mkfs/main.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/erofs-utils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/erofs-utils/erofs-utils_1.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3688758492025404887==--

