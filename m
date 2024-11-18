Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18259D62044
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4693.1731964647033860545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WiWZvHLv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=I3O84Of0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010193412334c5-f57710d0-6f2e-4854-90e1-c5cbff469929-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=08MEobvlDzxwYyGmIarv/zYHZyDq3+UbBsZSGQchyxs=;
	b=WiWZvHLviVju8sZ7uCX0OPfq+8D2U7Ju4rMgyyqVgO3/77UBfZcHfkzBqXkLJfCT
	X+5rLcXLx9lfoAdqUnviUu8Lm4fTWPDPJ88Xn0yINVdqYZS6CGyQQs466nyRnVORsxH
	914MlXiIT/Bns3yO2gKwmaTAAdEp2OiA84+QgEB0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=08MEobvlDzxwYyGmIarv/zYHZyDq3+UbBsZSGQchyxs=;
	b=I3O84Of0vQnMldcVjmykUn/IPy8i8n67dMx8OzuEFWl8c1xyU8KeeyROrLasS9+y
	qpiD+3sk+cNCtnJEuK1Y93ldO6FGFJUze4R4xAOnq9x/bGIVIiFRtf1YGdaorNDiWrC
	7UZ/zZ/Wa+M1jjq+pB4iwuDyg78L4ecUkF8bzl44=
Content-Type: multipart/mixed; boundary="===============8199937860460927682=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo-c-native: upgrading to 0.10.5+cargo-0.83.0 FAILED
Message-ID: <01010193412334c5-f57710d0-6f2e-4854-90e1-c5cbff469929-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207303

