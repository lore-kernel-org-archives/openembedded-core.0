Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85799C5473F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:03 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.131417.1723748333747496594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UZ6hE4Yb;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KfsDY/jE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019157683b9e-d8a039bf-5b20-4216-9955-0f5fbd1f9b33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ERzV9FtEai9LvTMXMtEoQ+ROsjIwwUqbZT1R3O/EO2A=;
	b=UZ6hE4YbBTHYSyrQNn8BuH30KfvuykfPYzK/0b56/YFoIzCb3BV/aEaJHDFYrAfi
	anG63b0x3BtUVQN6bwdnX5r8pZWyJbzsQmYCsBhl285YniF6gbDB+C6BzfyPd6zQJEk
	1Fc3ItPYpP7VNEDxG648m2MuV2E+HDEYZ1mZLCrA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ERzV9FtEai9LvTMXMtEoQ+ROsjIwwUqbZT1R3O/EO2A=;
	b=KfsDY/jEzB1nAUkqBKYCx/myezysofyNMlvO6IszAeZqJPnU0MryuGelUE2vA/ab
	FeKkm8aisijKuXNz+I9EwdY4wPEmJ1uxiyIFj3m5qo/sYJaX9ij3b6qNN4pdCgXczP+
	sU3k5/07BAEl21hOGiSJy3BRmYxdgNFIEHGE8rqY=
Content-Type: multipart/mixed; boundary="===============7932425696557339444=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo-c-native: upgrading to 0.10.3+cargo-0.81.0 FAILED
Message-ID: <0101019157683b9e-d8a039bf-5b20-4216-9955-0f5fbd1f9b33-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203395

