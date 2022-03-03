Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F19C352A1
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.13895.1646329344939712639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EO1Z/4N5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017f50e0303b-cbfbfbc3-ce73-425e-9e41-280d07bbb63b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dKu2SGzTXT97GzZFSVpqDkYFuqjjNWmr2qLID3LjCiY=;
	b=EO1Z/4N53qYE0tE3yn9nHuptV09SLXeNWQ1Zy/YjFFCXHGQmL5ROii98JW9fOZLX
	kptv3BudmrHVZbe0XBmKMoBOTr9Es8W7hdPHo1b9ECPV46PVPoAEOK8345ugCDLkfKX
	aAgZVojvQ8mqfPH0lY99vxgntk2FVxnO+3sHHBqg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dKu2SGzTXT97GzZFSVpqDkYFuqjjNWmr2qLID3LjCiY=;
	b=Z4ofQet5Fm5CNNZStY4U6WNNUft1OxuptV1jE1ocI4mRMTZzK7WbgRe8oh5dGpbH
	E2oalZ284qjHXKHvapr8f76KKIzwhQ2w6YTmQ6nzggdDbBeqfNHLCsW1BJDkafSMSek
	g+kyCV+uJVHYEnzAF0HntqPJqtPwAlMFSdnSIcbs=
Content-Type: multipart/mixed; boundary="===============5583692795629346086=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs: upgrading to 1.59.0 FAILED
Message-ID: 
 <0101017f50e0303b-cbfbfbc3-ce73-425e-9e41-280d07bbb63b-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162683

