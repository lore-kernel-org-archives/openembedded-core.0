Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBCFC531C1
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.4620.1704114718636930414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Kacg0F5r;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YQG6VB9t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018cc52703b8-bf8a0cbf-7cf6-49a6-b1c2-8dff2b61cc67-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MvtiaS+XGwJSJ09nwaSAv6cHrbKsRb3RkrC11wUyqEE=;
	b=Kacg0F5rYKg+ncnm67FArtZL0KJe12lzjr8RvjM2g5ih94c8gMm4jFByhqAvZxY5
	vTNTGn47797Rjl2t4GUFBr7O1C1lGuFQNT6nsl9+yYGigLse4xkvuNTtReJJ3VEHITP
	YQLG+juY9yZ0bgX0/Tm+J1dqJxDccuoC4hBa1HOU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MvtiaS+XGwJSJ09nwaSAv6cHrbKsRb3RkrC11wUyqEE=;
	b=YQG6VB9tOQDSxrNcgXeE0Ar32xF5jJW0fJRvJQ2tDwY8yH9DzJWPIzRlU0ZclUfm
	WNt1/IvM6EJ0tbjhANyr45cwzxBYjI2YkWIVp7ldTJzcnXZCGtYZkTa3HBQ505a0Kqz
	A8l7TdZkI/P3FqFEYSE4wiSBJ/e8bhw6DR4IFZVE=
Content-Type: multipart/mixed; boundary="===============3039046326499870173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grub: upgrading to 2.12 FAILED
Message-ID: <0101018cc52703b8-bf8a0cbf-7cf6-49a6-b1c2-8dff2b61cc67-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:57 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193097

--===============3039046326499870173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *grub* to *2.12* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe grub failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1848 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-fe5d2f0b666c83e3336ea9962c8e2e4c39816e21"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fe5d2f0b666c83e3336ea9962c8e2e4c39816e21"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 20 Local 20 Mirrors 0 Missed 0 Current 10 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (912 cached, 2 parsed). 1848 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-fe5d2f0b666c83e3336ea9962c8e2e4c39816e21"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fe5d2f0b666c83e3336ea9962c8e2e4c39816e21"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   8% |###                                 | ETA:  0:00:03
Adding changed files:  17% |######                              | ETA:  0:00:01
Adding changed files:  25% |#########                           | ETA:  0:00:01
Adding changed files:  34% |############                        | ETA:  0:00:00
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/grub/grub-2.12.tar.gz...
INFO: Rebasing devtool onto 35e40b5550d436f6de29efc9fa38abdbea04eb2a
WARNING: Command 'git rebase 35e40b5550d436f6de29efc9fa38abdbea04eb2a' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/grub
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/grub/grub_2.12.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3039046326499870173==--

