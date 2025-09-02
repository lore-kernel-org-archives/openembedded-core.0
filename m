Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834E0CAC58B
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.89805.1756850194378468698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Bs4XUKeu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rl/TCBah;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101990c6e9fb4-4dbc9a02-99bb-4f51-a507-b07243860b86-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P40tGTRmMNpyHrpmUxC+3Qwscv4TmTSVGMh4fQB2rG8=;
	b=Bs4XUKeurg9p0OGYJcOo4jtaF9YhhHZxsJJ2CRt9l3P1Nrdsu1t9uZSYct5WCzL8
	1jkJEsEjOnr0rOjBmsduHIEgw7Zznj+0n+V75dNCX3tysSC57kBT6fCqEmWleL7m3PB
	BJcWCwvt5DjKZggDIxNmUropRK89ROEVMjHhST7o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P40tGTRmMNpyHrpmUxC+3Qwscv4TmTSVGMh4fQB2rG8=;
	b=rl/TCBahnhlkSqGAyr46YSwjnVKx72pjRsuBL1QGdMeNLL+T5AUfKQeUYbtc85g/
	Rkvwp6Qv4uX2uNIzAvbCG7CYmJ4oo/oVAYTKXftUe4OFKT3ZWekpWdClQjJfGolk63c
	/QPM0j2c6PpLwsYwuIgn+n2xzgqU5+dv3xSjsGeo=
Content-Type: multipart/mixed; boundary="===============9079730068873430528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 60de2f09864f5cae0110de29b77bedce025a8fb1 FAILED
Message-ID: <010101990c6e9fb4-4dbc9a02-99bb-4f51-a507-b07243860b86-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222811

--===============9079730068873430528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *60de2f09864f5cae0110de29b77bedce025a8fb1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 60de2f09864f5cae0110de29b77bedce025a8fb1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1940 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-48307575d161c503b51605d22a0f031fea52737d"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:48307575d161c503b51605d22a0f031fea52737d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 60de2f09864f5cae0110de29b77bedce025a8fb1
WARNING: Command 'git rebase 60de2f09864f5cae0110de29b77bedce025a8fb1' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in e130c5c (Add changes from do_patch).  Version e130c5c (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9079730068873430528==--

