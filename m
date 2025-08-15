Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB03FCA0EEA
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.11408.1755263219321706482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZdDlvpWg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XuTWBhY7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010198add7321c-9f76aa2c-5fd5-43e2-927e-0c820acad600-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZXirrNPYzQgWAV7LSzkroz9kASYcXCHgwzAPxxqvtxE=;
	b=ZdDlvpWgVbHExcCAFwg4ZLGtlST8YawAbRyDWZfOx8PEFl60u7Y/0ucMtC6W/dGA
	NPgI2Q+U3LFv9LSflQB5CZGfUW3bw1Mz+jqbuDjF1p7xDaSWxKZyA288PMa6TfIFsqS
	7GCY+t6AnQj83Oc8ODKwMLCca4Iv7O1G26pR/5Kw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZXirrNPYzQgWAV7LSzkroz9kASYcXCHgwzAPxxqvtxE=;
	b=XuTWBhY7WvM2HDUiSZbh6PJYqnaix64KK7G55g1RGPbMU+DxSuaKg+njlx7akSRB
	MXy4K61l3hvX8K72lYBaRle2xPP3U0R4SHdfXUEjCeOLah12QT26FF80M3lLNqquFih
	tc4UGvj0czNZdPumqLiT3UIsHVEUTClhI2SRB+QM=
Content-Type: multipart/mixed; boundary="===============7789805700533919940=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs,rust-llvm,cargo,rust: upgrading to
 1.89.0,1.89.0,1.89.0,1.89.0 FAILED
Message-ID: <01010198add7321c-9f76aa2c-5fd5-43e2-927e-0c820acad600-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:06:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221889

