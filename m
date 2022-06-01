Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9D3CCA490
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.616.1654100324053890197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VcydZXFF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181200feadd-975d859d-68c4-4344-944b-cc5132ba9288-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=57i1tGCJAvAX7+S+190/RDTYbuL38YugD6KxytrnP6I=;
	b=VcydZXFF9bzQhX5hQD4FuUMnK155PGR5ae8k3maW5K1F37rthSBA4kG47RLwELyi
	9IazdpURaS1ScM93YWGjsfAjIwFyJpPQHKY5T4+Mt9Bc9ooaG7rrjQzJdSRC9x0m/gx
	mQuAumHoCg6qS+DPx/mwBjGP6WgboIvcqwCrst3Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=57i1tGCJAvAX7+S+190/RDTYbuL38YugD6KxytrnP6I=;
	b=K1p6mnLM6nx5bxEk7sHLJqfuzPYbDQ9zfDoTpDicwR2/5nHDOBRtZzTaag17vWpj
	T9ffRkhdG3JPTId/LsuzAwfF1qOxmrZVFvwBaIdz8GIALBJBza7Yk5jPUyZSu3SgsL5
	V45jOC7Id3J1Jid77RHIYqS+uFx1D7N/ZOFG/QnY=
Content-Type: multipart/mixed; boundary="===============5809486381695481037=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 5.9.1 FAILED
Message-ID: 
 <01010181200feadd-975d859d-68c4-4344-944b-cc5132ba9288-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166405

--===============5809486381695481037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-psutil* to *5.9.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-psutil failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f802d945780891fc87a84de0e705db6ab11076bb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f802d945780891fc87a84de0e705db6ab11076bb"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (882 cached, 2 parsed). 1643 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f802d945780891fc87a84de0e705db6ab11076bb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f802d945780891fc87a84de0e705db6ab11076bb"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.1.tar.gz...
INFO: Rebasing devtool onto 4c5fbc5809392ac1bc2b1c46ffcb9bd85d786d2d
WARNING: Command 'git rebase 4c5fbc5809392ac1bc2b1c46ffcb9bd85d786d2d' failed:
Auto-merging psutil/tests/test_unicode.py
Auto-merging psutil/tests/test_system.py
Auto-merging psutil/tests/test_process.py
Auto-merging psutil/tests/test_misc.py
CONFLICT (content): Merge conflict in psutil/tests/test_misc.py
Auto-merging psutil/tests/test_linux.py
Auto-merging psutil/tests/test_contracts.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/python3-psutil
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/python3-psutil/python3-psutil_5.9.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5809486381695481037==--

