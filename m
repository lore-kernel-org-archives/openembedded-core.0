Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF95C83F05
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1427.1751386807842766615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TShNLN+6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IjZt5zAa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010197c6ca0b53-7096b004-587b-4db1-afd9-5c45a7d48470-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OseePTTMLPzDnZOw+WZ8MUt1s3MPOZ0EKbWZsedrgyw=;
	b=TShNLN+6ch9eIQ2IdgMAN4eV7gdaeUZuA4DOs2ikVji8sabsnMRuSkaZKe/TCfqA
	VcUkcA4GTI4lKEA42dkKXJrdD10d3oPEpR8m6HFcR6FOKNZ4TIoETGUjobQ+wW8EjZw
	Q9v4zzyQ13ErnTeAXQTMycD8ScMqbuxFH/2ZUUZg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OseePTTMLPzDnZOw+WZ8MUt1s3MPOZ0EKbWZsedrgyw=;
	b=IjZt5zAaO1On/iG+XIfkH8JRbCLu12W30TS5oIp+8YpnUmzLD+Vrz3coc3DvQ5x+
	cCqYnNlO0Sw/YOq6VRBru9m7KLCeh1/rPPtJlrhc0G28BzWImwubti6hK7nwLVOROXx
	b8w9No8o6dfxQ1ySagLL0KXEHumQuqUgkEuK/wGg=
Content-Type: multipart/mixed; boundary="===============5990302175851741365=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo-c: upgrading to 0.10.14+cargo-0.89.0 FAILED
Message-ID: <01010197c6ca0b53-7096b004-587b-4db1-afd9-5c45a7d48470-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219654

