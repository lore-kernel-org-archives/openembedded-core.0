Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB5EC64EC7
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.24531.1665871392234762595
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UucTihmE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddac3136-0572c2fc-6cf6-43c8-a04c-1235217075e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CxxYVm/zVonTaeCLsoV99CtqzlKeBd/yN+C1X3pJi0o=;
	b=UucTihmEv5vCm+uzC7vSW478gMxjW6wFDe6IQet+dujgpxI3gII4ejtfFVnGi7Gm
	WClv4VchqIxQAEtGXKFm7PFZLF7CEEO6Z86FwLaupVvz2P6WMZXuL1gZdd25/8AjpMY
	7lTpnTmyhgNuxRmcHEFMvJ9Oj59eTm5XN0IQ+RBY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CxxYVm/zVonTaeCLsoV99CtqzlKeBd/yN+C1X3pJi0o=;
	b=Ir2xLTm+e3tM57AmrJ/TUvo5fV+DQh4+rvyh9gjEFPbHUSbN0mmJ5RMOwoBfiPne
	iy9Ad1p3ur7nBMRVfO6rPbNh34U0rEXI6h9GY8yJTdCrXgJbvcmH4OA+Tpce5NEiTDR
	co80i5/tQnCSFhWb28NVBnkGVu74otWFbXBjlwTw=
Content-Type: multipart/mixed; boundary="===============6243508963591083051=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 15.0.2 FAILED
Message-ID: <01010183ddac3136-0572c2fc-6cf6-43c8-a04c-1235217075e9-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171768

--===============6243508963591083051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *15.0.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe llvm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9146918ea7677f7993e9efc783b2267966ff9d58"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4bd3f3759259548e159aeba5c76efb9a0864e6fa
WARNING: Command 'git rebase 4bd3f3759259548e159aeba5c76efb9a0864e6fa' failed:
Adding libcxx/include/__string/extern_template_lists.h
Adding libcxx/include/__string/char_traits.h
CONFLICT (add/add): Merge conflict in .github/workflows/llvm-tests.yml
Auto-merging .github/workflows/llvm-tests.yml
CONFLICT (add/add): Merge conflict in .github/workflows/lldb-tests.yml
Auto-merging .github/workflows/lldb-tests.yml
CONFLICT (add/add): Merge conflict in .github/workflows/lld-tests.yml
Auto-merging .github/workflows/lld-tests.yml
CONFLICT (add/add): Merge conflict in .github/workflows/libclc-tests.yml
Auto-merging .github/workflows/libclc-tests.yml
CONFLICT (add/add): Merge conflict in .github/workflows/libclang-abi-tests.yml
Auto-merging .github/workflows/libclang-abi-tests.yml
CONFLICT (add/add): Merge conflict in .github/workflows/clang-tests.yml
Auto-merging .github/workflows/clang-tests.yml

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/llvm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/llvm/llvm_git.bb
WARNING: Version is pinned to 14.0.6 via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6243508963591083051==--

