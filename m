Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7BDC44508
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 06:06:33 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.267.1783749983038531414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 23:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=H9mz0Suq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qYNlj+Pp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f4fc8b624-55cd5430-cf3f-45c9-81ee-2b55612bcd9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783749982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/kedhIW8mbXfVez+QqJG1KAzEY129bwZMVAr3ybkefs=;
	b=H9mz0SuqCgdzut7lqO65k6/JvJ7Ab9Vx/wDhGrURAurkewT1H7nqF9zWdXKioi0D
	HfEzAVGsj1dc7zUgIw1SJzSOo19NM3a0zA7rcfOQxnVoCRnGBaNe4b5m8U1jaVerD6n
	rdDSCl7K7W/G5G51hdSyljNV70BqLIsa3hJK95cw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783749982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/kedhIW8mbXfVez+QqJG1KAzEY129bwZMVAr3ybkefs=;
	b=qYNlj+PpyKZWsXQTAjn8uiQafY6oHXm23Bq1l0Yg38gA1pL1o5Mz5CIp5gIgkGGp
	M6oeOmR8EdfLvxT7/tKFCWNqC94kQHA694nS1uuaM7cCoyeRt7YjFV/VvxDfEMzKk2C
	4cRhsMhVAYfkTjXsUinOfK2OgMVk7C6U9EKP7sRQ=
Content-Type: multipart/mixed; boundary="===============7810556980052845608=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] blueprint-compiler: upgrading to 0.22.2 FAILED
Message-ID: <0101019f4fc8b624-55cd5430-cf3f-45c9-81ee-2b55612bcd9a-000000@us-west-2.amazonses.com>
Date: Sat, 11 Jul 2026 06:06:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 06:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240705

--===============7810556980052845608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *blueprint-compiler* to *0.22.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade blueprint-compiler -V 0.22.2 -S ed35ac74de0c1bb1f5e852410b97edd1f08904c9
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-e03eb8b1bf1d63ef1d8aeaf0a70e0a29dab2f66d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e03eb8b1bf1d63ef1d8aeaf0a70e0a29dab2f66d"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision ed35ac74de0c1bb1f5e852410b97edd1f08904c9 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7810556980052845608==--

