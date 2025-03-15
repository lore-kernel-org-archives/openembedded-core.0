Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16835C369AA
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10357.1742048292608056005
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L9QKLWZL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Bb/tTFjr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101959a2b98de-188ad860-a69d-4738-ba9f-2117d83245e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nqUm0sgQR9MS0DTKZw0CRODcM8QZuFgoQeoosP7kUfw=;
	b=L9QKLWZLJZYeIdCGXfXA2iAU1kiZFKjfSJWWWeKOpJFkC/i1kqEEZrmmvZSQ2eCp
	pJYZbKcjBFlNZpyoDU5NBzgYO4nC8YS58LcgSHCCl3JsulvgvtJnKS6+2UgsYcxVXKT
	iH8oVX8O0edsqDMUzfm+9v8yewalBDh1Zk7mP+2s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nqUm0sgQR9MS0DTKZw0CRODcM8QZuFgoQeoosP7kUfw=;
	b=Bb/tTFjr8x1z7z8G5N/6jzhHqkJYOFLfAzSx46WtLF33Q7tXDLNF+YNYy7jzJp1H
	xrrEMdQz7mQUMp7tvTedSzLrhx6LzTm/LwEM66GTgtZJ1E403LtyNMNtLkKSIYG9gle
	R8CqGpQXvFWn3a7BsKpQO9iGotSRxIaTWEfBjcCc=
Content-Type: multipart/mixed; boundary="===============3235468556906082232=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo-c: upgrading to 0.10.11+cargo-0.86.0 FAILED
Message-ID: <010101959a2b98de-188ad860-a69d-4738-ba9f-2117d83245e1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212927

