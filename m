Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1012DC63714
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.24542.1665871395306311810
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mPlHg20J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac36fd-9acc6236-b19b-4940-bb54-95965d0f5517-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SBYs6KV3zwjjiIg+ZjseQU98/f01YYSRNNRxJbxI694=;
	b=mPlHg20JJoEJ926nNnLgWG9DzW/B+EiqBkSEUFZhUDbqkNXVGznKlwz8vWqdZphc
	Pmqn2/bafzcE4VazriMUQsTFa5JC+ngZiELnu4eP4f5sKFjQp74tXhAcux5kSKLf1Kc
	DW+U2yOuypD9vdticvJ+DtHq+q3yCJ/W3htb99Hk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SBYs6KV3zwjjiIg+ZjseQU98/f01YYSRNNRxJbxI694=;
	b=J5XGsi0he0fEd23w6zIsyJEfE1aYi/Ue46IzBUSmxOTrWj8Mx1Cn6QDUlekEx0Nq
	qIgJ7/0OE/CRcJ8XpfUMe+L0MWAVGXFiBrnDKp745K0p0XDNKKNCQn27oh09+jx+9YU
	F5ZnMS6apGWrkaivY1SI8bGYaJgLax48Na52Isug=
Content-Type: multipart/mixed; boundary="===============1672922669772492819=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grep: upgrading to 3.8 FAILED
Message-ID: <01010183ddac36fd-9acc6236-b19b-4940-bb54-95965d0f5517-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171811

--===============1672922669772492819==
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
meta-yocto-bsp       = "tmp-auh-upgrades:7ffbdde09d2dacf3240cf9772a4ac934648e4410"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

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
meta-yocto-bsp       = "tmp-auh-upgrades:7ffbdde09d2dacf3240cf9772a4ac934648e4410"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 17 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   8% |###                                 | ETA:  0:00:01
Adding changed files:  17% |######                              | ETA:  0:00:00
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
INFO: Rebasing devtool onto b1687ff3fc3ac7b36a0424b1498c4d2c5bc4e84a
WARNING: Command 'git rebase b1687ff3fc3ac7b36a0424b1498c4d2c5bc4e84a' failed:
Auto-merging lib/sigsegv.c
CONFLICT (content): Merge conflict in lib/sigsegv.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/grep
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/grep/grep_3.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1672922669772492819==--

