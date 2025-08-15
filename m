Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C8DCA1008
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.11420.1755263228070634958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vhcdcS9a;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YWO7xFxn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010198add7737c-67d2857e-0129-4997-9aa4-8c6024a06184-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263235;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r7zlnMYNiaHgiQ8SSyBnUmfa8gGfx3VbBe+VZnxvoYo=;
	b=vhcdcS9aS2LILRy0Sxk/J8DscJqYKQvF4XOODuT1nm9ytGqHxWFaroE73y7FnXx/
	TMoAqGXX8VuSQyPLfGg2sMgPX9QncWRXP6McVO9y8luu6b4onzZzyvirxG8dNinyYdr
	jfpUla4pNddWkurVPz0nNVuJvZkNLphz/50AeE+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263235;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r7zlnMYNiaHgiQ8SSyBnUmfa8gGfx3VbBe+VZnxvoYo=;
	b=YWO7xFxntdjF2Q0kdpnKayj2IS2cBQ3JQJFw7zem6DO1sCGcq0R97KHbJWKFLNqc
	4gkJ6RujxKA7n9ml7OTRp99EkjMpngAJo6WNDWW1SwnUvtOAt68Gw8wxb7crGt0Rdbs
	OfnC+VGZNRoSFlQ4IKbswVFge2phqo61QN3+J8RI=
Content-Type: multipart/mixed; boundary="===============4645852687595968320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 21.1.0 FAILED
Message-ID: <01010198add7737c-67d2857e-0129-4997-9aa4-8c6024a06184-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221940

--===============4645852687595968320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *21.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe spirv-llvm-translator failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8eb5cc04864db12874eb394c86d4285347fa9e0f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8eb5cc04864db12874eb394c86d4285347fa9e0f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto acb023b63a4bafd53d0ba6a1a452b1f0e5671458
WARNING: Command 'git rebase acb023b63a4bafd53d0ba6a1a452b1f0e5671458' failed:
Auto-merging .github/workflows/check-code-style.yml
CONFLICT (content): Merge conflict in .github/workflows/check-code-style.yml
Auto-merging .github/workflows/check-in-tree-build.yml
CONFLICT (content): Merge conflict in .github/workflows/check-in-tree-build.yml
Auto-merging .github/workflows/check-out-of-tree-build.yml
CONFLICT (content): Merge conflict in .github/workflows/check-out-of-tree-build.yml
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/spirv-llvm-translator
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/spirv-llvm-translator/spirv-llvm-translator_21.1.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4645852687595968320==--

