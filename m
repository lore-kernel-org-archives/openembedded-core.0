Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB49CA9EDD
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.3756.1684186747174525413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VcCakZk4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188215a4e9d-ea1fa8da-7871-4dd3-91b5-7880b310bcdb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9QBgVkAg8H8w6zegzWyUrDFMLS9q9ic3DMV7G2v7EX8=;
	b=VcCakZk4hMjCMA/9I0cMIhd3TixDxCq2omgTgNqiF7EcHuYudDm06lhzCkk+bMrc
	tYwq9+X9hS3HBE9iOZy3B+7BEcy3sLvf2D1FmRO+t/mU+rpH5pSZI+rPVA/iur7DuA3
	QR1PbyV4i5oBz39exz4dBYdbLtv9mycJ+0bQvWtw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9QBgVkAg8H8w6zegzWyUrDFMLS9q9ic3DMV7G2v7EX8=;
	b=eZvhtMFIeT+eh+T0sZK0Egd+BX1AF38ksiz9uOhU3z5808QxxuKxDuxXE4dlIg7Y
	FSXJaV07sPhUV/5pp4lX80OjPyELPqkIesWzx6dXgzUzpeVlxF4gsNdUXUMKk7vEBD2
	Kt1a06N02ywSudpHuZtwGwfDnYx6/17E1qLh0350=
Content-Type: multipart/mixed; boundary="===============2301029229302958868=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 16.0.3 FAILED
Message-ID: <01010188215a4e9d-ea1fa8da-7871-4dd3-91b5-7880b310bcdb-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181285

--===============2301029229302958868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *16.0.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe llvm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:35:13.260608)
Loading cache...done.
Loaded 1804 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8150ae1beb5f79ae853af8d0710d9bc1102dd637"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto da3cd333bea572fb10470f610a27f22bcb84b08c
WARNING: Command 'git rebase da3cd333bea572fb10470f610a27f22bcb84b08c' failed:
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
--===============2301029229302958868==--

