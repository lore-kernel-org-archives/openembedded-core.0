Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56C9C3DA5C
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.174023.1692224343091137432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eYlJgb28;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BrLJVQHy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a006e47cf-6223f691-b686-442d-b966-7523000ce2e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CZ1amwD5OmqAJl5kp7/J4Eqm6RCVW5WfwXi6NBg+z0c=;
	b=eYlJgb28BsqBBzGQBBqMO5K5bv07yBlSqadEB1umqKm3hqwd7a79TlBISGWiejK8
	ao5mz9yG9ptdcCFL9bjVIS4C+2ZepTkm+bSH3ZHAD+5UM4YPnSRVIbS1iqAiUZ4pC3F
	35KohIrNmV4+5ZeEGrYfO4kEUf7WGkc7ktrNGk1o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CZ1amwD5OmqAJl5kp7/J4Eqm6RCVW5WfwXi6NBg+z0c=;
	b=BrLJVQHyueFbxi2ktqwsGpTYt5aWFD8nLtBgcQ8UR2DEVdwhNWuus07+fa9NYTIg
	0mEXYGqxfqwF7uAbEj7zKzvVJGD4XTJb6DuDnZCY1g0dU+X70n8ApQcddf+KutBxICt
	jMes3CEfeAB/n8KJCa5/vvtaQg0wFozRIR4gpWXo=
Content-Type: multipart/mixed; boundary="===============3153975504397969757=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext: upgrading to 0.22 FAILED
Message-ID: <0101018a006e47cf-6223f691-b686-442d-b966-7523000ce2e5-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186157

--===============3153975504397969757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gettext* to *0.22* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gettext failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1805 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:774f46b5df332375bd05eadff796c636c2730c66"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 30 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:774f46b5df332375bd05eadff796c636c2730c66"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:09
Adding changed files:   4% |#                                   | ETA:  0:00:06
Adding changed files:   6% |##                                  | ETA:  0:00:05
Adding changed files:   8% |###                                 | ETA:  0:00:05
Adding changed files:  10% |###                                 | ETA:  0:00:05
Adding changed files:  12% |####                                | ETA:  0:00:04
Adding changed files:  14% |#####                               | ETA:  0:00:04
Adding changed files:  16% |######                              | ETA:  0:00:04
Adding changed files:  18% |######                              | ETA:  0:00:04
Adding changed files:  21% |#######                             | ETA:  0:00:03
Adding changed files:  23% |########                            | ETA:  0:00:04
Adding changed files:  25% |#########                           | ETA:  0:00:03
Adding changed files:  27% |#########                           | ETA:  0:00:03
Adding changed files:  29% |##########                          | ETA:  0:00:03
Adding changed files:  31% |###########                         | ETA:  0:00:03
Adding changed files:  33% |############                        | ETA:  0:00:03
Adding changed files:  35% |############                        | ETA:  0:00:03
Adding changed files:  37% |#############                       | ETA:  0:00:02
Adding changed files:  40% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  44% |###############                     | ETA:  0:00:02
Adding changed files:  46% |################                    | ETA:  0:00:02
Adding changed files:  48% |#################                   | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  52% |##################                  | ETA:  0:00:02
Adding changed files:  54% |###################                 | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  63% |######################              | ETA:  0:00:01
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz...
INFO: Rebasing devtool onto e31047b81de9b8b20186a488309ea7027540ddfe
WARNING: Command 'git rebase e31047b81de9b8b20186a488309ea7027540ddfe' failed:
Auto-merging gettext-runtime/gnulib-m4/largefile.m4
CONFLICT (content): Merge conflict in gettext-runtime/gnulib-m4/largefile.m4
Auto-merging gettext-tools/gnulib-m4/largefile.m4
CONFLICT (content): Merge conflict in gettext-tools/gnulib-m4/largefile.m4
Auto-merging libtextstyle/gnulib-m4/largefile.m4
CONFLICT (content): Merge conflict in libtextstyle/gnulib-m4/largefile.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gettext
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gettext/gettext_0.22.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3153975504397969757==--

