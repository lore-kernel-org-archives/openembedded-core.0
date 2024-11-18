Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C54D60061
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4672.1731964625466138589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RSa8NJUU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FfnPpmFa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101934122e010-97f548eb-da50-4159-8d03-42003c9df79f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kiOJQShuiOUepla1ySJsTGC6ciStD2eAsqPSLz30gpo=;
	b=RSa8NJUUPgy30xdrXoj7RxLxAjaj13FXdugnz3G215EcumY5rCfkv+Nrb7ktiJtA
	4bIbA59I2mu9jEFrW5tB2bBipF+eBAK98fRY5e1EfhoO/twbd044Rd7YFvc/R6+20ov
	JRz7KtPgto9pk8cSm76wJa6HR538x+Mmjez5Z63Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kiOJQShuiOUepla1ySJsTGC6ciStD2eAsqPSLz30gpo=;
	b=FfnPpmFarCBtHu+HNTvL8YONHKSfBTBRZ+VJukJIvmvqv+ELnBBUoEk6Bf2fkwaO
	riHJ15zSBuhUhiiAKVyFMwQaZSFwvPnO0y+7niS0o3dpQuTVGfTbd+Z6EgqU4KiuDGA
	OEtbRlWJ4hUbN09/g569VBGNj8yJz7lH+w1BAEjA=
Content-Type: multipart/mixed; boundary="===============2119338737610577394=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtc: upgrading to 1.7.2 FAILED
Message-ID: <010101934122e010-97f548eb-da50-4159-8d03-42003c9df79f-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207274

--===============2119338737610577394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtc* to *1.7.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-dtc failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1ccc6fef3e7eaaf632979c807d5aa5490adcd37b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2d10aa2afe35527728db30b35ec491ecb6959e5c
WARNING: Command 'git rebase 2d10aa2afe35527728db30b35ec491ecb6959e5c' failed:
Auto-merging libfdt/fdt_overlay.c
Auto-merging libfdt/libfdt.h
Auto-merging libfdt/version.lds
CONFLICT (content): Merge conflict in libfdt/version.lds

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-dtc
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-dtc/python3-dtc_1.7.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2119338737610577394==--