--===============5583692795629346086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libstd-rs* to *1.59.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libstd-rs -V 1.59.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1521 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-2ab1f8f011a9c85bd1cad3445f2c454790a7acb4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2ab1f8f011a9c85bd1cad3445f2c454790a7acb4"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1521 entries from dependency cache.
Parsing recipes...done.
Parsing of 844 .bb files complete (842 cached, 2 parsed). 1522 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-2ab1f8f011a9c85bd1cad3445f2c454790a7acb4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2ab1f8f011a9c85bd1cad3445f2c454790a7acb4"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 15 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:49
Adding changed files:   2% |                                    | ETA:  0:00:38
Adding changed files:   3% |#                                   | ETA:  0:00:32
Adding changed files:   4% |#                                   | ETA:  0:00:29
Adding changed files:   5% |#                                   | ETA:  0:00:26
Adding changed files:   6% |##                                  | ETA:  0:00:24
Adding changed files:   7% |##                                  | ETA:  0:00:23
Adding changed files:   8% |###                                 | ETA:  0:00:22
Adding changed files:   9% |###                                 | ETA:  0:00:21
Adding changed files:  10% |###                                 | ETA:  0:00:20
Adding changed files:  11% |####                                | ETA:  0:00:19
Adding changed files:  12% |####                                | ETA:  0:00:19
Adding changed files:  13% |####                                | ETA:  0:00:18
Adding changed files:  14% |#####                               | ETA:  0:00:18
Adding changed files:  15% |#####                               | ETA:  0:00:17
Adding changed files:  16% |######                              | ETA:  0:00:17
Adding changed files:  17% |######                              | ETA:  0:00:17
Adding changed files:  18% |######                              | ETA:  0:00:17
Adding changed files:  19% |#######                             | ETA:  0:00:17
Adding changed files:  20% |#######                             | ETA:  0:00:17
Adding changed files:  21% |#######                             | ETA:  0:00:16
Adding changed files:  22% |########                            | ETA:  0:00:16
Adding changed files:  23% |########                            | ETA:  0:00:16
Adding changed files:  25% |#########                           | ETA:  0:00:16
Adding changed files:  26% |#########                           | ETA:  0:00:16
Adding changed files:  27% |#########                           | ETA:  0:00:16
Adding changed files:  28% |##########                          | ETA:  0:00:16
Adding changed files:  29% |##########                          | ETA:  0:00:15
Adding changed files:  30% |##########                          | ETA:  0:00:16
Adding changed files:  31% |###########                         | ETA:  0:00:16
Adding changed files:  32% |###########                         | ETA:  0:00:16
Adding changed files:  33% |############                        | ETA:  0:00:16
Adding changed files:  34% |############                        | ETA:  0:00:16
Adding changed files:  35% |############                        | ETA:  0:00:16
Adding changed files:  36% |#############                       | ETA:  0:00:16
Adding changed files:  37% |#############                       | ETA:  0:00:15
Adding changed files:  38% |#############                       | ETA:  0:00:15
Adding changed files:  39% |##############                      | ETA:  0:00:15
Adding changed files:  40% |##############                      | ETA:  0:00:15
Adding changed files:  41% |###############                     | ETA:  0:00:14
Adding changed files:  42% |###############                     | ETA:  0:00:14
Adding changed files:  43% |###############                     | ETA:  0:00:14
Adding changed files:  44% |################                    | ETA:  0:00:13
Adding changed files:  45% |################                    | ETA:  0:00:13
Adding changed files:  46% |################                    | ETA:  0:00:13
Adding changed files:  47% |#################                   | ETA:  0:00:13
Adding changed files:  48% |#################                   | ETA:  0:00:12
Adding changed files:  50% |##################                  | ETA:  0:00:12
Adding changed files:  51% |##################                  | ETA:  0:00:12
Adding changed files:  52% |##################                  | ETA:  0:00:12
Adding changed files:  53% |###################                 | ETA:  0:00:12
Adding changed files:  54% |###################                 | ETA:  0:00:11
Adding changed files:  55% |###################                 | ETA:  0:00:11
Adding changed files:  56% |####################                | ETA:  0:00:11
Adding changed files:  57% |####################                | ETA:  0:00:11
Adding changed files:  58% |#####################               | ETA:  0:00:10
Adding changed files:  59% |#####################               | ETA:  0:00:10
Adding changed files:  60% |#####################               | ETA:  0:00:10
Adding changed files:  61% |######################              | ETA:  0:00:10
Adding changed files:  62% |######################              | ETA:  0:00:09
Adding changed files:  63% |######################              | ETA:  0:00:09
Adding changed files:  64% |#######################             | ETA:  0:00:09
Adding changed files:  65% |#######################             | ETA:  0:00:09
Adding changed files:  66% |########################            | ETA:  0:00:08
Adding changed files:  67% |########################            | ETA:  0:00:08
Adding changed files:  68% |########################            | ETA:  0:00:08
Adding changed files:  69% |#########################           | ETA:  0:00:08
Adding changed files:  70% |#########################           | ETA:  0:00:07
Adding changed files:  71% |#########################           | ETA:  0:00:07
Adding changed files:  72% |##########################          | ETA:  0:00:07
Adding changed files:  73% |##########################          | ETA:  0:00:07
Adding changed files:  75% |###########################         | ETA:  0:00:06
Adding changed files:  76% |###########################         | ETA:  0:00:06
Adding changed files:  77% |###########################         | ETA:  0:00:06
Adding changed files:  78% |############################        | ETA:  0:00:05
Adding changed files:  79% |############################        | ETA:  0:00:05
Adding changed files:  80% |############################        | ETA:  0:00:05
Adding changed files:  81% |#############################       | ETA:  0:00:05
Adding changed files:  82% |#############################       | ETA:  0:00:04
Adding changed files:  83% |##############################      | ETA:  0:00:04
Adding changed files:  84% |##############################      | ETA:  0:00:04
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  87% |###############################     | ETA:  0:00:03
Adding changed files:  88% |###############################     | ETA:  0:00:03
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  91% |#################################   | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:27

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.59.0-src.tar.xz;name=rust...
INFO: Rebasing devtool onto ce5f0ad28a3387ba0bde44676b8d844be6a4419d
WARNING: Command 'git rebase ce5f0ad28a3387ba0bde44676b8d844be6a4419d' failed:
CONFLICT (file location): vendor/libc-0.2.106/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs added in 1d155d83f... Add base definitions for riscv64 + musl inside a directory that was renamed in HEAD, suggesting it should perhaps be moved to vendor/libc-0.2.108/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs.
CONFLICT (modify/delete): vendor/libc-0.2.106/src/unix/linux_like/linux/musl/b64/mod.rs deleted in HEAD and modified in 1d155d83f... Add base definitions for riscv64 + musl. Version 1d155d83f... Add base definitions for riscv64 + musl of vendor/libc-0.2.106/src/unix/linux_like/linux/musl/b64/mod.rs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
vendor/libc-0.2.106/src/unix/linux_like/linux/musl/b64/mod.rs: needs merge
vendor/libc-0.2.108/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5583692795629346086==--

