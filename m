Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C986CCD1BA
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.17936.1759325535033520858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qUHtbkBy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BBJHleFR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101999ff96357-49c3c0b6-5743-442c-9652-ae4a707a4128-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vX37wY89A/vn0HXlOLb0NhQyk1gKULgWw1/h2/OWu/g=;
	b=qUHtbkByGKIoGsTgUMJTjDGWx374C/djkgdk4quQZdrxsDX65OQo8pj0cEpB9Ejf
	wb1Lfb+iFFu1tItJEwgwhI5QHopyJ633p+vuvE9XgzuvDlREMn4InvxWY03ds89XHnk
	gTQTc4jRkBJi/I/b9qSFYoxCzZYVtYn4jaXLjSJ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vX37wY89A/vn0HXlOLb0NhQyk1gKULgWw1/h2/OWu/g=;
	b=BBJHleFRA1kOFxF+45P4jjuhclqMG7Z8jpFxsSvvLTWnXI3elsEQk8Wbqd4d4ftG
	cAvN/Ox6DKZ1n1f1V0aOJINkWqqGyMm14y7y6jA8eZAijxZ+P4MFWNFnOAJbvxKn8xt
	T7wyAnKoyRAUbhgVJmBgq8OzgdJ64eZiR/HCXWdk=
Content-Type: multipart/mixed; boundary="===============8168660386165130234=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cargo-c: upgrading to 0.10.16+cargo-0.91.0 FAILED
Message-ID: <010101999ff96357-49c3c0b6-5743-442c-9652-ae4a707a4128-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224255

