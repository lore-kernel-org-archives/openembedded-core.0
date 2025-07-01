Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3FAC83F17
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1416.1751386804481426201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=r9CpWISh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=f3UNGPQw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010197c6c9ce36-40929fda-027a-4ebe-8c66-31bf40a2f4b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386803;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=60kPmwe0GgsvA/7/qP7jbtxRGg7RabtGpiuIE5FEAH0=;
	b=r9CpWIShGFixsxjYq0+ArVUHsVxSPgGBJJV88ZGhByQZjZoImlZhvoJMB/g+7u6b
	WDs47ZUGiLh2o2BfpvnRR6jxgnBbUHHzmAvx2/dXVdKVWLsbOEo2jcNreZMYp99lvM5
	nQ/o+BcdW/muX6gJj7brVgfERsLzHQE6nR+1n4cw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386803;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=60kPmwe0GgsvA/7/qP7jbtxRGg7RabtGpiuIE5FEAH0=;
	b=f3UNGPQwU8eKy9qvKA0OJQHlWN2Dm7ebNrgPY1lc+g8E7rKnf+l38fiIODLrjo3s
	oYIt3SuCyda2gdG1SXlY5v04LTZyCRjt1ysnDEvXpqWzoej2tSEHSEUlfhXJ3QsPlKH
	vfco+IuS2xfeudxrO0Mgl2qwzZMLyb7RwaFYhiAU=
Content-Type: multipart/mixed; boundary="===============7764100089758375862=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 4.0.3,4.0.3 FAILED
Message-ID: <01010197c6c9ce36-40929fda-027a-4ebe-8c66-31bf40a2f4b6-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219601

--===============7764100089758375862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *4.0.3,4.0.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe cmake-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6ffd064292f41cfcd41fb2e44c73ec1987e93138"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6ffd064292f41cfcd41fb2e44c73ec1987e93138"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 938 .bb files complete (0 cached, 938 parsed). 1918 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6ffd064292f41cfcd41fb2e44c73ec1987e93138"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6ffd064292f41cfcd41fb2e44c73ec1987e93138"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
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
Adding changed files:  55% |####################                | ETA:  0:00:01
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
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cmake.org/files/v4.0/cmake-4.0.3.tar.gz...
INFO: Rebasing devtool onto 3897d266a49bdf7fff2e124886f0ec9f89f9f6a1
WARNING: Command 'git rebase 3897d266a49bdf7fff2e124886f0ec9f89f9f6a1' failed:
Auto-merging Modules/CMakeDetermineCompilerABI.cmake
CONFLICT (content): Merge conflict in Modules/CMakeDetermineCompilerABI.cmake

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/cmake-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/cmake-native/cmake-native_4.0.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7764100089758375862==--

