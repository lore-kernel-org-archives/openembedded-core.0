Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF8AC54ED9
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.36986.1709330717426121996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EhmDPpuk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WlYS/u1i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dfc0cd915-5b686520-07fc-44b0-9156-561771772a0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8rj0+3KPz/uOdBalqY661X1OLrZv6H7DWKwsX47rF78=;
	b=EhmDPpuk+hisrM44ydcjfJSf2YTnSFocCc1yZXIBvyfhzlaVw94ZMPpgmbB2KYVl
	IjIamjJXWVDANnCKiOvhoIq/aQF+uPL9hbV+wD4tlP7erSqoa9rWz27UzkzrG8MWBLP
	qtwXXLE3h50cr5gNynryguR7VZAOtttGV33NTzi8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8rj0+3KPz/uOdBalqY661X1OLrZv6H7DWKwsX47rF78=;
	b=WlYS/u1iyueB04NRVcSNkTMzo+mVUg77zUSTz+qCRjWqK0F8WT77+oIOAwy1zH2n
	FY01l01O/zv5S0gEDvnvv+o/qyLSpliz+btanhG/yu9iYxO1gg0NNar8q5YD/jVltgP
	FF/TZjunOYuWf/G5QVqUCwLRH/KtkeSK1jV/LRQo=
Content-Type: multipart/mixed; boundary="===============8495166049889711641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.8 FAILED
Message-ID: <0101018dfc0cd915-5b686520-07fc-44b0-9156-561771772a0f-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196503

--===============8495166049889711641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe shaderc failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1863 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-c73170afd487f43c31a446bb312846425c6610ee"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c73170afd487f43c31a446bb312846425c6610ee"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto e6edd6d48fa5bdd9d176794c6810fae7f8e938e1
WARNING: Command 'git rebase e6edd6d48fa5bdd9d176794c6810fae7f8e938e1' failed:
Auto-merging glslc/CMakeLists.txt
CONFLICT (content): Merge conflict in glslc/CMakeLists.txt
Auto-merging libshaderc/CMakeLists.txt
CONFLICT (content): Merge conflict in libshaderc/CMakeLists.txt
Auto-merging libshaderc/README.md
CONFLICT (content): Merge conflict in libshaderc/README.md
Auto-merging libshaderc_util/CMakeLists.txt
CONFLICT (content): Merge conflict in libshaderc_util/CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/shaderc
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/shaderc/shaderc_2023.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8495166049889711641==--