--===============7932425696557339444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c-native* to *0.10.3+cargo-0.81.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo-c-native -V 0.10.3+cargo-0.81.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
WARNING: QA Issue: cargo-c-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-090ed2b7f1f2ab51bb88f07a0895f21e560da3e7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:090ed2b7f1f2ab51bb88f07a0895f21e560da3e7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: QA Issue: cargo-c-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: cargo-c-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: cargo-c-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-090ed2b7f1f2ab51bb88f07a0895f21e560da3e7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:090ed2b7f1f2ab51bb88f07a0895f21e560da3e7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-emmyg4s7: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-motpwala/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-motpwala/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:56
Adding changed files:   0% |                                    | ETA:  0:00:41
Adding changed files:   1% |                                    | ETA:  0:00:36
Adding changed files:   1% |                                    | ETA:  0:00:33
Adding changed files:   1% |                                    | ETA:  0:00:31
Adding changed files:   2% |                                    | ETA:  0:00:30
Adding changed files:   2% |                                    | ETA:  0:00:29
Adding changed files:   2% |#                                   | ETA:  0:00:29
Adding changed files:   3% |#                                   | ETA:  0:00:28
Adding changed files:   3% |#                                   | ETA:  0:00:28
Adding changed files:   3% |#                                   | ETA:  0:00:27
Adding changed files:   4% |#                                   | ETA:  0:00:27
Adding changed files:   4% |#                                   | ETA:  0:00:26
Adding changed files:   5% |#                                   | ETA:  0:00:26
Adding changed files:   5% |#                                   | ETA:  0:00:26
Adding changed files:   5% |##                                  | ETA:  0:00:25
Adding changed files:   6% |##                                  | ETA:  0:00:25
Adding changed files:   6% |##                                  | ETA:  0:00:25
Adding changed files:   6% |##                                  | ETA:  0:00:24
Adding changed files:   7% |##                                  | ETA:  0:00:24
Adding changed files:   7% |##                                  | ETA:  0:00:24
Adding changed files:   7% |##                                  | ETA:  0:00:24
Adding changed files:   8% |##                                  | ETA:  0:00:24
Adding changed files:   8% |###                                 | ETA:  0:00:24
Adding changed files:   8% |###                                 | ETA:  0:00:23
Adding changed files:   9% |###                                 | ETA:  0:00:23
Adding changed files:   9% |###                                 | ETA:  0:00:23
Adding changed files:  10% |###                                 | ETA:  0:00:23
Adding changed files:  10% |###                                 | ETA:  0:00:23
Adding changed files:  10% |###                                 | ETA:  0:00:23
Adding changed files:  11% |###                                 | ETA:  0:00:22
Adding changed files:  11% |####                                | ETA:  0:00:22
Adding changed files:  11% |####                                | ETA:  0:00:22
Adding changed files:  12% |####                                | ETA:  0:00:22
Adding changed files:  12% |####                                | ETA:  0:00:22
Adding changed files:  12% |####                                | ETA:  0:00:22
Adding changed files:  13% |####                                | ETA:  0:00:22
Adding changed files:  13% |####                                | ETA:  0:00:22
Adding changed files:  13% |#####                               | ETA:  0:00:21
Adding changed files:  14% |#####                               | ETA:  0:00:21
Adding changed files:  14% |#####                               | ETA:  0:00:21
Adding changed files:  15% |#####                               | ETA:  0:00:21
Adding changed files:  15% |#####                               | ETA:  0:00:21
Adding changed files:  15% |#####                               | ETA:  0:00:21
Adding changed files:  16% |#####                               | ETA:  0:00:21
Adding changed files:  16% |#####                               | ETA:  0:00:21
Adding changed files:  16% |######                              | ETA:  0:00:20
Adding changed files:  17% |######                              | ETA:  0:00:20
Adding changed files:  17% |######                              | ETA:  0:00:20
Adding changed files:  17% |######                              | ETA:  0:00:20
Adding changed files:  18% |######                              | ETA:  0:00:20
Adding changed files:  18% |######                              | ETA:  0:00:20
Adding changed files:  18% |######                              | ETA:  0:00:20
Adding changed files:  19% |######                              | ETA:  0:00:20
Adding changed files:  19% |#######                             | ETA:  0:00:19
Adding changed files:  20% |#######                             | ETA:  0:00:19
Adding changed files:  20% |#######                             | ETA:  0:00:19
Adding changed files:  20% |#######                             | ETA:  0:00:19
Adding changed files:  21% |#######                             | ETA:  0:00:19
Adding changed files:  21% |#######                             | ETA:  0:00:19
Adding changed files:  21% |#######                             | ETA:  0:00:19
Adding changed files:  22% |#######                             | ETA:  0:00:19
Adding changed files:  22% |########                            | ETA:  0:00:18
Adding changed files:  22% |########                            | ETA:  0:00:18
Adding changed files:  23% |########                            | ETA:  0:00:18
Adding changed files:  23% |########                            | ETA:  0:00:18
Adding changed files:  23% |########                            | ETA:  0:00:18
Adding changed files:  24% |########                            | ETA:  0:00:18
Adding changed files:  24% |########                            | ETA:  0:00:18
Adding changed files:  25% |#########                           | ETA:  0:00:18
Adding changed files:  25% |#########                           | ETA:  0:00:17
Adding changed files:  25% |#########                           | ETA:  0:00:17
Adding changed files:  26% |#########                           | ETA:  0:00:17
Adding changed files:  26% |#########                           | ETA:  0:00:17
Adding changed files:  26% |#########                           | ETA:  0:00:17
Adding changed files:  27% |#########                           | ETA:  0:00:17
Adding changed files:  27% |#########                           | ETA:  0:00:17
Adding changed files:  27% |##########                          | ETA:  0:00:17
Adding changed files:  28% |##########                          | ETA:  0:00:16
Adding changed files:  28% |##########                          | ETA:  0:00:16
Adding changed files:  28% |##########                          | ETA:  0:00:16
Adding changed files:  29% |##########                          | ETA:  0:00:16
Adding changed files:  29% |##########                          | ETA:  0:00:16
Adding changed files:  30% |##########                          | ETA:  0:00:16
Adding changed files:  30% |##########                          | ETA:  0:00:16
Adding changed files:  30% |###########                         | ETA:  0:00:16
Adding changed files:  31% |###########                         | ETA:  0:00:16
Adding changed files:  31% |###########                         | ETA:  0:00:16
Adding changed files:  31% |###########                         | ETA:  0:00:15
Adding changed files:  32% |###########                         | ETA:  0:00:15
Adding changed files:  32% |###########                         | ETA:  0:00:15
Adding changed files:  32% |###########                         | ETA:  0:00:15
Adding changed files:  33% |###########                         | ETA:  0:00:15
Adding changed files:  33% |############                        | ETA:  0:00:15
Adding changed files:  33% |############                        | ETA:  0:00:15
Adding changed files:  34% |############                        | ETA:  0:00:15
Adding changed files:  34% |############                        | ETA:  0:00:15
Adding changed files:  35% |############                        | ETA:  0:00:15
Adding changed files:  35% |############                        | ETA:  0:00:14
Adding changed files:  35% |############                        | ETA:  0:00:14
Adding changed files:  36% |############                        | ETA:  0:00:14
Adding changed files:  36% |#############                       | ETA:  0:00:14
Adding changed files:  36% |#############                       | ETA:  0:00:14
Adding changed files:  37% |#############                       | ETA:  0:00:14
Adding changed files:  37% |#############                       | ETA:  0:00:14
Adding changed files:  37% |#############                       | ETA:  0:00:14
Adding changed files:  38% |#############                       | ETA:  0:00:14
Adding changed files:  38% |#############                       | ETA:  0:00:14
Adding changed files:  38% |##############                      | ETA:  0:00:13
Adding changed files:  39% |##############                      | ETA:  0:00:13
Adding changed files:  39% |##############                      | ETA:  0:00:13
Adding changed files:  40% |##############                      | ETA:  0:00:13
Adding changed files:  40% |##############                      | ETA:  0:00:13
Adding changed files:  40% |##############                      | ETA:  0:00:13
Adding changed files:  41% |##############                      | ETA:  0:00:13
Adding changed files:  41% |##############                      | ETA:  0:00:13
Adding changed files:  41% |###############                     | ETA:  0:00:13
Adding changed files:  42% |###############                     | ETA:  0:00:12
Adding changed files:  42% |###############                     | ETA:  0:00:12
Adding changed files:  42% |###############                     | ETA:  0:00:12
Adding changed files:  43% |###############                     | ETA:  0:00:12
Adding changed files:  43% |###############                     | ETA:  0:00:12
Adding changed files:  43% |###############                     | ETA:  0:00:12
Adding changed files:  44% |###############                     | ETA:  0:00:12
Adding changed files:  44% |################                    | ETA:  0:00:12
Adding changed files:  45% |################                    | ETA:  0:00:12
Adding changed files:  45% |################                    | ETA:  0:00:12
Adding changed files:  45% |################                    | ETA:  0:00:12
Adding changed files:  46% |################                    | ETA:  0:00:11
Adding changed files:  46% |################                    | ETA:  0:00:11
Adding changed files:  46% |################                    | ETA:  0:00:11
Adding changed files:  47% |################                    | ETA:  0:00:11
Adding changed files:  47% |#################                   | ETA:  0:00:11
Adding changed files:  47% |#################                   | ETA:  0:00:11
Adding changed files:  48% |#################                   | ETA:  0:00:11
Adding changed files:  48% |#################                   | ETA:  0:00:11
Adding changed files:  48% |#################                   | ETA:  0:00:11
Adding changed files:  49% |#################                   | ETA:  0:00:11
Adding changed files:  49% |#################                   | ETA:  0:00:10
Adding changed files:  50% |##################                  | ETA:  0:00:10
Adding changed files:  50% |##################                  | ETA:  0:00:10
Adding changed files:  50% |##################                  | ETA:  0:00:10
Adding changed files:  51% |##################                  | ETA:  0:00:10
Adding changed files:  51% |##################                  | ETA:  0:00:10
Adding changed files:  51% |##################                  | ETA:  0:00:10
Adding changed files:  52% |##################                  | ETA:  0:00:10
Adding changed files:  52% |##################                  | ETA:  0:00:10
Adding changed files:  52% |###################                 | ETA:  0:00:10
Adding changed files:  53% |###################                 | ETA:  0:00:10
Adding changed files:  53% |###################                 | ETA:  0:00:09
Adding changed files:  53% |###################                 | ETA:  0:00:09
Adding changed files:  54% |###################                 | ETA:  0:00:09
Adding changed files:  54% |###################                 | ETA:  0:00:09
Adding changed files:  55% |###################                 | ETA:  0:00:09
Adding changed files:  55% |###################                 | ETA:  0:00:09
Adding changed files:  55% |####################                | ETA:  0:00:09
Adding changed files:  56% |####################                | ETA:  0:00:09
Adding changed files:  56% |####################                | ETA:  0:00:09
Adding changed files:  56% |####################                | ETA:  0:00:09
Adding changed files:  57% |####################                | ETA:  0:00:09
Adding changed files:  57% |####################                | ETA:  0:00:08
Adding changed files:  57% |####################                | ETA:  0:00:08
Adding changed files:  58% |####################                | ETA:  0:00:08
Adding changed files:  58% |#####################               | ETA:  0:00:08
Adding changed files:  58% |#####################               | ETA:  0:00:08
Adding changed files:  59% |#####################               | ETA:  0:00:08
Adding changed files:  59% |#####################               | ETA:  0:00:08
Adding changed files:  60% |#####################               | ETA:  0:00:08
Adding changed files:  60% |#####################               | ETA:  0:00:08
Adding changed files:  60% |#####################               | ETA:  0:00:08
Adding changed files:  61% |######################              | ETA:  0:00:08
Adding changed files:  61% |######################              | ETA:  0:00:08
Adding changed files:  61% |######################              | ETA:  0:00:07
Adding changed files:  62% |######################              | ETA:  0:00:07
Adding changed files:  62% |######################              | ETA:  0:00:07
Adding changed files:  62% |######################              | ETA:  0:00:07
Adding changed files:  63% |######################              | ETA:  0:00:07
Adding changed files:  63% |######################              | ETA:  0:00:07
Adding changed files:  63% |#######################             | ETA:  0:00:07
Adding changed files:  64% |#######################             | ETA:  0:00:07
Adding changed files:  64% |#######################             | ETA:  0:00:07
Adding changed files:  65% |#######################             | ETA:  0:00:07
Adding changed files:  65% |#######################             | ETA:  0:00:07
Adding changed files:  65% |#######################             | ETA:  0:00:07
Adding changed files:  66% |#######################             | ETA:  0:00:06
Adding changed files:  66% |#######################             | ETA:  0:00:06
Adding changed files:  66% |########################            | ETA:  0:00:06
Adding changed files:  67% |########################            | ETA:  0:00:06
Adding changed files:  67% |########################            | ETA:  0:00:06
Adding changed files:  67% |########################            | ETA:  0:00:06
Adding changed files:  68% |########################            | ETA:  0:00:06
Adding changed files:  68% |########################            | ETA:  0:00:06
Adding changed files:  68% |########################            | ETA:  0:00:06
Adding changed files:  69% |########################            | ETA:  0:00:06
Adding changed files:  69% |#########################           | ETA:  0:00:06
Adding changed files:  70% |#########################           | ETA:  0:00:06
Adding changed files:  70% |#########################           | ETA:  0:00:05
Adding changed files:  70% |#########################           | ETA:  0:00:05
Adding changed files:  71% |#########################           | ETA:  0:00:05
Adding changed files:  71% |#########################           | ETA:  0:00:05
Adding changed files:  71% |#########################           | ETA:  0:00:05
Adding changed files:  72% |#########################           | ETA:  0:00:05
Adding changed files:  72% |##########################          | ETA:  0:00:05
Adding changed files:  72% |##########################          | ETA:  0:00:05
Adding changed files:  73% |##########################          | ETA:  0:00:05
Adding changed files:  73% |##########################          | ETA:  0:00:05
Adding changed files:  73% |##########################          | ETA:  0:00:05
Adding changed files:  74% |##########################          | ETA:  0:00:05
Adding changed files:  74% |##########################          | ETA:  0:00:05
Adding changed files:  75% |###########################         | ETA:  0:00:04
Adding changed files:  75% |###########################         | ETA:  0:00:04
Adding changed files:  75% |###########################         | ETA:  0:00:04
Adding changed files:  76% |###########################         | ETA:  0:00:04
Adding changed files:  76% |###########################         | ETA:  0:00:04
Adding changed files:  76% |###########################         | ETA:  0:00:04
Adding changed files:  77% |###########################         | ETA:  0:00:04
Adding changed files:  77% |###########################         | ETA:  0:00:04
Adding changed files:  77% |############################        | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:04
Adding changed files:  79% |############################        | ETA:  0:00:04
Adding changed files:  79% |############################        | ETA:  0:00:03
Adding changed files:  80% |############################        | ETA:  0:00:03
Adding changed files:  80% |############################        | ETA:  0:00:03
Adding changed files:  80% |#############################       | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  82% |#############################       | ETA:  0:00:03
Adding changed files:  82% |#############################       | ETA:  0:00:03
Adding changed files:  82% |#############################       | ETA:  0:00:03
Adding changed files:  83% |#############################       | ETA:  0:00:03
Adding changed files:  83% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:18

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching crate://crates.io/cargo-c/0.10.3+cargo-0.81.0;name=cargo-c...
INFO: Rebasing devtool onto cd57a45fd740eff490284c3a77391ae6f2ba8ca7
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 350, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 337, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 609, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 508, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/workspace/sources/cargo-c-native/cargo_home/bitbake/cargo-c-0.9.30+cargo-0.77.0/LICENSE'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7932425696557339444==--

