Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E254C88CB8
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.13526.1681581685424452860
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=N4W3Pd0y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018786143758-79b53076-4cc0-40ad-9cb2-157699172f39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OdBuWzuifRPK1dTT5tV2x81pGoGDt/WG4pski867iCc=;
	b=N4W3Pd0y3yldnT21H/0hPVvhxoGt3Ge363q9hWjrjxi1eEqWqX4htjBjhR5hwgTp
	e9tU8Bg6pswzWa00gRA0c/LcspZMbkUsnt344P/Ike5GcD07PhUPNm7d5FTe2lzfrlM
	FOht61sfXLpyVAmWdBNM6tvv9iVm4OUp/nZsFFYc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OdBuWzuifRPK1dTT5tV2x81pGoGDt/WG4pski867iCc=;
	b=jAKUdXXitmRXUJpvdPGnmgF/1lbDPQNMo+H+b5hbBoHnPlF8/CUepR0F6FbJUZbs
	mm7t4/cst0PNIPtwyNbjDm2kN5AnEULlHY+W6O2t/mGoDqfWjwUW3EGkmT4Imk+/Zx5
	DpK+J/nLuhntZ2qvug5onv4UVujVvON8zUphlHMs=
Content-Type: multipart/mixed; boundary="===============3918719411108490891=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 16.0.1 FAILED
Message-ID: <0101018786143758-79b53076-4cc0-40ad-9cb2-157699172f39-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180045

--===============3918719411108490891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *16.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe llvm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:39:49.260769)
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
meta-yocto-bsp       = "tmp-auh-upgrades:a18113fc4b16efbeb8a3199f691782fae4ca4fc6"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto cd89023f797900e4492da58b7bed36f702120011
WARNING: Command 'git rebase cd89023f797900e4492da58b7bed36f702120011' failed:
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
--===============3918719411108490891==--

