Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71553C38A2D
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.504.1664643227804749232
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W9OtBHKL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101839477de2f-e369b25e-d010-4d80-824d-27f1ad7c14ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h8KbwMnVQrOCNVte8Kj/UqoirGcXu9Ge1lwcc0gXQzU=;
	b=W9OtBHKLxCMcVvOc7VG1haWTXsKPOTEfh3VoxXwSZIRpouY/3DIR63D5B+dLwEIf
	1kxaRSQ1AyWTKkpf9vdyG2t0TsHBNJunl9Gp3zLXzz4lvksWpmTPelyOdk0cgD/fUES
	8aTFOKqalxOumgXtXoQF47Eg5QFxMnaHeHgU+wQw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h8KbwMnVQrOCNVte8Kj/UqoirGcXu9Ge1lwcc0gXQzU=;
	b=S3LPj6hAUAUgo5UphbMIHm/P3yP2++VPqiEPndkvDMrMowwWQ3eKR+Q5VulSdwMH
	4DVbC4GtoZskMJFIDnqHJglvXTLNiIwwCEX52RveWR0XQMVgWnKrS/ks3b+mk9OAVA5
	sWK9Nb6IhPmMZ7QK/NNX3IkCesIy1TcYrz1E1R6g=
Content-Type: multipart/mixed; boundary="===============6341481235549136761=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust: upgrading to 1.64.0 FAILED
Message-ID: 
 <010101839477de2f-e369b25e-d010-4d80-824d-27f1ad7c14ec-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171292

