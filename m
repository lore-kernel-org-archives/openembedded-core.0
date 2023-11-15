Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEA6C54F8B
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.14637.1700059031342084000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LoV8seBY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dOsUdQVh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018bd36a2457-4546a689-2db1-480d-a99d-1770863c1412-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059030;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=eITr2CuzRiQQt4/fJltMCXbf3d32ZYqzoOKK0tf68PQ=;
	b=LoV8seBYqgO+tA9MBQxsFM29F1ojujb9mDgkAJ+5aQHpZCwl4n1VbzgxAwq4/RiY
	N3IHUfaCtxOlW+n8q046TmEFEfq3yrr56Xxl4ltVjvg8amqlijd+tvLyXznLL3EVBCd
	VD0HaSi6EFgyv1NMQgMggulZ+j0yghPbEFeRH6zw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059030;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=eITr2CuzRiQQt4/fJltMCXbf3d32ZYqzoOKK0tf68PQ=;
	b=dOsUdQVhALCkZqtDKv+tOy//aSU5Hs9KMl0PcmYWvyYr3o6XCZz4ctrpePWWykjF
	KUte4Qn8K8kEtPOPvScAvABmMEnBZMFk6bIzqEJgLOW+AyeWsLnfvxDX1Xn+FaNegxF
	i7u3Q/Y9szqLzbsapH15BfAfhLfCLnEd7/icScVU=
Content-Type: multipart/mixed; boundary="===============3474553506928471060=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.39 FAILED
Message-ID: <0101018bd36a2457-4546a689-2db1-480d-a99d-1770863c1412-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190653

--===============3474553506928471060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.39* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe repo failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-5ee7ada6287a8b28dccf1ecf13d376f5a08e2657"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5ee7ada6287a8b28dccf1ecf13d376f5a08e2657"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b99272c601bc5f466c3cfc782bb852c2c967ad27
WARNING: Command 'git rebase b99272c601bc5f466c3cfc782bb852c2c967ad27' failed:
Auto-merging repo
CONFLICT (content): Merge conflict in repo

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/repo
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/repo/repo_2.39.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3474553506928471060==--