--===============3235468556906082232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c* to *0.10.11+cargo-0.86.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo-c -V 0.10.11+cargo-0.86.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:13c70029ab6c1019f55f32449b0aab10097ce460"

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
Parsing of 924 .bb files complete (0 cached, 924 parsed). 1885 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:13c70029ab6c1019f55f32449b0aab10097ce460"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-hkmzhug0: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-9wt88_s5/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-9wt88_s5/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:35
Adding changed files:   0% |                                    | ETA:  0:00:25
Adding changed files:   1% |                                    | ETA:  0:00:22
Adding changed files:   1% |                                    | ETA:  0:00:21
Adding changed files:   2% |                                    | ETA:  0:00:20
Adding changed files:   2% |                                    | ETA:  0:00:19
Adding changed files:   2% |#                                   | ETA:  0:00:18
Adding changed files:   3% |#                                   | ETA:  0:00:18
Adding changed files:   3% |#                                   | ETA:  0:00:18
Adding changed files:   4% |#                                   | ETA:  0:00:17
Adding changed files:   4% |#                                   | ETA:  0:00:17
Adding changed files:   4% |#                                   | ETA:  0:00:17
Adding changed files:   5% |#                                   | ETA:  0:00:17
Adding changed files:   5% |##                                  | ETA:  0:00:16
Adding changed files:   6% |##                                  | ETA:  0:00:16
Adding changed files:   6% |##                                  | ETA:  0:00:16
Adding changed files:   6% |##                                  | ETA:  0:00:16
Adding changed files:   7% |##                                  | ETA:  0:00:16
Adding changed files:   7% |##                                  | ETA:  0:00:15
Adding changed files:   8% |##                                  | ETA:  0:00:15
Adding changed files:   8% |###                                 | ETA:  0:00:15
Adding changed files:   8% |###                                 | ETA:  0:00:15
Adding changed files:   9% |###                                 | ETA:  0:00:15
Adding changed files:   9% |###                                 | ETA:  0:00:15
Adding changed files:  10% |###                                 | ETA:  0:00:15
Adding changed files:  10% |###                                 | ETA:  0:00:15
Adding changed files:  10% |###                                 | ETA:  0:00:15
Adding changed files:  11% |####                                | ETA:  0:00:14
Adding changed files:  11% |####                                | ETA:  0:00:14
Adding changed files:  12% |####                                | ETA:  0:00:14
Adding changed files:  12% |####                                | ETA:  0:00:14
Adding changed files:  12% |####                                | ETA:  0:00:14
Adding changed files:  13% |####                                | ETA:  0:00:14
Adding changed files:  13% |####                                | ETA:  0:00:14
Adding changed files:  14% |#####                               | ETA:  0:00:14
Adding changed files:  14% |#####                               | ETA:  0:00:14
Adding changed files:  14% |#####                               | ETA:  0:00:14
Adding changed files:  15% |#####                               | ETA:  0:00:14
Adding changed files:  15% |#####                               | ETA:  0:00:13
Adding changed files:  16% |#####                               | ETA:  0:00:13
Adding changed files:  16% |#####                               | ETA:  0:00:13
Adding changed files:  16% |######                              | ETA:  0:00:13
Adding changed files:  17% |######                              | ETA:  0:00:13
Adding changed files:  17% |######                              | ETA:  0:00:13
Adding changed files:  18% |######                              | ETA:  0:00:13
Adding changed files:  18% |######                              | ETA:  0:00:13
Adding changed files:  18% |######                              | ETA:  0:00:13
Adding changed files:  19% |######                              | ETA:  0:00:13
Adding changed files:  19% |#######                             | ETA:  0:00:13
Adding changed files:  20% |#######                             | ETA:  0:00:13
Adding changed files:  20% |#######                             | ETA:  0:00:12
Adding changed files:  20% |#######                             | ETA:  0:00:12
Adding changed files:  21% |#######                             | ETA:  0:00:12
Adding changed files:  21% |#######                             | ETA:  0:00:12
Adding changed files:  22% |#######                             | ETA:  0:00:12
Adding changed files:  22% |########                            | ETA:  0:00:12
Adding changed files:  22% |########                            | ETA:  0:00:12
Adding changed files:  23% |########                            | ETA:  0:00:12
Adding changed files:  23% |########                            | ETA:  0:00:12
Adding changed files:  24% |########                            | ETA:  0:00:12
Adding changed files:  24% |########                            | ETA:  0:00:12
Adding changed files:  24% |########                            | ETA:  0:00:12
Adding changed files:  25% |#########                           | ETA:  0:00:12
Adding changed files:  25% |#########                           | ETA:  0:00:11
Adding changed files:  26% |#########                           | ETA:  0:00:11
Adding changed files:  26% |#########                           | ETA:  0:00:11
Adding changed files:  26% |#########                           | ETA:  0:00:11
Adding changed files:  27% |#########                           | ETA:  0:00:11
Adding changed files:  27% |#########                           | ETA:  0:00:11
Adding changed files:  28% |##########                          | ETA:  0:00:11
Adding changed files:  28% |##########                          | ETA:  0:00:11
Adding changed files:  28% |##########                          | ETA:  0:00:11
Adding changed files:  29% |##########                          | ETA:  0:00:11
Adding changed files:  29% |##########                          | ETA:  0:00:11
Adding changed files:  30% |##########                          | ETA:  0:00:11
Adding changed files:  30% |##########                          | ETA:  0:00:11
Adding changed files:  30% |###########                         | ETA:  0:00:10
Adding changed files:  31% |###########                         | ETA:  0:00:10
Adding changed files:  31% |###########                         | ETA:  0:00:10
Adding changed files:  32% |###########                         | ETA:  0:00:10
Adding changed files:  32% |###########                         | ETA:  0:00:10
Adding changed files:  32% |###########                         | ETA:  0:00:10
Adding changed files:  33% |###########                         | ETA:  0:00:10
Adding changed files:  33% |############                        | ETA:  0:00:10
Adding changed files:  34% |############                        | ETA:  0:00:10
Adding changed files:  34% |############                        | ETA:  0:00:10
Adding changed files:  34% |############                        | ETA:  0:00:10
Adding changed files:  35% |############                        | ETA:  0:00:10
Adding changed files:  35% |############                        | ETA:  0:00:10
Adding changed files:  36% |#############                       | ETA:  0:00:10
Adding changed files:  36% |#############                       | ETA:  0:00:09
Adding changed files:  36% |#############                       | ETA:  0:00:09
Adding changed files:  37% |#############                       | ETA:  0:00:09
Adding changed files:  37% |#############                       | ETA:  0:00:09
Adding changed files:  38% |#############                       | ETA:  0:00:09
Adding changed files:  38% |#############                       | ETA:  0:00:09
Adding changed files:  38% |##############                      | ETA:  0:00:09
Adding changed files:  39% |##############                      | ETA:  0:00:09
Adding changed files:  39% |##############                      | ETA:  0:00:09
Adding changed files:  40% |##############                      | ETA:  0:00:09
Adding changed files:  40% |##############                      | ETA:  0:00:09
Adding changed files:  40% |##############                      | ETA:  0:00:09
Adding changed files:  41% |##############                      | ETA:  0:00:09
Adding changed files:  41% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:08
Adding changed files:  43% |###############                     | ETA:  0:00:08
Adding changed files:  43% |###############                     | ETA:  0:00:08
Adding changed files:  44% |###############                     | ETA:  0:00:08
Adding changed files:  44% |################                    | ETA:  0:00:08
Adding changed files:  44% |################                    | ETA:  0:00:08
Adding changed files:  45% |################                    | ETA:  0:00:08
Adding changed files:  45% |################                    | ETA:  0:00:08
Adding changed files:  46% |################                    | ETA:  0:00:08
Adding changed files:  46% |################                    | ETA:  0:00:08
Adding changed files:  46% |################                    | ETA:  0:00:08
Adding changed files:  47% |#################                   | ETA:  0:00:07
Adding changed files:  47% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  49% |#################                   | ETA:  0:00:07
Adding changed files:  49% |#################                   | ETA:  0:00:07
Adding changed files:  50% |##################                  | ETA:  0:00:07
Adding changed files:  50% |##################                  | ETA:  0:00:07
Adding changed files:  50% |##################                  | ETA:  0:00:07
Adding changed files:  51% |##################                  | ETA:  0:00:07
Adding changed files:  51% |##################                  | ETA:  0:00:07
Adding changed files:  52% |##################                  | ETA:  0:00:07
Adding changed files:  52% |##################                  | ETA:  0:00:07
Adding changed files:  52% |###################                 | ETA:  0:00:07
Adding changed files:  53% |###################                 | ETA:  0:00:06
Adding changed files:  53% |###################                 | ETA:  0:00:06
Adding changed files:  54% |###################                 | ETA:  0:00:06
Adding changed files:  54% |###################                 | ETA:  0:00:06
Adding changed files:  55% |###################                 | ETA:  0:00:06
Adding changed files:  55% |###################                 | ETA:  0:00:06
Adding changed files:  55% |####################                | ETA:  0:00:06
Adding changed files:  56% |####################                | ETA:  0:00:06
Adding changed files:  56% |####################                | ETA:  0:00:06
Adding changed files:  57% |####################                | ETA:  0:00:06
Adding changed files:  57% |####################                | ETA:  0:00:06
Adding changed files:  57% |####################                | ETA:  0:00:06
Adding changed files:  58% |####################                | ETA:  0:00:06
Adding changed files:  58% |#####################               | ETA:  0:00:06
Adding changed files:  59% |#####################               | ETA:  0:00:06
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  60% |#####################               | ETA:  0:00:05
Adding changed files:  60% |#####################               | ETA:  0:00:05
Adding changed files:  61% |#####################               | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:05
Adding changed files:  64% |#######################             | ETA:  0:00:05
Adding changed files:  64% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  66% |#######################             | ETA:  0:00:04
Adding changed files:  66% |#######################             | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  69% |########################            | ETA:  0:00:04
Adding changed files:  69% |#########################           | ETA:  0:00:04
Adding changed files:  69% |#########################           | ETA:  0:00:04
Adding changed files:  70% |#########################           | ETA:  0:00:04
Adding changed files:  70% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  72% |##########################          | ETA:  0:00:03
Adding changed files:  72% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  77% |###########################         | ETA:  0:00:03
Adding changed files:  77% |###########################         | ETA:  0:00:03
Adding changed files:  77% |############################        | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  80% |############################        | ETA:  0:00:02
Adding changed files:  80% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  83% |#############################       | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
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
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:13

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching crate://crates.io/cargo-c/0.10.11+cargo-0.86.0;name=cargo-c...
INFO: Rebasing devtool onto a773051377da62eb56965bd4631bc3fbb3cdbe68
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 352, in <module>
    ret = main()
          ^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 610, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 509, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/cargo-c/cargo_home/bitbake/cargo-c-0.10.5+cargo-0.83.0/LICENSE'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3235468556906082232==--

