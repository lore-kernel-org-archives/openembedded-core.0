Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDDDC04E88
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.39336.1656687063316827066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=L4Sd9gr4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010181ba3e6e84-2b377329-d0f2-4ab1-88d1-6b8dc1d97e68-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HDnJC1Iem4+0cvnBPKkS8r0rml6QonMniOTreuKSuHw=;
	b=L4Sd9gr4PT0smrsCaGxVuUEvqHGxSw9yKsMHMOrdamvrtVpRD37rKN7q0ZdRYa1O
	cE/zh9Q3rv3MGoBTNzYPOvTs5H99L0eCllMOGSBRjYCUC0cJxU+a7/LQ+DXG1VZEKM2
	tS0elfE6eFh+wPl1VUyQXAe1Z+TQcwfAnOYwroMM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HDnJC1Iem4+0cvnBPKkS8r0rml6QonMniOTreuKSuHw=;
	b=Yc62a31ZQD/WNS3+TAV06kr6l2xGyf8jd1lk/Y5dWzhQ6cEu6gRDtzBtDD8sjBhb
	JyUWl0D+LrpGd57ocfhcV6G1gy8mTkV1JhGcqlQ1l/O39iPP59ahAsMU8+YMF2ZBkrR
	Q+Mkn7kOS1rJtAm+VIBPvmZ7QcnP0zZejzuyBfd0=
Content-Type: multipart/mixed; boundary="===============4337029360494579202=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs: upgrading to 1.62.0 FAILED
Message-ID: 
 <01010181ba3e6e84-2b377329-d0f2-4ab1-88d1-6b8dc1d97e68-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167495