--===============8199937860460927682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c-native* to *0.10.5+cargo-0.83.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo-c-native -V 0.10.5+cargo-0.83.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
WARNING: QA Issue: cargo-c-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
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
workspace            = "tmp-auh-upgrades:80f68db97c6a3ae9a7298d96a44085d1949c9874"

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
NOTE: Writing buildhistory took: 12 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:80f68db97c6a3ae9a7298d96a44085d1949c9874"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-3x0aoerx: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-8dke47va/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-8dke47va/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:05:02
Adding changed files:   0% |                                    | ETA:  0:03:40
Adding changed files:   1% |                                    | ETA:  0:03:14
Adding changed files:   1% |                                    | ETA:  0:03:00
Adding changed files:   2% |                                    | ETA:  0:02:52
Adding changed files:   2% |                                    | ETA:  0:02:45
Adding changed files:   2% |#                                   | ETA:  0:02:41
Adding changed files:   3% |#                                   | ETA:  0:02:37
Adding changed files:   3% |#                                   | ETA:  0:02:34
Adding changed files:   4% |#                                   | ETA:  0:02:32
Adding changed files:   4% |#                                   | ETA:  0:02:29
Adding changed files:   4% |#                                   | ETA:  0:02:27
Adding changed files:   5% |#                                   | ETA:  0:02:25
Adding changed files:   5% |##                                  | ETA:  0:02:23
Adding changed files:   6% |##                                  | ETA:  0:02:21
Adding changed files:   6% |##                                  | ETA:  0:02:19
Adding changed files:   6% |##                                  | ETA:  0:02:17
Adding changed files:   7% |##                                  | ETA:  0:02:16
Adding changed files:   7% |##                                  | ETA:  0:02:15
Adding changed files:   8% |##                                  | ETA:  0:02:14
Adding changed files:   8% |###                                 | ETA:  0:02:13
Adding changed files:   8% |###                                 | ETA:  0:02:12
Adding changed files:   9% |###                                 | ETA:  0:02:11
Adding changed files:   9% |###                                 | ETA:  0:02:10
Adding changed files:  10% |###                                 | ETA:  0:02:09
Adding changed files:  10% |###                                 | ETA:  0:02:08
Adding changed files:  10% |###                                 | ETA:  0:02:07
Adding changed files:  11% |####                                | ETA:  0:02:06
Adding changed files:  11% |####                                | ETA:  0:02:05
Adding changed files:  12% |####                                | ETA:  0:02:04
Adding changed files:  12% |####                                | ETA:  0:02:03
Adding changed files:  12% |####                                | ETA:  0:02:02
Adding changed files:  13% |####                                | ETA:  0:02:02
Adding changed files:  13% |####                                | ETA:  0:02:01
Adding changed files:  14% |#####                               | ETA:  0:02:00
Adding changed files:  14% |#####                               | ETA:  0:01:59
Adding changed files:  14% |#####                               | ETA:  0:01:59
Adding changed files:  15% |#####                               | ETA:  0:01:58
Adding changed files:  15% |#####                               | ETA:  0:01:57
Adding changed files:  16% |#####                               | ETA:  0:01:56
Adding changed files:  16% |#####                               | ETA:  0:01:56
Adding changed files:  16% |######                              | ETA:  0:01:55
Adding changed files:  17% |######                              | ETA:  0:01:54
Adding changed files:  17% |######                              | ETA:  0:01:54
Adding changed files:  18% |######                              | ETA:  0:01:53
Adding changed files:  18% |######                              | ETA:  0:01:52
Adding changed files:  18% |######                              | ETA:  0:01:51
Adding changed files:  19% |######                              | ETA:  0:01:51
Adding changed files:  19% |#######                             | ETA:  0:01:50
Adding changed files:  20% |#######                             | ETA:  0:01:49
Adding changed files:  20% |#######                             | ETA:  0:01:49
Adding changed files:  20% |#######                             | ETA:  0:01:48
Adding changed files:  21% |#######                             | ETA:  0:01:47
Adding changed files:  21% |#######                             | ETA:  0:01:47
Adding changed files:  22% |#######                             | ETA:  0:01:46
Adding changed files:  22% |########                            | ETA:  0:01:45
Adding changed files:  22% |########                            | ETA:  0:01:45
Adding changed files:  23% |########                            | ETA:  0:01:44
Adding changed files:  23% |########                            | ETA:  0:01:43
Adding changed files:  24% |########                            | ETA:  0:01:43
Adding changed files:  24% |########                            | ETA:  0:01:42
Adding changed files:  24% |########                            | ETA:  0:01:41
Adding changed files:  25% |#########                           | ETA:  0:01:41
Adding changed files:  25% |#########                           | ETA:  0:01:40
Adding changed files:  26% |#########                           | ETA:  0:01:39
Adding changed files:  26% |#########                           | ETA:  0:01:39
Adding changed files:  26% |#########                           | ETA:  0:01:38
Adding changed files:  27% |#########                           | ETA:  0:01:38
Adding changed files:  27% |#########                           | ETA:  0:01:37
Adding changed files:  28% |##########                          | ETA:  0:01:36
Adding changed files:  28% |##########                          | ETA:  0:01:36
Adding changed files:  28% |##########                          | ETA:  0:01:35
Adding changed files:  29% |##########                          | ETA:  0:01:34
Adding changed files:  29% |##########                          | ETA:  0:01:34
Adding changed files:  30% |##########                          | ETA:  0:01:33
Adding changed files:  30% |##########                          | ETA:  0:01:33
Adding changed files:  30% |###########                         | ETA:  0:01:32
Adding changed files:  31% |###########                         | ETA:  0:01:31
Adding changed files:  31% |###########                         | ETA:  0:01:31
Adding changed files:  32% |###########                         | ETA:  0:01:30
Adding changed files:  32% |###########                         | ETA:  0:01:29
Adding changed files:  32% |###########                         | ETA:  0:01:29
Adding changed files:  33% |############                        | ETA:  0:01:28
Adding changed files:  33% |############                        | ETA:  0:01:27
Adding changed files:  34% |############                        | ETA:  0:01:27
Adding changed files:  34% |############                        | ETA:  0:01:26
Adding changed files:  34% |############                        | ETA:  0:01:26
Adding changed files:  35% |############                        | ETA:  0:01:25
Adding changed files:  35% |############                        | ETA:  0:01:24
Adding changed files:  36% |#############                       | ETA:  0:01:24
Adding changed files:  36% |#############                       | ETA:  0:01:23
Adding changed files:  36% |#############                       | ETA:  0:01:22
Adding changed files:  37% |#############                       | ETA:  0:01:22
Adding changed files:  37% |#############                       | ETA:  0:01:21
Adding changed files:  38% |#############                       | ETA:  0:01:20
Adding changed files:  38% |#############                       | ETA:  0:01:20
Adding changed files:  38% |##############                      | ETA:  0:01:19
Adding changed files:  39% |##############                      | ETA:  0:01:19
Adding changed files:  39% |##############                      | ETA:  0:01:18
Adding changed files:  40% |##############                      | ETA:  0:01:17
Adding changed files:  40% |##############                      | ETA:  0:01:17
Adding changed files:  41% |##############                      | ETA:  0:01:16
Adding changed files:  41% |##############                      | ETA:  0:01:15
Adding changed files:  41% |###############                     | ETA:  0:01:15
Adding changed files:  42% |###############                     | ETA:  0:01:14
Adding changed files:  42% |###############                     | ETA:  0:01:14
Adding changed files:  43% |###############                     | ETA:  0:01:13
Adding changed files:  43% |###############                     | ETA:  0:01:12
Adding changed files:  43% |###############                     | ETA:  0:01:12
Adding changed files:  44% |###############                     | ETA:  0:01:11
Adding changed files:  44% |################                    | ETA:  0:01:11
Adding changed files:  45% |################                    | ETA:  0:01:10
Adding changed files:  45% |################                    | ETA:  0:01:10
Adding changed files:  45% |################                    | ETA:  0:01:09
Adding changed files:  46% |################                    | ETA:  0:01:08
Adding changed files:  46% |################                    | ETA:  0:01:08
Adding changed files:  47% |################                    | ETA:  0:01:07
Adding changed files:  47% |#################                   | ETA:  0:01:07
Adding changed files:  47% |#################                   | ETA:  0:01:06
Adding changed files:  48% |#################                   | ETA:  0:01:05
Adding changed files:  48% |#################                   | ETA:  0:01:05
Adding changed files:  49% |#################                   | ETA:  0:01:04
Adding changed files:  49% |#################                   | ETA:  0:01:04
Adding changed files:  49% |#################                   | ETA:  0:01:03
Adding changed files:  50% |##################                  | ETA:  0:01:03
Adding changed files:  50% |##################                  | ETA:  0:01:02
Adding changed files:  51% |##################                  | ETA:  0:01:01
Adding changed files:  51% |##################                  | ETA:  0:01:01
Adding changed files:  51% |##################                  | ETA:  0:01:00
Adding changed files:  52% |##################                  | ETA:  0:01:00
Adding changed files:  52% |##################                  | ETA:  0:00:59
Adding changed files:  53% |###################                 | ETA:  0:00:59
Adding changed files:  53% |###################                 | ETA:  0:00:58
Adding changed files:  53% |###################                 | ETA:  0:00:57
Adding changed files:  54% |###################                 | ETA:  0:00:57
Adding changed files:  54% |###################                 | ETA:  0:00:56
Adding changed files:  55% |###################                 | ETA:  0:00:56
Adding changed files:  55% |###################                 | ETA:  0:00:55
Adding changed files:  55% |####################                | ETA:  0:00:55
Adding changed files:  56% |####################                | ETA:  0:00:54
Adding changed files:  56% |####################                | ETA:  0:00:53
Adding changed files:  57% |####################                | ETA:  0:00:53
Adding changed files:  57% |####################                | ETA:  0:00:52
Adding changed files:  57% |####################                | ETA:  0:00:52
Adding changed files:  58% |####################                | ETA:  0:00:51
Adding changed files:  58% |#####################               | ETA:  0:00:51
Adding changed files:  59% |#####################               | ETA:  0:00:50
Adding changed files:  59% |#####################               | ETA:  0:00:50
Adding changed files:  59% |#####################               | ETA:  0:00:49
Adding changed files:  60% |#####################               | ETA:  0:00:48
Adding changed files:  60% |#####################               | ETA:  0:00:48
Adding changed files:  61% |#####################               | ETA:  0:00:47
Adding changed files:  61% |######################              | ETA:  0:00:47
Adding changed files:  61% |######################              | ETA:  0:00:46
Adding changed files:  62% |######################              | ETA:  0:00:46
Adding changed files:  62% |######################              | ETA:  0:00:45
Adding changed files:  63% |######################              | ETA:  0:00:45
Adding changed files:  63% |######################              | ETA:  0:00:44
Adding changed files:  63% |#######################             | ETA:  0:00:44
Adding changed files:  64% |#######################             | ETA:  0:00:43
Adding changed files:  64% |#######################             | ETA:  0:00:42
Adding changed files:  65% |#######################             | ETA:  0:00:42
Adding changed files:  65% |#######################             | ETA:  0:00:41
Adding changed files:  65% |#######################             | ETA:  0:00:41
Adding changed files:  66% |#######################             | ETA:  0:00:40
Adding changed files:  66% |########################            | ETA:  0:00:40
Adding changed files:  67% |########################            | ETA:  0:00:39
Adding changed files:  67% |########################            | ETA:  0:00:39
Adding changed files:  67% |########################            | ETA:  0:00:38
Adding changed files:  68% |########################            | ETA:  0:00:38
Adding changed files:  68% |########################            | ETA:  0:00:37
Adding changed files:  69% |########################            | ETA:  0:00:37
Adding changed files:  69% |#########################           | ETA:  0:00:36
Adding changed files:  69% |#########################           | ETA:  0:00:36
Adding changed files:  70% |#########################           | ETA:  0:00:35
Adding changed files:  70% |#########################           | ETA:  0:00:35
Adding changed files:  71% |#########################           | ETA:  0:00:34
Adding changed files:  71% |#########################           | ETA:  0:00:34
Adding changed files:  71% |#########################           | ETA:  0:00:33
Adding changed files:  72% |##########################          | ETA:  0:00:33
Adding changed files:  72% |##########################          | ETA:  0:00:32
Adding changed files:  73% |##########################          | ETA:  0:00:31
Adding changed files:  73% |##########################          | ETA:  0:00:31
Adding changed files:  73% |##########################          | ETA:  0:00:30
Adding changed files:  74% |##########################          | ETA:  0:00:30
Adding changed files:  74% |##########################          | ETA:  0:00:29
Adding changed files:  75% |###########################         | ETA:  0:00:29
Adding changed files:  75% |###########################         | ETA:  0:00:28
Adding changed files:  75% |###########################         | ETA:  0:00:28
Adding changed files:  76% |###########################         | ETA:  0:00:27
Adding changed files:  76% |###########################         | ETA:  0:00:27
Adding changed files:  77% |###########################         | ETA:  0:00:26
Adding changed files:  77% |###########################         | ETA:  0:00:26
Adding changed files:  77% |############################        | ETA:  0:00:25
Adding changed files:  78% |############################        | ETA:  0:00:25
Adding changed files:  78% |############################        | ETA:  0:00:24
Adding changed files:  79% |############################        | ETA:  0:00:24
Adding changed files:  79% |############################        | ETA:  0:00:23
Adding changed files:  79% |############################        | ETA:  0:00:23
Adding changed files:  80% |############################        | ETA:  0:00:22
Adding changed files:  80% |#############################       | ETA:  0:00:22
Adding changed files:  81% |#############################       | ETA:  0:00:21
Adding changed files:  81% |#############################       | ETA:  0:00:21
Adding changed files:  82% |#############################       | ETA:  0:00:20
Adding changed files:  82% |#############################       | ETA:  0:00:20
Adding changed files:  82% |#############################       | ETA:  0:00:19
Adding changed files:  83% |#############################       | ETA:  0:00:19
Adding changed files:  83% |##############################      | ETA:  0:00:18
Adding changed files:  84% |##############################      | ETA:  0:00:18
Adding changed files:  84% |##############################      | ETA:  0:00:17
Adding changed files:  84% |##############################      | ETA:  0:00:17
Adding changed files:  85% |##############################      | ETA:  0:00:17
Adding changed files:  85% |##############################      | ETA:  0:00:16
Adding changed files:  86% |##############################      | ETA:  0:00:16
Adding changed files:  86% |###############################     | ETA:  0:00:15
Adding changed files:  86% |###############################     | ETA:  0:00:15
Adding changed files:  87% |###############################     | ETA:  0:00:14
Adding changed files:  87% |###############################     | ETA:  0:00:14
Adding changed files:  88% |###############################     | ETA:  0:00:13
Adding changed files:  88% |###############################     | ETA:  0:00:13
Adding changed files:  88% |###############################     | ETA:  0:00:12
Adding changed files:  89% |################################    | ETA:  0:00:12
Adding changed files:  89% |################################    | ETA:  0:00:11
Adding changed files:  90% |################################    | ETA:  0:00:11
Adding changed files:  90% |################################    | ETA:  0:00:10
Adding changed files:  90% |################################    | ETA:  0:00:10
Adding changed files:  91% |################################    | ETA:  0:00:09
Adding changed files:  91% |################################    | ETA:  0:00:09
Adding changed files:  92% |#################################   | ETA:  0:00:08
Adding changed files:  92% |#################################   | ETA:  0:00:08
Adding changed files:  92% |#################################   | ETA:  0:00:08
Adding changed files:  93% |#################################   | ETA:  0:00:07
Adding changed files:  93% |#################################   | ETA:  0:00:07
Adding changed files:  94% |#################################   | ETA:  0:00:06
Adding changed files:  94% |##################################  | ETA:  0:00:06
Adding changed files:  94% |##################################  | ETA:  0:00:05
Adding changed files:  95% |##################################  | ETA:  0:00:05
Adding changed files:  95% |##################################  | ETA:  0:00:04
Adding changed files:  96% |##################################  | ETA:  0:00:04
Adding changed files:  96% |##################################  | ETA:  0:00:03
Adding changed files:  96% |##################################  | ETA:  0:00:03
Adding changed files:  97% |################################### | ETA:  0:00:03
Adding changed files:  97% |################################### | ETA:  0:00:02
Adding changed files:  98% |################################### | ETA:  0:00:02
Adding changed files:  98% |################################### | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:01:49

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching crate://crates.io/cargo-c/0.10.5+cargo-0.83.0;name=cargo-c...
INFO: Rebasing devtool onto 3e5bde95ef300ce4a64a57f1dbd6c0023b3e26d5
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 350, in <module>
    ret = main()
          ^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 337, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 609, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 508, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/cargo-c-native/cargo_home/bitbake/cargo-c-0.10.3+cargo-0.81.0/LICENSE'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8199937860460927682==--

