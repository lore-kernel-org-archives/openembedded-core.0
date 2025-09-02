Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECB3CA101F
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.89811.1756850199764922137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jFtr/NzL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=W6WyN9NT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101990c6ea085-826e24d3-89fc-4908-ac66-7a03a777c0ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8jI7iZGxSxDtNkOm4C0GEEVkmIggQHXWFDaTlVGMi4w=;
	b=jFtr/NzL5CJvNzc+G4h19IG680B5WtoRazNVRj9d61+9LX1eqTZRAV7+FaSQUfAQ
	reFUs78yyTTgOHNn220pHUiyvnTrxJAgJ7OeeIsWUtgnhLT+GBSkNUfgi1lZSBTuFK/
	USh6lo2m1mku8iEnmpJk1imbuwJOWza1if1RbePk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8jI7iZGxSxDtNkOm4C0GEEVkmIggQHXWFDaTlVGMi4w=;
	b=W6WyN9NTRG9eucJCx9yNFqnRIMzXbCLZeAkNS4BzJdrBvRc1pykagsbtxsqvx38H
	1P8BaeRkAK1SzU8iOdn527c6uNtG+lHXUKYe0pWoMOOewE7Bj9EdwnINdYCUGAs5tOs
	g5BM+cIKkap5QCfLMxA9Lh2yc6VoCi1rtY++Mixc=
Content-Type: multipart/mixed; boundary="===============4038648689469687656=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 21.1.0 FAILED
Message-ID: <010101990c6ea085-826e24d3-89fc-4908-ac66-7a03a777c0ab-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222812

--===============4038648689469687656==
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
Loaded 1940 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-48307575d161c503b51605d22a0f031fea52737d"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:48307575d161c503b51605d22a0f031fea52737d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
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
--===============4038648689469687656==--

