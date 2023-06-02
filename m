Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D7FC77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7620.1685693431241538892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=beWhLsdc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101887b288772-7988e4da-d48c-4069-856d-a3576f412522-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eHtdg/1aMdzCkeGfwbPqWFf2cGr6N1/Ic5Agzs+wdSI=;
	b=beWhLsdcFKXxYi5KjU7hpAIhAr4Roqj0q+vwffMN5eFwL8UXHzECHyREXcPQl95G
	6gJ6KEwqVCxkxMBfSqjPIm9lnbrNTer4ykkeB1EfjW1A/mryVLPoscOmiWNHlMJcv7R
	Z1gE/p529McgnYWCf/HzfH7rvF7mADYpF1f/j38k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eHtdg/1aMdzCkeGfwbPqWFf2cGr6N1/Ic5Agzs+wdSI=;
	b=kYHXp33e+JkJ9gMzDpOyKTl0fLDUHnf4U955crkLmHzqEgKT4PbHJcR0PnRZmCza
	0cy/bfgsVDhC9JaPhHYO9/Xk8Su1pSh8ENP+2Djj8BsqPLB2Cpxv0I2a6NBb4vICMRE
	lYspqoNTzakSlsgcGEuKLbWuRdPukSYJcHRQrFGw=
Content-Type: multipart/mixed; boundary="===============7901391048533268952=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 5bec756976671f30903223ec46ff8a70dced4954 FAILED
Message-ID: <010101887b288772-7988e4da-d48c-4069-856d-a3576f412522-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182216

--===============7901391048533268952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *5bec756976671f30903223ec46ff8a70dced4954* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 5bec756976671f30903223ec46ff8a70dced4954
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (19:36:22.835516)
NOTE: Directory listing: ['sstate-cache', 'downloads', 'bitbake-cookerdaemon.log', 'tmp', 'conf', 'workspace', 'upgrade-helper', 'buildhistory', 'cache']
NOTE: Retrying server connection (#1)... (19:36:22.968766)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f35b7b66175534cfecf99c26b73f4b888a6b2dbc"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 5bec756976671f30903223ec46ff8a70dced4954' failed with exit code 128:
fatal: reference is not a tree: 5bec756976671f30903223ec46ff8a70dced4954



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7901391048533268952==--

