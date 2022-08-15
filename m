Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1835FC32793
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.6469.1660589822608793033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=g9HH5t+u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010182a2ddcf5f-f92a6b0a-351b-43da-a319-6a8513b822f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m/0OPbA0+d1rkZXBfyRQmAX4WbvMjfUxSFTmCE765Jc=;
	b=g9HH5t+uEvs9w3IrUZrxk9jTDZP2VxWVlT1kxCbOW31tWBxWkOUX1Ea2xlITsY5V
	Zpo6JwgK/YJ6tUI11+AtvZE5sXnKAUN9/Z5ID5EPVZTJY1eoPBytDrtlthMbT8HJNcj
	oj+xin+R7/k1YPuhf3LnRgcWe4sgATt2lKV7RJ8o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m/0OPbA0+d1rkZXBfyRQmAX4WbvMjfUxSFTmCE765Jc=;
	b=Tu/lxZc8wqYfAELxxvqTb1E6UaxguFZlKfl2NzRgTmjzoUU/n0GB5THkqRY7AOPX
	bAkrqiw0wgBJoyEEUhboJRM6WLo+QNdTONxnEB0DApn8/tGHpfaRKw0atHZHgqZGhPC
	LsS4ewGSbnVuaSoy372ntRMWgi+8pbqkeqyv8okE=
Content-Type: multipart/mixed; boundary="===============5051445173513451745=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] boost: upgrading to 1.80.0 FAILED
Message-ID: 
 <01010182a2ddcf5f-f92a6b0a-351b-43da-a319-6a8513b822f8-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169405

--===============5051445173513451745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *boost* to *1.80.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe boost failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.

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
DISTRO_VERSION       = "4.1+snapshot-3de2b0608d3c3dd9578a9d04e8bc0674dd57b14b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3de2b0608d3c3dd9578a9d04e8bc0674dd57b14b"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-3de2b0608d3c3dd9578a9d04e8bc0674dd57b14b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3de2b0608d3c3dd9578a9d04e8bc0674dd57b14b"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:24
Adding changed files:   2% |#                                   | ETA:  0:00:18
Adding changed files:   4% |#                                   | ETA:  0:00:15
Adding changed files:   5% |##                                  | ETA:  0:00:14
Adding changed files:   7% |##                                  | ETA:  0:00:13
Adding changed files:   8% |###                                 | ETA:  0:00:13
Adding changed files:   9% |###                                 | ETA:  0:00:12
Adding changed files:  11% |####                                | ETA:  0:00:12
Adding changed files:  12% |####                                | ETA:  0:00:11
Adding changed files:  14% |#####                               | ETA:  0:00:11
Adding changed files:  15% |#####                               | ETA:  0:00:11
Adding changed files:  17% |######                              | ETA:  0:00:11
Adding changed files:  18% |######                              | ETA:  0:00:11
Adding changed files:  19% |#######                             | ETA:  0:00:11
Adding changed files:  21% |#######                             | ETA:  0:00:10
Adding changed files:  22% |########                            | ETA:  0:00:10
Adding changed files:  24% |########                            | ETA:  0:00:10
Adding changed files:  25% |#########                           | ETA:  0:00:10
Adding changed files:  27% |#########                           | ETA:  0:00:10
Adding changed files:  28% |##########                          | ETA:  0:00:10
Adding changed files:  29% |##########                          | ETA:  0:00:10
Adding changed files:  31% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:09
Adding changed files:  34% |############                        | ETA:  0:00:09
Adding changed files:  35% |############                        | ETA:  0:00:09
Adding changed files:  37% |#############                       | ETA:  0:00:08
Adding changed files:  38% |#############                       | ETA:  0:00:08
Adding changed files:  39% |##############                      | ETA:  0:00:08
Adding changed files:  41% |##############                      | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:08
Adding changed files:  44% |###############                     | ETA:  0:00:07
Adding changed files:  45% |################                    | ETA:  0:00:07
Adding changed files:  46% |################                    | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  49% |#################                   | ETA:  0:00:06
Adding changed files:  51% |##################                  | ETA:  0:00:06
Adding changed files:  52% |##################                  | ETA:  0:00:06
Adding changed files:  54% |###################                 | ETA:  0:00:06
Adding changed files:  55% |###################                 | ETA:  0:00:06
Adding changed files:  56% |####################                | ETA:  0:00:06
Adding changed files:  58% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  64% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  66% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  69% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  72% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:14
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://boostorg.jfrog.io/artifactory/main/release/1.80.0/source/boost_1_80_0.tar.bz2...
INFO: Rebasing devtool onto 97c78b534bd0f26b64a4e120dad7b62ade34a0e0
WARNING: Command 'git rebase 97c78b534bd0f26b64a4e120dad7b62ade34a0e0' failed:
Auto-merging boost/pool/pool.hpp
CONFLICT (content): Merge conflict in boost/pool/pool.hpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/boost
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/boost/boost_1.80.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5051445173513451745==--

