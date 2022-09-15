Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9068EC6FD28
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.10896.1663251514686308547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=D8W5nYHz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101834183ff2b-0927b8a5-be55-4bae-968e-8fa351bf57cc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EXJZ26Ai1wSiewdLBtQkkg78mxk5Wpko+dSRsqUwAGs=;
	b=D8W5nYHzmR0UyTE8RPsa8v9oClKK2BlCLgda+pSgsjnAoxTZZETyFb9WnVctA0Pn
	W9HC35tDSmQCYnXodxDxSFeUS/rh2324Jz9EjP2VRie5UEcLARQmJM38YBLkH4n7F8K
	C7uRyxLqmMXElpid4hwJEt+4hekRV/8LjboZBhH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EXJZ26Ai1wSiewdLBtQkkg78mxk5Wpko+dSRsqUwAGs=;
	b=dZFqDhTOysfZVSH7Vw8CXduMWg217Jhq9zOtpq+w5ABahpO/5v8JOUegOld2gohR
	5zgGSflPYrjDYmL14WgrqEtLK9gOL8gT8lu1DAgMWGQIeGRP1i8aYsoMoQuvh9faUmc
	+dtPwc6JKZOxjbJIGGfYRwDYVctvX61aIFgCnJlE=
Content-Type: multipart/mixed; boundary="===============4390323996197590275=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grep: upgrading to 3.8 FAILED
Message-ID: 
 <010101834183ff2b-0927b8a5-be55-4bae-968e-8fa351bf57cc-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170762

--===============4390323996197590275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *grep* to *3.8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe grep failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-5a3a01473ad8bdd83955e9aa92a3fadab1bc2ae3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5a3a01473ad8bdd83955e9aa92a3fadab1bc2ae3"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (884 cached, 2 parsed). 1662 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-5a3a01473ad8bdd83955e9aa92a3fadab1bc2ae3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5a3a01473ad8bdd83955e9aa92a3fadab1bc2ae3"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 17 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   8% |###                                 | ETA:  0:00:01
Adding changed files:  17% |######                              | ETA:  0:00:01
Adding changed files:  26% |#########                           | ETA:  0:00:00
Adding changed files:  35% |############                        | ETA:  0:00:00
Adding changed files:  44% |################                    | ETA:  0:00:00
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/grep/grep-3.8.tar.xz...
INFO: Rebasing devtool onto dfd28f648616f0755a6f51de3528cf29de1bddca
WARNING: Command 'git rebase dfd28f648616f0755a6f51de3528cf29de1bddca' failed:
Auto-merging lib/sigsegv.c
CONFLICT (content): Merge conflict in lib/sigsegv.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/grep
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/grep/grep_3.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4390323996197590275==--

