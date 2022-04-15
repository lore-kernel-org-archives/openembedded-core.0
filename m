Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F075C47091
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11830.1650052688502509474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZZh2+Ose;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101802ecde690-b0a54cce-2660-461c-883d-417dae020903-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n0u3+xCP0In+EYo1I0PvI6DN5JdtrCLuFio9sFXQxrA=;
	b=ZZh2+OseLYP+IzRFZpjECzRyLqagsrIB80pRr7Xxz57NQ1nxdKTTDqY8wEfiwxXe
	oQMdQzbP+9Jl1wm1Y4zGpvC0L2Gh1zFPmFxDEEph0ogIpftkKKiVV/iMUONytMqGSIX
	wZ1w1sE7e0DZpdCXffnC9Yk/QVrfSu3/KiYihhFs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n0u3+xCP0In+EYo1I0PvI6DN5JdtrCLuFio9sFXQxrA=;
	b=iSDOG1VOrhcK3KQgMCDI8nCukcd3+xokBv89XuHeu3yH0wzJvs81zf48AxT9PIh+
	TKzkvSBGuxRAIIdA0FQmaXQPVXHMryyg01veLotD+Gtm4PRSjxR4mKONDHyzCwmtRSy
	kwm4dwGvxO3OB8+oUksBWknTF9+ajjXg4TDQ/Lss=
Content-Type: multipart/mixed; boundary="===============6406705693387415298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs: upgrading to 1.60.0 FAILED
Message-ID: 
 <010101802ecde690-b0a54cce-2660-461c-883d-417dae020903-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164477