--===============6341481235549136761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust* to *1.64.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rust failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8bad35c6b8a788dd1c9813addd0057e0be32d578"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8bad35c6b8a788dd1c9813addd0057e0be32d578"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 17 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:01:04
Adding changed files:   1% |                                    | ETA:  0:00:47
Adding changed files:   2% |#                                   | ETA:  0:00:41
Adding changed files:   3% |#                                   | ETA:  0:00:38
Adding changed files:   4% |#                                   | ETA:  0:00:36
Adding changed files:   5% |##                                  | ETA:  0:00:34
Adding changed files:   6% |##                                  | ETA:  0:00:33
Adding changed files:   7% |##                                  | ETA:  0:00:32
Adding changed files:   8% |###                                 | ETA:  0:00:31
Adding changed files:   9% |###                                 | ETA:  0:00:30
Adding changed files:  10% |###                                 | ETA:  0:00:30
Adding changed files:  11% |####                                | ETA:  0:00:29
Adding changed files:  12% |####                                | ETA:  0:00:29
Adding changed files:  13% |####                                | ETA:  0:00:29
Adding changed files:  13% |#####                               | ETA:  0:00:29
Adding changed files:  14% |#####                               | ETA:  0:00:29
Adding changed files:  15% |#####                               | ETA:  0:00:28
Adding changed files:  16% |######                              | ETA:  0:00:27
Adding changed files:  17% |######                              | ETA:  0:00:27
Adding changed files:  18% |######                              | ETA:  0:00:27
Adding changed files:  19% |#######                             | ETA:  0:00:26
Adding changed files:  20% |#######                             | ETA:  0:00:26
Adding changed files:  21% |#######                             | ETA:  0:00:26
Adding changed files:  22% |########                            | ETA:  0:00:25
Adding changed files:  23% |########                            | ETA:  0:00:25
Adding changed files:  24% |########                            | ETA:  0:00:25
Adding changed files:  25% |#########                           | ETA:  0:00:24
Adding changed files:  26% |#########                           | ETA:  0:00:24
Adding changed files:  27% |#########                           | ETA:  0:00:24
Adding changed files:  27% |##########                          | ETA:  0:00:23
Adding changed files:  28% |##########                          | ETA:  0:00:23
Adding changed files:  29% |##########                          | ETA:  0:00:23
Adding changed files:  30% |###########                         | ETA:  0:00:23
Adding changed files:  31% |###########                         | ETA:  0:00:22
Adding changed files:  32% |###########                         | ETA:  0:00:22
Adding changed files:  33% |############                        | ETA:  0:00:22
Adding changed files:  34% |############                        | ETA:  0:00:22
Adding changed files:  35% |############                        | ETA:  0:00:21
Adding changed files:  36% |#############                       | ETA:  0:00:21
Adding changed files:  37% |#############                       | ETA:  0:00:21
Adding changed files:  38% |#############                       | ETA:  0:00:21
Adding changed files:  39% |##############                      | ETA:  0:00:20
Adding changed files:  40% |##############                      | ETA:  0:00:20
Adding changed files:  41% |##############                      | ETA:  0:00:20
Adding changed files:  41% |###############                     | ETA:  0:00:19
Adding changed files:  42% |###############                     | ETA:  0:00:19
Adding changed files:  43% |###############                     | ETA:  0:00:19
Adding changed files:  44% |################                    | ETA:  0:00:18
Adding changed files:  45% |################                    | ETA:  0:00:18
Adding changed files:  46% |################                    | ETA:  0:00:18
Adding changed files:  47% |#################                   | ETA:  0:00:18
Adding changed files:  48% |#################                   | ETA:  0:00:17
Adding changed files:  49% |#################                   | ETA:  0:00:17
Adding changed files:  50% |##################                  | ETA:  0:00:17
Adding changed files:  51% |##################                  | ETA:  0:00:17
Adding changed files:  52% |##################                  | ETA:  0:00:16
Adding changed files:  53% |###################                 | ETA:  0:00:16
Adding changed files:  54% |###################                 | ETA:  0:00:16
Adding changed files:  54% |###################                 | ETA:  0:00:15
Adding changed files:  55% |####################                | ETA:  0:00:15
Adding changed files:  56% |####################                | ETA:  0:00:15
Adding changed files:  57% |####################                | ETA:  0:00:14
Adding changed files:  58% |#####################               | ETA:  0:00:14
Adding changed files:  59% |#####################               | ETA:  0:00:14
Adding changed files:  60% |#####################               | ETA:  0:00:14
Adding changed files:  61% |######################              | ETA:  0:00:13
Adding changed files:  62% |######################              | ETA:  0:00:13
Adding changed files:  63% |######################              | ETA:  0:00:13
Adding changed files:  64% |#######################             | ETA:  0:00:12
Adding changed files:  65% |#######################             | ETA:  0:00:12
Adding changed files:  66% |#######################             | ETA:  0:00:12
Adding changed files:  67% |########################            | ETA:  0:00:11
Adding changed files:  68% |########################            | ETA:  0:00:11
Adding changed files:  68% |########################            | ETA:  0:00:11
Adding changed files:  69% |#########################           | ETA:  0:00:10
Adding changed files:  70% |#########################           | ETA:  0:00:10
Adding changed files:  71% |#########################           | ETA:  0:00:10
Adding changed files:  72% |##########################          | ETA:  0:00:09
Adding changed files:  73% |##########################          | ETA:  0:00:09
Adding changed files:  74% |##########################          | ETA:  0:00:09
Adding changed files:  75% |###########################         | ETA:  0:00:08
Adding changed files:  76% |###########################         | ETA:  0:00:08
Adding changed files:  77% |###########################         | ETA:  0:00:08
Adding changed files:  78% |############################        | ETA:  0:00:07
Adding changed files:  79% |############################        | ETA:  0:00:07
Adding changed files:  80% |############################        | ETA:  0:00:07
Adding changed files:  81% |#############################       | ETA:  0:00:06
Adding changed files:  82% |#############################       | ETA:  0:00:06
Adding changed files:  82% |#############################       | ETA:  0:00:06
Adding changed files:  83% |##############################      | ETA:  0:00:05
Adding changed files:  84% |##############################      | ETA:  0:00:05
Adding changed files:  85% |##############################      | ETA:  0:00:05
Adding changed files:  86% |###############################     | ETA:  0:00:04
Adding changed files:  87% |###############################     | ETA:  0:00:04
Adding changed files:  88% |###############################     | ETA:  0:00:04
Adding changed files:  89% |################################    | ETA:  0:00:03
Adding changed files:  90% |################################    | ETA:  0:00:03
Adding changed files:  91% |################################    | ETA:  0:00:03
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  93% |#################################   | ETA:  0:00:02
Adding changed files:  94% |#################################   | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:37
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.64.0-src.tar.xz;name=rust...
INFO: Rebasing devtool onto 6e97595ab3c63fe690db03f0cfd88ebb02ebb1fb
WARNING: Command 'git rebase 6e97595ab3c63fe690db03f0cfd88ebb02ebb1fb' failed:
Auto-merging vendor/crossbeam-utils/.cargo-checksum.json
CONFLICT (content): Merge conflict in vendor/crossbeam-utils/.cargo-checksum.json

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 6e97595ab3c63fe690db03f0cfd88ebb02ebb1fb
INFO: Rebasing devtool-override-class-target onto 6e97595ab3c63fe690db03f0cfd88ebb02ebb1fb
WARNING: Command 'git rebase 6e97595ab3c63fe690db03f0cfd88ebb02ebb1fb' failed:
Auto-merging vendor/crossbeam-utils/.cargo-checksum.json
CONFLICT (content): Merge conflict in vendor/crossbeam-utils/.cargo-checksum.json

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-pn-nativesdk-rust onto 6e97595ab3c63fe690db03f0cfd88ebb02ebb1fb
INFO: Rebasing devtool-override-pn-rust onto 6e97595ab3c63fe690db03f0cfd88ebb02ebb1fb
WARNING: Command 'git rebase 6e97595ab3c63fe690db03f0cfd88ebb02ebb1fb' failed:
Auto-merging vendor/crossbeam-utils/.cargo-checksum.json
CONFLICT (content): Merge conflict in vendor/crossbeam-utils/.cargo-checksum.json

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rust
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rust/rust_1.64.0.bb
WARNING: Version is pinned to 1.63% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6341481235549136761==--

