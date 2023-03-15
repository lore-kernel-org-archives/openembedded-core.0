Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B991BC87FDD
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.12143.1678895725599081107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZUA+/Zg6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010186e5fbb95b-bfc34bf1-978e-46e1-945b-da53bb6ebcad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4k+FGFAtxsnNBZpEvcrPte9BEs5UG7sSqdp4In83xNo=;
	b=ZUA+/Zg6EwuICE02NJKKXw+dM1JNWtYxOOFwi0naryOtTsaIDFABNFSDJTXgGw3l
	Kz3L5uANTckg2xULqxumj4KrAkjyYBkhPfaVxelEkarpWZZwEUjo9cgmCoUXoOozXrf
	rRbgDGAhIqKcT98vs6JrSe2xBpfy5XIzlJGWA80w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4k+FGFAtxsnNBZpEvcrPte9BEs5UG7sSqdp4In83xNo=;
	b=Jf99BrUNYoVkBfGKbU6b6SY5cjpT6Ia8UJhh9QI03aMCvX5vCiTqJN67EpK3m6pR
	mp8te38iuJhsOEJBQQ7PwssGqsqsrWs0alqkNQ1C+/btbgP2Pa9O81m4DHYl0PINMXk
	Hudr1x1v5Jgh4xO7EqAUH0swsL/wtVoYHhhoEMEk=
Content-Type: multipart/mixed; boundary="===============1655639320229401569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Weinberger <richard@nod.at>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.6 FAILED
Message-ID: <01010186e5fbb95b-bfc34bf1-978e-46e1-945b-da53bb6ebcad-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178589

--===============1655639320229401569==
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
NOTE: Retrying server connection (#1)... (07:38:54.424446)
Loading cache...done.
Loaded 1791 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8a26052a81564959ed964f8921c7e4b10907ff0d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8a26052a81564959ed964f8921c7e4b10907ff0d"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
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
--===============1655639320229401569==--