--===============5990302175851741365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c* to *0.10.14+cargo-0.89.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo-c -V 0.10.14+cargo-0.89.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e89f924f6a8fc91c206ece9bb4fe60bbf551b486"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e89f924f6a8fc91c206ece9bb4fe60bbf551b486"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 938 .bb files complete (0 cached, 938 parsed). 1918 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e89f924f6a8fc91c206ece9bb4fe60bbf551b486"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e89f924f6a8fc91c206ece9bb4fe60bbf551b486"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:01:01
Adding changed files:   0% |                                    | ETA:  0:00:45
Adding changed files:   1% |                                    | ETA:  0:00:39
Adding changed files:   1% |                                    | ETA:  0:00:36
Adding changed files:   1% |                                    | ETA:  0:00:34
Adding changed files:   2% |                                    | ETA:  0:00:33
Adding changed files:   2% |                                    | ETA:  0:00:32
Adding changed files:   2% |                                    | ETA:  0:00:31
Adding changed files:   3% |#                                   | ETA:  0:00:30
Adding changed files:   3% |#                                   | ETA:  0:00:30
Adding changed files:   3% |#                                   | ETA:  0:00:29
Adding changed files:   4% |#                                   | ETA:  0:00:29
Adding changed files:   4% |#                                   | ETA:  0:00:29
Adding changed files:   4% |#                                   | ETA:  0:00:30
Adding changed files:   5% |#                                   | ETA:  0:00:30
Adding changed files:   5% |#                                   | ETA:  0:00:29
Adding changed files:   5% |##                                  | ETA:  0:00:29
Adding changed files:   6% |##                                  | ETA:  0:00:29
Adding changed files:   6% |##                                  | ETA:  0:00:29
Adding changed files:   6% |##                                  | ETA:  0:00:29
Adding changed files:   7% |##                                  | ETA:  0:00:29
Adding changed files:   7% |##                                  | ETA:  0:00:29
Adding changed files:   7% |##                                  | ETA:  0:00:29
Adding changed files:   8% |##                                  | ETA:  0:00:28
Adding changed files:   8% |###                                 | ETA:  0:00:28
Adding changed files:   9% |###                                 | ETA:  0:00:28
Adding changed files:   9% |###                                 | ETA:  0:00:28
Adding changed files:   9% |###                                 | ETA:  0:00:28
Adding changed files:  10% |###                                 | ETA:  0:00:28
Adding changed files:  10% |###                                 | ETA:  0:00:27
Adding changed files:  10% |###                                 | ETA:  0:00:27
Adding changed files:  11% |###                                 | ETA:  0:00:27
Adding changed files:  11% |####                                | ETA:  0:00:27
Adding changed files:  11% |####                                | ETA:  0:00:27
Adding changed files:  12% |####                                | ETA:  0:00:27
Adding changed files:  12% |####                                | ETA:  0:00:27
Adding changed files:  12% |####                                | ETA:  0:00:26
Adding changed files:  13% |####                                | ETA:  0:00:26
Adding changed files:  13% |####                                | ETA:  0:00:26
Adding changed files:  13% |####                                | ETA:  0:00:26
Adding changed files:  14% |#####                               | ETA:  0:00:26
Adding changed files:  14% |#####                               | ETA:  0:00:26
Adding changed files:  14% |#####                               | ETA:  0:00:25
Adding changed files:  15% |#####                               | ETA:  0:00:25
Adding changed files:  15% |#####                               | ETA:  0:00:25
Adding changed files:  15% |#####                               | ETA:  0:00:25
Adding changed files:  16% |#####                               | ETA:  0:00:25
Adding changed files:  16% |#####                               | ETA:  0:00:25
Adding changed files:  16% |######                              | ETA:  0:00:24
Adding changed files:  17% |######                              | ETA:  0:00:24
Adding changed files:  17% |######                              | ETA:  0:00:24
Adding changed files:  18% |######                              | ETA:  0:00:24
Adding changed files:  18% |######                              | ETA:  0:00:24
Adding changed files:  18% |######                              | ETA:  0:00:24
Adding changed files:  19% |######                              | ETA:  0:00:24
Adding changed files:  19% |######                              | ETA:  0:00:24
Adding changed files:  19% |#######                             | ETA:  0:00:23
Adding changed files:  20% |#######                             | ETA:  0:00:23
Adding changed files:  20% |#######                             | ETA:  0:00:23
Adding changed files:  20% |#######                             | ETA:  0:00:23
Adding changed files:  21% |#######                             | ETA:  0:00:23
Adding changed files:  21% |#######                             | ETA:  0:00:23
Adding changed files:  21% |#######                             | ETA:  0:00:23
Adding changed files:  22% |#######                             | ETA:  0:00:22
Adding changed files:  22% |########                            | ETA:  0:00:22
Adding changed files:  22% |########                            | ETA:  0:00:22
Adding changed files:  23% |########                            | ETA:  0:00:22
Adding changed files:  23% |########                            | ETA:  0:00:22
Adding changed files:  23% |########                            | ETA:  0:00:22
Adding changed files:  24% |########                            | ETA:  0:00:22
Adding changed files:  24% |########                            | ETA:  0:00:21
Adding changed files:  24% |########                            | ETA:  0:00:21
Adding changed files:  25% |#########                           | ETA:  0:00:21
Adding changed files:  25% |#########                           | ETA:  0:00:21
Adding changed files:  26% |#########                           | ETA:  0:00:21
Adding changed files:  26% |#########                           | ETA:  0:00:21
Adding changed files:  26% |#########                           | ETA:  0:00:21
Adding changed files:  27% |#########                           | ETA:  0:00:21
Adding changed files:  27% |#########                           | ETA:  0:00:20
Adding changed files:  27% |#########                           | ETA:  0:00:20
Adding changed files:  28% |##########                          | ETA:  0:00:20
Adding changed files:  28% |##########                          | ETA:  0:00:20
Adding changed files:  28% |##########                          | ETA:  0:00:20
Adding changed files:  29% |##########                          | ETA:  0:00:20
Adding changed files:  29% |##########                          | ETA:  0:00:20
Adding changed files:  29% |##########                          | ETA:  0:00:19
Adding changed files:  30% |##########                          | ETA:  0:00:19
Adding changed files:  30% |##########                          | ETA:  0:00:19
Adding changed files:  30% |###########                         | ETA:  0:00:19
Adding changed files:  31% |###########                         | ETA:  0:00:19
Adding changed files:  31% |###########                         | ETA:  0:00:19
Adding changed files:  31% |###########                         | ETA:  0:00:18
Adding changed files:  32% |###########                         | ETA:  0:00:18
Adding changed files:  32% |###########                         | ETA:  0:00:18
Adding changed files:  32% |###########                         | ETA:  0:00:18
Adding changed files:  33% |###########                         | ETA:  0:00:18
Adding changed files:  33% |############                        | ETA:  0:00:18
Adding changed files:  33% |############                        | ETA:  0:00:18
Adding changed files:  34% |############                        | ETA:  0:00:18
Adding changed files:  34% |############                        | ETA:  0:00:17
Adding changed files:  35% |############                        | ETA:  0:00:17
Adding changed files:  35% |############                        | ETA:  0:00:17
Adding changed files:  35% |############                        | ETA:  0:00:17
Adding changed files:  36% |############                        | ETA:  0:00:17
Adding changed files:  36% |#############                       | ETA:  0:00:17
Adding changed files:  36% |#############                       | ETA:  0:00:17
Adding changed files:  37% |#############                       | ETA:  0:00:17
Adding changed files:  37% |#############                       | ETA:  0:00:17
Adding changed files:  37% |#############                       | ETA:  0:00:16
Adding changed files:  38% |#############                       | ETA:  0:00:16
Adding changed files:  38% |#############                       | ETA:  0:00:16
Adding changed files:  38% |#############                       | ETA:  0:00:16
Adding changed files:  39% |##############                      | ETA:  0:00:16
Adding changed files:  39% |##############                      | ETA:  0:00:16
Adding changed files:  39% |##############                      | ETA:  0:00:16
Adding changed files:  40% |##############                      | ETA:  0:00:16
Adding changed files:  40% |##############                      | ETA:  0:00:16
Adding changed files:  40% |##############                      | ETA:  0:00:15
Adding changed files:  41% |##############                      | ETA:  0:00:15
Adding changed files:  41% |##############                      | ETA:  0:00:15
Adding changed files:  41% |###############                     | ETA:  0:00:15
Adding changed files:  42% |###############                     | ETA:  0:00:15
Adding changed files:  42% |###############                     | ETA:  0:00:15
Adding changed files:  43% |###############                     | ETA:  0:00:15
Adding changed files:  43% |###############                     | ETA:  0:00:15
Adding changed files:  43% |###############                     | ETA:  0:00:15
Adding changed files:  44% |###############                     | ETA:  0:00:14
Adding changed files:  44% |###############                     | ETA:  0:00:14
Adding changed files:  44% |################                    | ETA:  0:00:14
Adding changed files:  45% |################                    | ETA:  0:00:14
Adding changed files:  45% |################                    | ETA:  0:00:14
Adding changed files:  45% |################                    | ETA:  0:00:14
Adding changed files:  46% |################                    | ETA:  0:00:14
Adding changed files:  46% |################                    | ETA:  0:00:14
Adding changed files:  46% |################                    | ETA:  0:00:14
Adding changed files:  47% |################                    | ETA:  0:00:13
Adding changed files:  47% |#################                   | ETA:  0:00:13
Adding changed files:  47% |#################                   | ETA:  0:00:13
Adding changed files:  48% |#################                   | ETA:  0:00:13
Adding changed files:  48% |#################                   | ETA:  0:00:13
Adding changed files:  48% |#################                   | ETA:  0:00:13
Adding changed files:  49% |#################                   | ETA:  0:00:13
Adding changed files:  49% |#################                   | ETA:  0:00:13
Adding changed files:  49% |#################                   | ETA:  0:00:13
Adding changed files:  50% |##################                  | ETA:  0:00:13
Adding changed files:  50% |##################                  | ETA:  0:00:12
Adding changed files:  50% |##################                  | ETA:  0:00:12
Adding changed files:  51% |##################                  | ETA:  0:00:12
Adding changed files:  51% |##################                  | ETA:  0:00:12
Adding changed files:  52% |##################                  | ETA:  0:00:12
Adding changed files:  52% |##################                  | ETA:  0:00:12
Adding changed files:  52% |##################                  | ETA:  0:00:12
Adding changed files:  53% |###################                 | ETA:  0:00:12
Adding changed files:  53% |###################                 | ETA:  0:00:12
Adding changed files:  53% |###################                 | ETA:  0:00:12
Adding changed files:  54% |###################                 | ETA:  0:00:11
Adding changed files:  54% |###################                 | ETA:  0:00:11
Adding changed files:  54% |###################                 | ETA:  0:00:11
Adding changed files:  55% |###################                 | ETA:  0:00:11
Adding changed files:  55% |###################                 | ETA:  0:00:11
Adding changed files:  55% |####################                | ETA:  0:00:11
Adding changed files:  56% |####################                | ETA:  0:00:11
Adding changed files:  56% |####################                | ETA:  0:00:11
Adding changed files:  56% |####################                | ETA:  0:00:11
Adding changed files:  57% |####################                | ETA:  0:00:10
Adding changed files:  57% |####################                | ETA:  0:00:10
Adding changed files:  57% |####################                | ETA:  0:00:10
Adding changed files:  58% |####################                | ETA:  0:00:10
Adding changed files:  58% |#####################               | ETA:  0:00:10
Adding changed files:  58% |#####################               | ETA:  0:00:10
Adding changed files:  59% |#####################               | ETA:  0:00:10
Adding changed files:  59% |#####################               | ETA:  0:00:10
Adding changed files:  60% |#####################               | ETA:  0:00:10
Adding changed files:  60% |#####################               | ETA:  0:00:10
Adding changed files:  60% |#####################               | ETA:  0:00:09
Adding changed files:  61% |#####################               | ETA:  0:00:09
Adding changed files:  61% |######################              | ETA:  0:00:09
Adding changed files:  61% |######################              | ETA:  0:00:09
Adding changed files:  62% |######################              | ETA:  0:00:09
Adding changed files:  62% |######################              | ETA:  0:00:09
Adding changed files:  62% |######################              | ETA:  0:00:09
Adding changed files:  63% |######################              | ETA:  0:00:09
Adding changed files:  63% |######################              | ETA:  0:00:09
Adding changed files:  63% |######################              | ETA:  0:00:09
Adding changed files:  64% |#######################             | ETA:  0:00:09
Adding changed files:  64% |#######################             | ETA:  0:00:08
Adding changed files:  64% |#######################             | ETA:  0:00:08
Adding changed files:  65% |#######################             | ETA:  0:00:08
Adding changed files:  65% |#######################             | ETA:  0:00:08
Adding changed files:  65% |#######################             | ETA:  0:00:08
Adding changed files:  66% |#######################             | ETA:  0:00:08
Adding changed files:  66% |#######################             | ETA:  0:00:08
Adding changed files:  66% |########################            | ETA:  0:00:08
Adding changed files:  67% |########################            | ETA:  0:00:08
Adding changed files:  67% |########################            | ETA:  0:00:08
Adding changed files:  67% |########################            | ETA:  0:00:07
Adding changed files:  68% |########################            | ETA:  0:00:07
Adding changed files:  68% |########################            | ETA:  0:00:07
Adding changed files:  69% |########################            | ETA:  0:00:07
Adding changed files:  69% |########################            | ETA:  0:00:07
Adding changed files:  69% |#########################           | ETA:  0:00:07
Adding changed files:  70% |#########################           | ETA:  0:00:07
Adding changed files:  70% |#########################           | ETA:  0:00:07
Adding changed files:  70% |#########################           | ETA:  0:00:07
Adding changed files:  71% |#########################           | ETA:  0:00:07
Adding changed files:  71% |#########################           | ETA:  0:00:07
Adding changed files:  71% |#########################           | ETA:  0:00:06
Adding changed files:  72% |#########################           | ETA:  0:00:06
Adding changed files:  72% |##########################          | ETA:  0:00:06
Adding changed files:  72% |##########################          | ETA:  0:00:06
Adding changed files:  73% |##########################          | ETA:  0:00:06
Adding changed files:  73% |##########################          | ETA:  0:00:06
Adding changed files:  73% |##########################          | ETA:  0:00:06
Adding changed files:  74% |##########################          | ETA:  0:00:06
Adding changed files:  74% |##########################          | ETA:  0:00:06
Adding changed files:  74% |##########################          | ETA:  0:00:06
Adding changed files:  75% |###########################         | ETA:  0:00:06
Adding changed files:  75% |###########################         | ETA:  0:00:05
Adding changed files:  75% |###########################         | ETA:  0:00:05
Adding changed files:  76% |###########################         | ETA:  0:00:05
Adding changed files:  76% |###########################         | ETA:  0:00:05
Adding changed files:  77% |###########################         | ETA:  0:00:05
Adding changed files:  77% |###########################         | ETA:  0:00:05
Adding changed files:  77% |###########################         | ETA:  0:00:05
Adding changed files:  78% |############################        | ETA:  0:00:05
Adding changed files:  78% |############################        | ETA:  0:00:05
Adding changed files:  78% |############################        | ETA:  0:00:05
Adding changed files:  79% |############################        | ETA:  0:00:05
Adding changed files:  79% |############################        | ETA:  0:00:04
Adding changed files:  79% |############################        | ETA:  0:00:04
Adding changed files:  80% |############################        | ETA:  0:00:04
Adding changed files:  80% |############################        | ETA:  0:00:04
Adding changed files:  80% |#############################       | ETA:  0:00:04
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  82% |#############################       | ETA:  0:00:04
Adding changed files:  82% |#############################       | ETA:  0:00:04
Adding changed files:  82% |#############################       | ETA:  0:00:04
Adding changed files:  83% |#############################       | ETA:  0:00:03
Adding changed files:  83% |##############################      | ETA:  0:00:03
Adding changed files:  83% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:03
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  86% |##############################      | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  87% |###############################     | ETA:  0:00:03
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  91% |################################    | ETA:  0:00:02
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:22

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching crate://crates.io/cargo-c/0.10.14+cargo-0.89.0;name=cargo-c...
INFO: Rebasing devtool onto 7e6a7c3c49d94aaa6bd4e9e4a0f8c0072c44a186
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 610, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 509, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/cargo-c/bitbake/cargo-c-0.10.13+cargo-0.88.0/LICENSE'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5990302175851741365==--

