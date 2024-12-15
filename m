Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24389E77186
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:40 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.33379.1734254979285525428
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fcdzu9ej;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Wwq6nOPP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010193c9a6e565-1e9bbc14-4767-404f-95ce-460eca58d13b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WnMxsONrPK3VKpYXfOHKeF/s0VLw8NZXzPbVnrSiyVg=;
	b=fcdzu9ejV3qaGHjytnfByBJL+fJqfuooTvcQdvgJB8r8J5dqBSeLSbi/In7+cPnZ
	iU6/k4aiTlchwbHHFSzFO0w2GY5O6IhEENnE/PH2nFveZSMJ0FkvxIc3gqoCjYIl40r
	2CkH4jAjmBdMHUseQw8pmH7CuD3cev5gU3Ah3A3A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WnMxsONrPK3VKpYXfOHKeF/s0VLw8NZXzPbVnrSiyVg=;
	b=Wwq6nOPPy6mHmAim8ikxK4pgFnNa8Fqs0TVjXlqo8/JEUy+910BDbKl75ooE2Z0D
	Mw90zrUMA3rrjlKyGQJNk0m7eO6e5+sSRBFrb0G5osuxEZrog7UBW2HofjXpfm+WLOV
	WRVji9DY/51B3UxDlrlpU7HOXS+FUF11Vrp+MTvA=
Content-Type: multipart/mixed; boundary="===============6559111405837745785=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-system-native,qemu,qemu-native: upgrading to
 9.2.0,9.2.0,9.2.0 FAILED
Message-ID: <01010193c9a6e565-1e9bbc14-4767-404f-95ce-460eca58d13b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208707

--===============6559111405837745785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-system-native,qemu,qemu-native* to *9.2.0,9.2.0,9.2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu-system-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d30ae1aa9d7831e0f29b51290e9114f3f6e8af19"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 9 Mirrors 0 Missed 0 Current 18 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d30ae1aa9d7831e0f29b51290e9114f3f6e8af19"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-zzzhkqja: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-g65gg6or/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-g65gg6or/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:13
Adding changed files:   4% |#                                   | ETA:  0:00:09
Adding changed files:   7% |##                                  | ETA:  0:00:07
Adding changed files:   9% |###                                 | ETA:  0:00:06
Adding changed files:  12% |####                                | ETA:  0:00:06
Adding changed files:  14% |#####                               | ETA:  0:00:05
Adding changed files:  17% |######                              | ETA:  0:00:05
Adding changed files:  19% |#######                             | ETA:  0:00:05
Adding changed files:  22% |########                            | ETA:  0:00:05
Adding changed files:  24% |########                            | ETA:  0:00:04
Adding changed files:  27% |#########                           | ETA:  0:00:04
Adding changed files:  29% |##########                          | ETA:  0:00:04
Adding changed files:  32% |###########                         | ETA:  0:00:04
Adding changed files:  34% |############                        | ETA:  0:00:04
Adding changed files:  37% |#############                       | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:03
Adding changed files:  42% |###############                     | ETA:  0:00:03
Adding changed files:  44% |################                    | ETA:  0:00:03
Adding changed files:  47% |################                    | ETA:  0:00:03
Adding changed files:  49% |#################                   | ETA:  0:00:03
Adding changed files:  51% |##################                  | ETA:  0:00:03
Adding changed files:  54% |###################                 | ETA:  0:00:02
Adding changed files:  56% |####################                | ETA:  0:00:03
Adding changed files:  59% |#####################               | ETA:  0:00:02
Adding changed files:  61% |######################              | ETA:  0:00:02
Adding changed files:  64% |#######################             | ETA:  0:00:02
Adding changed files:  66% |########################            | ETA:  0:00:02
Adding changed files:  69% |########################            | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:07
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-9.2.0.tar.xz...
INFO: Rebasing devtool onto 97ebe36345d003386e1658718672318323a20569
WARNING: Command 'git rebase 97ebe36345d003386e1658718672318323a20569' failed:
Auto-merging linux-user/syscall.c
CONFLICT (content): Merge conflict in linux-user/syscall.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/qemu-system-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/qemu-system-native/qemu-system-native_9.2.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6559111405837745785==--

