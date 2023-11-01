Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC22C25B61
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8641.1698848702993284554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bW/C9AKS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UvnBItTr;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b45fed7-194e86b9-ebe6-4a33-a618-f0d204d68b1c-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lofkV8wszf/6z4h3xPZr+8ab5QUcuW3Qb5z8eJ1yZX8=;
	b=bW/C9AKSpgzZGMz3kUdeJgZ3OF4dkdqXkmYbjpi0hOOL9bXaPKR6sVWEdtruyqKo
	hriM9WE/dWFljUKi1pu06wVmWP5KA7yUow9fRdrzRRSglahl2UtDozU0m3ul1Y3MTLp
	upFJLZDQ5BCq2xqpT0lZNilodRi//ZcEznw84lXg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lofkV8wszf/6z4h3xPZr+8ab5QUcuW3Qb5z8eJ1yZX8=;
	b=UvnBItTrB8qqdfbDh9EOffJ6OEFjet6QzleaciqQn0pr0mD/zkZ/mglqO+xVgGjD
	ygDOMvJvA1c3/ITTJRUuaYMr+tlmUxr2UCKAhTloRwcQrmU2rTtPco/P4j8kqf9OKtu
	GBRX5GbsVKxskozJxJEOypQVXDi8cNQRh6ZucCLw=
Content-Type: multipart/mixed; boundary="===============0575782913803053243=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] psplash: upgrading to ecc1913756698d0c87ad8fa10e44b29537f09ad1
 FAILED
Message-ID: <0101018b8b45fed7-194e86b9-ebe6-4a33-a618-f0d204d68b1c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189921

--===============0575782913803053243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *psplash* to *ecc1913756698d0c87ad8fa10e44b29537f09ad1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade psplash -S ecc1913756698d0c87ad8fa10e44b29537f09ad1
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (06:15:02.091822)
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
DISTRO_VERSION       = "4.3+snapshot-44358b45ce9d9ee2b38ebdc753abe08e270fc198"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:44358b45ce9d9ee2b38ebdc753abe08e270fc198"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ecc1913756698d0c87ad8fa10e44b29537f09ad1
ERROR: Could not decode SRC_URI: The URL: '${SPLASH_IMAGES}' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0575782913803053243==--

