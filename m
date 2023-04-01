Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C50C6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.32140.1680384535187890442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=A+waw6l6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101873eb9245d-b864676c-d5fa-46e9-8cd4-c3127d3591da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RaDSPf54H0uTJFm7GKmMNeKRGSBB2S5onCv9vgOqzMA=;
	b=A+waw6l6r5104GLFVadrHqHM2hDgfayV0ozsRvEESrjhr7NoekrTfMLRhJ4Abm6U
	OU06XU8/tYNboMKSSiKhA/hShzXqR7apMg8VIEQ4tXDhdq8xYT3+L2XpkVS/RyukaQc
	S/++isRByfV1K3yfg4HFchSXOI19JGuJV4VVtB/Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RaDSPf54H0uTJFm7GKmMNeKRGSBB2S5onCv9vgOqzMA=;
	b=GgKQ17qCJ33Gde0nU0j1zY9o26+GhPzveIDXbxxJmaJPXWb372GZhY7K4m8I7dqw
	lmmklrSURaw9ygeA3GMgCTz1rhn8LqEkX24phlI8uNfBYgtXDBsgP+yMXzlIoFKSYKQ
	G0b8oELt6d7anJIjJQS3mmh9HlaXs/jSQAQyIXgA=
Content-Type: multipart/mixed; boundary="===============1065614882089498336=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 16.0.0 FAILED
Message-ID: <010101873eb9245d-b864676c-d5fa-46e9-8cd4-c3127d3591da-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179575

--===============1065614882089498336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *16.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe llvm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:25:15.550021)
Loading cache...done.
Loaded 1797 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8ad473f39fd4a998127f3f8025a4a34616fb1081"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8ad473f39fd4a998127f3f8025a4a34616fb1081"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 08d094a0e457360ad8b94b017d2dc277e697ca76
WARNING: Command 'git rebase 08d094a0e457360ad8b94b017d2dc277e697ca76' failed:
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
--===============1065614882089498336==--

