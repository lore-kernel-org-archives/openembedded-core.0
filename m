Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3119C71135
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:44 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.27794.1748786131003985116
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cWa/SGiG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=j1lINYxK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101972bc6daf7-c131ac0d-7faf-42be-90b4-209cebccb34c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786142;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ibtRHMmbd+tVPXo6/E2QFZGXZQdKKCHdBhRPb25/Z50=;
	b=cWa/SGiGo6UcGXL/SxLYbkTi0EgigdRN89BnDAfyemD2MzNBJJeTMWtpg0cqFOnP
	d7xkWKHMsKZHE/vxdMpk27U91XpA5ANyHk7LgIsgsSQUgyuV3+TNteefZrySf3NCEU/
	wwBCwRudNsUHo4laVbZr418U42CiVBBvVYO9FPxc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786142;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ibtRHMmbd+tVPXo6/E2QFZGXZQdKKCHdBhRPb25/Z50=;
	b=j1lINYxKzrBIm5Xie19k+vhSwECAjzJKWkZymsyW/KoinC92GOQvKW5zj7RN91Un
	QJyUAEeL7xlT1uDAi95/yPhIrVkYp8j3ZOGqe8ulKM2WLkY0P/QsB1/uxLrwPaojcSu
	DLyiOwzoRD04GdSCH6Q0XuNKWGX0AXpxL2h8tn1w=
Content-Type: multipart/mixed; boundary="===============1402194143003587740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo-c: upgrading to 0.10.13+cargo-0.88.0 FAILED
Message-ID: <010101972bc6daf7-c131ac0d-7faf-42be-90b4-209cebccb34c-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217625

