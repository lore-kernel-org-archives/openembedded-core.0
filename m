Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCBAC7EE30
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.107426.1682976350180551352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NeHg0/r1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010187d9351cb4-83572aa7-70dc-4827-a0a4-0506e8a558a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4jyGDQ84NI+hn6V9sg9f5uxrT8UY6BN9/KbmHFyO1fw=;
	b=NeHg0/r1rnMpqDIJSFXXlfcR57ouqXx1kfsQ2OdFcOmdWDKb1p010F8tykfS4/S7
	SBtJEaG6WELPp5JOOEJV0ZhZpxIKEkanPtTYA+QJM/Y6fKGeoDwmhqH9Kcj9SP0VFA/
	kxiAS+187+0Mbb36vqzvDTqu/PIELW5hEybaePYg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4jyGDQ84NI+hn6V9sg9f5uxrT8UY6BN9/KbmHFyO1fw=;
	b=rk/Zj93/tkm6bi/ESZ1yxYCmo+CaNVTMMWMGPEuIVvAl+3v+QJ26o09mhp6cKdQH
	TYw9GlIQ2JbkzLvRXX+yjjUSITFip22NOhfS/yylb6rTUFpm5rfonhvMWvjGn32hTFY
	mim6oZYFBkPDPd557XG3hRkrz15Fe/KKeldhvsE4=
Content-Type: multipart/mixed; boundary="===============8750951406902610921=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 16.0.2 FAILED
Message-ID: <01010187d9351cb4-83572aa7-70dc-4827-a0a4-0506e8a558a7-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180611

--===============8750951406902610921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *16.0.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe llvm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:15:44.453052)
Loading cache...done.
Loaded 1799 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:06bf367491a7a02405414f6336629d892f3df839"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 18ddebe1a1a9bde349441631365f0472e9693520
WARNING: Command 'git rebase 18ddebe1a1a9bde349441631365f0472e9693520' failed:
Auto-merging libcxx/docs/ReleaseNotes.rst
CONFLICT (content): Merge conflict in libcxx/docs/ReleaseNotes.rst
Auto-merging libcxx/docs/Status/Cxx20Papers.csv
CONFLICT (content): Merge conflict in libcxx/docs/Status/Cxx20Papers.csv
Auto-merging libcxx/include/__algorithm/fill.h
Auto-merging libcxx/include/__algorithm/fill_n.h
Auto-merging libcxx/include/__bit_reference
CONFLICT (content): Merge conflict in libcxx/include/__bit_reference
Auto-merging libcxx/include/__memory/construct_at.h
Auto-merging libcxx/include/__memory/pointer_traits.h
CONFLICT (content): Merge conflict in libcxx/include/__memory/pointer_traits.h
Auto-merging libcxx/include/__memory/uninitialized_algorithms.h
CONFLICT (content): Merge conflict in libcxx/include/__memory/uninitialized_algorithms.h
Auto-merging libcxx/include/__split_buffer
CONFLICT (content): Merge conflict in libcxx/include/__split_buffer
Auto-merging libcxx/include/memory
CONFLICT (content): Merge conflict in libcxx/include/memory
Auto-merging libcxx/include/vector
CONFLICT (content): Merge conflict in libcxx/include/vector
Auto-merging libcxx/test/support/allocators.h
CONFLICT (content): Merge conflict in libcxx/test/support/allocators.h
Auto-merging libcxx/test/support/poisoned_hash_helper.h
Auto-merging libcxx/test/support/test_allocator.h
CONFLICT (content): Merge conflict in libcxx/test/support/test_allocator.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/llvm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/llvm/llvm_git.bb
WARNING: Version is pinned to 15.% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8750951406902610921==--