--===============6406705693387415298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libstd-rs* to *1.60.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libstd-rs -V 1.60.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1640 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:109bac4713d7df55aea5101e75fcd0441ea2bb6f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (881 cached, 2 parsed). 1641 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:109bac4713d7df55aea5101e75fcd0441ea2bb6f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 17 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:04:20
Adding changed files:   0% |                                    | ETA:  0:03:14
Adding changed files:   1% |                                    | ETA:  0:02:48
Adding changed files:   1% |                                    | ETA:  0:02:37
Adding changed files:   1% |                                    | ETA:  0:02:30
Adding changed files:   2% |                                    | ETA:  0:02:25
Adding changed files:   2% |                                    | ETA:  0:02:20
Adding changed files:   3% |#                                   | ETA:  0:02:17
Adding changed files:   3% |#                                   | ETA:  0:02:14
Adding changed files:   3% |#                                   | ETA:  0:02:11
Adding changed files:   4% |#                                   | ETA:  0:02:05
Adding changed files:   4% |#                                   | ETA:  0:01:59
Adding changed files:   4% |#                                   | ETA:  0:01:55
Adding changed files:   5% |#                                   | ETA:  0:01:51
Adding changed files:   5% |##                                  | ETA:  0:01:47
Adding changed files:   6% |##                                  | ETA:  0:01:43
Adding changed files:   6% |##                                  | ETA:  0:01:40
Adding changed files:   6% |##                                  | ETA:  0:01:38
Adding changed files:   7% |##                                  | ETA:  0:01:36
Adding changed files:   7% |##                                  | ETA:  0:01:34
Adding changed files:   7% |##                                  | ETA:  0:01:33
Adding changed files:   8% |##                                  | ETA:  0:01:31
Adding changed files:   8% |###                                 | ETA:  0:01:30
Adding changed files:   9% |###                                 | ETA:  0:01:29
Adding changed files:   9% |###                                 | ETA:  0:01:27
Adding changed files:   9% |###                                 | ETA:  0:01:26
Adding changed files:  10% |###                                 | ETA:  0:01:25
Adding changed files:  10% |###                                 | ETA:  0:01:23
Adding changed files:  10% |###                                 | ETA:  0:01:22
Adding changed files:  11% |####                                | ETA:  0:01:21
Adding changed files:  11% |####                                | ETA:  0:01:20
Adding changed files:  12% |####                                | ETA:  0:01:20
Adding changed files:  12% |####                                | ETA:  0:01:19
Adding changed files:  12% |####                                | ETA:  0:01:18
Adding changed files:  13% |####                                | ETA:  0:01:18
Adding changed files:  13% |####                                | ETA:  0:01:17
Adding changed files:  13% |#####                               | ETA:  0:01:17
Adding changed files:  14% |#####                               | ETA:  0:01:16
Adding changed files:  14% |#####                               | ETA:  0:01:16
Adding changed files:  15% |#####                               | ETA:  0:01:15
Adding changed files:  15% |#####                               | ETA:  0:01:14
Adding changed files:  15% |#####                               | ETA:  0:01:14
Adding changed files:  16% |#####                               | ETA:  0:01:13
Adding changed files:  16% |#####                               | ETA:  0:01:13
Adding changed files:  16% |######                              | ETA:  0:01:12
Adding changed files:  17% |######                              | ETA:  0:01:12
Adding changed files:  17% |######                              | ETA:  0:01:11
Adding changed files:  18% |######                              | ETA:  0:01:11
Adding changed files:  18% |######                              | ETA:  0:01:10
Adding changed files:  18% |######                              | ETA:  0:01:10
Adding changed files:  19% |######                              | ETA:  0:01:09
Adding changed files:  19% |#######                             | ETA:  0:01:09
Adding changed files:  19% |#######                             | ETA:  0:01:08
Adding changed files:  20% |#######                             | ETA:  0:01:08
Adding changed files:  20% |#######                             | ETA:  0:01:07
Adding changed files:  21% |#######                             | ETA:  0:01:07
Adding changed files:  21% |#######                             | ETA:  0:01:06
Adding changed files:  21% |#######                             | ETA:  0:01:06
Adding changed files:  22% |#######                             | ETA:  0:01:05
Adding changed files:  22% |########                            | ETA:  0:01:05
Adding changed files:  22% |########                            | ETA:  0:01:04
Adding changed files:  23% |########                            | ETA:  0:01:05
Adding changed files:  23% |########                            | ETA:  0:01:04
Adding changed files:  24% |########                            | ETA:  0:01:05
Adding changed files:  24% |########                            | ETA:  0:01:05
Adding changed files:  24% |########                            | ETA:  0:01:05
Adding changed files:  25% |#########                           | ETA:  0:01:05
Adding changed files:  25% |#########                           | ETA:  0:01:05
Adding changed files:  25% |#########                           | ETA:  0:01:05
Adding changed files:  26% |#########                           | ETA:  0:01:04
Adding changed files:  26% |#########                           | ETA:  0:01:04
Adding changed files:  27% |#########                           | ETA:  0:01:04
Adding changed files:  27% |#########                           | ETA:  0:01:04
Adding changed files:  27% |##########                          | ETA:  0:01:03
Adding changed files:  28% |##########                          | ETA:  0:01:03
Adding changed files:  28% |##########                          | ETA:  0:01:03
Adding changed files:  28% |##########                          | ETA:  0:01:02
Adding changed files:  29% |##########                          | ETA:  0:01:02
Adding changed files:  29% |##########                          | ETA:  0:01:01
Adding changed files:  30% |##########                          | ETA:  0:01:01
Adding changed files:  30% |##########                          | ETA:  0:01:01
Adding changed files:  30% |###########                         | ETA:  0:01:00
Adding changed files:  31% |###########                         | ETA:  0:01:00
Adding changed files:  31% |###########                         | ETA:  0:01:00
Adding changed files:  31% |###########                         | ETA:  0:01:00
Adding changed files:  32% |###########                         | ETA:  0:01:00
Adding changed files:  32% |###########                         | ETA:  0:00:59
Adding changed files:  33% |###########                         | ETA:  0:00:59
Adding changed files:  33% |############                        | ETA:  0:00:59
Adding changed files:  33% |############                        | ETA:  0:00:59
Adding changed files:  34% |############                        | ETA:  0:00:58
Adding changed files:  34% |############                        | ETA:  0:00:58
Adding changed files:  35% |############                        | ETA:  0:00:58
Adding changed files:  35% |############                        | ETA:  0:00:58
Adding changed files:  35% |############                        | ETA:  0:00:57
Adding changed files:  36% |#############                       | ETA:  0:00:57
Adding changed files:  36% |#############                       | ETA:  0:00:57
Adding changed files:  36% |#############                       | ETA:  0:00:56
Adding changed files:  37% |#############                       | ETA:  0:00:56
Adding changed files:  37% |#############                       | ETA:  0:00:55
Adding changed files:  38% |#############                       | ETA:  0:00:55
Adding changed files:  38% |#############                       | ETA:  0:00:54
Adding changed files:  38% |#############                       | ETA:  0:00:54
Adding changed files:  39% |##############                      | ETA:  0:00:54
Adding changed files:  39% |##############                      | ETA:  0:00:53
Adding changed files:  39% |##############                      | ETA:  0:00:53
Adding changed files:  40% |##############                      | ETA:  0:00:53
Adding changed files:  40% |##############                      | ETA:  0:00:53
Adding changed files:  41% |##############                      | ETA:  0:00:53
Adding changed files:  41% |##############                      | ETA:  0:00:54
Adding changed files:  41% |###############                     | ETA:  0:00:54
Adding changed files:  42% |###############                     | ETA:  0:00:54
Adding changed files:  42% |###############                     | ETA:  0:00:54
Adding changed files:  42% |###############                     | ETA:  0:00:54
Adding changed files:  43% |###############                     | ETA:  0:00:54
Adding changed files:  43% |###############                     | ETA:  0:00:54
Adding changed files:  44% |###############                     | ETA:  0:00:54
Adding changed files:  44% |###############                     | ETA:  0:00:54
Adding changed files:  44% |################                    | ETA:  0:00:53
Adding changed files:  45% |################                    | ETA:  0:00:53
Adding changed files:  45% |################                    | ETA:  0:00:53
Adding changed files:  45% |################                    | ETA:  0:00:52
Adding changed files:  46% |################                    | ETA:  0:00:52
Adding changed files:  46% |################                    | ETA:  0:00:52
Adding changed files:  47% |################                    | ETA:  0:00:51
Adding changed files:  47% |#################                   | ETA:  0:00:51
Adding changed files:  47% |#################                   | ETA:  0:00:50
Adding changed files:  48% |#################                   | ETA:  0:00:50
Adding changed files:  48% |#################                   | ETA:  0:00:49
Adding changed files:  48% |#################                   | ETA:  0:00:49
Adding changed files:  49% |#################                   | ETA:  0:00:49
Adding changed files:  49% |#################                   | ETA:  0:00:48
Adding changed files:  50% |##################                  | ETA:  0:00:48
Adding changed files:  50% |##################                  | ETA:  0:00:48
Adding changed files:  50% |##################                  | ETA:  0:00:47
Adding changed files:  51% |##################                  | ETA:  0:00:47
Adding changed files:  51% |##################                  | ETA:  0:00:46
Adding changed files:  51% |##################                  | ETA:  0:00:46
Adding changed files:  52% |##################                  | ETA:  0:00:46
Adding changed files:  52% |##################                  | ETA:  0:00:45
Adding changed files:  53% |###################                 | ETA:  0:00:45
Adding changed files:  53% |###################                 | ETA:  0:00:44
Adding changed files:  53% |###################                 | ETA:  0:00:44
Adding changed files:  54% |###################                 | ETA:  0:00:44
Adding changed files:  54% |###################                 | ETA:  0:00:43
Adding changed files:  54% |###################                 | ETA:  0:00:43
Adding changed files:  55% |###################                 | ETA:  0:00:42
Adding changed files:  55% |####################                | ETA:  0:00:42
Adding changed files:  56% |####################                | ETA:  0:00:41
Adding changed files:  56% |####################                | ETA:  0:00:41
Adding changed files:  56% |####################                | ETA:  0:00:41
Adding changed files:  57% |####################                | ETA:  0:00:40
Adding changed files:  57% |####################                | ETA:  0:00:40
Adding changed files:  57% |####################                | ETA:  0:00:40
Adding changed files:  58% |#####################               | ETA:  0:00:39
Adding changed files:  58% |#####################               | ETA:  0:00:39
Adding changed files:  59% |#####################               | ETA:  0:00:38
Adding changed files:  59% |#####################               | ETA:  0:00:38
Adding changed files:  59% |#####################               | ETA:  0:00:38
Adding changed files:  60% |#####################               | ETA:  0:00:37
Adding changed files:  60% |#####################               | ETA:  0:00:37
Adding changed files:  60% |#####################               | ETA:  0:00:37
Adding changed files:  61% |######################              | ETA:  0:00:36
Adding changed files:  61% |######################              | ETA:  0:00:36
Adding changed files:  62% |######################              | ETA:  0:00:36
Adding changed files:  62% |######################              | ETA:  0:00:35
Adding changed files:  62% |######################              | ETA:  0:00:35
Adding changed files:  63% |######################              | ETA:  0:00:34
Adding changed files:  63% |######################              | ETA:  0:00:34
Adding changed files:  63% |#######################             | ETA:  0:00:34
Adding changed files:  64% |#######################             | ETA:  0:00:33
Adding changed files:  64% |#######################             | ETA:  0:00:33
Adding changed files:  65% |#######################             | ETA:  0:00:33
Adding changed files:  65% |#######################             | ETA:  0:00:32
Adding changed files:  65% |#######################             | ETA:  0:00:32
Adding changed files:  66% |#######################             | ETA:  0:00:32
Adding changed files:  66% |#######################             | ETA:  0:00:31
Adding changed files:  66% |########################            | ETA:  0:00:31
Adding changed files:  67% |########################            | ETA:  0:00:31
Adding changed files:  67% |########################            | ETA:  0:00:30
Adding changed files:  68% |########################            | ETA:  0:00:30
Adding changed files:  68% |########################            | ETA:  0:00:30
Adding changed files:  68% |########################            | ETA:  0:00:29
Adding changed files:  69% |########################            | ETA:  0:00:29
Adding changed files:  69% |#########################           | ETA:  0:00:29
Adding changed files:  70% |#########################           | ETA:  0:00:28
Adding changed files:  70% |#########################           | ETA:  0:00:28
Adding changed files:  70% |#########################           | ETA:  0:00:28
Adding changed files:  71% |#########################           | ETA:  0:00:28
Adding changed files:  71% |#########################           | ETA:  0:00:27
Adding changed files:  71% |#########################           | ETA:  0:00:27
Adding changed files:  72% |##########################          | ETA:  0:00:27
Adding changed files:  72% |##########################          | ETA:  0:00:26
Adding changed files:  73% |##########################          | ETA:  0:00:26
Adding changed files:  73% |##########################          | ETA:  0:00:26
Adding changed files:  73% |##########################          | ETA:  0:00:26
Adding changed files:  74% |##########################          | ETA:  0:00:25
Adding changed files:  74% |##########################          | ETA:  0:00:25
Adding changed files:  74% |##########################          | ETA:  0:00:25
Adding changed files:  75% |###########################         | ETA:  0:00:25
Adding changed files:  75% |###########################         | ETA:  0:00:24
Adding changed files:  76% |###########################         | ETA:  0:00:24
Adding changed files:  76% |###########################         | ETA:  0:00:24
Adding changed files:  76% |###########################         | ETA:  0:00:23
Adding changed files:  77% |###########################         | ETA:  0:00:23
Adding changed files:  77% |###########################         | ETA:  0:00:23
Adding changed files:  77% |############################        | ETA:  0:00:22
Adding changed files:  78% |############################        | ETA:  0:00:22
Adding changed files:  78% |############################        | ETA:  0:00:21
Adding changed files:  79% |############################        | ETA:  0:00:21
Adding changed files:  79% |############################        | ETA:  0:00:21
Adding changed files:  79% |############################        | ETA:  0:00:20
Adding changed files:  80% |############################        | ETA:  0:00:20
Adding changed files:  80% |############################        | ETA:  0:00:19
Adding changed files:  80% |#############################       | ETA:  0:00:19
Adding changed files:  81% |#############################       | ETA:  0:00:19
Adding changed files:  81% |#############################       | ETA:  0:00:18
Adding changed files:  82% |#############################       | ETA:  0:00:18
Adding changed files:  82% |#############################       | ETA:  0:00:18
Adding changed files:  82% |#############################       | ETA:  0:00:17
Adding changed files:  83% |#############################       | ETA:  0:00:17
Adding changed files:  83% |##############################      | ETA:  0:00:16
Adding changed files:  83% |##############################      | ETA:  0:00:16
Adding changed files:  84% |##############################      | ETA:  0:00:16
Adding changed files:  84% |##############################      | ETA:  0:00:15
Adding changed files:  85% |##############################      | ETA:  0:00:15
Adding changed files:  85% |##############################      | ETA:  0:00:14
Adding changed files:  85% |##############################      | ETA:  0:00:14
Adding changed files:  86% |###############################     | ETA:  0:00:14
Adding changed files:  86% |###############################     | ETA:  0:00:13
Adding changed files:  86% |###############################     | ETA:  0:00:13
Adding changed files:  87% |###############################     | ETA:  0:00:13
Adding changed files:  87% |###############################     | ETA:  0:00:12
Adding changed files:  88% |###############################     | ETA:  0:00:12
Adding changed files:  88% |###############################     | ETA:  0:00:11
Adding changed files:  88% |###############################     | ETA:  0:00:11
Adding changed files:  89% |################################    | ETA:  0:00:11
Adding changed files:  89% |################################    | ETA:  0:00:10
Adding changed files:  89% |################################    | ETA:  0:00:10
Adding changed files:  90% |################################    | ETA:  0:00:09
Adding changed files:  90% |################################    | ETA:  0:00:09
Adding changed files:  91% |################################    | ETA:  0:00:09
Adding changed files:  91% |################################    | ETA:  0:00:08
Adding changed files:  91% |#################################   | ETA:  0:00:08
Adding changed files:  92% |#################################   | ETA:  0:00:07
Adding changed files:  92% |#################################   | ETA:  0:00:07
Adding changed files:  92% |#################################   | ETA:  0:00:07
Adding changed files:  93% |#################################   | ETA:  0:00:06
Adding changed files:  93% |#################################   | ETA:  0:00:06
Adding changed files:  94% |#################################   | ETA:  0:00:06
Adding changed files:  94% |##################################  | ETA:  0:00:05
Adding changed files:  94% |##################################  | ETA:  0:00:05
Adding changed files:  95% |##################################  | ETA:  0:00:04
Adding changed files:  95% |##################################  | ETA:  0:00:04
Adding changed files:  95% |##################################  | ETA:  0:00:04
Adding changed files:  96% |##################################  | ETA:  0:00:03
Adding changed files:  96% |##################################  | ETA:  0:00:03
Adding changed files:  97% |##################################  | ETA:  0:00:02
Adding changed files:  97% |################################### | ETA:  0:00:02
Adding changed files:  97% |################################### | ETA:  0:00:02
Adding changed files:  98% |################################### | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:01:42

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.60.0-src.tar.xz;name=rust...
INFO: Rebasing devtool onto 4b9e31ef81b301819b337710699fc716a71c628c
WARNING: Command 'git rebase 4b9e31ef81b301819b337710699fc716a71c628c' failed:
CONFLICT (modify/delete): vendor/libc-0.2.108/.cargo-checksum.json deleted in HEAD and modified in 36193b962... Update checksums for modified vendored libc. Version 36193b962... Update checksums for modified vendored libc of vendor/libc-0.2.108/.cargo-checksum.json left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
vendor/libc-0.2.108/.cargo-checksum.json: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6406705693387415298==--

