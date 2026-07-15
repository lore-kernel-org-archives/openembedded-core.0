Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB70C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 05:40:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.470.1784093996785564608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 22:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yeo/YFZN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ESX5SVPu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f6449f39f-a6a6234e-d635-4cdd-9667-55ce7ca7215e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784093996;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lkcjdV094VDleLL2L94kQgJX/JxtRsuaGKgmMQOYG7I=;
	b=Yeo/YFZN3YffQE8eentLYmHPErNTW9a2XUkUt5Gbl+RlKgeSOMwxZ6Y5wMVGni3t
	m2zO8sJc812dHXnuPiBBJgH6UgORuPvrJRmO7oLQ2dUD6gUlnEjnWwcgv8e+888TKM2
	LBKrna6g+6Kr6EmPgAr7ulrQraXXMRhQFtMRzWOQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784093996;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lkcjdV094VDleLL2L94kQgJX/JxtRsuaGKgmMQOYG7I=;
	b=ESX5SVPuuBdni5v9YAy55Om5TsBUese+gLFnMG49QlcvJyyLbGp54O8qWY0qIyTN
	ut3tL+LiYowtSRVRDrbBk6yh9qKidxeItrLrhQBnQKz+26hM7EqfoHJRRqtcK8phDjH
	MR2wQlNAZ+wEkt+jFkWT2H5fVAKpW4OfTAqtKdMo=
Content-Type: multipart/mixed; boundary="===============5695273694634532051=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo-c: upgrading to 0.10.24+cargo-0.98.0 FAILED
Message-ID: <0101019f6449f39f-a6a6234e-d635-4cdd-9667-55ce7ca7215e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jul 2026 05:39:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240935