--===============8168660386165130234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c* to *0.10.16+cargo-0.91.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo-c -V 0.10.16+cargo-0.91.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-7b4eb011645424ed223eabd418db6bc4772ddd0e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7b4eb011645424ed223eabd418db6bc4772ddd0e"

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
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1940 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-7b4eb011645424ed223eabd418db6bc4772ddd0e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7b4eb011645424ed223eabd418db6bc4772ddd0e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:35
Adding changed files:   0% |                                    | ETA:  0:00:26
Adding changed files:   1% |                                    | ETA:  0:00:23
Adding changed files:   1% |                                    | ETA:  0:00:21
Adding changed files:   1% |                                    | ETA:  0:00:20
Adding changed files:   2% |                                    | ETA:  0:00:19
Adding changed files:   2% |                                    | ETA:  0:00:19
Adding changed files:   2% |#                                   | ETA:  0:00:18
Adding changed files:   3% |#                                   | ETA:  0:00:18
Adding changed files:   3% |#                                   | ETA:  0:00:18
Adding changed files:   4% |#                                   | ETA:  0:00:17
Adding changed files:   4% |#                                   | ETA:  0:00:17
Adding changed files:   4% |#                                   | ETA:  0:00:17
Adding changed files:   5% |#                                   | ETA:  0:00:17
Adding changed files:   5% |#                                   | ETA:  0:00:17
Adding changed files:   5% |##                                  | ETA:  0:00:17
Adding changed files:   6% |##                                  | ETA:  0:00:17
Adding changed files:   6% |##                                  | ETA:  0:00:16
Adding changed files:   6% |##                                  | ETA:  0:00:16
Adding changed files:   7% |##                                  | ETA:  0:00:16
Adding changed files:   7% |##                                  | ETA:  0:00:16
Adding changed files:   8% |##                                  | ETA:  0:00:16
Adding changed files:   8% |###                                 | ETA:  0:00:16
Adding changed files:   8% |###                                 | ETA:  0:00:16
Adding changed files:   9% |###                                 | ETA:  0:00:16
Adding changed files:   9% |###                                 | ETA:  0:00:15
Adding changed files:   9% |###                                 | ETA:  0:00:15
Adding changed files:  10% |###                                 | ETA:  0:00:15
Adding changed files:  10% |###                                 | ETA:  0:00:15
Adding changed files:  11% |###                                 | ETA:  0:00:15
Adding changed files:  11% |####                                | ETA:  0:00:15
Adding changed files:  11% |####                                | ETA:  0:00:15
Adding changed files:  12% |####                                | ETA:  0:00:15
Adding changed files:  12% |####                                | ETA:  0:00:15
Adding changed files:  12% |####                                | ETA:  0:00:15
Adding changed files:  13% |####                                | ETA:  0:00:15
Adding changed files:  13% |####                                | ETA:  0:00:14
Adding changed files:  13% |#####                               | ETA:  0:00:14
Adding changed files:  14% |#####                               | ETA:  0:00:14
Adding changed files:  14% |#####                               | ETA:  0:00:14
Adding changed files:  15% |#####                               | ETA:  0:00:14
Adding changed files:  15% |#####                               | ETA:  0:00:14
Adding changed files:  15% |#####                               | ETA:  0:00:14
Adding changed files:  16% |#####                               | ETA:  0:00:14
Adding changed files:  16% |#####                               | ETA:  0:00:14
Adding changed files:  16% |######                              | ETA:  0:00:14
Adding changed files:  17% |######                              | ETA:  0:00:14
Adding changed files:  17% |######                              | ETA:  0:00:14
Adding changed files:  17% |######                              | ETA:  0:00:14
Adding changed files:  18% |######                              | ETA:  0:00:13
Adding changed files:  18% |######                              | ETA:  0:00:13
Adding changed files:  19% |######                              | ETA:  0:00:13
Adding changed files:  19% |######                              | ETA:  0:00:13
Adding changed files:  19% |#######                             | ETA:  0:00:13
Adding changed files:  20% |#######                             | ETA:  0:00:13
Adding changed files:  20% |#######                             | ETA:  0:00:13
Adding changed files:  20% |#######                             | ETA:  0:00:13
Adding changed files:  21% |#######                             | ETA:  0:00:13
Adding changed files:  21% |#######                             | ETA:  0:00:13
Adding changed files:  22% |#######                             | ETA:  0:00:13
Adding changed files:  22% |########                            | ETA:  0:00:13
Adding changed files:  22% |########                            | ETA:  0:00:13
Adding changed files:  23% |########                            | ETA:  0:00:12
Adding changed files:  23% |########                            | ETA:  0:00:12
Adding changed files:  23% |########                            | ETA:  0:00:12
Adding changed files:  24% |########                            | ETA:  0:00:12
Adding changed files:  24% |########                            | ETA:  0:00:12
Adding changed files:  24% |########                            | ETA:  0:00:12
Adding changed files:  25% |#########                           | ETA:  0:00:12
Adding changed files:  25% |#########                           | ETA:  0:00:12
Adding changed files:  26% |#########                           | ETA:  0:00:12
Adding changed files:  26% |#########                           | ETA:  0:00:12
Adding changed files:  26% |#########                           | ETA:  0:00:12
Adding changed files:  27% |#########                           | ETA:  0:00:12
Adding changed files:  27% |#########                           | ETA:  0:00:12
Adding changed files:  27% |##########                          | ETA:  0:00:11
Adding changed files:  28% |##########                          | ETA:  0:00:11
Adding changed files:  28% |##########                          | ETA:  0:00:11
Adding changed files:  28% |##########                          | ETA:  0:00:11
Adding changed files:  29% |##########                          | ETA:  0:00:11
Adding changed files:  29% |##########                          | ETA:  0:00:11
Adding changed files:  30% |##########                          | ETA:  0:00:11
Adding changed files:  30% |##########                          | ETA:  0:00:11
Adding changed files:  30% |###########                         | ETA:  0:00:11
Adding changed files:  31% |###########                         | ETA:  0:00:11
Adding changed files:  31% |###########                         | ETA:  0:00:11
Adding changed files:  31% |###########                         | ETA:  0:00:11
Adding changed files:  32% |###########                         | ETA:  0:00:11
Adding changed files:  32% |###########                         | ETA:  0:00:11
Adding changed files:  33% |###########                         | ETA:  0:00:10
Adding changed files:  33% |############                        | ETA:  0:00:10
Adding changed files:  33% |############                        | ETA:  0:00:10
Adding changed files:  34% |############                        | ETA:  0:00:10
Adding changed files:  34% |############                        | ETA:  0:00:10
Adding changed files:  34% |############                        | ETA:  0:00:10
Adding changed files:  35% |############                        | ETA:  0:00:10
Adding changed files:  35% |############                        | ETA:  0:00:10
Adding changed files:  35% |############                        | ETA:  0:00:10
Adding changed files:  36% |#############                       | ETA:  0:00:10
Adding changed files:  36% |#############                       | ETA:  0:00:10
Adding changed files:  37% |#############                       | ETA:  0:00:10
Adding changed files:  37% |#############                       | ETA:  0:00:10
Adding changed files:  37% |#############                       | ETA:  0:00:10
Adding changed files:  38% |#############                       | ETA:  0:00:10
Adding changed files:  38% |#############                       | ETA:  0:00:09
Adding changed files:  38% |#############                       | ETA:  0:00:09
Adding changed files:  39% |##############                      | ETA:  0:00:09
Adding changed files:  39% |##############                      | ETA:  0:00:09
Adding changed files:  39% |##############                      | ETA:  0:00:09
Adding changed files:  40% |##############                      | ETA:  0:00:09
Adding changed files:  40% |##############                      | ETA:  0:00:09
Adding changed files:  41% |##############                      | ETA:  0:00:09
Adding changed files:  41% |##############                      | ETA:  0:00:09
Adding changed files:  41% |###############                     | ETA:  0:00:09
Adding changed files:  42% |###############                     | ETA:  0:00:09
Adding changed files:  42% |###############                     | ETA:  0:00:09
Adding changed files:  42% |###############                     | ETA:  0:00:09
Adding changed files:  43% |###############                     | ETA:  0:00:09
Adding changed files:  43% |###############                     | ETA:  0:00:09
Adding changed files:  44% |###############                     | ETA:  0:00:08
Adding changed files:  44% |###############                     | ETA:  0:00:08
Adding changed files:  44% |################                    | ETA:  0:00:08
Adding changed files:  45% |################                    | ETA:  0:00:08
Adding changed files:  45% |################                    | ETA:  0:00:08
Adding changed files:  45% |################                    | ETA:  0:00:08
Adding changed files:  46% |################                    | ETA:  0:00:08
Adding changed files:  46% |################                    | ETA:  0:00:08
Adding changed files:  46% |################                    | ETA:  0:00:08
Adding changed files:  47% |#################                   | ETA:  0:00:08
Adding changed files:  47% |#################                   | ETA:  0:00:08
Adding changed files:  48% |#################                   | ETA:  0:00:08
Adding changed files:  48% |#################                   | ETA:  0:00:08
Adding changed files:  48% |#################                   | ETA:  0:00:08
Adding changed files:  49% |#################                   | ETA:  0:00:08
Adding changed files:  49% |#################                   | ETA:  0:00:08
Adding changed files:  49% |#################                   | ETA:  0:00:07
Adding changed files:  50% |##################                  | ETA:  0:00:07
Adding changed files:  50% |##################                  | ETA:  0:00:07
Adding changed files:  50% |##################                  | ETA:  0:00:07
Adding changed files:  51% |##################                  | ETA:  0:00:07
Adding changed files:  51% |##################                  | ETA:  0:00:07
Adding changed files:  52% |##################                  | ETA:  0:00:07
Adding changed files:  52% |##################                  | ETA:  0:00:07
Adding changed files:  52% |###################                 | ETA:  0:00:07
Adding changed files:  53% |###################                 | ETA:  0:00:07
Adding changed files:  53% |###################                 | ETA:  0:00:07
Adding changed files:  53% |###################                 | ETA:  0:00:07
Adding changed files:  54% |###################                 | ETA:  0:00:07
Adding changed files:  54% |###################                 | ETA:  0:00:07
Adding changed files:  55% |###################                 | ETA:  0:00:07
Adding changed files:  55% |###################                 | ETA:  0:00:06
Adding changed files:  55% |####################                | ETA:  0:00:06
Adding changed files:  56% |####################                | ETA:  0:00:06
Adding changed files:  56% |####################                | ETA:  0:00:06
Adding changed files:  56% |####################                | ETA:  0:00:06
Adding changed files:  57% |####################                | ETA:  0:00:06
Adding changed files:  57% |####################                | ETA:  0:00:06
Adding changed files:  57% |####################                | ETA:  0:00:06
Adding changed files:  58% |####################                | ETA:  0:00:06
Adding changed files:  58% |#####################               | ETA:  0:00:06
Adding changed files:  59% |#####################               | ETA:  0:00:06
Adding changed files:  59% |#####################               | ETA:  0:00:06
Adding changed files:  59% |#####################               | ETA:  0:00:06
Adding changed files:  60% |#####################               | ETA:  0:00:06
Adding changed files:  60% |#####################               | ETA:  0:00:06
Adding changed files:  60% |#####################               | ETA:  0:00:06
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:05
Adding changed files:  64% |#######################             | ETA:  0:00:05
Adding changed files:  64% |#######################             | ETA:  0:00:05
Adding changed files:  64% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:05
Adding changed files:  66% |#######################             | ETA:  0:00:05
Adding changed files:  66% |#######################             | ETA:  0:00:05
Adding changed files:  66% |########################            | ETA:  0:00:05
Adding changed files:  67% |########################            | ETA:  0:00:05
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  69% |########################            | ETA:  0:00:04
Adding changed files:  69% |#########################           | ETA:  0:00:04
Adding changed files:  70% |#########################           | ETA:  0:00:04
Adding changed files:  70% |#########################           | ETA:  0:00:04
Adding changed files:  70% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  72% |##########################          | ETA:  0:00:04
Adding changed files:  72% |##########################          | ETA:  0:00:04
Adding changed files:  72% |##########################          | ETA:  0:00:04
Adding changed files:  73% |##########################          | ETA:  0:00:04
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  77% |###########################         | ETA:  0:00:03
Adding changed files:  77% |###########################         | ETA:  0:00:03
Adding changed files:  77% |###########################         | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  80% |############################        | ETA:  0:00:02
Adding changed files:  80% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  83% |#############################       | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
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
Adding changed files: 100% |####################################| Time: 0:00:14

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching crate://crates.io/cargo-c/0.10.16+cargo-0.91.0;name=cargo-c...
INFO: Rebasing devtool onto 478065096bf28f4981842dcb95e487ba40f360b2
WARNING: Command 'git rebase 478065096bf28f4981842dcb95e487ba40f360b2' failed:
CONFLICT (modify/delete): bitbake/getrandom-0.3.3/src/backends.rs deleted in HEAD and modified in f89dabc6 (Use getrandom syscall on riscv32/riscv64 linux).  Version f89dabc6 (Use getrandom syscall on riscv32/riscv64 linux) of bitbake/getrandom-0.3.3/src/backends.rs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
bitbake/getrandom-0.3.3/src/backends.rs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8168660386165130234==--

