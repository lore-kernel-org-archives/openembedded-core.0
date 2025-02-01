Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F72C021A7
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.42637.1738416057166345233
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ED4uP2TX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rjeMvykH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010194c1ac01da-00aeedba-ee06-4940-b534-51fb4256a99d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1Gb6TH+Ow2XlSXHfDRjr8Gef8IS+1fE0XyATmvIwO+w=;
	b=ED4uP2TXGH5Y7h5p+azcafAenBOUiVBdo6WVpCHI09b6hKbNVJoMc6aIZ9xa/nDe
	OaLyEfwz7Xvq9pQ5zUZ80m0BcU/+GZoKbk+OgPfacnvc8Iti8mQ2PhKUdFRsCrRB3/E
	YblvV6AxJWvkXFwgLToLRxMguT7P19TMujTrjLLs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1Gb6TH+Ow2XlSXHfDRjr8Gef8IS+1fE0XyATmvIwO+w=;
	b=rjeMvykHmDh3L/U2+jvFI0zjuimW19oUDmGYjvG3R4tvHm67FjbWDI1JgLxmLA7b
	1MbraIf2DqldKr7pt8mvEm2FmcYJWQxz6eU5p/l/cQQjgNg9DdRlvLun2jgn2SrKkAs
	8XZSCj3kUwjtqyPDGG3l6y/FlQKuZL7QRAWzcqM0=
Content-Type: multipart/mixed; boundary="===============6051755215183857931=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.3.4 FAILED
Message-ID: <01010194c1ac01da-00aeedba-ee06-4940-b534-51fb4256a99d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210574

--===============6051755215183857931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa* to *24.3.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mesa failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:aed7cff93e9c5d977d0ac5890d1969d3509db9d2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:aed7cff93e9c5d977d0ac5890d1969d3509db9d2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-d16kw1c2: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-yaip9bf2/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-yaip9bf2/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:10
Adding changed files:   2% |                                    | ETA:  0:00:07
Adding changed files:   4% |#                                   | ETA:  0:00:06
Adding changed files:   5% |#                                   | ETA:  0:00:06
Adding changed files:   6% |##                                  | ETA:  0:00:06
Adding changed files:   8% |##                                  | ETA:  0:00:07
Adding changed files:   9% |###                                 | ETA:  0:00:07
Adding changed files:  10% |###                                 | ETA:  0:00:08
Adding changed files:  12% |####                                | ETA:  0:00:08
Adding changed files:  13% |####                                | ETA:  0:00:07
Adding changed files:  14% |#####                               | ETA:  0:00:07
Adding changed files:  16% |#####                               | ETA:  0:00:06
Adding changed files:  17% |######                              | ETA:  0:00:06
Adding changed files:  18% |######                              | ETA:  0:00:06
Adding changed files:  20% |#######                             | ETA:  0:00:05
Adding changed files:  21% |#######                             | ETA:  0:00:05
Adding changed files:  23% |########                            | ETA:  0:00:05
Adding changed files:  24% |########                            | ETA:  0:00:05
Adding changed files:  25% |#########                           | ETA:  0:00:05
Adding changed files:  27% |#########                           | ETA:  0:00:04
Adding changed files:  28% |##########                          | ETA:  0:00:04
Adding changed files:  29% |##########                          | ETA:  0:00:04
Adding changed files:  31% |###########                         | ETA:  0:00:04
Adding changed files:  32% |###########                         | ETA:  0:00:04
Adding changed files:  33% |############                        | ETA:  0:00:04
Adding changed files:  35% |############                        | ETA:  0:00:04
Adding changed files:  36% |#############                       | ETA:  0:00:04
Adding changed files:  37% |#############                       | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:04
Adding changed files:  40% |##############                      | ETA:  0:00:03
Adding changed files:  41% |###############                     | ETA:  0:00:03
Adding changed files:  43% |###############                     | ETA:  0:00:03
Adding changed files:  44% |################                    | ETA:  0:00:03
Adding changed files:  46% |################                    | ETA:  0:00:03
Adding changed files:  47% |#################                   | ETA:  0:00:03
Adding changed files:  48% |#################                   | ETA:  0:00:03
Adding changed files:  50% |##################                  | ETA:  0:00:03
Adding changed files:  51% |##################                  | ETA:  0:00:03
Adding changed files:  52% |###################                 | ETA:  0:00:03
Adding changed files:  54% |###################                 | ETA:  0:00:03
Adding changed files:  55% |###################                 | ETA:  0:00:03
Adding changed files:  56% |####################                | ETA:  0:00:02
Adding changed files:  58% |####################                | ETA:  0:00:02
Adding changed files:  59% |#####################               | ETA:  0:00:02
Adding changed files:  60% |#####################               | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  63% |######################              | ETA:  0:00:02
Adding changed files:  64% |#######################             | ETA:  0:00:02
Adding changed files:  66% |#######################             | ETA:  0:00:02
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  69% |########################            | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  83% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:06
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://mesa.freedesktop.org/archive/mesa-24.3.4.tar.xz...
INFO: Rebasing devtool onto fd63580e5e00179c12364b2831ef8c42eea0b1d2
WARNING: Command 'git rebase fd63580e5e00179c12364b2831ef8c42eea0b1d2' failed:
Auto-merging src/glx/drisw_glx.c
CONFLICT (content): Merge conflict in src/glx/drisw_glx.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mesa
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mesa/mesa.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6051755215183857931==--

