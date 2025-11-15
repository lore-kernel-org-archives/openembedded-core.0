Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAF1CED609
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12127.1763224729929753292
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tkFBaCw9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Laug39bh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a88625e4a-4efb22d5-f786-4fca-a1dc-b573f1e1963d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hIiz9M5BHZAxC+Qb9ah+742pz/6ol1qwhIahJ6ruQ7M=;
	b=tkFBaCw9WpD4c/JNZof3ST3lOpv8Yga/2RIG8Rylas2lfV7WDXC+kwjYrnWLMgaq
	102tCs+oFBwIDuENaUSKSdzjeJm6tcqQh7Qw5BzyeI4+vStg2mwgidr4gL2pgGesI+u
	AbiHovu/W4ygRJgBwMMv1pl+Uw90kQ3sIRhzL0+I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hIiz9M5BHZAxC+Qb9ah+742pz/6ol1qwhIahJ6ruQ7M=;
	b=Laug39bhzPxKXN2hmEX2Wx0kBqzY6oGi8FsfenCPtka0YDYxTMSv526zDenVbrSA
	sIJyuOvtaRUaWWgaxGDxfrNw6Ga9VrXA9M9C8t0UdX4XcI+iUQyIR2aA3i2QT9YJek2
	BAL3DZJBwGrA85gAvb8HXmIxHV1XMjHH4N1xWwgM=
Content-Type: multipart/mixed; boundary="===============5757888733498635934=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cargo-c: upgrading to 0.10.18+cargo-0.92.0 FAILED
Message-ID: <0101019a88625e4a-4efb22d5-f786-4fca-a1dc-b573f1e1963d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226391

