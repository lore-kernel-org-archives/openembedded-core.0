Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CD9F013E6
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28970.1773582115481695032
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vsAmuOWZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RuDyvJwh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019cf1bb7fbc-c516d3ca-40b7-44af-85fa-667c8d40a753-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582123;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T13kclUytLsUHwj7LreF8MtXCQipRqQL9+2uz9XLgho=;
	b=vsAmuOWZL0fXgqwheuTvGbgUiGD1xNbD64KijSiEKrTwiQHgcL9AZDU5jixsb5Yi
	k5ZVJnTpNluFZrL+AB/RoBNZ/PYfc70PMYkXixNywdZ/grMK/N9/QOs3Hu40VuwNk0w
	lG9kVsE1bnQIVaAK9YiDn4r3iO2UJNhV9nQmorrU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582123;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T13kclUytLsUHwj7LreF8MtXCQipRqQL9+2uz9XLgho=;
	b=RuDyvJwhGH0qONc3ZR41O5LyxbNp3i6JH2ywcmZJ24GjEsZ8q4CtwSUXwY5D0IXW
	dSm1Buve7doTg/28Kj/mJ6czXLAla9LPJ2OMN0hpsGoqF82n9xVAyj7CZqRXuvb/AZ9
	O6wf7lCL3hD1NHDJDmUdNm2X3ZTCm0W2x16S08ns=
Content-Type: multipart/mixed; boundary="===============3700679845169610969=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 22.1.0 FAILED
Message-ID: <0101019cf1bb7fbc-c516d3ca-40b7-44af-85fa-667c8d40a753-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233171

--===============3700679845169610969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *22.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe spirv-llvm-translator failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1971 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-baa620fb0dae86f070c7ce431828c69ebc81189a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:baa620fb0dae86f070c7ce431828c69ebc81189a"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 567786558a00e8b7ec0457f1706504784e229150
WARNING: Command 'git rebase 567786558a00e8b7ec0457f1706504784e229150' failed:
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
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/spirv-llvm-translator/spirv-llvm-translator_22.1.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3700679845169610969==--