--===============1402194143003587740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c* to *0.10.13+cargo-0.88.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo-c -V 0.10.13+cargo-0.88.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4e4cefca8032decdbf8a9b24a63b1217e78dbd07"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4e4cefca8032decdbf8a9b24a63b1217e78dbd07"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-b6z70grr: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-0zomfs7c/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-0zomfs7c/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:31
Adding changed files:   0% |                                    | ETA:  0:00:23
Adding changed files:   1% |                                    | ETA:  0:00:20
Adding changed files:   1% |                                    | ETA:  0:00:18
Adding changed files:   2% |                                    | ETA:  0:00:17
Adding changed files:   2% |                                    | ETA:  0:00:17
Adding changed files:   2% |#                                   | ETA:  0:00:16
Adding changed files:   3% |#                                   | ETA:  0:00:16
Adding changed files:   3% |#                                   | ETA:  0:00:15
Adding changed files:   4% |#                                   | ETA:  0:00:15
Adding changed files:   4% |#                                   | ETA:  0:00:15
Adding changed files:   4% |#                                   | ETA:  0:00:15
Adding changed files:   5% |#                                   | ETA:  0:00:15
Adding changed files:   5% |##                                  | ETA:  0:00:15
Adding changed files:   6% |##                                  | ETA:  0:00:14
Adding changed files:   6% |##                                  | ETA:  0:00:14
Adding changed files:   6% |##                                  | ETA:  0:00:14
Adding changed files:   7% |##                                  | ETA:  0:00:14
Adding changed files:   7% |##                                  | ETA:  0:00:14
Adding changed files:   8% |##                                  | ETA:  0:00:14
Adding changed files:   8% |###                                 | ETA:  0:00:14
Adding changed files:   8% |###                                 | ETA:  0:00:14
Adding changed files:   9% |###                                 | ETA:  0:00:13
Adding changed files:   9% |###                                 | ETA:  0:00:13
Adding changed files:  10% |###                                 | ETA:  0:00:13
Adding changed files:  10% |###                                 | ETA:  0:00:13
Adding changed files:  10% |###                                 | ETA:  0:00:13
Adding changed files:  11% |####                                | ETA:  0:00:13
Adding changed files:  11% |####                                | ETA:  0:00:13
Adding changed files:  12% |####                                | ETA:  0:00:13
Adding changed files:  12% |####                                | ETA:  0:00:13
Adding changed files:  12% |####                                | ETA:  0:00:13
Adding changed files:  13% |####                                | ETA:  0:00:13
Adding changed files:  13% |####                                | ETA:  0:00:12
Adding changed files:  14% |#####                               | ETA:  0:00:12
Adding changed files:  14% |#####                               | ETA:  0:00:12
Adding changed files:  14% |#####                               | ETA:  0:00:12
Adding changed files:  15% |#####                               | ETA:  0:00:12
Adding changed files:  15% |#####                               | ETA:  0:00:12
Adding changed files:  16% |#####                               | ETA:  0:00:12
Adding changed files:  16% |#####                               | ETA:  0:00:12
Adding changed files:  16% |######                              | ETA:  0:00:12
Adding changed files:  17% |######                              | ETA:  0:00:12
Adding changed files:  17% |######                              | ETA:  0:00:12
Adding changed files:  18% |######                              | ETA:  0:00:12
Adding changed files:  18% |######                              | ETA:  0:00:12
Adding changed files:  18% |######                              | ETA:  0:00:11
Adding changed files:  19% |######                              | ETA:  0:00:11
Adding changed files:  19% |#######                             | ETA:  0:00:11
Adding changed files:  20% |#######                             | ETA:  0:00:11
Adding changed files:  20% |#######                             | ETA:  0:00:11
Adding changed files:  20% |#######                             | ETA:  0:00:11
Adding changed files:  21% |#######                             | ETA:  0:00:11
Adding changed files:  21% |#######                             | ETA:  0:00:11
Adding changed files:  22% |#######                             | ETA:  0:00:11
Adding changed files:  22% |########                            | ETA:  0:00:11
Adding changed files:  22% |########                            | ETA:  0:00:11
Adding changed files:  23% |########                            | ETA:  0:00:11
Adding changed files:  23% |########                            | ETA:  0:00:11
Adding changed files:  24% |########                            | ETA:  0:00:11
Adding changed files:  24% |########                            | ETA:  0:00:10
Adding changed files:  24% |########                            | ETA:  0:00:10
Adding changed files:  25% |#########                           | ETA:  0:00:10
Adding changed files:  25% |#########                           | ETA:  0:00:10
Adding changed files:  26% |#########                           | ETA:  0:00:10
Adding changed files:  26% |#########                           | ETA:  0:00:10
Adding changed files:  26% |#########                           | ETA:  0:00:10
Adding changed files:  27% |#########                           | ETA:  0:00:10
Adding changed files:  27% |#########                           | ETA:  0:00:10
Adding changed files:  28% |##########                          | ETA:  0:00:10
Adding changed files:  28% |##########                          | ETA:  0:00:10
Adding changed files:  28% |##########                          | ETA:  0:00:10
Adding changed files:  29% |##########                          | ETA:  0:00:10
Adding changed files:  29% |##########                          | ETA:  0:00:10
Adding changed files:  30% |##########                          | ETA:  0:00:10
Adding changed files:  30% |##########                          | ETA:  0:00:09
Adding changed files:  30% |###########                         | ETA:  0:00:09
Adding changed files:  31% |###########                         | ETA:  0:00:09
Adding changed files:  31% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:09
Adding changed files:  33% |###########                         | ETA:  0:00:09
Adding changed files:  33% |############                        | ETA:  0:00:09
Adding changed files:  34% |############                        | ETA:  0:00:09
Adding changed files:  34% |############                        | ETA:  0:00:09
Adding changed files:  34% |############                        | ETA:  0:00:09
Adding changed files:  35% |############                        | ETA:  0:00:09
Adding changed files:  35% |############                        | ETA:  0:00:09
Adding changed files:  36% |#############                       | ETA:  0:00:09
Adding changed files:  36% |#############                       | ETA:  0:00:08
Adding changed files:  36% |#############                       | ETA:  0:00:08
Adding changed files:  37% |#############                       | ETA:  0:00:08
Adding changed files:  37% |#############                       | ETA:  0:00:08
Adding changed files:  38% |#############                       | ETA:  0:00:08
Adding changed files:  38% |#############                       | ETA:  0:00:08
Adding changed files:  38% |##############                      | ETA:  0:00:08
Adding changed files:  39% |##############                      | ETA:  0:00:08
Adding changed files:  39% |##############                      | ETA:  0:00:08
Adding changed files:  40% |##############                      | ETA:  0:00:08
Adding changed files:  40% |##############                      | ETA:  0:00:08
Adding changed files:  40% |##############                      | ETA:  0:00:08
Adding changed files:  41% |##############                      | ETA:  0:00:08
Adding changed files:  41% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:07
Adding changed files:  43% |###############                     | ETA:  0:00:07
Adding changed files:  43% |###############                     | ETA:  0:00:07
Adding changed files:  44% |###############                     | ETA:  0:00:07
Adding changed files:  44% |################                    | ETA:  0:00:07
Adding changed files:  44% |################                    | ETA:  0:00:07
Adding changed files:  45% |################                    | ETA:  0:00:07
Adding changed files:  45% |################                    | ETA:  0:00:07
Adding changed files:  46% |################                    | ETA:  0:00:07
Adding changed files:  46% |################                    | ETA:  0:00:07
Adding changed files:  46% |################                    | ETA:  0:00:07
Adding changed files:  47% |#################                   | ETA:  0:00:07
Adding changed files:  47% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  49% |#################                   | ETA:  0:00:06
Adding changed files:  49% |#################                   | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  51% |##################                  | ETA:  0:00:06
Adding changed files:  51% |##################                  | ETA:  0:00:06
Adding changed files:  52% |##################                  | ETA:  0:00:06
Adding changed files:  52% |##################                  | ETA:  0:00:06
Adding changed files:  52% |###################                 | ETA:  0:00:06
Adding changed files:  53% |###################                 | ETA:  0:00:06
Adding changed files:  53% |###################                 | ETA:  0:00:06
Adding changed files:  54% |###################                 | ETA:  0:00:06
Adding changed files:  54% |###################                 | ETA:  0:00:06
Adding changed files:  55% |###################                 | ETA:  0:00:06
Adding changed files:  55% |###################                 | ETA:  0:00:06
Adding changed files:  55% |####################                | ETA:  0:00:06
Adding changed files:  56% |####################                | ETA:  0:00:05
Adding changed files:  56% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  58% |####################                | ETA:  0:00:05
Adding changed files:  58% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  60% |#####################               | ETA:  0:00:05
Adding changed files:  60% |#####################               | ETA:  0:00:05
Adding changed files:  61% |#####################               | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  64% |#######################             | ETA:  0:00:04
Adding changed files:  64% |#######################             | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
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
Adding changed files:  69% |#########################           | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
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
Adding changed files:  77% |###########################         | ETA:  0:00:02
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
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  83% |#############################       | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
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
Adding changed files:  92% |#################################   | ETA:  0:00:00
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
Adding changed files: 100% |####################################| Time: 0:00:12

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching crate://crates.io/cargo-c/0.10.13+cargo-0.88.0;name=cargo-c...
INFO: Rebasing devtool onto 944b906203a7de50156c358c43ab3a5c57d8cc10
WARNING: Command 'git rebase 944b906203a7de50156c358c43ab3a5c57d8cc10' failed:
CONFLICT (modify/delete): cargo_home/bitbake/libc-0.2.161/src/unix/linux_like/linux/arch/generic/mod.rs deleted in HEAD and modified in 3695cd28 (Define more ioctl codes on riscv32gc-unknown-linux-gnu).  Version 3695cd28 (Define more ioctl codes on riscv32gc-unknown-linux-gnu) of cargo_home/bitbake/libc-0.2.161/src/unix/linux_like/linux/arch/generic/mod.rs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
cargo_home/bitbake/libc-0.2.161/src/unix/linux_like/linux/arch/generic/mod.rs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1402194143003587740==--