--===============5757888733498635934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c* to *0.10.18+cargo-0.92.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo-c -V 0.10.18+cargo-0.92.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-1a7be88536350e2667605e610c6d75c795245921"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:1a7be88536350e2667605e610c6d75c795245921"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-1a7be88536350e2667605e610c6d75c795245921"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:1a7be88536350e2667605e610c6d75c795245921"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:28
Adding changed files:   0% |                                    | ETA:  0:00:20
Adding changed files:   1% |                                    | ETA:  0:00:18
Adding changed files:   1% |                                    | ETA:  0:00:17
Adding changed files:   2% |                                    | ETA:  0:00:16
Adding changed files:   2% |                                    | ETA:  0:00:15
Adding changed files:   2% |#                                   | ETA:  0:00:15
Adding changed files:   3% |#                                   | ETA:  0:00:14
Adding changed files:   3% |#                                   | ETA:  0:00:14
Adding changed files:   4% |#                                   | ETA:  0:00:14
Adding changed files:   4% |#                                   | ETA:  0:00:14
Adding changed files:   5% |#                                   | ETA:  0:00:14
Adding changed files:   5% |##                                  | ETA:  0:00:13
Adding changed files:   5% |##                                  | ETA:  0:00:13
Adding changed files:   6% |##                                  | ETA:  0:00:13
Adding changed files:   6% |##                                  | ETA:  0:00:13
Adding changed files:   7% |##                                  | ETA:  0:00:13
Adding changed files:   7% |##                                  | ETA:  0:00:13
Adding changed files:   8% |##                                  | ETA:  0:00:13
Adding changed files:   8% |###                                 | ETA:  0:00:13
Adding changed files:   8% |###                                 | ETA:  0:00:12
Adding changed files:   9% |###                                 | ETA:  0:00:12
Adding changed files:   9% |###                                 | ETA:  0:00:12
Adding changed files:  10% |###                                 | ETA:  0:00:12
Adding changed files:  10% |###                                 | ETA:  0:00:12
Adding changed files:  11% |####                                | ETA:  0:00:12
Adding changed files:  11% |####                                | ETA:  0:00:12
Adding changed files:  11% |####                                | ETA:  0:00:12
Adding changed files:  12% |####                                | ETA:  0:00:12
Adding changed files:  12% |####                                | ETA:  0:00:12
Adding changed files:  13% |####                                | ETA:  0:00:12
Adding changed files:  13% |####                                | ETA:  0:00:11
Adding changed files:  14% |#####                               | ETA:  0:00:11
Adding changed files:  14% |#####                               | ETA:  0:00:11
Adding changed files:  14% |#####                               | ETA:  0:00:11
Adding changed files:  15% |#####                               | ETA:  0:00:11
Adding changed files:  15% |#####                               | ETA:  0:00:11
Adding changed files:  16% |#####                               | ETA:  0:00:11
Adding changed files:  16% |######                              | ETA:  0:00:11
Adding changed files:  17% |######                              | ETA:  0:00:11
Adding changed files:  17% |######                              | ETA:  0:00:11
Adding changed files:  17% |######                              | ETA:  0:00:11
Adding changed files:  18% |######                              | ETA:  0:00:11
Adding changed files:  18% |######                              | ETA:  0:00:11
Adding changed files:  19% |######                              | ETA:  0:00:11
Adding changed files:  19% |#######                             | ETA:  0:00:10
Adding changed files:  20% |#######                             | ETA:  0:00:10
Adding changed files:  20% |#######                             | ETA:  0:00:10
Adding changed files:  20% |#######                             | ETA:  0:00:10
Adding changed files:  21% |#######                             | ETA:  0:00:10
Adding changed files:  21% |#######                             | ETA:  0:00:10
Adding changed files:  22% |########                            | ETA:  0:00:10
Adding changed files:  22% |########                            | ETA:  0:00:10
Adding changed files:  23% |########                            | ETA:  0:00:10
Adding changed files:  23% |########                            | ETA:  0:00:10
Adding changed files:  23% |########                            | ETA:  0:00:10
Adding changed files:  24% |########                            | ETA:  0:00:10
Adding changed files:  24% |########                            | ETA:  0:00:10
Adding changed files:  25% |#########                           | ETA:  0:00:10
Adding changed files:  25% |#########                           | ETA:  0:00:09
Adding changed files:  26% |#########                           | ETA:  0:00:09
Adding changed files:  26% |#########                           | ETA:  0:00:09
Adding changed files:  26% |#########                           | ETA:  0:00:09
Adding changed files:  27% |#########                           | ETA:  0:00:09
Adding changed files:  27% |##########                          | ETA:  0:00:09
Adding changed files:  28% |##########                          | ETA:  0:00:09
Adding changed files:  28% |##########                          | ETA:  0:00:09
Adding changed files:  29% |##########                          | ETA:  0:00:09
Adding changed files:  29% |##########                          | ETA:  0:00:09
Adding changed files:  29% |##########                          | ETA:  0:00:09
Adding changed files:  30% |##########                          | ETA:  0:00:09
Adding changed files:  30% |###########                         | ETA:  0:00:09
Adding changed files:  31% |###########                         | ETA:  0:00:09
Adding changed files:  31% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:08
Adding changed files:  32% |###########                         | ETA:  0:00:08
Adding changed files:  32% |###########                         | ETA:  0:00:08
Adding changed files:  33% |############                        | ETA:  0:00:08
Adding changed files:  33% |############                        | ETA:  0:00:08
Adding changed files:  34% |############                        | ETA:  0:00:08
Adding changed files:  34% |############                        | ETA:  0:00:08
Adding changed files:  35% |############                        | ETA:  0:00:08
Adding changed files:  35% |############                        | ETA:  0:00:08
Adding changed files:  35% |############                        | ETA:  0:00:08
Adding changed files:  36% |#############                       | ETA:  0:00:08
Adding changed files:  36% |#############                       | ETA:  0:00:08
Adding changed files:  37% |#############                       | ETA:  0:00:08
Adding changed files:  37% |#############                       | ETA:  0:00:08
Adding changed files:  38% |#############                       | ETA:  0:00:08
Adding changed files:  38% |#############                       | ETA:  0:00:08
Adding changed files:  38% |##############                      | ETA:  0:00:07
Adding changed files:  39% |##############                      | ETA:  0:00:07
Adding changed files:  39% |##############                      | ETA:  0:00:07
Adding changed files:  40% |##############                      | ETA:  0:00:07
Adding changed files:  40% |##############                      | ETA:  0:00:07
Adding changed files:  41% |##############                      | ETA:  0:00:07
Adding changed files:  41% |##############                      | ETA:  0:00:07
Adding changed files:  41% |###############                     | ETA:  0:00:07
Adding changed files:  42% |###############                     | ETA:  0:00:07
Adding changed files:  42% |###############                     | ETA:  0:00:07
Adding changed files:  43% |###############                     | ETA:  0:00:07
Adding changed files:  43% |###############                     | ETA:  0:00:07
Adding changed files:  44% |###############                     | ETA:  0:00:07
Adding changed files:  44% |################                    | ETA:  0:00:07
Adding changed files:  44% |################                    | ETA:  0:00:07
Adding changed files:  45% |################                    | ETA:  0:00:07
Adding changed files:  45% |################                    | ETA:  0:00:06
Adding changed files:  46% |################                    | ETA:  0:00:06
Adding changed files:  46% |################                    | ETA:  0:00:06
Adding changed files:  47% |################                    | ETA:  0:00:06
Adding changed files:  47% |#################                   | ETA:  0:00:06
Adding changed files:  47% |#################                   | ETA:  0:00:06
Adding changed files:  48% |#################                   | ETA:  0:00:06
Adding changed files:  48% |#################                   | ETA:  0:00:06
Adding changed files:  49% |#################                   | ETA:  0:00:06
Adding changed files:  49% |#################                   | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  51% |##################                  | ETA:  0:00:06
Adding changed files:  51% |##################                  | ETA:  0:00:06
Adding changed files:  52% |##################                  | ETA:  0:00:06
Adding changed files:  52% |##################                  | ETA:  0:00:06
Adding changed files:  53% |###################                 | ETA:  0:00:05
Adding changed files:  53% |###################                 | ETA:  0:00:05
Adding changed files:  53% |###################                 | ETA:  0:00:05
Adding changed files:  54% |###################                 | ETA:  0:00:05
Adding changed files:  54% |###################                 | ETA:  0:00:05
Adding changed files:  55% |###################                 | ETA:  0:00:05
Adding changed files:  55% |####################                | ETA:  0:00:05
Adding changed files:  56% |####################                | ETA:  0:00:05
Adding changed files:  56% |####################                | ETA:  0:00:05
Adding changed files:  56% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  58% |####################                | ETA:  0:00:05
Adding changed files:  58% |#####################               | ETA:  0:00:05
Adding changed files:  58% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  60% |#####################               | ETA:  0:00:04
Adding changed files:  60% |#####################               | ETA:  0:00:04
Adding changed files:  61% |######################              | ETA:  0:00:04
Adding changed files:  61% |######################              | ETA:  0:00:04
Adding changed files:  61% |######################              | ETA:  0:00:04
Adding changed files:  62% |######################              | ETA:  0:00:04
Adding changed files:  62% |######################              | ETA:  0:00:04
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  64% |#######################             | ETA:  0:00:04
Adding changed files:  64% |#######################             | ETA:  0:00:04
Adding changed files:  64% |#######################             | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  66% |#######################             | ETA:  0:00:04
Adding changed files:  66% |########################            | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:03
Adding changed files:  67% |########################            | ETA:  0:00:03
Adding changed files:  68% |########################            | ETA:  0:00:03
Adding changed files:  68% |########################            | ETA:  0:00:03
Adding changed files:  69% |########################            | ETA:  0:00:03
Adding changed files:  69% |#########################           | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  72% |##########################          | ETA:  0:00:03
Adding changed files:  72% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:02
Adding changed files:  75% |###########################         | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:02
Adding changed files:  77% |###########################         | ETA:  0:00:02
Adding changed files:  77% |############################        | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  80% |############################        | ETA:  0:00:02
Adding changed files:  80% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:01
Adding changed files:  83% |##############################      | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:11

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching crate://crates.io/cargo-c/0.10.18+cargo-0.92.0;name=cargo-c...
INFO: Rebasing devtool onto 2b4195ec46253085f14ed21a5b6a331b484bed88
WARNING: Command 'git rebase 2b4195ec46253085f14ed21a5b6a331b484bed88' failed:
CONFLICT (modify/delete): bitbake/getrandom-0.3.3/src/backends.rs deleted in HEAD and modified in 70d86987 (Use getrandom syscall on riscv32/riscv64 linux).  Version 70d86987 (Use getrandom syscall on riscv32/riscv64 linux) of bitbake/getrandom-0.3.3/src/backends.rs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
bitbake/getrandom-0.3.3/src/backends.rs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5757888733498635934==--