--===============5695273694634532051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c* to *0.10.24+cargo-0.98.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo-c -V 0.10.24+cargo-0.98.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-75ddd3bb4c04a36973db1dca1e21617be9329363"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:75ddd3bb4c04a36973db1dca1e21617be9329363"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-75ddd3bb4c04a36973db1dca1e21617be9329363"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:75ddd3bb4c04a36973db1dca1e21617be9329363"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
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
Adding changed files:   0% |                                    | ETA:  0:00:40
Adding changed files:   0% |                                    | ETA:  0:00:29
Adding changed files:   1% |                                    | ETA:  0:00:26
Adding changed files:   1% |                                    | ETA:  0:00:24
Adding changed files:   1% |                                    | ETA:  0:00:23
Adding changed files:   2% |                                    | ETA:  0:00:22
Adding changed files:   2% |                                    | ETA:  0:00:21
Adding changed files:   2% |                                    | ETA:  0:00:21
Adding changed files:   3% |#                                   | ETA:  0:00:20
Adding changed files:   3% |#                                   | ETA:  0:00:20
Adding changed files:   3% |#                                   | ETA:  0:00:20
Adding changed files:   4% |#                                   | ETA:  0:00:20
Adding changed files:   4% |#                                   | ETA:  0:00:19
Adding changed files:   4% |#                                   | ETA:  0:00:19
Adding changed files:   5% |#                                   | ETA:  0:00:19
Adding changed files:   5% |#                                   | ETA:  0:00:19
Adding changed files:   5% |##                                  | ETA:  0:00:19
Adding changed files:   6% |##                                  | ETA:  0:00:19
Adding changed files:   6% |##                                  | ETA:  0:00:18
Adding changed files:   6% |##                                  | ETA:  0:00:18
Adding changed files:   7% |##                                  | ETA:  0:00:18
Adding changed files:   7% |##                                  | ETA:  0:00:18
Adding changed files:   7% |##                                  | ETA:  0:00:18
Adding changed files:   8% |##                                  | ETA:  0:00:18
Adding changed files:   8% |###                                 | ETA:  0:00:18
Adding changed files:   8% |###                                 | ETA:  0:00:18
Adding changed files:   9% |###                                 | ETA:  0:00:18
Adding changed files:   9% |###                                 | ETA:  0:00:17
Adding changed files:   9% |###                                 | ETA:  0:00:17
Adding changed files:  10% |###                                 | ETA:  0:00:17
Adding changed files:  10% |###                                 | ETA:  0:00:17
Adding changed files:  10% |###                                 | ETA:  0:00:17
Adding changed files:  11% |###                                 | ETA:  0:00:17
Adding changed files:  11% |####                                | ETA:  0:00:17
Adding changed files:  11% |####                                | ETA:  0:00:17
Adding changed files:  12% |####                                | ETA:  0:00:17
Adding changed files:  12% |####                                | ETA:  0:00:17
Adding changed files:  12% |####                                | ETA:  0:00:17
Adding changed files:  13% |####                                | ETA:  0:00:16
Adding changed files:  13% |####                                | ETA:  0:00:16
Adding changed files:  13% |####                                | ETA:  0:00:16
Adding changed files:  14% |#####                               | ETA:  0:00:16
Adding changed files:  14% |#####                               | ETA:  0:00:16
Adding changed files:  14% |#####                               | ETA:  0:00:16
Adding changed files:  15% |#####                               | ETA:  0:00:16
Adding changed files:  15% |#####                               | ETA:  0:00:16
Adding changed files:  15% |#####                               | ETA:  0:00:16
Adding changed files:  16% |#####                               | ETA:  0:00:16
Adding changed files:  16% |#####                               | ETA:  0:00:16
Adding changed files:  16% |######                              | ETA:  0:00:16
Adding changed files:  17% |######                              | ETA:  0:00:15
Adding changed files:  17% |######                              | ETA:  0:00:15
Adding changed files:  17% |######                              | ETA:  0:00:15
Adding changed files:  18% |######                              | ETA:  0:00:15
Adding changed files:  18% |######                              | ETA:  0:00:15
Adding changed files:  18% |######                              | ETA:  0:00:15
Adding changed files:  19% |######                              | ETA:  0:00:15
Adding changed files:  19% |#######                             | ETA:  0:00:15
Adding changed files:  19% |#######                             | ETA:  0:00:15
Adding changed files:  20% |#######                             | ETA:  0:00:15
Adding changed files:  20% |#######                             | ETA:  0:00:15
Adding changed files:  20% |#######                             | ETA:  0:00:15
Adding changed files:  21% |#######                             | ETA:  0:00:14
Adding changed files:  21% |#######                             | ETA:  0:00:14
Adding changed files:  21% |#######                             | ETA:  0:00:14
Adding changed files:  22% |#######                             | ETA:  0:00:14
Adding changed files:  22% |########                            | ETA:  0:00:14
Adding changed files:  22% |########                            | ETA:  0:00:14
Adding changed files:  23% |########                            | ETA:  0:00:14
Adding changed files:  23% |########                            | ETA:  0:00:14
Adding changed files:  23% |########                            | ETA:  0:00:14
Adding changed files:  24% |########                            | ETA:  0:00:14
Adding changed files:  24% |########                            | ETA:  0:00:14
Adding changed files:  24% |########                            | ETA:  0:00:14
Adding changed files:  25% |#########                           | ETA:  0:00:14
Adding changed files:  25% |#########                           | ETA:  0:00:13
Adding changed files:  25% |#########                           | ETA:  0:00:13
Adding changed files:  26% |#########                           | ETA:  0:00:13
Adding changed files:  26% |#########                           | ETA:  0:00:13
Adding changed files:  26% |#########                           | ETA:  0:00:13
Adding changed files:  27% |#########                           | ETA:  0:00:13
Adding changed files:  27% |#########                           | ETA:  0:00:13
Adding changed files:  27% |##########                          | ETA:  0:00:13
Adding changed files:  28% |##########                          | ETA:  0:00:13
Adding changed files:  28% |##########                          | ETA:  0:00:13
Adding changed files:  28% |##########                          | ETA:  0:00:13
Adding changed files:  29% |##########                          | ETA:  0:00:13
Adding changed files:  29% |##########                          | ETA:  0:00:13
Adding changed files:  29% |##########                          | ETA:  0:00:12
Adding changed files:  30% |##########                          | ETA:  0:00:12
Adding changed files:  30% |##########                          | ETA:  0:00:12
Adding changed files:  30% |###########                         | ETA:  0:00:12
Adding changed files:  31% |###########                         | ETA:  0:00:12
Adding changed files:  31% |###########                         | ETA:  0:00:12
Adding changed files:  31% |###########                         | ETA:  0:00:12
Adding changed files:  32% |###########                         | ETA:  0:00:12
Adding changed files:  32% |###########                         | ETA:  0:00:12
Adding changed files:  32% |###########                         | ETA:  0:00:12
Adding changed files:  33% |###########                         | ETA:  0:00:12
Adding changed files:  33% |############                        | ETA:  0:00:12
Adding changed files:  33% |############                        | ETA:  0:00:12
Adding changed files:  34% |############                        | ETA:  0:00:12
Adding changed files:  34% |############                        | ETA:  0:00:11
Adding changed files:  34% |############                        | ETA:  0:00:11
Adding changed files:  35% |############                        | ETA:  0:00:11
Adding changed files:  35% |############                        | ETA:  0:00:11
Adding changed files:  35% |############                        | ETA:  0:00:11
Adding changed files:  36% |#############                       | ETA:  0:00:11
Adding changed files:  36% |#############                       | ETA:  0:00:11
Adding changed files:  36% |#############                       | ETA:  0:00:11
Adding changed files:  37% |#############                       | ETA:  0:00:11
Adding changed files:  37% |#############                       | ETA:  0:00:11
Adding changed files:  37% |#############                       | ETA:  0:00:11
Adding changed files:  38% |#############                       | ETA:  0:00:11
Adding changed files:  38% |#############                       | ETA:  0:00:11
Adding changed files:  38% |##############                      | ETA:  0:00:11
Adding changed files:  39% |##############                      | ETA:  0:00:11
Adding changed files:  39% |##############                      | ETA:  0:00:10
Adding changed files:  39% |##############                      | ETA:  0:00:10
Adding changed files:  40% |##############                      | ETA:  0:00:10
Adding changed files:  40% |##############                      | ETA:  0:00:10
Adding changed files:  40% |##############                      | ETA:  0:00:10
Adding changed files:  41% |##############                      | ETA:  0:00:10
Adding changed files:  41% |##############                      | ETA:  0:00:10
Adding changed files:  41% |###############                     | ETA:  0:00:10
Adding changed files:  42% |###############                     | ETA:  0:00:10
Adding changed files:  42% |###############                     | ETA:  0:00:10
Adding changed files:  42% |###############                     | ETA:  0:00:10
Adding changed files:  43% |###############                     | ETA:  0:00:10
Adding changed files:  43% |###############                     | ETA:  0:00:10
Adding changed files:  43% |###############                     | ETA:  0:00:10
Adding changed files:  44% |###############                     | ETA:  0:00:10
Adding changed files:  44% |################                    | ETA:  0:00:09
Adding changed files:  44% |################                    | ETA:  0:00:09
Adding changed files:  45% |################                    | ETA:  0:00:09
Adding changed files:  45% |################                    | ETA:  0:00:09
Adding changed files:  45% |################                    | ETA:  0:00:09
Adding changed files:  46% |################                    | ETA:  0:00:09
Adding changed files:  46% |################                    | ETA:  0:00:09
Adding changed files:  46% |################                    | ETA:  0:00:09
Adding changed files:  47% |#################                   | ETA:  0:00:09
Adding changed files:  47% |#################                   | ETA:  0:00:09
Adding changed files:  47% |#################                   | ETA:  0:00:09
Adding changed files:  48% |#################                   | ETA:  0:00:09
Adding changed files:  48% |#################                   | ETA:  0:00:09
Adding changed files:  48% |#################                   | ETA:  0:00:09
Adding changed files:  49% |#################                   | ETA:  0:00:09
Adding changed files:  49% |#################                   | ETA:  0:00:08
Adding changed files:  49% |#################                   | ETA:  0:00:08
Adding changed files:  50% |##################                  | ETA:  0:00:08
Adding changed files:  50% |##################                  | ETA:  0:00:08
Adding changed files:  50% |##################                  | ETA:  0:00:08
Adding changed files:  51% |##################                  | ETA:  0:00:08
Adding changed files:  51% |##################                  | ETA:  0:00:08
Adding changed files:  51% |##################                  | ETA:  0:00:08
Adding changed files:  52% |##################                  | ETA:  0:00:08
Adding changed files:  52% |##################                  | ETA:  0:00:08
Adding changed files:  53% |###################                 | ETA:  0:00:08
Adding changed files:  53% |###################                 | ETA:  0:00:08
Adding changed files:  53% |###################                 | ETA:  0:00:08
Adding changed files:  54% |###################                 | ETA:  0:00:08
Adding changed files:  54% |###################                 | ETA:  0:00:08
Adding changed files:  54% |###################                 | ETA:  0:00:07
Adding changed files:  55% |###################                 | ETA:  0:00:07
Adding changed files:  55% |###################                 | ETA:  0:00:07
Adding changed files:  55% |####################                | ETA:  0:00:07
Adding changed files:  56% |####################                | ETA:  0:00:07
Adding changed files:  56% |####################                | ETA:  0:00:07
Adding changed files:  56% |####################                | ETA:  0:00:07
Adding changed files:  57% |####################                | ETA:  0:00:07
Adding changed files:  57% |####################                | ETA:  0:00:07
Adding changed files:  57% |####################                | ETA:  0:00:07
Adding changed files:  58% |####################                | ETA:  0:00:07
Adding changed files:  58% |#####################               | ETA:  0:00:07
Adding changed files:  58% |#####################               | ETA:  0:00:07
Adding changed files:  59% |#####################               | ETA:  0:00:07
Adding changed files:  59% |#####################               | ETA:  0:00:07
Adding changed files:  59% |#####################               | ETA:  0:00:06
Adding changed files:  60% |#####################               | ETA:  0:00:06
Adding changed files:  60% |#####################               | ETA:  0:00:06
Adding changed files:  60% |#####################               | ETA:  0:00:06
Adding changed files:  61% |#####################               | ETA:  0:00:06
Adding changed files:  61% |######################              | ETA:  0:00:06
Adding changed files:  61% |######################              | ETA:  0:00:06
Adding changed files:  62% |######################              | ETA:  0:00:06
Adding changed files:  62% |######################              | ETA:  0:00:06
Adding changed files:  62% |######################              | ETA:  0:00:06
Adding changed files:  63% |######################              | ETA:  0:00:06
Adding changed files:  63% |######################              | ETA:  0:00:06
Adding changed files:  63% |######################              | ETA:  0:00:06
Adding changed files:  64% |#######################             | ETA:  0:00:06
Adding changed files:  64% |#######################             | ETA:  0:00:06
Adding changed files:  64% |#######################             | ETA:  0:00:06
Adding changed files:  65% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:05
Adding changed files:  65% |#######################             | ETA:  0:00:05
Adding changed files:  66% |#######################             | ETA:  0:00:05
Adding changed files:  66% |#######################             | ETA:  0:00:05
Adding changed files:  66% |########################            | ETA:  0:00:05
Adding changed files:  67% |########################            | ETA:  0:00:05
Adding changed files:  67% |########################            | ETA:  0:00:05
Adding changed files:  67% |########################            | ETA:  0:00:05
Adding changed files:  68% |########################            | ETA:  0:00:05
Adding changed files:  68% |########################            | ETA:  0:00:05
Adding changed files:  68% |########################            | ETA:  0:00:05
Adding changed files:  69% |########################            | ETA:  0:00:05
Adding changed files:  69% |########################            | ETA:  0:00:05
Adding changed files:  69% |#########################           | ETA:  0:00:05
Adding changed files:  70% |#########################           | ETA:  0:00:05
Adding changed files:  70% |#########################           | ETA:  0:00:05
Adding changed files:  70% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  71% |#########################           | ETA:  0:00:04
Adding changed files:  72% |#########################           | ETA:  0:00:04
Adding changed files:  72% |##########################          | ETA:  0:00:04
Adding changed files:  72% |##########################          | ETA:  0:00:04
Adding changed files:  73% |##########################          | ETA:  0:00:04
Adding changed files:  73% |##########################          | ETA:  0:00:04
Adding changed files:  73% |##########################          | ETA:  0:00:04
Adding changed files:  74% |##########################          | ETA:  0:00:04
Adding changed files:  74% |##########################          | ETA:  0:00:04
Adding changed files:  74% |##########################          | ETA:  0:00:04
Adding changed files:  75% |###########################         | ETA:  0:00:04
Adding changed files:  75% |###########################         | ETA:  0:00:04
Adding changed files:  75% |###########################         | ETA:  0:00:04
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  77% |###########################         | ETA:  0:00:03
Adding changed files:  77% |###########################         | ETA:  0:00:03
Adding changed files:  77% |############################        | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  78% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:03
Adding changed files:  79% |############################        | ETA:  0:00:03
Adding changed files:  80% |############################        | ETA:  0:00:03
Adding changed files:  80% |############################        | ETA:  0:00:03
Adding changed files:  80% |#############################       | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  83% |#############################       | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
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
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
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
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:15

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching crate://crates.io/cargo-c/0.10.24+cargo-0.98.0;name=cargo-c...
INFO: Rebasing devtool onto 33f65036c3abb9d7cc460e09bdc10791939cbb45
WARNING: Command 'git rebase 33f65036c3abb9d7cc460e09bdc10791939cbb45' failed:
CONFLICT (modify/delete): bitbake/parking_lot_core-0.9.12/src/thread_parker/linux.rs deleted in HEAD and modified in 9615ed15 (Use libc::SYS_futex_time64 on riscv32/musl).  Version 9615ed15 (Use libc::SYS_futex_time64 on riscv32/musl) of bitbake/parking_lot_core-0.9.12/src/thread_parker/linux.rs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
bitbake/parking_lot_core-0.9.12/src/thread_parker/linux.rs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5695273694634532051==--