--===============4337029360494579202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libstd-rs* to *1.62.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libstd-rs -V 1.62.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1654 entries from dependency cache.

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
DISTRO_VERSION       = "4.1+snapshot-7aded86b509598c64f74a20776880bd500ba25d5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7aded86b509598c64f74a20776880bd500ba25d5"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1654 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (885 cached, 2 parsed). 1655 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7aded86b509598c64f74a20776880bd500ba25d5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7aded86b509598c64f74a20776880bd500ba25d5"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:01:31
Adding changed files:   1% |                                    | ETA:  0:01:08
Adding changed files:   2% |                                    | ETA:  0:00:59
Adding changed files:   2% |#                                   | ETA:  0:00:53
Adding changed files:   3% |#                                   | ETA:  0:00:50
Adding changed files:   4% |#                                   | ETA:  0:00:48
Adding changed files:   4% |#                                   | ETA:  0:00:46
Adding changed files:   5% |##                                  | ETA:  0:00:45
Adding changed files:   6% |##                                  | ETA:  0:00:44
Adding changed files:   6% |##                                  | ETA:  0:00:43
Adding changed files:   7% |##                                  | ETA:  0:00:42
Adding changed files:   8% |###                                 | ETA:  0:00:41
Adding changed files:   9% |###                                 | ETA:  0:00:40
Adding changed files:   9% |###                                 | ETA:  0:00:39
Adding changed files:  10% |###                                 | ETA:  0:00:38
Adding changed files:  11% |####                                | ETA:  0:00:37
Adding changed files:  11% |####                                | ETA:  0:00:36
Adding changed files:  12% |####                                | ETA:  0:00:36
Adding changed files:  13% |####                                | ETA:  0:00:35
Adding changed files:  13% |#####                               | ETA:  0:00:35
Adding changed files:  14% |#####                               | ETA:  0:00:34
Adding changed files:  15% |#####                               | ETA:  0:00:34
Adding changed files:  16% |#####                               | ETA:  0:00:34
Adding changed files:  16% |######                              | ETA:  0:00:34
Adding changed files:  17% |######                              | ETA:  0:00:33
Adding changed files:  18% |######                              | ETA:  0:00:33
Adding changed files:  18% |######                              | ETA:  0:00:32
Adding changed files:  19% |#######                             | ETA:  0:00:32
Adding changed files:  20% |#######                             | ETA:  0:00:32
Adding changed files:  20% |#######                             | ETA:  0:00:31
Adding changed files:  21% |#######                             | ETA:  0:00:31
Adding changed files:  22% |########                            | ETA:  0:00:31
Adding changed files:  23% |########                            | ETA:  0:00:31
Adding changed files:  23% |########                            | ETA:  0:00:30
Adding changed files:  24% |########                            | ETA:  0:00:30
Adding changed files:  25% |#########                           | ETA:  0:00:30
Adding changed files:  25% |#########                           | ETA:  0:00:30
Adding changed files:  26% |#########                           | ETA:  0:00:29
Adding changed files:  27% |#########                           | ETA:  0:00:29
Adding changed files:  27% |##########                          | ETA:  0:00:29
Adding changed files:  28% |##########                          | ETA:  0:00:28
Adding changed files:  29% |##########                          | ETA:  0:00:28
Adding changed files:  30% |##########                          | ETA:  0:00:28
Adding changed files:  30% |###########                         | ETA:  0:00:28
Adding changed files:  31% |###########                         | ETA:  0:00:28
Adding changed files:  32% |###########                         | ETA:  0:00:28
Adding changed files:  32% |###########                         | ETA:  0:00:27
Adding changed files:  33% |############                        | ETA:  0:00:27
Adding changed files:  34% |############                        | ETA:  0:00:27
Adding changed files:  34% |############                        | ETA:  0:00:27
Adding changed files:  35% |############                        | ETA:  0:00:27
Adding changed files:  36% |#############                       | ETA:  0:00:26
Adding changed files:  37% |#############                       | ETA:  0:00:26
Adding changed files:  37% |#############                       | ETA:  0:00:26
Adding changed files:  38% |#############                       | ETA:  0:00:26
Adding changed files:  39% |##############                      | ETA:  0:00:26
Adding changed files:  39% |##############                      | ETA:  0:00:25
Adding changed files:  40% |##############                      | ETA:  0:00:25
Adding changed files:  41% |##############                      | ETA:  0:00:25
Adding changed files:  41% |###############                     | ETA:  0:00:24
Adding changed files:  42% |###############                     | ETA:  0:00:24
Adding changed files:  43% |###############                     | ETA:  0:00:24
Adding changed files:  44% |###############                     | ETA:  0:00:24
Adding changed files:  44% |################                    | ETA:  0:00:24
Adding changed files:  45% |################                    | ETA:  0:00:23
Adding changed files:  46% |################                    | ETA:  0:00:23
Adding changed files:  46% |################                    | ETA:  0:00:23
Adding changed files:  47% |#################                   | ETA:  0:00:23
Adding changed files:  48% |#################                   | ETA:  0:00:22
Adding changed files:  48% |#################                   | ETA:  0:00:22
Adding changed files:  49% |#################                   | ETA:  0:00:22
Adding changed files:  50% |##################                  | ETA:  0:00:22
Adding changed files:  51% |##################                  | ETA:  0:00:21
Adding changed files:  51% |##################                  | ETA:  0:00:21
Adding changed files:  52% |##################                  | ETA:  0:00:21
Adding changed files:  53% |###################                 | ETA:  0:00:21
Adding changed files:  53% |###################                 | ETA:  0:00:20
Adding changed files:  54% |###################                 | ETA:  0:00:20
Adding changed files:  55% |###################                 | ETA:  0:00:20
Adding changed files:  55% |####################                | ETA:  0:00:19
Adding changed files:  56% |####################                | ETA:  0:00:19
Adding changed files:  57% |####################                | ETA:  0:00:19
Adding changed files:  58% |####################                | ETA:  0:00:19
Adding changed files:  58% |#####################               | ETA:  0:00:18
Adding changed files:  59% |#####################               | ETA:  0:00:18
Adding changed files:  60% |#####################               | ETA:  0:00:18
Adding changed files:  60% |#####################               | ETA:  0:00:17
Adding changed files:  61% |######################              | ETA:  0:00:17
Adding changed files:  62% |######################              | ETA:  0:00:17
Adding changed files:  62% |######################              | ETA:  0:00:17
Adding changed files:  63% |######################              | ETA:  0:00:16
Adding changed files:  64% |#######################             | ETA:  0:00:16
Adding changed files:  65% |#######################             | ETA:  0:00:16
Adding changed files:  65% |#######################             | ETA:  0:00:15
Adding changed files:  66% |#######################             | ETA:  0:00:15
Adding changed files:  67% |########################            | ETA:  0:00:15
Adding changed files:  67% |########################            | ETA:  0:00:15
Adding changed files:  68% |########################            | ETA:  0:00:14
Adding changed files:  69% |########################            | ETA:  0:00:14
Adding changed files:  69% |#########################           | ETA:  0:00:14
Adding changed files:  70% |#########################           | ETA:  0:00:13
Adding changed files:  71% |#########################           | ETA:  0:00:13
Adding changed files:  72% |#########################           | ETA:  0:00:13
Adding changed files:  72% |##########################          | ETA:  0:00:12
Adding changed files:  73% |##########################          | ETA:  0:00:12
Adding changed files:  74% |##########################          | ETA:  0:00:12
Adding changed files:  74% |##########################          | ETA:  0:00:11
Adding changed files:  75% |###########################         | ETA:  0:00:11
Adding changed files:  76% |###########################         | ETA:  0:00:11
Adding changed files:  76% |###########################         | ETA:  0:00:10
Adding changed files:  77% |###########################         | ETA:  0:00:10
Adding changed files:  78% |############################        | ETA:  0:00:10
Adding changed files:  79% |############################        | ETA:  0:00:09
Adding changed files:  79% |############################        | ETA:  0:00:09
Adding changed files:  80% |############################        | ETA:  0:00:09
Adding changed files:  81% |#############################       | ETA:  0:00:08
Adding changed files:  81% |#############################       | ETA:  0:00:08
Adding changed files:  82% |#############################       | ETA:  0:00:08
Adding changed files:  83% |#############################       | ETA:  0:00:07
Adding changed files:  83% |##############################      | ETA:  0:00:07
Adding changed files:  84% |##############################      | ETA:  0:00:07
Adding changed files:  85% |##############################      | ETA:  0:00:06
Adding changed files:  86% |##############################      | ETA:  0:00:06
Adding changed files:  86% |###############################     | ETA:  0:00:06
Adding changed files:  87% |###############################     | ETA:  0:00:05
Adding changed files:  88% |###############################     | ETA:  0:00:05
Adding changed files:  88% |###############################     | ETA:  0:00:05
Adding changed files:  89% |################################    | ETA:  0:00:04
Adding changed files:  90% |################################    | ETA:  0:00:04
Adding changed files:  90% |################################    | ETA:  0:00:04
Adding changed files:  91% |################################    | ETA:  0:00:03
Adding changed files:  92% |#################################   | ETA:  0:00:03
Adding changed files:  93% |#################################   | ETA:  0:00:03
Adding changed files:  93% |#################################   | ETA:  0:00:02
Adding changed files:  94% |##################################  | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:48

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz;name=rust...
INFO: Rebasing devtool onto 69abb8b03fbc11db2c36ecd5a9c23225844cbaad
WARNING: Command 'git rebase 69abb8b03fbc11db2c36ecd5a9c23225844cbaad' failed:
CONFLICT (modify/delete): vendor/libc-0.2.116/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs deleted in HEAD and modified in 533174268 (Add 400-series syscalls to musl riscv64 definitions). Version 533174268 (Add 400-series syscalls to musl riscv64 definitions) of vendor/libc-0.2.116/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
vendor/libc-0.2.116/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4337029360494579202==--