--===============7789805700533919940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libstd-rs,rust-llvm,cargo,rust* to *1.89.0,1.89.0,1.89.0,1.89.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libstd-rs -V 1.89.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-bdd678bdcd3dd2807ee158b7ca6e58337ca3f70e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bdd678bdcd3dd2807ee158b7ca6e58337ca3f70e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1942 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-bdd678bdcd3dd2807ee158b7ca6e58337ca3f70e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bdd678bdcd3dd2807ee158b7ca6e58337ca3f70e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:11:26
Adding changed files:   0% |                                    | ETA:  0:08:30
Adding changed files:   0% |                                    | ETA:  0:07:31
Adding changed files:   0% |                                    | ETA:  0:07:06
Adding changed files:   0% |                                    | ETA:  0:06:48
Adding changed files:   0% |                                    | ETA:  0:06:36
Adding changed files:   0% |                                    | ETA:  0:06:20
Adding changed files:   0% |                                    | ETA:  0:06:11
Adding changed files:   0% |                                    | ETA:  0:06:02
Adding changed files:   0% |                                    | ETA:  0:05:54
Adding changed files:   1% |                                    | ETA:  0:05:49
Adding changed files:   1% |                                    | ETA:  0:05:44
Adding changed files:   1% |                                    | ETA:  0:05:39
Adding changed files:   1% |                                    | ETA:  0:05:34
Adding changed files:   1% |                                    | ETA:  0:05:31
Adding changed files:   1% |                                    | ETA:  0:05:27
Adding changed files:   1% |                                    | ETA:  0:05:24
Adding changed files:   1% |                                    | ETA:  0:05:21
Adding changed files:   1% |                                    | ETA:  0:05:18
Adding changed files:   1% |                                    | ETA:  0:05:16
Adding changed files:   2% |                                    | ETA:  0:05:15
Adding changed files:   2% |                                    | ETA:  0:05:14
Adding changed files:   2% |                                    | ETA:  0:05:13
Adding changed files:   2% |                                    | ETA:  0:05:12
Adding changed files:   2% |                                    | ETA:  0:05:10
Adding changed files:   2% |                                    | ETA:  0:05:10
Adding changed files:   2% |                                    | ETA:  0:05:08
Adding changed files:   2% |                                    | ETA:  0:05:07
Adding changed files:   2% |#                                   | ETA:  0:05:07
Adding changed files:   2% |#                                   | ETA:  0:05:06
Adding changed files:   3% |#                                   | ETA:  0:05:04
Adding changed files:   3% |#                                   | ETA:  0:05:03
Adding changed files:   3% |#                                   | ETA:  0:05:02
Adding changed files:   3% |#                                   | ETA:  0:05:02
Adding changed files:   3% |#                                   | ETA:  0:05:01
Adding changed files:   3% |#                                   | ETA:  0:05:00
Adding changed files:   3% |#                                   | ETA:  0:04:59
Adding changed files:   3% |#                                   | ETA:  0:04:58
Adding changed files:   3% |#                                   | ETA:  0:04:57
Adding changed files:   3% |#                                   | ETA:  0:04:56
Adding changed files:   4% |#                                   | ETA:  0:04:56
Adding changed files:   4% |#                                   | ETA:  0:04:55
Adding changed files:   4% |#                                   | ETA:  0:04:54
Adding changed files:   4% |#                                   | ETA:  0:04:54
Adding changed files:   4% |#                                   | ETA:  0:04:53
Adding changed files:   4% |#                                   | ETA:  0:04:52
Adding changed files:   4% |#                                   | ETA:  0:04:52
Adding changed files:   4% |#                                   | ETA:  0:04:51
Adding changed files:   4% |#                                   | ETA:  0:04:51
Adding changed files:   4% |#                                   | ETA:  0:04:50
Adding changed files:   4% |#                                   | ETA:  0:04:49
Adding changed files:   5% |#                                   | ETA:  0:04:49
Adding changed files:   5% |#                                   | ETA:  0:04:48
Adding changed files:   5% |#                                   | ETA:  0:04:48
Adding changed files:   5% |#                                   | ETA:  0:04:48
Adding changed files:   5% |#                                   | ETA:  0:04:47
Adding changed files:   5% |##                                  | ETA:  0:04:47
Adding changed files:   5% |##                                  | ETA:  0:04:46
Adding changed files:   5% |##                                  | ETA:  0:04:46
Adding changed files:   5% |##                                  | ETA:  0:04:45
Adding changed files:   5% |##                                  | ETA:  0:04:45
Adding changed files:   6% |##                                  | ETA:  0:04:44
Adding changed files:   6% |##                                  | ETA:  0:04:44
Adding changed files:   6% |##                                  | ETA:  0:04:43
Adding changed files:   6% |##                                  | ETA:  0:04:43
Adding changed files:   6% |##                                  | ETA:  0:04:42
Adding changed files:   6% |##                                  | ETA:  0:04:42
Adding changed files:   6% |##                                  | ETA:  0:04:41
Adding changed files:   6% |##                                  | ETA:  0:04:41
Adding changed files:   6% |##                                  | ETA:  0:04:41
Adding changed files:   6% |##                                  | ETA:  0:04:40
Adding changed files:   7% |##                                  | ETA:  0:04:40
Adding changed files:   7% |##                                  | ETA:  0:04:39
Adding changed files:   7% |##                                  | ETA:  0:04:39
Adding changed files:   7% |##                                  | ETA:  0:04:38
Adding changed files:   7% |##                                  | ETA:  0:04:38
Adding changed files:   7% |##                                  | ETA:  0:04:37
Adding changed files:   7% |##                                  | ETA:  0:04:37
Adding changed files:   7% |##                                  | ETA:  0:04:37
Adding changed files:   7% |##                                  | ETA:  0:04:36
Adding changed files:   7% |##                                  | ETA:  0:04:36
Adding changed files:   8% |##                                  | ETA:  0:04:35
Adding changed files:   8% |##                                  | ETA:  0:04:35
Adding changed files:   8% |##                                  | ETA:  0:04:35
Adding changed files:   8% |##                                  | ETA:  0:04:34
Adding changed files:   8% |###                                 | ETA:  0:04:34
Adding changed files:   8% |###                                 | ETA:  0:04:34
Adding changed files:   8% |###                                 | ETA:  0:04:33
Adding changed files:   8% |###                                 | ETA:  0:04:33
Adding changed files:   8% |###                                 | ETA:  0:04:33
Adding changed files:   8% |###                                 | ETA:  0:04:32
Adding changed files:   8% |###                                 | ETA:  0:04:32
Adding changed files:   9% |###                                 | ETA:  0:04:32
Adding changed files:   9% |###                                 | ETA:  0:04:32
Adding changed files:   9% |###                                 | ETA:  0:04:31
Adding changed files:   9% |###                                 | ETA:  0:04:31
Adding changed files:   9% |###                                 | ETA:  0:04:30
Adding changed files:   9% |###                                 | ETA:  0:04:30
Adding changed files:   9% |###                                 | ETA:  0:04:30
Adding changed files:   9% |###                                 | ETA:  0:04:29
Adding changed files:   9% |###                                 | ETA:  0:04:29
Adding changed files:   9% |###                                 | ETA:  0:04:28
Adding changed files:  10% |###                                 | ETA:  0:04:28
Adding changed files:  10% |###                                 | ETA:  0:04:28
Adding changed files:  10% |###                                 | ETA:  0:04:27
Adding changed files:  10% |###                                 | ETA:  0:04:27
Adding changed files:  10% |###                                 | ETA:  0:04:27
Adding changed files:  10% |###                                 | ETA:  0:04:26
Adding changed files:  10% |###                                 | ETA:  0:04:26
Adding changed files:  10% |###                                 | ETA:  0:04:26
Adding changed files:  10% |###                                 | ETA:  0:04:25
Adding changed files:  10% |###                                 | ETA:  0:04:25
Adding changed files:  11% |###                                 | ETA:  0:04:24
Adding changed files:  11% |####                                | ETA:  0:04:24
Adding changed files:  11% |####                                | ETA:  0:04:24
Adding changed files:  11% |####                                | ETA:  0:04:24
Adding changed files:  11% |####                                | ETA:  0:04:23
Adding changed files:  11% |####                                | ETA:  0:04:23
Adding changed files:  11% |####                                | ETA:  0:04:23
Adding changed files:  11% |####                                | ETA:  0:04:23
Adding changed files:  11% |####                                | ETA:  0:04:22
Adding changed files:  11% |####                                | ETA:  0:04:22
Adding changed files:  12% |####                                | ETA:  0:04:22
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  12% |####                                | ETA:  0:04:21
Adding changed files:  13% |####                                | ETA:  0:04:21
Adding changed files:  13% |####                                | ETA:  0:04:21
Adding changed files:  13% |####                                | ETA:  0:04:22
Adding changed files:  13% |####                                | ETA:  0:04:22
Adding changed files:  13% |####                                | ETA:  0:04:22
Adding changed files:  13% |####                                | ETA:  0:04:22
Adding changed files:  13% |####                                | ETA:  0:04:23
Adding changed files:  13% |####                                | ETA:  0:04:23
Adding changed files:  13% |####                                | ETA:  0:04:23
Adding changed files:  13% |#####                               | ETA:  0:04:23
Adding changed files:  14% |#####                               | ETA:  0:04:23
Adding changed files:  14% |#####                               | ETA:  0:04:23
Adding changed files:  14% |#####                               | ETA:  0:04:23
Adding changed files:  14% |#####                               | ETA:  0:04:24
Adding changed files:  14% |#####                               | ETA:  0:04:24
Adding changed files:  14% |#####                               | ETA:  0:04:24
Adding changed files:  14% |#####                               | ETA:  0:04:23
Adding changed files:  14% |#####                               | ETA:  0:04:23
Adding changed files:  14% |#####                               | ETA:  0:04:23
Adding changed files:  14% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  15% |#####                               | ETA:  0:04:23
Adding changed files:  16% |#####                               | ETA:  0:04:23
Adding changed files:  16% |#####                               | ETA:  0:04:23
Adding changed files:  16% |#####                               | ETA:  0:04:23
Adding changed files:  16% |#####                               | ETA:  0:04:22
Adding changed files:  16% |#####                               | ETA:  0:04:22
Adding changed files:  16% |#####                               | ETA:  0:04:22
Adding changed files:  16% |#####                               | ETA:  0:04:22
Adding changed files:  16% |######                              | ETA:  0:04:22
Adding changed files:  16% |######                              | ETA:  0:04:22
Adding changed files:  16% |######                              | ETA:  0:04:22
Adding changed files:  16% |######                              | ETA:  0:04:22
Adding changed files:  17% |######                              | ETA:  0:04:22
Adding changed files:  17% |######                              | ETA:  0:04:21
Adding changed files:  17% |######                              | ETA:  0:04:21
Adding changed files:  17% |######                              | ETA:  0:04:21
Adding changed files:  17% |######                              | ETA:  0:04:21
Adding changed files:  17% |######                              | ETA:  0:04:21
Adding changed files:  17% |######                              | ETA:  0:04:21
Adding changed files:  17% |######                              | ETA:  0:04:21
Adding changed files:  17% |######                              | ETA:  0:04:21
Adding changed files:  17% |######                              | ETA:  0:04:21
Adding changed files:  18% |######                              | ETA:  0:04:21
Adding changed files:  18% |######                              | ETA:  0:04:21
Adding changed files:  18% |######                              | ETA:  0:04:21
Adding changed files:  18% |######                              | ETA:  0:04:21
Adding changed files:  18% |######                              | ETA:  0:04:21
Adding changed files:  18% |######                              | ETA:  0:04:21
Adding changed files:  18% |######                              | ETA:  0:04:21
Adding changed files:  18% |######                              | ETA:  0:04:20
Adding changed files:  18% |######                              | ETA:  0:04:20
Adding changed files:  18% |######                              | ETA:  0:04:20
Adding changed files:  19% |######                              | ETA:  0:04:20
Adding changed files:  19% |######                              | ETA:  0:04:20
Adding changed files:  19% |######                              | ETA:  0:04:20
Adding changed files:  19% |######                              | ETA:  0:04:20
Adding changed files:  19% |######                              | ETA:  0:04:20
Adding changed files:  19% |#######                             | ETA:  0:04:20
Adding changed files:  19% |#######                             | ETA:  0:04:19
Adding changed files:  19% |#######                             | ETA:  0:04:19
Adding changed files:  19% |#######                             | ETA:  0:04:19
Adding changed files:  19% |#######                             | ETA:  0:04:19
Adding changed files:  20% |#######                             | ETA:  0:04:19
Adding changed files:  20% |#######                             | ETA:  0:04:19
Adding changed files:  20% |#######                             | ETA:  0:04:19
Adding changed files:  20% |#######                             | ETA:  0:04:19
Adding changed files:  20% |#######                             | ETA:  0:04:19
Adding changed files:  20% |#######                             | ETA:  0:04:19
Adding changed files:  20% |#######                             | ETA:  0:04:19
Adding changed files:  20% |#######                             | ETA:  0:04:18
Adding changed files:  20% |#######                             | ETA:  0:04:18
Adding changed files:  20% |#######                             | ETA:  0:04:18
Adding changed files:  20% |#######                             | ETA:  0:04:18
Adding changed files:  21% |#######                             | ETA:  0:04:17
Adding changed files:  21% |#######                             | ETA:  0:04:17
Adding changed files:  21% |#######                             | ETA:  0:04:17
Adding changed files:  21% |#######                             | ETA:  0:04:17
Adding changed files:  21% |#######                             | ETA:  0:04:16
Adding changed files:  21% |#######                             | ETA:  0:04:16
Adding changed files:  21% |#######                             | ETA:  0:04:16
Adding changed files:  21% |#######                             | ETA:  0:04:16
Adding changed files:  21% |#######                             | ETA:  0:04:16
Adding changed files:  21% |#######                             | ETA:  0:04:15
Adding changed files:  22% |#######                             | ETA:  0:04:15
Adding changed files:  22% |#######                             | ETA:  0:04:15
Adding changed files:  22% |########                            | ETA:  0:04:15
Adding changed files:  22% |########                            | ETA:  0:04:15
Adding changed files:  22% |########                            | ETA:  0:04:15
Adding changed files:  22% |########                            | ETA:  0:04:14
Adding changed files:  22% |########                            | ETA:  0:04:14
Adding changed files:  22% |########                            | ETA:  0:04:14
Adding changed files:  22% |########                            | ETA:  0:04:14
Adding changed files:  22% |########                            | ETA:  0:04:14
Adding changed files:  23% |########                            | ETA:  0:04:13
Adding changed files:  23% |########                            | ETA:  0:04:13
Adding changed files:  23% |########                            | ETA:  0:04:13
Adding changed files:  23% |########                            | ETA:  0:04:13
Adding changed files:  23% |########                            | ETA:  0:04:12
Adding changed files:  23% |########                            | ETA:  0:04:12
Adding changed files:  23% |########                            | ETA:  0:04:12
Adding changed files:  23% |########                            | ETA:  0:04:11
Adding changed files:  23% |########                            | ETA:  0:04:11
Adding changed files:  23% |########                            | ETA:  0:04:11
Adding changed files:  24% |########                            | ETA:  0:04:11
Adding changed files:  24% |########                            | ETA:  0:04:11
Adding changed files:  24% |########                            | ETA:  0:04:10
Adding changed files:  24% |########                            | ETA:  0:04:11
Adding changed files:  24% |########                            | ETA:  0:04:11
Adding changed files:  24% |########                            | ETA:  0:04:10
Adding changed files:  24% |########                            | ETA:  0:04:10
Adding changed files:  24% |########                            | ETA:  0:04:10
Adding changed files:  24% |########                            | ETA:  0:04:10
Adding changed files:  24% |########                            | ETA:  0:04:09
Adding changed files:  24% |########                            | ETA:  0:04:09
Adding changed files:  25% |#########                           | ETA:  0:04:09
Adding changed files:  25% |#########                           | ETA:  0:04:09
Adding changed files:  25% |#########                           | ETA:  0:04:08
Adding changed files:  25% |#########                           | ETA:  0:04:08
Adding changed files:  25% |#########                           | ETA:  0:04:08
Adding changed files:  25% |#########                           | ETA:  0:04:07
Adding changed files:  25% |#########                           | ETA:  0:04:07
Adding changed files:  25% |#########                           | ETA:  0:04:07
Adding changed files:  25% |#########                           | ETA:  0:04:06
Adding changed files:  25% |#########                           | ETA:  0:04:06
Adding changed files:  26% |#########                           | ETA:  0:04:06
Adding changed files:  26% |#########                           | ETA:  0:04:05
Adding changed files:  26% |#########                           | ETA:  0:04:05
Adding changed files:  26% |#########                           | ETA:  0:04:05
Adding changed files:  26% |#########                           | ETA:  0:04:05
Adding changed files:  26% |#########                           | ETA:  0:04:04
Adding changed files:  26% |#########                           | ETA:  0:04:04
Adding changed files:  26% |#########                           | ETA:  0:04:04
Adding changed files:  26% |#########                           | ETA:  0:04:03
Adding changed files:  26% |#########                           | ETA:  0:04:03
Adding changed files:  27% |#########                           | ETA:  0:04:03
Adding changed files:  27% |#########                           | ETA:  0:04:02
Adding changed files:  27% |#########                           | ETA:  0:04:02
Adding changed files:  27% |#########                           | ETA:  0:04:02
Adding changed files:  27% |#########                           | ETA:  0:04:02
Adding changed files:  27% |#########                           | ETA:  0:04:02
Adding changed files:  27% |#########                           | ETA:  0:04:01
Adding changed files:  27% |#########                           | ETA:  0:04:01
Adding changed files:  27% |##########                          | ETA:  0:04:01
Adding changed files:  27% |##########                          | ETA:  0:04:00
Adding changed files:  28% |##########                          | ETA:  0:04:00
Adding changed files:  28% |##########                          | ETA:  0:04:00
Adding changed files:  28% |##########                          | ETA:  0:04:00
Adding changed files:  28% |##########                          | ETA:  0:04:00
Adding changed files:  28% |##########                          | ETA:  0:04:00
Adding changed files:  28% |##########                          | ETA:  0:04:00
Adding changed files:  28% |##########                          | ETA:  0:03:59
Adding changed files:  28% |##########                          | ETA:  0:03:59
Adding changed files:  28% |##########                          | ETA:  0:03:59
Adding changed files:  28% |##########                          | ETA:  0:03:59
Adding changed files:  28% |##########                          | ETA:  0:03:59
Adding changed files:  29% |##########                          | ETA:  0:03:58
Adding changed files:  29% |##########                          | ETA:  0:03:58
Adding changed files:  29% |##########                          | ETA:  0:03:58
Adding changed files:  29% |##########                          | ETA:  0:03:58
Adding changed files:  29% |##########                          | ETA:  0:03:57
Adding changed files:  29% |##########                          | ETA:  0:03:57
Adding changed files:  29% |##########                          | ETA:  0:03:57
Adding changed files:  29% |##########                          | ETA:  0:03:56
Adding changed files:  29% |##########                          | ETA:  0:03:56
Adding changed files:  29% |##########                          | ETA:  0:03:56
Adding changed files:  30% |##########                          | ETA:  0:03:55
Adding changed files:  30% |##########                          | ETA:  0:03:55
Adding changed files:  30% |##########                          | ETA:  0:03:55
Adding changed files:  30% |##########                          | ETA:  0:03:54
Adding changed files:  30% |##########                          | ETA:  0:03:54
Adding changed files:  30% |##########                          | ETA:  0:03:54
Adding changed files:  30% |###########                         | ETA:  0:03:53
Adding changed files:  30% |###########                         | ETA:  0:03:53
Adding changed files:  30% |###########                         | ETA:  0:03:53
Adding changed files:  30% |###########                         | ETA:  0:03:52
Adding changed files:  31% |###########                         | ETA:  0:03:52
Adding changed files:  31% |###########                         | ETA:  0:03:52
Adding changed files:  31% |###########                         | ETA:  0:03:52
Adding changed files:  31% |###########                         | ETA:  0:03:51
Adding changed files:  31% |###########                         | ETA:  0:03:51
Adding changed files:  31% |###########                         | ETA:  0:03:51
Adding changed files:  31% |###########                         | ETA:  0:03:50
Adding changed files:  31% |###########                         | ETA:  0:03:50
Adding changed files:  31% |###########                         | ETA:  0:03:50
Adding changed files:  31% |###########                         | ETA:  0:03:49
Adding changed files:  32% |###########                         | ETA:  0:03:49
Adding changed files:  32% |###########                         | ETA:  0:03:49
Adding changed files:  32% |###########                         | ETA:  0:03:48
Adding changed files:  32% |###########                         | ETA:  0:03:48
Adding changed files:  32% |###########                         | ETA:  0:03:48
Adding changed files:  32% |###########                         | ETA:  0:03:47
Adding changed files:  32% |###########                         | ETA:  0:03:47
Adding changed files:  32% |###########                         | ETA:  0:03:47
Adding changed files:  32% |###########                         | ETA:  0:03:46
Adding changed files:  32% |###########                         | ETA:  0:03:46
Adding changed files:  32% |###########                         | ETA:  0:03:46
Adding changed files:  33% |###########                         | ETA:  0:03:45
Adding changed files:  33% |###########                         | ETA:  0:03:45
Adding changed files:  33% |###########                         | ETA:  0:03:45
Adding changed files:  33% |############                        | ETA:  0:03:44
Adding changed files:  33% |############                        | ETA:  0:03:44
Adding changed files:  33% |############                        | ETA:  0:03:44
Adding changed files:  33% |############                        | ETA:  0:03:43
Adding changed files:  33% |############                        | ETA:  0:03:43
Adding changed files:  33% |############                        | ETA:  0:03:43
Adding changed files:  33% |############                        | ETA:  0:03:42
Adding changed files:  34% |############                        | ETA:  0:03:42
Adding changed files:  34% |############                        | ETA:  0:03:42
Adding changed files:  34% |############                        | ETA:  0:03:41
Adding changed files:  34% |############                        | ETA:  0:03:41
Adding changed files:  34% |############                        | ETA:  0:03:41
Adding changed files:  34% |############                        | ETA:  0:03:40
Adding changed files:  34% |############                        | ETA:  0:03:40
Adding changed files:  34% |############                        | ETA:  0:03:40
Adding changed files:  34% |############                        | ETA:  0:03:40
Adding changed files:  34% |############                        | ETA:  0:03:39
Adding changed files:  35% |############                        | ETA:  0:03:39
Adding changed files:  35% |############                        | ETA:  0:03:39
Adding changed files:  35% |############                        | ETA:  0:03:39
Adding changed files:  35% |############                        | ETA:  0:03:38
Adding changed files:  35% |############                        | ETA:  0:03:38
Adding changed files:  35% |############                        | ETA:  0:03:38
Adding changed files:  35% |############                        | ETA:  0:03:38
Adding changed files:  35% |############                        | ETA:  0:03:37
Adding changed files:  35% |############                        | ETA:  0:03:37
Adding changed files:  35% |############                        | ETA:  0:03:37
Adding changed files:  36% |############                        | ETA:  0:03:37
Adding changed files:  36% |############                        | ETA:  0:03:36
Adding changed files:  36% |#############                       | ETA:  0:03:36
Adding changed files:  36% |#############                       | ETA:  0:03:36
Adding changed files:  36% |#############                       | ETA:  0:03:36
Adding changed files:  36% |#############                       | ETA:  0:03:35
Adding changed files:  36% |#############                       | ETA:  0:03:35
Adding changed files:  36% |#############                       | ETA:  0:03:35
Adding changed files:  36% |#############                       | ETA:  0:03:35
Adding changed files:  36% |#############                       | ETA:  0:03:34
Adding changed files:  36% |#############                       | ETA:  0:03:34
Adding changed files:  37% |#############                       | ETA:  0:03:34
Adding changed files:  37% |#############                       | ETA:  0:03:33
Adding changed files:  37% |#############                       | ETA:  0:03:33
Adding changed files:  37% |#############                       | ETA:  0:03:33
Adding changed files:  37% |#############                       | ETA:  0:03:32
Adding changed files:  37% |#############                       | ETA:  0:03:32
Adding changed files:  37% |#############                       | ETA:  0:03:32
Adding changed files:  37% |#############                       | ETA:  0:03:32
Adding changed files:  37% |#############                       | ETA:  0:03:31
Adding changed files:  37% |#############                       | ETA:  0:03:31
Adding changed files:  38% |#############                       | ETA:  0:03:31
Adding changed files:  38% |#############                       | ETA:  0:03:30
Adding changed files:  38% |#############                       | ETA:  0:03:30
Adding changed files:  38% |#############                       | ETA:  0:03:30
Adding changed files:  38% |#############                       | ETA:  0:03:30
Adding changed files:  38% |#############                       | ETA:  0:03:29
Adding changed files:  38% |#############                       | ETA:  0:03:29
Adding changed files:  38% |#############                       | ETA:  0:03:29
Adding changed files:  38% |#############                       | ETA:  0:03:29
Adding changed files:  38% |##############                      | ETA:  0:03:28
Adding changed files:  39% |##############                      | ETA:  0:03:28
Adding changed files:  39% |##############                      | ETA:  0:03:28
Adding changed files:  39% |##############                      | ETA:  0:03:27
Adding changed files:  39% |##############                      | ETA:  0:03:27
Adding changed files:  39% |##############                      | ETA:  0:03:27
Adding changed files:  39% |##############                      | ETA:  0:03:27
Adding changed files:  39% |##############                      | ETA:  0:03:26
Adding changed files:  39% |##############                      | ETA:  0:03:26
Adding changed files:  39% |##############                      | ETA:  0:03:26
Adding changed files:  39% |##############                      | ETA:  0:03:25
Adding changed files:  40% |##############                      | ETA:  0:03:25
Adding changed files:  40% |##############                      | ETA:  0:03:25
Adding changed files:  40% |##############                      | ETA:  0:03:25
Adding changed files:  40% |##############                      | ETA:  0:03:24
Adding changed files:  40% |##############                      | ETA:  0:03:24
Adding changed files:  40% |##############                      | ETA:  0:03:24
Adding changed files:  40% |##############                      | ETA:  0:03:23
Adding changed files:  40% |##############                      | ETA:  0:03:23
Adding changed files:  40% |##############                      | ETA:  0:03:23
Adding changed files:  40% |##############                      | ETA:  0:03:22
Adding changed files:  40% |##############                      | ETA:  0:03:22
Adding changed files:  41% |##############                      | ETA:  0:03:22
Adding changed files:  41% |##############                      | ETA:  0:03:22
Adding changed files:  41% |##############                      | ETA:  0:03:21
Adding changed files:  41% |##############                      | ETA:  0:03:21
Adding changed files:  41% |##############                      | ETA:  0:03:21
Adding changed files:  41% |##############                      | ETA:  0:03:20
Adding changed files:  41% |##############                      | ETA:  0:03:20
Adding changed files:  41% |###############                     | ETA:  0:03:20
Adding changed files:  41% |###############                     | ETA:  0:03:20
Adding changed files:  41% |###############                     | ETA:  0:03:19
Adding changed files:  42% |###############                     | ETA:  0:03:19
Adding changed files:  42% |###############                     | ETA:  0:03:19
Adding changed files:  42% |###############                     | ETA:  0:03:19
Adding changed files:  42% |###############                     | ETA:  0:03:18
Adding changed files:  42% |###############                     | ETA:  0:03:18
Adding changed files:  42% |###############                     | ETA:  0:03:18
Adding changed files:  42% |###############                     | ETA:  0:03:18
Adding changed files:  42% |###############                     | ETA:  0:03:17
Adding changed files:  42% |###############                     | ETA:  0:03:17
Adding changed files:  42% |###############                     | ETA:  0:03:17
Adding changed files:  43% |###############                     | ETA:  0:03:16
Adding changed files:  43% |###############                     | ETA:  0:03:16
Adding changed files:  43% |###############                     | ETA:  0:03:16
Adding changed files:  43% |###############                     | ETA:  0:03:15
Adding changed files:  43% |###############                     | ETA:  0:03:15
Adding changed files:  43% |###############                     | ETA:  0:03:15
Adding changed files:  43% |###############                     | ETA:  0:03:14
Adding changed files:  43% |###############                     | ETA:  0:03:14
Adding changed files:  43% |###############                     | ETA:  0:03:14
Adding changed files:  43% |###############                     | ETA:  0:03:13
Adding changed files:  44% |###############                     | ETA:  0:03:13
Adding changed files:  44% |###############                     | ETA:  0:03:13
Adding changed files:  44% |###############                     | ETA:  0:03:12
Adding changed files:  44% |###############                     | ETA:  0:03:12
Adding changed files:  44% |###############                     | ETA:  0:03:12
Adding changed files:  44% |################                    | ETA:  0:03:11
Adding changed files:  44% |################                    | ETA:  0:03:11
Adding changed files:  44% |################                    | ETA:  0:03:11
Adding changed files:  44% |################                    | ETA:  0:03:11
Adding changed files:  44% |################                    | ETA:  0:03:10
Adding changed files:  44% |################                    | ETA:  0:03:10
Adding changed files:  45% |################                    | ETA:  0:03:10
Adding changed files:  45% |################                    | ETA:  0:03:09
Adding changed files:  45% |################                    | ETA:  0:03:09
Adding changed files:  45% |################                    | ETA:  0:03:09
Adding changed files:  45% |################                    | ETA:  0:03:08
Adding changed files:  45% |################                    | ETA:  0:03:08
Adding changed files:  45% |################                    | ETA:  0:03:08
Adding changed files:  45% |################                    | ETA:  0:03:07
Adding changed files:  45% |################                    | ETA:  0:03:07
Adding changed files:  45% |################                    | ETA:  0:03:07
Adding changed files:  46% |################                    | ETA:  0:03:06
Adding changed files:  46% |################                    | ETA:  0:03:06
Adding changed files:  46% |################                    | ETA:  0:03:06
Adding changed files:  46% |################                    | ETA:  0:03:06
Adding changed files:  46% |################                    | ETA:  0:03:05
Adding changed files:  46% |################                    | ETA:  0:03:05
Adding changed files:  46% |################                    | ETA:  0:03:05
Adding changed files:  46% |################                    | ETA:  0:03:04
Adding changed files:  46% |################                    | ETA:  0:03:04
Adding changed files:  46% |################                    | ETA:  0:03:03
Adding changed files:  47% |################                    | ETA:  0:03:03
Adding changed files:  47% |################                    | ETA:  0:03:03
Adding changed files:  47% |#################                   | ETA:  0:03:02
Adding changed files:  47% |#################                   | ETA:  0:03:02
Adding changed files:  47% |#################                   | ETA:  0:03:02
Adding changed files:  47% |#################                   | ETA:  0:03:01
Adding changed files:  47% |#################                   | ETA:  0:03:01
Adding changed files:  47% |#################                   | ETA:  0:03:01
Adding changed files:  47% |#################                   | ETA:  0:03:00
Adding changed files:  47% |#################                   | ETA:  0:03:00
Adding changed files:  48% |#################                   | ETA:  0:03:00
Adding changed files:  48% |#################                   | ETA:  0:02:59
Adding changed files:  48% |#################                   | ETA:  0:02:59
Adding changed files:  48% |#################                   | ETA:  0:02:58
Adding changed files:  48% |#################                   | ETA:  0:02:58
Adding changed files:  48% |#################                   | ETA:  0:02:58
Adding changed files:  48% |#################                   | ETA:  0:02:57
Adding changed files:  48% |#################                   | ETA:  0:02:57
Adding changed files:  48% |#################                   | ETA:  0:02:57
Adding changed files:  48% |#################                   | ETA:  0:02:56
Adding changed files:  48% |#################                   | ETA:  0:02:56
Adding changed files:  49% |#################                   | ETA:  0:02:56
Adding changed files:  49% |#################                   | ETA:  0:02:55
Adding changed files:  49% |#################                   | ETA:  0:02:55
Adding changed files:  49% |#################                   | ETA:  0:02:55
Adding changed files:  49% |#################                   | ETA:  0:02:54
Adding changed files:  49% |#################                   | ETA:  0:02:54
Adding changed files:  49% |#################                   | ETA:  0:02:54
Adding changed files:  49% |#################                   | ETA:  0:02:53
Adding changed files:  49% |#################                   | ETA:  0:02:53
Adding changed files:  49% |#################                   | ETA:  0:02:52
Adding changed files:  50% |##################                  | ETA:  0:02:52
Adding changed files:  50% |##################                  | ETA:  0:02:52
Adding changed files:  50% |##################                  | ETA:  0:02:51
Adding changed files:  50% |##################                  | ETA:  0:02:51
Adding changed files:  50% |##################                  | ETA:  0:02:51
Adding changed files:  50% |##################                  | ETA:  0:02:50
Adding changed files:  50% |##################                  | ETA:  0:02:50
Adding changed files:  50% |##################                  | ETA:  0:02:50
Adding changed files:  50% |##################                  | ETA:  0:02:49
Adding changed files:  50% |##################                  | ETA:  0:02:49
Adding changed files:  51% |##################                  | ETA:  0:02:49
Adding changed files:  51% |##################                  | ETA:  0:02:48
Adding changed files:  51% |##################                  | ETA:  0:02:48
Adding changed files:  51% |##################                  | ETA:  0:02:48
Adding changed files:  51% |##################                  | ETA:  0:02:47
Adding changed files:  51% |##################                  | ETA:  0:02:47
Adding changed files:  51% |##################                  | ETA:  0:02:46
Adding changed files:  51% |##################                  | ETA:  0:02:46
Adding changed files:  51% |##################                  | ETA:  0:02:46
Adding changed files:  51% |##################                  | ETA:  0:02:45
Adding changed files:  52% |##################                  | ETA:  0:02:45
Adding changed files:  52% |##################                  | ETA:  0:02:45
Adding changed files:  52% |##################                  | ETA:  0:02:44
Adding changed files:  52% |##################                  | ETA:  0:02:44
Adding changed files:  52% |##################                  | ETA:  0:02:44
Adding changed files:  52% |##################                  | ETA:  0:02:43
Adding changed files:  52% |##################                  | ETA:  0:02:43
Adding changed files:  52% |##################                  | ETA:  0:02:42
Adding changed files:  52% |###################                 | ETA:  0:02:42
Adding changed files:  52% |###################                 | ETA:  0:02:42
Adding changed files:  52% |###################                 | ETA:  0:02:41
Adding changed files:  53% |###################                 | ETA:  0:02:41
Adding changed files:  53% |###################                 | ETA:  0:02:41
Adding changed files:  53% |###################                 | ETA:  0:02:40
Adding changed files:  53% |###################                 | ETA:  0:02:40
Adding changed files:  53% |###################                 | ETA:  0:02:40
Adding changed files:  53% |###################                 | ETA:  0:02:39
Adding changed files:  53% |###################                 | ETA:  0:02:39
Adding changed files:  53% |###################                 | ETA:  0:02:39
Adding changed files:  53% |###################                 | ETA:  0:02:38
Adding changed files:  53% |###################                 | ETA:  0:02:38
Adding changed files:  54% |###################                 | ETA:  0:02:37
Adding changed files:  54% |###################                 | ETA:  0:02:37
Adding changed files:  54% |###################                 | ETA:  0:02:37
Adding changed files:  54% |###################                 | ETA:  0:02:36
Adding changed files:  54% |###################                 | ETA:  0:02:36
Adding changed files:  54% |###################                 | ETA:  0:02:36
Adding changed files:  54% |###################                 | ETA:  0:02:35
Adding changed files:  54% |###################                 | ETA:  0:02:35
Adding changed files:  54% |###################                 | ETA:  0:02:35
Adding changed files:  54% |###################                 | ETA:  0:02:34
Adding changed files:  55% |###################                 | ETA:  0:02:34
Adding changed files:  55% |###################                 | ETA:  0:02:34
Adding changed files:  55% |###################                 | ETA:  0:02:33
Adding changed files:  55% |###################                 | ETA:  0:02:33
Adding changed files:  55% |###################                 | ETA:  0:02:32
Adding changed files:  55% |###################                 | ETA:  0:02:32
Adding changed files:  55% |####################                | ETA:  0:02:32
Adding changed files:  55% |####################                | ETA:  0:02:31
Adding changed files:  55% |####################                | ETA:  0:02:31
Adding changed files:  55% |####################                | ETA:  0:02:31
Adding changed files:  56% |####################                | ETA:  0:02:30
Adding changed files:  56% |####################                | ETA:  0:02:30
Adding changed files:  56% |####################                | ETA:  0:02:30
Adding changed files:  56% |####################                | ETA:  0:02:29
Adding changed files:  56% |####################                | ETA:  0:02:29
Adding changed files:  56% |####################                | ETA:  0:02:29
Adding changed files:  56% |####################                | ETA:  0:02:28
Adding changed files:  56% |####################                | ETA:  0:02:28
Adding changed files:  56% |####################                | ETA:  0:02:28
Adding changed files:  56% |####################                | ETA:  0:02:27
Adding changed files:  56% |####################                | ETA:  0:02:27
Adding changed files:  57% |####################                | ETA:  0:02:27
Adding changed files:  57% |####################                | ETA:  0:02:26
Adding changed files:  57% |####################                | ETA:  0:02:26
Adding changed files:  57% |####################                | ETA:  0:02:26
Adding changed files:  57% |####################                | ETA:  0:02:25
Adding changed files:  57% |####################                | ETA:  0:02:25
Adding changed files:  57% |####################                | ETA:  0:02:25
Adding changed files:  57% |####################                | ETA:  0:02:25
Adding changed files:  57% |####################                | ETA:  0:02:24
Adding changed files:  57% |####################                | ETA:  0:02:24
Adding changed files:  58% |####################                | ETA:  0:02:24
Adding changed files:  58% |####################                | ETA:  0:02:23
Adding changed files:  58% |####################                | ETA:  0:02:23
Adding changed files:  58% |#####################               | ETA:  0:02:23
Adding changed files:  58% |#####################               | ETA:  0:02:22
Adding changed files:  58% |#####################               | ETA:  0:02:22
Adding changed files:  58% |#####################               | ETA:  0:02:22
Adding changed files:  58% |#####################               | ETA:  0:02:22
Adding changed files:  58% |#####################               | ETA:  0:02:21
Adding changed files:  58% |#####################               | ETA:  0:02:21
Adding changed files:  59% |#####################               | ETA:  0:02:21
Adding changed files:  59% |#####################               | ETA:  0:02:20
Adding changed files:  59% |#####################               | ETA:  0:02:20
Adding changed files:  59% |#####################               | ETA:  0:02:20
Adding changed files:  59% |#####################               | ETA:  0:02:20
Adding changed files:  59% |#####################               | ETA:  0:02:19
Adding changed files:  59% |#####################               | ETA:  0:02:19
Adding changed files:  59% |#####################               | ETA:  0:02:19
Adding changed files:  59% |#####################               | ETA:  0:02:18
Adding changed files:  59% |#####################               | ETA:  0:02:18
Adding changed files:  60% |#####################               | ETA:  0:02:18
Adding changed files:  60% |#####################               | ETA:  0:02:17
Adding changed files:  60% |#####################               | ETA:  0:02:17
Adding changed files:  60% |#####################               | ETA:  0:02:17
Adding changed files:  60% |#####################               | ETA:  0:02:17
Adding changed files:  60% |#####################               | ETA:  0:02:16
Adding changed files:  60% |#####################               | ETA:  0:02:16
Adding changed files:  60% |#####################               | ETA:  0:02:16
Adding changed files:  60% |#####################               | ETA:  0:02:15
Adding changed files:  60% |#####################               | ETA:  0:02:15
Adding changed files:  60% |#####################               | ETA:  0:02:15
Adding changed files:  61% |#####################               | ETA:  0:02:14
Adding changed files:  61% |######################              | ETA:  0:02:14
Adding changed files:  61% |######################              | ETA:  0:02:14
Adding changed files:  61% |######################              | ETA:  0:02:14
Adding changed files:  61% |######################              | ETA:  0:02:13
Adding changed files:  61% |######################              | ETA:  0:02:13
Adding changed files:  61% |######################              | ETA:  0:02:13
Adding changed files:  61% |######################              | ETA:  0:02:12
Adding changed files:  61% |######################              | ETA:  0:02:12
Adding changed files:  61% |######################              | ETA:  0:02:12
Adding changed files:  62% |######################              | ETA:  0:02:11
Adding changed files:  62% |######################              | ETA:  0:02:11
Adding changed files:  62% |######################              | ETA:  0:02:11
Adding changed files:  62% |######################              | ETA:  0:02:10
Adding changed files:  62% |######################              | ETA:  0:02:10
Adding changed files:  62% |######################              | ETA:  0:02:10
Adding changed files:  62% |######################              | ETA:  0:02:10
Adding changed files:  62% |######################              | ETA:  0:02:09
Adding changed files:  62% |######################              | ETA:  0:02:09
Adding changed files:  62% |######################              | ETA:  0:02:09
Adding changed files:  63% |######################              | ETA:  0:02:08
Adding changed files:  63% |######################              | ETA:  0:02:08
Adding changed files:  63% |######################              | ETA:  0:02:07
Adding changed files:  63% |######################              | ETA:  0:02:07
Adding changed files:  63% |######################              | ETA:  0:02:07
Adding changed files:  63% |######################              | ETA:  0:02:07
Adding changed files:  63% |######################              | ETA:  0:02:06
Adding changed files:  63% |######################              | ETA:  0:02:06
Adding changed files:  63% |######################              | ETA:  0:02:06
Adding changed files:  63% |#######################             | ETA:  0:02:05
Adding changed files:  64% |#######################             | ETA:  0:02:05
Adding changed files:  64% |#######################             | ETA:  0:02:05
Adding changed files:  64% |#######################             | ETA:  0:02:04
Adding changed files:  64% |#######################             | ETA:  0:02:04
Adding changed files:  64% |#######################             | ETA:  0:02:04
Adding changed files:  64% |#######################             | ETA:  0:02:03
Adding changed files:  64% |#######################             | ETA:  0:02:03
Adding changed files:  64% |#######################             | ETA:  0:02:03
Adding changed files:  64% |#######################             | ETA:  0:02:02
Adding changed files:  64% |#######################             | ETA:  0:02:02
Adding changed files:  64% |#######################             | ETA:  0:02:02
Adding changed files:  65% |#######################             | ETA:  0:02:01
Adding changed files:  65% |#######################             | ETA:  0:02:01
Adding changed files:  65% |#######################             | ETA:  0:02:01
Adding changed files:  65% |#######################             | ETA:  0:02:00
Adding changed files:  65% |#######################             | ETA:  0:02:00
Adding changed files:  65% |#######################             | ETA:  0:02:00
Adding changed files:  65% |#######################             | ETA:  0:01:59
Adding changed files:  65% |#######################             | ETA:  0:01:59
Adding changed files:  65% |#######################             | ETA:  0:01:59
Adding changed files:  65% |#######################             | ETA:  0:01:58
Adding changed files:  66% |#######################             | ETA:  0:01:58
Adding changed files:  66% |#######################             | ETA:  0:01:58
Adding changed files:  66% |#######################             | ETA:  0:01:57
Adding changed files:  66% |#######################             | ETA:  0:01:57
Adding changed files:  66% |#######################             | ETA:  0:01:57
Adding changed files:  66% |#######################             | ETA:  0:01:56
Adding changed files:  66% |#######################             | ETA:  0:01:56
Adding changed files:  66% |########################            | ETA:  0:01:56
Adding changed files:  66% |########################            | ETA:  0:01:56
Adding changed files:  66% |########################            | ETA:  0:01:55
Adding changed files:  67% |########################            | ETA:  0:01:55
Adding changed files:  67% |########################            | ETA:  0:01:55
Adding changed files:  67% |########################            | ETA:  0:01:54
Adding changed files:  67% |########################            | ETA:  0:01:54
Adding changed files:  67% |########################            | ETA:  0:01:54
Adding changed files:  67% |########################            | ETA:  0:01:53
Adding changed files:  67% |########################            | ETA:  0:01:53
Adding changed files:  67% |########################            | ETA:  0:01:53
Adding changed files:  67% |########################            | ETA:  0:01:52
Adding changed files:  67% |########################            | ETA:  0:01:52
Adding changed files:  68% |########################            | ETA:  0:01:52
Adding changed files:  68% |########################            | ETA:  0:01:51
Adding changed files:  68% |########################            | ETA:  0:01:51
Adding changed files:  68% |########################            | ETA:  0:01:51
Adding changed files:  68% |########################            | ETA:  0:01:50
Adding changed files:  68% |########################            | ETA:  0:01:50
Adding changed files:  68% |########################            | ETA:  0:01:50
Adding changed files:  68% |########################            | ETA:  0:01:50
Adding changed files:  68% |########################            | ETA:  0:01:49
Adding changed files:  68% |########################            | ETA:  0:01:49
Adding changed files:  68% |########################            | ETA:  0:01:49
Adding changed files:  69% |########################            | ETA:  0:01:48
Adding changed files:  69% |########################            | ETA:  0:01:48
Adding changed files:  69% |########################            | ETA:  0:01:48
Adding changed files:  69% |########################            | ETA:  0:01:47
Adding changed files:  69% |#########################           | ETA:  0:01:47
Adding changed files:  69% |#########################           | ETA:  0:01:47
Adding changed files:  69% |#########################           | ETA:  0:01:46
Adding changed files:  69% |#########################           | ETA:  0:01:46
Adding changed files:  69% |#########################           | ETA:  0:01:46
Adding changed files:  69% |#########################           | ETA:  0:01:45
Adding changed files:  70% |#########################           | ETA:  0:01:45
Adding changed files:  70% |#########################           | ETA:  0:01:45
Adding changed files:  70% |#########################           | ETA:  0:01:44
Adding changed files:  70% |#########################           | ETA:  0:01:44
Adding changed files:  70% |#########################           | ETA:  0:01:44
Adding changed files:  70% |#########################           | ETA:  0:01:43
Adding changed files:  70% |#########################           | ETA:  0:01:43
Adding changed files:  70% |#########################           | ETA:  0:01:43
Adding changed files:  70% |#########################           | ETA:  0:01:42
Adding changed files:  70% |#########################           | ETA:  0:01:42
Adding changed files:  71% |#########################           | ETA:  0:01:42
Adding changed files:  71% |#########################           | ETA:  0:01:41
Adding changed files:  71% |#########################           | ETA:  0:01:41
Adding changed files:  71% |#########################           | ETA:  0:01:41
Adding changed files:  71% |#########################           | ETA:  0:01:40
Adding changed files:  71% |#########################           | ETA:  0:01:40
Adding changed files:  71% |#########################           | ETA:  0:01:40
Adding changed files:  71% |#########################           | ETA:  0:01:39
Adding changed files:  71% |#########################           | ETA:  0:01:39
Adding changed files:  71% |#########################           | ETA:  0:01:39
Adding changed files:  72% |#########################           | ETA:  0:01:38
Adding changed files:  72% |#########################           | ETA:  0:01:38
Adding changed files:  72% |#########################           | ETA:  0:01:38
Adding changed files:  72% |##########################          | ETA:  0:01:37
Adding changed files:  72% |##########################          | ETA:  0:01:37
Adding changed files:  72% |##########################          | ETA:  0:01:37
Adding changed files:  72% |##########################          | ETA:  0:01:36
Adding changed files:  72% |##########################          | ETA:  0:01:36
Adding changed files:  72% |##########################          | ETA:  0:01:36
Adding changed files:  72% |##########################          | ETA:  0:01:35
Adding changed files:  72% |##########################          | ETA:  0:01:35
Adding changed files:  73% |##########################          | ETA:  0:01:35
Adding changed files:  73% |##########################          | ETA:  0:01:34
Adding changed files:  73% |##########################          | ETA:  0:01:34
Adding changed files:  73% |##########################          | ETA:  0:01:34
Adding changed files:  73% |##########################          | ETA:  0:01:33
Adding changed files:  73% |##########################          | ETA:  0:01:33
Adding changed files:  73% |##########################          | ETA:  0:01:33
Adding changed files:  73% |##########################          | ETA:  0:01:32
Adding changed files:  73% |##########################          | ETA:  0:01:32
Adding changed files:  73% |##########################          | ETA:  0:01:32
Adding changed files:  74% |##########################          | ETA:  0:01:31
Adding changed files:  74% |##########################          | ETA:  0:01:31
Adding changed files:  74% |##########################          | ETA:  0:01:31
Adding changed files:  74% |##########################          | ETA:  0:01:30
Adding changed files:  74% |##########################          | ETA:  0:01:30
Adding changed files:  74% |##########################          | ETA:  0:01:30
Adding changed files:  74% |##########################          | ETA:  0:01:29
Adding changed files:  74% |##########################          | ETA:  0:01:29
Adding changed files:  74% |##########################          | ETA:  0:01:29
Adding changed files:  74% |##########################          | ETA:  0:01:28
Adding changed files:  75% |###########################         | ETA:  0:01:28
Adding changed files:  75% |###########################         | ETA:  0:01:28
Adding changed files:  75% |###########################         | ETA:  0:01:27
Adding changed files:  75% |###########################         | ETA:  0:01:27
Adding changed files:  75% |###########################         | ETA:  0:01:27
Adding changed files:  75% |###########################         | ETA:  0:01:26
Adding changed files:  75% |###########################         | ETA:  0:01:26
Adding changed files:  75% |###########################         | ETA:  0:01:26
Adding changed files:  75% |###########################         | ETA:  0:01:25
Adding changed files:  75% |###########################         | ETA:  0:01:25
Adding changed files:  76% |###########################         | ETA:  0:01:25
Adding changed files:  76% |###########################         | ETA:  0:01:24
Adding changed files:  76% |###########################         | ETA:  0:01:24
Adding changed files:  76% |###########################         | ETA:  0:01:24
Adding changed files:  76% |###########################         | ETA:  0:01:23
Adding changed files:  76% |###########################         | ETA:  0:01:23
Adding changed files:  76% |###########################         | ETA:  0:01:23
Adding changed files:  76% |###########################         | ETA:  0:01:22
Adding changed files:  76% |###########################         | ETA:  0:01:22
Adding changed files:  76% |###########################         | ETA:  0:01:22
Adding changed files:  76% |###########################         | ETA:  0:01:21
Adding changed files:  77% |###########################         | ETA:  0:01:21
Adding changed files:  77% |###########################         | ETA:  0:01:21
Adding changed files:  77% |###########################         | ETA:  0:01:20
Adding changed files:  77% |###########################         | ETA:  0:01:20
Adding changed files:  77% |###########################         | ETA:  0:01:20
Adding changed files:  77% |###########################         | ETA:  0:01:19
Adding changed files:  77% |###########################         | ETA:  0:01:19
Adding changed files:  77% |###########################         | ETA:  0:01:19
Adding changed files:  77% |############################        | ETA:  0:01:18
Adding changed files:  77% |############################        | ETA:  0:01:18
Adding changed files:  78% |############################        | ETA:  0:01:18
Adding changed files:  78% |############################        | ETA:  0:01:17
Adding changed files:  78% |############################        | ETA:  0:01:17
Adding changed files:  78% |############################        | ETA:  0:01:17
Adding changed files:  78% |############################        | ETA:  0:01:16
Adding changed files:  78% |############################        | ETA:  0:01:16
Adding changed files:  78% |############################        | ETA:  0:01:16
Adding changed files:  78% |############################        | ETA:  0:01:15
Adding changed files:  78% |############################        | ETA:  0:01:15
Adding changed files:  78% |############################        | ETA:  0:01:14
Adding changed files:  79% |############################        | ETA:  0:01:14
Adding changed files:  79% |############################        | ETA:  0:01:14
Adding changed files:  79% |############################        | ETA:  0:01:13
Adding changed files:  79% |############################        | ETA:  0:01:13
Adding changed files:  79% |############################        | ETA:  0:01:13
Adding changed files:  79% |############################        | ETA:  0:01:12
Adding changed files:  79% |############################        | ETA:  0:01:12
Adding changed files:  79% |############################        | ETA:  0:01:12
Adding changed files:  79% |############################        | ETA:  0:01:11
Adding changed files:  79% |############################        | ETA:  0:01:11
Adding changed files:  80% |############################        | ETA:  0:01:11
Adding changed files:  80% |############################        | ETA:  0:01:10
Adding changed files:  80% |############################        | ETA:  0:01:10
Adding changed files:  80% |############################        | ETA:  0:01:10
Adding changed files:  80% |############################        | ETA:  0:01:09
Adding changed files:  80% |############################        | ETA:  0:01:09
Adding changed files:  80% |#############################       | ETA:  0:01:09
Adding changed files:  80% |#############################       | ETA:  0:01:08
Adding changed files:  80% |#############################       | ETA:  0:01:08
Adding changed files:  80% |#############################       | ETA:  0:01:07
Adding changed files:  80% |#############################       | ETA:  0:01:07
Adding changed files:  81% |#############################       | ETA:  0:01:07
Adding changed files:  81% |#############################       | ETA:  0:01:06
Adding changed files:  81% |#############################       | ETA:  0:01:06
Adding changed files:  81% |#############################       | ETA:  0:01:06
Adding changed files:  81% |#############################       | ETA:  0:01:05
Adding changed files:  81% |#############################       | ETA:  0:01:05
Adding changed files:  81% |#############################       | ETA:  0:01:05
Adding changed files:  81% |#############################       | ETA:  0:01:04
Adding changed files:  81% |#############################       | ETA:  0:01:04
Adding changed files:  81% |#############################       | ETA:  0:01:04
Adding changed files:  82% |#############################       | ETA:  0:01:03
Adding changed files:  82% |#############################       | ETA:  0:01:03
Adding changed files:  82% |#############################       | ETA:  0:01:03
Adding changed files:  82% |#############################       | ETA:  0:01:02
Adding changed files:  82% |#############################       | ETA:  0:01:02
Adding changed files:  82% |#############################       | ETA:  0:01:02
Adding changed files:  82% |#############################       | ETA:  0:01:01
Adding changed files:  82% |#############################       | ETA:  0:01:01
Adding changed files:  82% |#############################       | ETA:  0:01:01
Adding changed files:  82% |#############################       | ETA:  0:01:00
Adding changed files:  83% |#############################       | ETA:  0:01:00
Adding changed files:  83% |#############################       | ETA:  0:01:00
Adding changed files:  83% |#############################       | ETA:  0:00:59
Adding changed files:  83% |#############################       | ETA:  0:00:59
Adding changed files:  83% |##############################      | ETA:  0:00:59
Adding changed files:  83% |##############################      | ETA:  0:00:58
Adding changed files:  83% |##############################      | ETA:  0:00:58
Adding changed files:  83% |##############################      | ETA:  0:00:57
Adding changed files:  83% |##############################      | ETA:  0:00:57
Adding changed files:  83% |##############################      | ETA:  0:00:57
Adding changed files:  84% |##############################      | ETA:  0:00:56
Adding changed files:  84% |##############################      | ETA:  0:00:56
Adding changed files:  84% |##############################      | ETA:  0:00:56
Adding changed files:  84% |##############################      | ETA:  0:00:55
Adding changed files:  84% |##############################      | ETA:  0:00:55
Adding changed files:  84% |##############################      | ETA:  0:00:55
Adding changed files:  84% |##############################      | ETA:  0:00:54
Adding changed files:  84% |##############################      | ETA:  0:00:54
Adding changed files:  84% |##############################      | ETA:  0:00:54
Adding changed files:  84% |##############################      | ETA:  0:00:53
Adding changed files:  84% |##############################      | ETA:  0:00:53
Adding changed files:  85% |##############################      | ETA:  0:00:53
Adding changed files:  85% |##############################      | ETA:  0:00:52
Adding changed files:  85% |##############################      | ETA:  0:00:52
Adding changed files:  85% |##############################      | ETA:  0:00:52
Adding changed files:  85% |##############################      | ETA:  0:00:51
Adding changed files:  85% |##############################      | ETA:  0:00:51
Adding changed files:  85% |##############################      | ETA:  0:00:51
Adding changed files:  85% |##############################      | ETA:  0:00:50
Adding changed files:  85% |##############################      | ETA:  0:00:50
Adding changed files:  85% |##############################      | ETA:  0:00:50
Adding changed files:  86% |##############################      | ETA:  0:00:49
Adding changed files:  86% |###############################     | ETA:  0:00:49
Adding changed files:  86% |###############################     | ETA:  0:00:49
Adding changed files:  86% |###############################     | ETA:  0:00:48
Adding changed files:  86% |###############################     | ETA:  0:00:48
Adding changed files:  86% |###############################     | ETA:  0:00:48
Adding changed files:  86% |###############################     | ETA:  0:00:47
Adding changed files:  86% |###############################     | ETA:  0:00:47
Adding changed files:  86% |###############################     | ETA:  0:00:47
Adding changed files:  86% |###############################     | ETA:  0:00:46
Adding changed files:  87% |###############################     | ETA:  0:00:46
Adding changed files:  87% |###############################     | ETA:  0:00:46
Adding changed files:  87% |###############################     | ETA:  0:00:45
Adding changed files:  87% |###############################     | ETA:  0:00:45
Adding changed files:  87% |###############################     | ETA:  0:00:45
Adding changed files:  87% |###############################     | ETA:  0:00:44
Adding changed files:  87% |###############################     | ETA:  0:00:44
Adding changed files:  87% |###############################     | ETA:  0:00:43
Adding changed files:  87% |###############################     | ETA:  0:00:43
Adding changed files:  87% |###############################     | ETA:  0:00:43
Adding changed files:  88% |###############################     | ETA:  0:00:42
Adding changed files:  88% |###############################     | ETA:  0:00:42
Adding changed files:  88% |###############################     | ETA:  0:00:42
Adding changed files:  88% |###############################     | ETA:  0:00:41
Adding changed files:  88% |###############################     | ETA:  0:00:41
Adding changed files:  88% |###############################     | ETA:  0:00:41
Adding changed files:  88% |###############################     | ETA:  0:00:40
Adding changed files:  88% |###############################     | ETA:  0:00:40
Adding changed files:  88% |###############################     | ETA:  0:00:40
Adding changed files:  88% |###############################     | ETA:  0:00:39
Adding changed files:  88% |################################    | ETA:  0:00:39
Adding changed files:  89% |################################    | ETA:  0:00:39
Adding changed files:  89% |################################    | ETA:  0:00:38
Adding changed files:  89% |################################    | ETA:  0:00:38
Adding changed files:  89% |################################    | ETA:  0:00:38
Adding changed files:  89% |################################    | ETA:  0:00:37
Adding changed files:  89% |################################    | ETA:  0:00:37
Adding changed files:  89% |################################    | ETA:  0:00:37
Adding changed files:  89% |################################    | ETA:  0:00:36
Adding changed files:  89% |################################    | ETA:  0:00:36
Adding changed files:  89% |################################    | ETA:  0:00:36
Adding changed files:  90% |################################    | ETA:  0:00:35
Adding changed files:  90% |################################    | ETA:  0:00:35
Adding changed files:  90% |################################    | ETA:  0:00:35
Adding changed files:  90% |################################    | ETA:  0:00:34
Adding changed files:  90% |################################    | ETA:  0:00:34
Adding changed files:  90% |################################    | ETA:  0:00:33
Adding changed files:  90% |################################    | ETA:  0:00:33
Adding changed files:  90% |################################    | ETA:  0:00:33
Adding changed files:  90% |################################    | ETA:  0:00:32
Adding changed files:  90% |################################    | ETA:  0:00:32
Adding changed files:  91% |################################    | ETA:  0:00:32
Adding changed files:  91% |################################    | ETA:  0:00:31
Adding changed files:  91% |################################    | ETA:  0:00:31
Adding changed files:  91% |################################    | ETA:  0:00:31
Adding changed files:  91% |################################    | ETA:  0:00:30
Adding changed files:  91% |################################    | ETA:  0:00:30
Adding changed files:  91% |################################    | ETA:  0:00:30
Adding changed files:  91% |#################################   | ETA:  0:00:29
Adding changed files:  91% |#################################   | ETA:  0:00:29
Adding changed files:  91% |#################################   | ETA:  0:00:29
Adding changed files:  92% |#################################   | ETA:  0:00:28
Adding changed files:  92% |#################################   | ETA:  0:00:28
Adding changed files:  92% |#################################   | ETA:  0:00:28
Adding changed files:  92% |#################################   | ETA:  0:00:27
Adding changed files:  92% |#################################   | ETA:  0:00:27
Adding changed files:  92% |#################################   | ETA:  0:00:27
Adding changed files:  92% |#################################   | ETA:  0:00:26
Adding changed files:  92% |#################################   | ETA:  0:00:26
Adding changed files:  92% |#################################   | ETA:  0:00:25
Adding changed files:  92% |#################################   | ETA:  0:00:25
Adding changed files:  92% |#################################   | ETA:  0:00:25
Adding changed files:  93% |#################################   | ETA:  0:00:24
Adding changed files:  93% |#################################   | ETA:  0:00:24
Adding changed files:  93% |#################################   | ETA:  0:00:24
Adding changed files:  93% |#################################   | ETA:  0:00:23
Adding changed files:  93% |#################################   | ETA:  0:00:23
Adding changed files:  93% |#################################   | ETA:  0:00:23
Adding changed files:  93% |#################################   | ETA:  0:00:22
Adding changed files:  93% |#################################   | ETA:  0:00:22
Adding changed files:  93% |#################################   | ETA:  0:00:22
Adding changed files:  93% |#################################   | ETA:  0:00:21
Adding changed files:  94% |#################################   | ETA:  0:00:21
Adding changed files:  94% |#################################   | ETA:  0:00:21
Adding changed files:  94% |#################################   | ETA:  0:00:20
Adding changed files:  94% |#################################   | ETA:  0:00:20
Adding changed files:  94% |##################################  | ETA:  0:00:20
Adding changed files:  94% |##################################  | ETA:  0:00:19
Adding changed files:  94% |##################################  | ETA:  0:00:19
Adding changed files:  94% |##################################  | ETA:  0:00:18
Adding changed files:  94% |##################################  | ETA:  0:00:18
Adding changed files:  94% |##################################  | ETA:  0:00:18
Adding changed files:  95% |##################################  | ETA:  0:00:17
Adding changed files:  95% |##################################  | ETA:  0:00:17
Adding changed files:  95% |##################################  | ETA:  0:00:17
Adding changed files:  95% |##################################  | ETA:  0:00:16
Adding changed files:  95% |##################################  | ETA:  0:00:16
Adding changed files:  95% |##################################  | ETA:  0:00:16
Adding changed files:  95% |##################################  | ETA:  0:00:15
Adding changed files:  95% |##################################  | ETA:  0:00:15
Adding changed files:  95% |##################################  | ETA:  0:00:15
Adding changed files:  95% |##################################  | ETA:  0:00:14
Adding changed files:  96% |##################################  | ETA:  0:00:14
Adding changed files:  96% |##################################  | ETA:  0:00:14
Adding changed files:  96% |##################################  | ETA:  0:00:13
Adding changed files:  96% |##################################  | ETA:  0:00:13
Adding changed files:  96% |##################################  | ETA:  0:00:12
Adding changed files:  96% |##################################  | ETA:  0:00:12
Adding changed files:  96% |##################################  | ETA:  0:00:12
Adding changed files:  96% |##################################  | ETA:  0:00:11
Adding changed files:  96% |##################################  | ETA:  0:00:11
Adding changed files:  96% |##################################  | ETA:  0:00:11
Adding changed files:  96% |##################################  | ETA:  0:00:10
Adding changed files:  97% |##################################  | ETA:  0:00:10
Adding changed files:  97% |##################################  | ETA:  0:00:10
Adding changed files:  97% |################################### | ETA:  0:00:09
Adding changed files:  97% |################################### | ETA:  0:00:09
Adding changed files:  97% |################################### | ETA:  0:00:09
Adding changed files:  97% |################################### | ETA:  0:00:08
Adding changed files:  97% |################################### | ETA:  0:00:08
Adding changed files:  97% |################################### | ETA:  0:00:08
Adding changed files:  97% |################################### | ETA:  0:00:07
Adding changed files:  97% |################################### | ETA:  0:00:07
Adding changed files:  98% |################################### | ETA:  0:00:07
Adding changed files:  98% |################################### | ETA:  0:00:06
Adding changed files:  98% |################################### | ETA:  0:00:06
Adding changed files:  98% |################################### | ETA:  0:00:05
Adding changed files:  98% |################################### | ETA:  0:00:05
Adding changed files:  98% |################################### | ETA:  0:00:05
Adding changed files:  98% |################################### | ETA:  0:00:04
Adding changed files:  98% |################################### | ETA:  0:00:04
Adding changed files:  98% |################################### | ETA:  0:00:04
Adding changed files:  98% |################################### | ETA:  0:00:03
Adding changed files:  99% |################################### | ETA:  0:00:03
Adding changed files:  99% |################################### | ETA:  0:00:03
Adding changed files:  99% |################################### | ETA:  0:00:02
Adding changed files:  99% |################################### | ETA:  0:00:02
Adding changed files:  99% |################################### | ETA:  0:00:02
Adding changed files:  99% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:06:01

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.89.0-src.tar.xz;name=rust...
INFO: Rebasing devtool onto 14ecdf868c5c111361a681ad1475d7c262bba0d6
WARNING: Command 'git rebase 14ecdf868c5c111361a681ad1475d7c262bba0d6' failed:
Auto-merging src/tools/rustc-perf/collector/compile-benchmarks/libc-0.2.172/src/unix/linux_like/linux/arch/generic/mod.rs
CONFLICT (modify/delete): vendor/libc-0.2.170/.cargo-checksum.json deleted in HEAD and modified in c2223e54f (Define Linux ioctl codes on more architectures.).  Version c2223e54f (Define Linux ioctl codes on more architectures.) of vendor/libc-0.2.170/.cargo-checksum.json left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
vendor/libc-0.2.170/.cargo-checksum.json: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7789805700533919940==--

