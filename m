Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1F2C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11251.1747312304778815564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yzoTpk2q;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NhsbNF0b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010196d3eddf4f-28c1758d-f1da-4c40-9283-d96ddc6570fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312304;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v0b3LYXBWVATQQOSuVjQO+sN9wax8m1yujaj6HQIQtI=;
	b=yzoTpk2q5qqqTp2jrYA9m1pZWUbyJTGLLuf1Ku+FlTmedHklL2klZx4myFL+cVOB
	YGdXe1QDBr2RBc7sRSwjIOaat+oxsT+B+I95s0WxyrXOCCZmSfc9Icb5DxCvPlBnRXW
	Q4w5xKu1oqtT89vTwd4w6frkcfSsWi06inV/9+YE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312304;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v0b3LYXBWVATQQOSuVjQO+sN9wax8m1yujaj6HQIQtI=;
	b=NhsbNF0bYdqLJ7wszKuRB+CltTXhvuc6huzuhQSSifAqKUYaOT2cEQRlUGmgqC7M
	nzlv/1qtaV/9Jl9liwyiNQN7m7tGIcli/R3rdNE7QuzNsgngIXEE+YBss3UuzhRnDkq
	d8ONa4Qev5qgojgJ0zEZ//V7PKfwNVdRpZV/msYU=
Content-Type: multipart/mixed; boundary="===============3798991443589954937=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 4.0.2,4.0.2 FAILED
Message-ID: <01010196d3eddf4f-28c1758d-f1da-4c40-9283-d96ddc6570fd-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216577

--===============3798991443589954937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *4.0.2,4.0.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe cmake failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:91436590247466f25eb42d1a4edd5fe59d7249a3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 938 .bb files complete (0 cached, 938 parsed). 1917 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:91436590247466f25eb42d1a4edd5fe59d7249a3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-suyhmdjh: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-vkwqpfs4/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-vkwqpfs4/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:07
Adding changed files:   3% |#                                   | ETA:  0:00:05
Adding changed files:   5% |##                                  | ETA:  0:00:04
Adding changed files:   7% |##                                  | ETA:  0:00:04
Adding changed files:   9% |###                                 | ETA:  0:00:04
Adding changed files:  11% |####                                | ETA:  0:00:03
Adding changed files:  13% |####                                | ETA:  0:00:03
Adding changed files:  15% |#####                               | ETA:  0:00:03
Adding changed files:  17% |######                              | ETA:  0:00:03
Adding changed files:  19% |######                              | ETA:  0:00:03
Adding changed files:  21% |#######                             | ETA:  0:00:03
Adding changed files:  23% |########                            | ETA:  0:00:03
Adding changed files:  25% |#########                           | ETA:  0:00:03
Adding changed files:  27% |#########                           | ETA:  0:00:03
Adding changed files:  28% |##########                          | ETA:  0:00:02
Adding changed files:  30% |###########                         | ETA:  0:00:02
Adding changed files:  32% |###########                         | ETA:  0:00:02
Adding changed files:  34% |############                        | ETA:  0:00:02
Adding changed files:  36% |#############                       | ETA:  0:00:02
Adding changed files:  38% |#############                       | ETA:  0:00:02
Adding changed files:  40% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  44% |###############                     | ETA:  0:00:02
Adding changed files:  46% |################                    | ETA:  0:00:02
Adding changed files:  48% |#################                   | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  52% |##################                  | ETA:  0:00:01
Adding changed files:  54% |###################                 | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  57% |####################                | ETA:  0:00:01
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  63% |######################              | ETA:  0:00:01
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  83% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://cmake.org/files/v4.0/cmake-4.0.2.tar.gz...
INFO: Rebasing devtool onto 93db3262e6261ebdf8dcaa5019275e7cc9b4b004
WARNING: Command 'git rebase 93db3262e6261ebdf8dcaa5019275e7cc9b4b004' failed:
Auto-merging Modules/CMakeDetermineCompilerABI.cmake
CONFLICT (content): Merge conflict in Modules/CMakeDetermineCompilerABI.cmake

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 93db3262e6261ebdf8dcaa5019275e7cc9b4b004
WARNING: Command 'git rebase 93db3262e6261ebdf8dcaa5019275e7cc9b4b004' failed:
Auto-merging Modules/CMakeDetermineCompilerABI.cmake
CONFLICT (content): Merge conflict in Modules/CMakeDetermineCompilerABI.cmake

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/cmake
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/cmake/cmake_4.0.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3798991443589954937==--

