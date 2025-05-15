Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CB5C5479B
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:49 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.11254.1747312304903867747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l0G/4EJ8;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=O2kW5yU0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010196d3ede011-f697100f-67c1-4504-b310-5bc091b6409b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312304;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WH+ujIDAD/6sv/htN+1ymI6oR/ZuiZlWPQ4RRH0vlNY=;
	b=l0G/4EJ88znuXuKiykQ+a4oCEVFsD/fXhr3xLHv8D1Y3aINZdyAT8ySGFdHUJ+19
	/HrSIfmpdJpwXCGcWXxMxfrNksmjtbWKuws+MBtU1VX7yFmCmO9IB69IiLN7RXF6Hpr
	kvpnGnp8Q1ObVot37YAG1RQqjbI6S8pBtJRH9Ps0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312304;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WH+ujIDAD/6sv/htN+1ymI6oR/ZuiZlWPQ4RRH0vlNY=;
	b=O2kW5yU0Gavnta0IGkX1Sg7K1SOQIIv+zNXrPcMMg5m3ENXlgHEMdX3hNSOyApG9
	Syyb+PshPbrJfXxDtdAPvhx9W6ItxMLzMcGVORzuVgIOzm9Q0txJ+cUmckrYckUj7PU
	tWQuEPx9OeSyZInzZEaAyqR2mTyFvLNqPO7vfGTI=
Content-Type: multipart/mixed; boundary="===============3556412286248812634=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] m4,m4-native: upgrading to 1.4.20,1.4.20 FAILED
Message-ID: <01010196d3ede011-f697100f-67c1-4504-b310-5bc091b6409b-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216580

--===============3556412286248812634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *m4,m4-native* to *1.4.20,1.4.20* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe m4 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1918 entries from dependency cache.
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
WARNING: tmp-recipetool-cz3oxez3: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-t75m6ven/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-t75m6ven/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   4% |#                                   | ETA:  0:00:02
Adding changed files:   9% |###                                 | ETA:  0:00:01
Adding changed files:  14% |#####                               | ETA:  0:00:01
Adding changed files:  18% |######                              | ETA:  0:00:01
Adding changed files:  23% |########                            | ETA:  0:00:01
Adding changed files:  28% |##########                          | ETA:  0:00:00
Adding changed files:  33% |###########                         | ETA:  0:00:00
Adding changed files:  37% |#############                       | ETA:  0:00:00
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  47% |#################                   | ETA:  0:00:00
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  61% |######################              | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/m4/m4-1.4.20.tar.gz...
INFO: Rebasing devtool onto fd3d3fba791521750ec9c9702bd6549185649b4d
WARNING: Command 'git rebase fd3d3fba791521750ec9c9702bd6549185649b4d' failed:
Auto-merging lib/sigsegv.c
CONFLICT (content): Merge conflict in lib/sigsegv.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto fd3d3fba791521750ec9c9702bd6549185649b4d
WARNING: Command 'git rebase fd3d3fba791521750ec9c9702bd6549185649b4d' failed:
Auto-merging lib/sigsegv.c
CONFLICT (content): Merge conflict in lib/sigsegv.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/m4
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/m4/m4_1.4.20.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3556412286248812634==--

