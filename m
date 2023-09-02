Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0882EE4993
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.5736.1693650554391069667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cEpuCAmp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Kv3q5rnF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a55708bce-0dc429ae-53e3-43ea-9064-4447b27709cc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r+DX8cJHFHNfFHtcmxSKnZMldpK75011IwyzDkRkdao=;
	b=cEpuCAmpB6Gc9zuS0XlbPg8vNXoFxQMBowR/2llzmHeatdqctMcCdp1ulmoGWOND
	rFFzv7tpLtNkoh3umKeWc0pa6r9YNJdcZeCb2twBw7kKRvnVy26CoZhZBFlUgv5xJrM
	g0LBiW6Xhr81Pi3ZVaQmBOqjsPI+ty9uCyEa1Rns=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r+DX8cJHFHNfFHtcmxSKnZMldpK75011IwyzDkRkdao=;
	b=Kv3q5rnF/TGVwS1xipC5/Z32TYbvhaI6xwBw1hH1F4Kp/7pWRkPXOle4YABFUVt0
	g8LP/P5YvxnDocVSVa+40QzFVjLJoH1lnbRvH36pSEkY10yX66hudhx6/7BKwM91R3o
	+VLAUYvQNTRYnDDPbRl1RHTPSIY+kIbyrGZry80U=
Content-Type: multipart/mixed; boundary="===============6604999289411908994=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 9fd7daa707c37689879391242abc42be737c78e2 FAILED
Message-ID: <0101018a55708bce-0dc429ae-53e3-43ea-9064-4447b27709cc-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187089

--===============6604999289411908994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *9fd7daa707c37689879391242abc42be737c78e2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 9fd7daa707c37689879391242abc42be737c78e2
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (20:05:28.884794)
NOTE: Directory listing: ['tmp', 'cache', 'bitbake-cookerdaemon.log', 'downloads', 'buildhistory', 'workspace', 'conf', 'sstate-cache', 'upgrade-helper']
NOTE: Retrying server connection (#1)... (20:05:29.121919)
Loading cache...done.
Loaded 1807 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-e936b7e09bb7b1dfbfa6d6782e41955de9eb0f1b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e936b7e09bb7b1dfbfa6d6782e41955de9eb0f1b"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 9fd7daa707c37689879391242abc42be737c78e2' failed with exit code 128:
fatal: reference is not a tree: 9fd7daa707c37689879391242abc42be737c78e2



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6604999289411908994==--

