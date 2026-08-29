Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436F3C61DD7
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 05:44:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2088.1787982251513426016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 22:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jrHtn0xy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=z67RCo6m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a04c0c01fe-cb03e4a5-be17-4e3c-8977-901d347e0881-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787982250;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GfLuKcQu4NTQisfOUOylXghpIdNO4W5V1+z/nEQW/WE=;
	b=jrHtn0xyB9pidbiDFwGedeuor+wCgTt0X5JF+sbucELQIcE4UtjZi3g/EG7EjhZi
	ON7feJP6Xf25Wc6N7kfQZrcuewSejs1dwl+Gvvy2YsQKv9J0Ke5SmOOlW5V1mRa6GSG
	T21RmaVcBBt1RV+xhGODPYVUokPflDFLDZCQxFdc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787982250;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GfLuKcQu4NTQisfOUOylXghpIdNO4W5V1+z/nEQW/WE=;
	b=z67RCo6mtTj+fANvPUnup0FZbw3Yh0itsEpjoYDZpelsJu4KURLXgFwxP13hJDaz
	kjLIWH22Cw+P/o8bAcsilrN8KescKqCf0lN47+XbcktSqDcQq3/sBjA0kif7npPMr/H
	D8znSVQQo4qyOGzPLaYR81w1qaEdT0xqOEbHjO/w=
Content-Type: multipart/mixed; boundary="===============1357478407085866056=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-22.1.8: upgrading to 23.1.0 FAILED
Message-ID: <010101a04c0c01fe-cb03e4a5-be17-4e3c-8977-901d347e0881-000000@us-west-2.amazonses.com>
Date: Sat, 29 Aug 2026 05:44:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244624

--===============1357478407085866056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm-project-source-22.1.8* to *23.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe llvm-project-source-22.1.8 failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0662179269023af66b63e34f092e7b50c0fe6af3"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0662179269023af66b63e34f092e7b50c0fe6af3"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 22 Local 22 Mirrors 0 Missed 0 Current 8 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 957 .bb files complete (0 cached, 957 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0662179269023af66b63e34f092e7b50c0fe6af3"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0662179269023af66b63e34f092e7b50c0fe6af3"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:03:53
Adding changed files:   0% |                                    | ETA:  0:02:50
Adding changed files:   0% |                                    | ETA:  0:02:27
Adding changed files:   0% |                                    | ETA:  0:02:16
Adding changed files:   0% |                                    | ETA:  0:02:14
Adding changed files:   1% |                                    | ETA:  0:02:11
Adding changed files:   1% |                                    | ETA:  0:02:07
Adding changed files:   1% |                                    | ETA:  0:02:06
Adding changed files:   1% |                                    | ETA:  0:02:03
Adding changed files:   1% |                                    | ETA:  0:02:00
Adding changed files:   2% |                                    | ETA:  0:01:58
Adding changed files:   2% |                                    | ETA:  0:01:56
Adding changed files:   2% |                                    | ETA:  0:01:56
Adding changed files:   2% |                                    | ETA:  0:01:56
Adding changed files:   2% |#                                   | ETA:  0:01:56
Adding changed files:   3% |#                                   | ETA:  0:01:55
Adding changed files:   3% |#                                   | ETA:  0:01:55
Adding changed files:   3% |#                                   | ETA:  0:01:55
Adding changed files:   3% |#                                   | ETA:  0:01:54
Adding changed files:   3% |#                                   | ETA:  0:01:55
Adding changed files:   3% |#                                   | ETA:  0:01:54
Adding changed files:   4% |#                                   | ETA:  0:01:54
Adding changed files:   4% |#                                   | ETA:  0:01:53
Adding changed files:   4% |#                                   | ETA:  0:01:53
Adding changed files:   4% |#                                   | ETA:  0:01:52
Adding changed files:   4% |#                                   | ETA:  0:01:52
Adding changed files:   5% |#                                   | ETA:  0:01:52
Adding changed files:   5% |#                                   | ETA:  0:01:52
Adding changed files:   5% |#                                   | ETA:  0:01:52
Adding changed files:   5% |##                                  | ETA:  0:01:51
Adding changed files:   5% |##                                  | ETA:  0:01:51
Adding changed files:   6% |##                                  | ETA:  0:01:51
Adding changed files:   6% |##                                  | ETA:  0:01:51
Adding changed files:   6% |##                                  | ETA:  0:01:50
Adding changed files:   6% |##                                  | ETA:  0:01:50
Adding changed files:   6% |##                                  | ETA:  0:01:50
Adding changed files:   7% |##                                  | ETA:  0:01:49
Adding changed files:   7% |##                                  | ETA:  0:01:49
Adding changed files:   7% |##                                  | ETA:  0:01:49
Adding changed files:   7% |##                                  | ETA:  0:01:49
Adding changed files:   7% |##                                  | ETA:  0:01:49
Adding changed files:   7% |##                                  | ETA:  0:01:48
Adding changed files:   8% |##                                  | ETA:  0:01:48
Adding changed files:   8% |###                                 | ETA:  0:01:48
Adding changed files:   8% |###                                 | ETA:  0:01:48
Adding changed files:   8% |###                                 | ETA:  0:01:48
Adding changed files:   8% |###                                 | ETA:  0:01:48
Adding changed files:   9% |###                                 | ETA:  0:01:48
Adding changed files:   9% |###                                 | ETA:  0:01:48
Adding changed files:   9% |###                                 | ETA:  0:01:47
Adding changed files:   9% |###                                 | ETA:  0:01:47
Adding changed files:   9% |###                                 | ETA:  0:01:47
Adding changed files:  10% |###                                 | ETA:  0:01:47
Adding changed files:  10% |###                                 | ETA:  0:01:47
Adding changed files:  10% |###                                 | ETA:  0:01:47
Adding changed files:  10% |###                                 | ETA:  0:01:47
Adding changed files:  10% |###                                 | ETA:  0:01:47
Adding changed files:  11% |###                                 | ETA:  0:01:46
Adding changed files:  11% |####                                | ETA:  0:01:46
Adding changed files:  11% |####                                | ETA:  0:01:46
Adding changed files:  11% |####                                | ETA:  0:01:46
Adding changed files:  11% |####                                | ETA:  0:01:46
Adding changed files:  11% |####                                | ETA:  0:01:45
Adding changed files:  12% |####                                | ETA:  0:01:45
Adding changed files:  12% |####                                | ETA:  0:01:44
Adding changed files:  12% |####                                | ETA:  0:01:44
Adding changed files:  12% |####                                | ETA:  0:01:44
Adding changed files:  12% |####                                | ETA:  0:01:44
Adding changed files:  13% |####                                | ETA:  0:01:44
Adding changed files:  13% |####                                | ETA:  0:01:43
Adding changed files:  13% |####                                | ETA:  0:01:43
Adding changed files:  13% |####                                | ETA:  0:01:43
Adding changed files:  13% |####                                | ETA:  0:01:43
Adding changed files:  14% |#####                               | ETA:  0:01:43
Adding changed files:  14% |#####                               | ETA:  0:01:42
Adding changed files:  14% |#####                               | ETA:  0:01:42
Adding changed files:  14% |#####                               | ETA:  0:01:42
Adding changed files:  14% |#####                               | ETA:  0:01:42
Adding changed files:  14% |#####                               | ETA:  0:01:42
Adding changed files:  15% |#####                               | ETA:  0:01:42
Adding changed files:  15% |#####                               | ETA:  0:01:42
Adding changed files:  15% |#####                               | ETA:  0:01:41
Adding changed files:  15% |#####                               | ETA:  0:01:41
Adding changed files:  15% |#####                               | ETA:  0:01:42
Adding changed files:  16% |#####                               | ETA:  0:01:42
Adding changed files:  16% |#####                               | ETA:  0:01:42
Adding changed files:  16% |#####                               | ETA:  0:01:42
Adding changed files:  16% |######                              | ETA:  0:01:41
Adding changed files:  16% |######                              | ETA:  0:01:41
Adding changed files:  17% |######                              | ETA:  0:01:41
Adding changed files:  17% |######                              | ETA:  0:01:41
Adding changed files:  17% |######                              | ETA:  0:01:40
Adding changed files:  17% |######                              | ETA:  0:01:40
Adding changed files:  17% |######                              | ETA:  0:01:40
Adding changed files:  18% |######                              | ETA:  0:01:40
Adding changed files:  18% |######                              | ETA:  0:01:39
Adding changed files:  18% |######                              | ETA:  0:01:39
Adding changed files:  18% |######                              | ETA:  0:01:39
Adding changed files:  18% |######                              | ETA:  0:01:39
Adding changed files:  18% |######                              | ETA:  0:01:38
Adding changed files:  19% |######                              | ETA:  0:01:38
Adding changed files:  19% |######                              | ETA:  0:01:38
Adding changed files:  19% |#######                             | ETA:  0:01:38
Adding changed files:  19% |#######                             | ETA:  0:01:38
Adding changed files:  19% |#######                             | ETA:  0:01:38
Adding changed files:  20% |#######                             | ETA:  0:01:37
Adding changed files:  20% |#######                             | ETA:  0:01:37
Adding changed files:  20% |#######                             | ETA:  0:01:37
Adding changed files:  20% |#######                             | ETA:  0:01:37
Adding changed files:  20% |#######                             | ETA:  0:01:36
Adding changed files:  21% |#######                             | ETA:  0:01:36
Adding changed files:  21% |#######                             | ETA:  0:01:36
Adding changed files:  21% |#######                             | ETA:  0:01:35
Adding changed files:  21% |#######                             | ETA:  0:01:35
Adding changed files:  21% |#######                             | ETA:  0:01:35
Adding changed files:  22% |#######                             | ETA:  0:01:35
Adding changed files:  22% |#######                             | ETA:  0:01:34
Adding changed files:  22% |########                            | ETA:  0:01:34
Adding changed files:  22% |########                            | ETA:  0:01:34
Adding changed files:  22% |########                            | ETA:  0:01:34
Adding changed files:  22% |########                            | ETA:  0:01:34
Adding changed files:  23% |########                            | ETA:  0:01:34
Adding changed files:  23% |########                            | ETA:  0:01:34
Adding changed files:  23% |########                            | ETA:  0:01:33
Adding changed files:  23% |########                            | ETA:  0:01:33
Adding changed files:  23% |########                            | ETA:  0:01:33
Adding changed files:  24% |########                            | ETA:  0:01:33
Adding changed files:  24% |########                            | ETA:  0:01:32
Adding changed files:  24% |########                            | ETA:  0:01:32
Adding changed files:  24% |########                            | ETA:  0:01:32
Adding changed files:  24% |########                            | ETA:  0:01:32
Adding changed files:  25% |#########                           | ETA:  0:01:31
Adding changed files:  25% |#########                           | ETA:  0:01:31
Adding changed files:  25% |#########                           | ETA:  0:01:31
Adding changed files:  25% |#########                           | ETA:  0:01:31
Adding changed files:  25% |#########                           | ETA:  0:01:30
Adding changed files:  25% |#########                           | ETA:  0:01:30
Adding changed files:  26% |#########                           | ETA:  0:01:30
Adding changed files:  26% |#########                           | ETA:  0:01:30
Adding changed files:  26% |#########                           | ETA:  0:01:29
Adding changed files:  26% |#########                           | ETA:  0:01:29
Adding changed files:  26% |#########                           | ETA:  0:01:29
Adding changed files:  27% |#########                           | ETA:  0:01:28
Adding changed files:  27% |#########                           | ETA:  0:01:28
Adding changed files:  27% |#########                           | ETA:  0:01:28
Adding changed files:  27% |#########                           | ETA:  0:01:27
Adding changed files:  27% |##########                          | ETA:  0:01:27
Adding changed files:  28% |##########                          | ETA:  0:01:27
Adding changed files:  28% |##########                          | ETA:  0:01:26
Adding changed files:  28% |##########                          | ETA:  0:01:26
Adding changed files:  28% |##########                          | ETA:  0:01:26
Adding changed files:  28% |##########                          | ETA:  0:01:25
Adding changed files:  29% |##########                          | ETA:  0:01:25
Adding changed files:  29% |##########                          | ETA:  0:01:25
Adding changed files:  29% |##########                          | ETA:  0:01:25
Adding changed files:  29% |##########                          | ETA:  0:01:25
Adding changed files:  29% |##########                          | ETA:  0:01:24
Adding changed files:  29% |##########                          | ETA:  0:01:24
Adding changed files:  30% |##########                          | ETA:  0:01:24
Adding changed files:  30% |##########                          | ETA:  0:01:24
Adding changed files:  30% |##########                          | ETA:  0:01:24
Adding changed files:  30% |###########                         | ETA:  0:01:23
Adding changed files:  30% |###########                         | ETA:  0:01:23
Adding changed files:  31% |###########                         | ETA:  0:01:23
Adding changed files:  31% |###########                         | ETA:  0:01:23
Adding changed files:  31% |###########                         | ETA:  0:01:23
Adding changed files:  31% |###########                         | ETA:  0:01:22
Adding changed files:  31% |###########                         | ETA:  0:01:22
Adding changed files:  32% |###########                         | ETA:  0:01:22
Adding changed files:  32% |###########                         | ETA:  0:01:21
Adding changed files:  32% |###########                         | ETA:  0:01:21
Adding changed files:  32% |###########                         | ETA:  0:01:21
Adding changed files:  32% |###########                         | ETA:  0:01:21
Adding changed files:  33% |###########                         | ETA:  0:01:20
Adding changed files:  33% |###########                         | ETA:  0:01:20
Adding changed files:  33% |############                        | ETA:  0:01:20
Adding changed files:  33% |############                        | ETA:  0:01:20
Adding changed files:  33% |############                        | ETA:  0:01:19
Adding changed files:  33% |############                        | ETA:  0:01:19
Adding changed files:  34% |############                        | ETA:  0:01:19
Adding changed files:  34% |############                        | ETA:  0:01:19
Adding changed files:  34% |############                        | ETA:  0:01:18
Adding changed files:  34% |############                        | ETA:  0:01:18
Adding changed files:  34% |############                        | ETA:  0:01:18
Adding changed files:  35% |############                        | ETA:  0:01:17
Adding changed files:  35% |############                        | ETA:  0:01:17
Adding changed files:  35% |############                        | ETA:  0:01:17
Adding changed files:  35% |############                        | ETA:  0:01:17
Adding changed files:  35% |############                        | ETA:  0:01:16
Adding changed files:  36% |############                        | ETA:  0:01:16
Adding changed files:  36% |#############                       | ETA:  0:01:16
Adding changed files:  36% |#############                       | ETA:  0:01:16
Adding changed files:  36% |#############                       | ETA:  0:01:16
Adding changed files:  36% |#############                       | ETA:  0:01:16
Adding changed files:  36% |#############                       | ETA:  0:01:16
Adding changed files:  37% |#############                       | ETA:  0:01:15
Adding changed files:  37% |#############                       | ETA:  0:01:15
Adding changed files:  37% |#############                       | ETA:  0:01:15
Adding changed files:  37% |#############                       | ETA:  0:01:15
Adding changed files:  37% |#############                       | ETA:  0:01:14
Adding changed files:  38% |#############                       | ETA:  0:01:14
Adding changed files:  38% |#############                       | ETA:  0:01:14
Adding changed files:  38% |#############                       | ETA:  0:01:14
Adding changed files:  38% |#############                       | ETA:  0:01:13
Adding changed files:  38% |##############                      | ETA:  0:01:13
Adding changed files:  39% |##############                      | ETA:  0:01:13
Adding changed files:  39% |##############                      | ETA:  0:01:13
Adding changed files:  39% |##############                      | ETA:  0:01:13
Adding changed files:  39% |##############                      | ETA:  0:01:12
Adding changed files:  39% |##############                      | ETA:  0:01:12
Adding changed files:  40% |##############                      | ETA:  0:01:12
Adding changed files:  40% |##############                      | ETA:  0:01:12
Adding changed files:  40% |##############                      | ETA:  0:01:12
Adding changed files:  40% |##############                      | ETA:  0:01:11
Adding changed files:  40% |##############                      | ETA:  0:01:11
Adding changed files:  40% |##############                      | ETA:  0:01:11
Adding changed files:  41% |##############                      | ETA:  0:01:11
Adding changed files:  41% |##############                      | ETA:  0:01:10
Adding changed files:  41% |##############                      | ETA:  0:01:10
Adding changed files:  41% |###############                     | ETA:  0:01:10
Adding changed files:  41% |###############                     | ETA:  0:01:10
Adding changed files:  42% |###############                     | ETA:  0:01:09
Adding changed files:  42% |###############                     | ETA:  0:01:09
Adding changed files:  42% |###############                     | ETA:  0:01:09
Adding changed files:  42% |###############                     | ETA:  0:01:09
Adding changed files:  42% |###############                     | ETA:  0:01:08
Adding changed files:  43% |###############                     | ETA:  0:01:08
Adding changed files:  43% |###############                     | ETA:  0:01:08
Adding changed files:  43% |###############                     | ETA:  0:01:08
Adding changed files:  43% |###############                     | ETA:  0:01:08
Adding changed files:  43% |###############                     | ETA:  0:01:07
Adding changed files:  44% |###############                     | ETA:  0:01:07
Adding changed files:  44% |###############                     | ETA:  0:01:07
Adding changed files:  44% |###############                     | ETA:  0:01:07
Adding changed files:  44% |################                    | ETA:  0:01:06
Adding changed files:  44% |################                    | ETA:  0:01:06
Adding changed files:  44% |################                    | ETA:  0:01:06
Adding changed files:  45% |################                    | ETA:  0:01:06
Adding changed files:  45% |################                    | ETA:  0:01:05
Adding changed files:  45% |################                    | ETA:  0:01:05
Adding changed files:  45% |################                    | ETA:  0:01:05
Adding changed files:  45% |################                    | ETA:  0:01:05
Adding changed files:  46% |################                    | ETA:  0:01:05
Adding changed files:  46% |################                    | ETA:  0:01:04
Adding changed files:  46% |################                    | ETA:  0:01:04
Adding changed files:  46% |################                    | ETA:  0:01:04
Adding changed files:  46% |################                    | ETA:  0:01:04
Adding changed files:  47% |################                    | ETA:  0:01:03
Adding changed files:  47% |#################                   | ETA:  0:01:03
Adding changed files:  47% |#################                   | ETA:  0:01:03
Adding changed files:  47% |#################                   | ETA:  0:01:03
Adding changed files:  47% |#################                   | ETA:  0:01:02
Adding changed files:  47% |#################                   | ETA:  0:01:02
Adding changed files:  48% |#################                   | ETA:  0:01:02
Adding changed files:  48% |#################                   | ETA:  0:01:02
Adding changed files:  48% |#################                   | ETA:  0:01:02
Adding changed files:  48% |#################                   | ETA:  0:01:01
Adding changed files:  48% |#################                   | ETA:  0:01:01
Adding changed files:  49% |#################                   | ETA:  0:01:01
Adding changed files:  49% |#################                   | ETA:  0:01:01
Adding changed files:  49% |#################                   | ETA:  0:01:00
Adding changed files:  49% |#################                   | ETA:  0:01:00
Adding changed files:  49% |#################                   | ETA:  0:01:00
Adding changed files:  50% |##################                  | ETA:  0:01:00
Adding changed files:  50% |##################                  | ETA:  0:00:59
Adding changed files:  50% |##################                  | ETA:  0:00:59
Adding changed files:  50% |##################                  | ETA:  0:00:59
Adding changed files:  50% |##################                  | ETA:  0:00:59
Adding changed files:  51% |##################                  | ETA:  0:00:58
Adding changed files:  51% |##################                  | ETA:  0:00:58
Adding changed files:  51% |##################                  | ETA:  0:00:58
Adding changed files:  51% |##################                  | ETA:  0:00:58
Adding changed files:  51% |##################                  | ETA:  0:00:58
Adding changed files:  51% |##################                  | ETA:  0:00:57
Adding changed files:  52% |##################                  | ETA:  0:00:57
Adding changed files:  52% |##################                  | ETA:  0:00:57
Adding changed files:  52% |##################                  | ETA:  0:00:57
Adding changed files:  52% |##################                  | ETA:  0:00:57
Adding changed files:  52% |###################                 | ETA:  0:00:56
Adding changed files:  53% |###################                 | ETA:  0:00:56
Adding changed files:  53% |###################                 | ETA:  0:00:56
Adding changed files:  53% |###################                 | ETA:  0:00:56
Adding changed files:  53% |###################                 | ETA:  0:00:56
Adding changed files:  53% |###################                 | ETA:  0:00:55
Adding changed files:  54% |###################                 | ETA:  0:00:55
Adding changed files:  54% |###################                 | ETA:  0:00:55
Adding changed files:  54% |###################                 | ETA:  0:00:55
Adding changed files:  54% |###################                 | ETA:  0:00:55
Adding changed files:  54% |###################                 | ETA:  0:00:54
Adding changed files:  55% |###################                 | ETA:  0:00:54
Adding changed files:  55% |###################                 | ETA:  0:00:54
Adding changed files:  55% |###################                 | ETA:  0:00:54
Adding changed files:  55% |####################                | ETA:  0:00:53
Adding changed files:  55% |####################                | ETA:  0:00:53
Adding changed files:  55% |####################                | ETA:  0:00:53
Adding changed files:  56% |####################                | ETA:  0:00:53
Adding changed files:  56% |####################                | ETA:  0:00:52
Adding changed files:  56% |####################                | ETA:  0:00:52
Adding changed files:  56% |####################                | ETA:  0:00:52
Adding changed files:  56% |####################                | ETA:  0:00:52
Adding changed files:  57% |####################                | ETA:  0:00:52
Adding changed files:  57% |####################                | ETA:  0:00:51
Adding changed files:  57% |####################                | ETA:  0:00:51
Adding changed files:  57% |####################                | ETA:  0:00:51
Adding changed files:  57% |####################                | ETA:  0:00:51
Adding changed files:  58% |####################                | ETA:  0:00:51
Adding changed files:  58% |####################                | ETA:  0:00:50
Adding changed files:  58% |#####################               | ETA:  0:00:50
Adding changed files:  58% |#####################               | ETA:  0:00:50
Adding changed files:  58% |#####################               | ETA:  0:00:50
Adding changed files:  59% |#####################               | ETA:  0:00:50
Adding changed files:  59% |#####################               | ETA:  0:00:49
Adding changed files:  59% |#####################               | ETA:  0:00:49
Adding changed files:  59% |#####################               | ETA:  0:00:49
Adding changed files:  59% |#####################               | ETA:  0:00:49
Adding changed files:  59% |#####################               | ETA:  0:00:48
Adding changed files:  60% |#####################               | ETA:  0:00:48
Adding changed files:  60% |#####################               | ETA:  0:00:48
Adding changed files:  60% |#####################               | ETA:  0:00:48
Adding changed files:  60% |#####################               | ETA:  0:00:48
Adding changed files:  60% |#####################               | ETA:  0:00:47
Adding changed files:  61% |#####################               | ETA:  0:00:47
Adding changed files:  61% |######################              | ETA:  0:00:47
Adding changed files:  61% |######################              | ETA:  0:00:47
Adding changed files:  61% |######################              | ETA:  0:00:47
Adding changed files:  61% |######################              | ETA:  0:00:47
Adding changed files:  62% |######################              | ETA:  0:00:46
Adding changed files:  62% |######################              | ETA:  0:00:46
Adding changed files:  62% |######################              | ETA:  0:00:46
Adding changed files:  62% |######################              | ETA:  0:00:46
Adding changed files:  62% |######################              | ETA:  0:00:46
Adding changed files:  62% |######################              | ETA:  0:00:45
Adding changed files:  63% |######################              | ETA:  0:00:45
Adding changed files:  63% |######################              | ETA:  0:00:45
Adding changed files:  63% |######################              | ETA:  0:00:45
Adding changed files:  63% |######################              | ETA:  0:00:44
Adding changed files:  63% |#######################             | ETA:  0:00:44
Adding changed files:  64% |#######################             | ETA:  0:00:44
Adding changed files:  64% |#######################             | ETA:  0:00:44
Adding changed files:  64% |#######################             | ETA:  0:00:44
Adding changed files:  64% |#######################             | ETA:  0:00:43
Adding changed files:  64% |#######################             | ETA:  0:00:43
Adding changed files:  65% |#######################             | ETA:  0:00:43
Adding changed files:  65% |#######################             | ETA:  0:00:43
Adding changed files:  65% |#######################             | ETA:  0:00:43
Adding changed files:  65% |#######################             | ETA:  0:00:42
Adding changed files:  65% |#######################             | ETA:  0:00:42
Adding changed files:  66% |#######################             | ETA:  0:00:42
Adding changed files:  66% |#######################             | ETA:  0:00:42
Adding changed files:  66% |#######################             | ETA:  0:00:41
Adding changed files:  66% |#######################             | ETA:  0:00:41
Adding changed files:  66% |########################            | ETA:  0:00:41
Adding changed files:  66% |########################            | ETA:  0:00:41
Adding changed files:  67% |########################            | ETA:  0:00:41
Adding changed files:  67% |########################            | ETA:  0:00:40
Adding changed files:  67% |########################            | ETA:  0:00:40
Adding changed files:  67% |########################            | ETA:  0:00:40
Adding changed files:  67% |########################            | ETA:  0:00:40
Adding changed files:  68% |########################            | ETA:  0:00:39
Adding changed files:  68% |########################            | ETA:  0:00:39
Adding changed files:  68% |########################            | ETA:  0:00:39
Adding changed files:  68% |########################            | ETA:  0:00:39
Adding changed files:  68% |########################            | ETA:  0:00:38
Adding changed files:  69% |########################            | ETA:  0:00:38
Adding changed files:  69% |########################            | ETA:  0:00:38
Adding changed files:  69% |########################            | ETA:  0:00:38
Adding changed files:  69% |#########################           | ETA:  0:00:38
Adding changed files:  69% |#########################           | ETA:  0:00:37
Adding changed files:  70% |#########################           | ETA:  0:00:37
Adding changed files:  70% |#########################           | ETA:  0:00:37
Adding changed files:  70% |#########################           | ETA:  0:00:37
Adding changed files:  70% |#########################           | ETA:  0:00:37
Adding changed files:  70% |#########################           | ETA:  0:00:36
Adding changed files:  70% |#########################           | ETA:  0:00:36
Adding changed files:  71% |#########################           | ETA:  0:00:36
Adding changed files:  71% |#########################           | ETA:  0:00:36
Adding changed files:  71% |#########################           | ETA:  0:00:35
Adding changed files:  71% |#########################           | ETA:  0:00:35
Adding changed files:  71% |#########################           | ETA:  0:00:35
Adding changed files:  72% |#########################           | ETA:  0:00:35
Adding changed files:  72% |##########################          | ETA:  0:00:35
Adding changed files:  72% |##########################          | ETA:  0:00:34
Adding changed files:  72% |##########################          | ETA:  0:00:34
Adding changed files:  72% |##########################          | ETA:  0:00:34
Adding changed files:  73% |##########################          | ETA:  0:00:34
Adding changed files:  73% |##########################          | ETA:  0:00:33
Adding changed files:  73% |##########################          | ETA:  0:00:33
Adding changed files:  73% |##########################          | ETA:  0:00:33
Adding changed files:  73% |##########################          | ETA:  0:00:33
Adding changed files:  73% |##########################          | ETA:  0:00:33
Adding changed files:  74% |##########################          | ETA:  0:00:32
Adding changed files:  74% |##########################          | ETA:  0:00:32
Adding changed files:  74% |##########################          | ETA:  0:00:32
Adding changed files:  74% |##########################          | ETA:  0:00:32
Adding changed files:  74% |##########################          | ETA:  0:00:31
Adding changed files:  75% |###########################         | ETA:  0:00:31
Adding changed files:  75% |###########################         | ETA:  0:00:31
Adding changed files:  75% |###########################         | ETA:  0:00:31
Adding changed files:  75% |###########################         | ETA:  0:00:31
Adding changed files:  75% |###########################         | ETA:  0:00:30
Adding changed files:  76% |###########################         | ETA:  0:00:30
Adding changed files:  76% |###########################         | ETA:  0:00:30
Adding changed files:  76% |###########################         | ETA:  0:00:30
Adding changed files:  76% |###########################         | ETA:  0:00:29
Adding changed files:  76% |###########################         | ETA:  0:00:29
Adding changed files:  77% |###########################         | ETA:  0:00:29
Adding changed files:  77% |###########################         | ETA:  0:00:29
Adding changed files:  77% |###########################         | ETA:  0:00:28
Adding changed files:  77% |###########################         | ETA:  0:00:28
Adding changed files:  77% |############################        | ETA:  0:00:28
Adding changed files:  77% |############################        | ETA:  0:00:28
Adding changed files:  78% |############################        | ETA:  0:00:28
Adding changed files:  78% |############################        | ETA:  0:00:27
Adding changed files:  78% |############################        | ETA:  0:00:27
Adding changed files:  78% |############################        | ETA:  0:00:27
Adding changed files:  78% |############################        | ETA:  0:00:27
Adding changed files:  79% |############################        | ETA:  0:00:26
Adding changed files:  79% |############################        | ETA:  0:00:26
Adding changed files:  79% |############################        | ETA:  0:00:26
Adding changed files:  79% |############################        | ETA:  0:00:26
Adding changed files:  79% |############################        | ETA:  0:00:25
Adding changed files:  80% |############################        | ETA:  0:00:25
Adding changed files:  80% |############################        | ETA:  0:00:25
Adding changed files:  80% |############################        | ETA:  0:00:25
Adding changed files:  80% |#############################       | ETA:  0:00:24
Adding changed files:  80% |#############################       | ETA:  0:00:24
Adding changed files:  81% |#############################       | ETA:  0:00:24
Adding changed files:  81% |#############################       | ETA:  0:00:24
Adding changed files:  81% |#############################       | ETA:  0:00:24
Adding changed files:  81% |#############################       | ETA:  0:00:23
Adding changed files:  81% |#############################       | ETA:  0:00:23
Adding changed files:  81% |#############################       | ETA:  0:00:23
Adding changed files:  82% |#############################       | ETA:  0:00:23
Adding changed files:  82% |#############################       | ETA:  0:00:22
Adding changed files:  82% |#############################       | ETA:  0:00:22
Adding changed files:  82% |#############################       | ETA:  0:00:22
Adding changed files:  82% |#############################       | ETA:  0:00:22
Adding changed files:  83% |#############################       | ETA:  0:00:22
Adding changed files:  83% |#############################       | ETA:  0:00:21
Adding changed files:  83% |##############################      | ETA:  0:00:21
Adding changed files:  83% |##############################      | ETA:  0:00:21
Adding changed files:  83% |##############################      | ETA:  0:00:21
Adding changed files:  84% |##############################      | ETA:  0:00:20
Adding changed files:  84% |##############################      | ETA:  0:00:20
Adding changed files:  84% |##############################      | ETA:  0:00:20
Adding changed files:  84% |##############################      | ETA:  0:00:20
Adding changed files:  84% |##############################      | ETA:  0:00:19
Adding changed files:  84% |##############################      | ETA:  0:00:19
Adding changed files:  85% |##############################      | ETA:  0:00:19
Adding changed files:  85% |##############################      | ETA:  0:00:19
Adding changed files:  85% |##############################      | ETA:  0:00:18
Adding changed files:  85% |##############################      | ETA:  0:00:18
Adding changed files:  85% |##############################      | ETA:  0:00:18
Adding changed files:  86% |###############################     | ETA:  0:00:18
Adding changed files:  86% |###############################     | ETA:  0:00:17
Adding changed files:  86% |###############################     | ETA:  0:00:17
Adding changed files:  86% |###############################     | ETA:  0:00:17
Adding changed files:  86% |###############################     | ETA:  0:00:17
Adding changed files:  87% |###############################     | ETA:  0:00:16
Adding changed files:  87% |###############################     | ETA:  0:00:16
Adding changed files:  87% |###############################     | ETA:  0:00:16
Adding changed files:  87% |###############################     | ETA:  0:00:16
Adding changed files:  87% |###############################     | ETA:  0:00:15
Adding changed files:  88% |###############################     | ETA:  0:00:15
Adding changed files:  88% |###############################     | ETA:  0:00:15
Adding changed files:  88% |###############################     | ETA:  0:00:15
Adding changed files:  88% |###############################     | ETA:  0:00:14
Adding changed files:  88% |###############################     | ETA:  0:00:14
Adding changed files:  88% |################################    | ETA:  0:00:14
Adding changed files:  89% |################################    | ETA:  0:00:14
Adding changed files:  89% |################################    | ETA:  0:00:13
Adding changed files:  89% |################################    | ETA:  0:00:13
Adding changed files:  89% |################################    | ETA:  0:00:13
Adding changed files:  89% |################################    | ETA:  0:00:13
Adding changed files:  90% |################################    | ETA:  0:00:12
Adding changed files:  90% |################################    | ETA:  0:00:12
Adding changed files:  90% |################################    | ETA:  0:00:12
Adding changed files:  90% |################################    | ETA:  0:00:12
Adding changed files:  90% |################################    | ETA:  0:00:11
Adding changed files:  91% |################################    | ETA:  0:00:11
Adding changed files:  91% |################################    | ETA:  0:00:11
Adding changed files:  91% |################################    | ETA:  0:00:11
Adding changed files:  91% |################################    | ETA:  0:00:11
Adding changed files:  91% |#################################   | ETA:  0:00:10
Adding changed files:  92% |#################################   | ETA:  0:00:10
Adding changed files:  92% |#################################   | ETA:  0:00:10
Adding changed files:  92% |#################################   | ETA:  0:00:10
Adding changed files:  92% |#################################   | ETA:  0:00:09
Adding changed files:  92% |#################################   | ETA:  0:00:09
Adding changed files:  92% |#################################   | ETA:  0:00:09
Adding changed files:  93% |#################################   | ETA:  0:00:09
Adding changed files:  93% |#################################   | ETA:  0:00:08
Adding changed files:  93% |#################################   | ETA:  0:00:08
Adding changed files:  93% |#################################   | ETA:  0:00:08
Adding changed files:  93% |#################################   | ETA:  0:00:08
Adding changed files:  94% |#################################   | ETA:  0:00:07
Adding changed files:  94% |#################################   | ETA:  0:00:07
Adding changed files:  94% |##################################  | ETA:  0:00:07
Adding changed files:  94% |##################################  | ETA:  0:00:07
Adding changed files:  94% |##################################  | ETA:  0:00:06
Adding changed files:  95% |##################################  | ETA:  0:00:06
Adding changed files:  95% |##################################  | ETA:  0:00:06
Adding changed files:  95% |##################################  | ETA:  0:00:06
Adding changed files:  95% |##################################  | ETA:  0:00:05
Adding changed files:  95% |##################################  | ETA:  0:00:05
Adding changed files:  95% |##################################  | ETA:  0:00:05
Adding changed files:  96% |##################################  | ETA:  0:00:05
Adding changed files:  96% |##################################  | ETA:  0:00:04
Adding changed files:  96% |##################################  | ETA:  0:00:04
Adding changed files:  96% |##################################  | ETA:  0:00:04
Adding changed files:  96% |##################################  | ETA:  0:00:04
Adding changed files:  97% |##################################  | ETA:  0:00:03
Adding changed files:  97% |################################### | ETA:  0:00:03
Adding changed files:  97% |################################### | ETA:  0:00:03
Adding changed files:  97% |################################### | ETA:  0:00:03
Adding changed files:  97% |################################### | ETA:  0:00:02
Adding changed files:  98% |################################### | ETA:  0:00:02
Adding changed files:  98% |################################### | ETA:  0:00:02
Adding changed files:  98% |################################### | ETA:  0:00:02
Adding changed files:  98% |################################### | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:02:14
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/llvm/llvm-project/releases/download/llvmorg-23.1.0/llvm-project-23.1.0.src.tar.xz...
INFO: Rebasing devtool onto 501a292f82f35a5e802357f5c0f51cff59c8b0b4
WARNING: Command 'git rebase 501a292f82f35a5e802357f5c0f51cff59c8b0b4' failed:
Auto-merging clang/include/clang/Driver/Distro.h
Auto-merging clang/lib/Driver/Distro.cpp
Auto-merging clang/lib/Driver/ToolChains/Gnu.cpp
Auto-merging clang/lib/Driver/ToolChains/Linux.cpp
Auto-merging llvm/lib/TargetParser/Triple.cpp
CONFLICT (content): Merge conflict in llvm/lib/TargetParser/Triple.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/llvm-project-source-22.1.8
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/llvm-project-source-22.1.8/llvm-project-source.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/llvm-project-source-22.1.8.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1357478407085866056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="llvm-project-source-22.1.8-changelog.txt"

Q2hhbmdlbG9nIGZvciBsbHZtLXByb2plY3Qtc291cmNlLTIyLjEuODogMjIuMS44IC0+IDIzLjEu
MApTb3VyY2U6IGNsYW5nL2RvY3MvUmVsZWFzZU5vdGVzLm1kCgotLS0KbXlzdDoKICBlbmFibGVf
ZXh0ZW5zaW9uczoKICAgIC0gYXR0cnNfYmxvY2sKICAgIC0gc3Vic3RpdHV0aW9uCi0tLQoKJSBJ
ZiB5b3Ugd2FudCB0byBtb2RpZnkgc2VjdGlvbnMvY29udGVudHMgcGVybWFuZW50bHksIHlvdSBz
aG91bGQgbW9kaWZ5IGJvdGgKJSBSZWxlYXNlTm90ZXMubWQgYW5kIFJlbGVhc2VOb3Rlc1RlbXBs
YXRlLnR4dC4KCnsjY2xhbmctcmVsZWFzZS1yZWxlYXNlbm90ZXN0aXRsZX0KIyBDbGFuZyB7eyAo
KCcoSW4tUHJvZ3Jlc3MpICcgaWYgZW52LmFwcC50YWdzLmhhcygnUHJlUmVsZWFzZScpIGVsc2Ug
JycpIH4gJ1JlbGVhc2UgTm90ZXMnKSBpZiBlbnYuY29uZmlnLnByb2plY3QgPT0gJ0NsYW5nJyBl
bHNlICd8UmVsZWFzZU5vdGVzVGl0bGV8JyB9fQoKYGBge2NvbnRlbnRzfQo6ZGVwdGg6IDIKOmxv
Y2FsOgpgYGAKCldyaXR0ZW4gYnkgdGhlIFtMTFZNIFRlYW1dKGh0dHBzOi8vbGx2bS5vcmcvKQoK
YGBgYHtvbmx5fSBQcmVSZWxlYXNlCgpgYGB7d2FybmluZ30KVGhlc2UgYXJlIGluLXByb2dyZXNz
IG5vdGVzIGZvciB0aGUgdXBjb21pbmcgQ2xhbmcge3tlbnYuY29uZmlnLnZlcnNpb259fSByZWxl
YXNlLgpSZWxlYXNlIG5vdGVzIGZvciBwcmV2aW91cyByZWxlYXNlcyBjYW4gYmUgZm91bmQgb24K
W3RoZSBSZWxlYXNlcyBQYWdlXShodHRwczovL2xsdm0ub3JnL3JlbGVhc2VzLykuCmBgYApgYGBg
CgojIyBJbnRyb2R1Y3Rpb24KClRoaXMgZG9jdW1lbnQgY29udGFpbnMgdGhlIHJlbGVhc2Ugbm90
ZXMgZm9yIHRoZSBDbGFuZyBDL0MrKy9PYmplY3RpdmUtQwpmcm9udGVuZCwgcGFydCBvZiB0aGUg
TExWTSBDb21waWxlciBJbmZyYXN0cnVjdHVyZSwgcmVsZWFzZSB7e2Vudi5jb25maWcucmVsZWFz
ZX19LiBIZXJlIHdlCmRlc2NyaWJlIHRoZSBzdGF0dXMgb2YgQ2xhbmcgaW4gc29tZSBkZXRhaWws
IGluY2x1ZGluZyBtYWpvcgppbXByb3ZlbWVudHMgZnJvbSB0aGUgcHJldmlvdXMgcmVsZWFzZSBh
bmQgbmV3IGZlYXR1cmUgd29yay4gRm9yIHRoZQpnZW5lcmFsIExMVk0gcmVsZWFzZSBub3Rlcywg
c2VlIFt0aGUgTExWTQpkb2N1bWVudGF0aW9uXShodHRwczovL2xsdm0ub3JnL2RvY3MvUmVsZWFz
ZU5vdGVzLmh0bWwpLiBGb3IgdGhlIGxpYmMrKyByZWxlYXNlIG5vdGVzLApzZWUgW3RoaXMgcGFn
ZV0oaHR0cHM6Ly9saWJjeHgubGx2bS5vcmcvUmVsZWFzZU5vdGVzLmh0bWwpLiBBbGwgTExWTSBy
ZWxlYXNlcwptYXkgYmUgZG93bmxvYWRlZCBmcm9tIHRoZSBbTExWTSByZWxlYXNlcyB3ZWIgc2l0
ZV0oaHR0cHM6Ly9sbHZtLm9yZy9yZWxlYXNlcy8pLgoKRm9yIG1vcmUgaW5mb3JtYXRpb24gYWJv
dXQgQ2xhbmcgb3IgTExWTSwgaW5jbHVkaW5nIGluZm9ybWF0aW9uIGFib3V0IHRoZQpsYXRlc3Qg
cmVsZWFzZSwgcGxlYXNlIHNlZSB0aGUgW0NsYW5nIFdlYiBTaXRlXShodHRwczovL2NsYW5nLmxs
dm0ub3JnKSBvciB0aGUKW0xMVk0gV2ViIFNpdGVdKGh0dHBzOi8vbGx2bS5vcmcpLgoKIyMgUG90
ZW50aWFsbHkgQnJlYWtpbmcgQ2hhbmdlcwoKIyMjIEMvQysrIExhbmd1YWdlIFBvdGVudGlhbGx5
IEJyZWFraW5nIENoYW5nZXMKCi0gQ2xhbmcgbm93IG1ha2VzIGl0IGlsbC1mb3JtZWQgdG8gdHJ5
IHRvIGBicmVha2Agb3V0IG9mIG9yIGBjb250aW51ZWAgYSBsb29wIGluc2lkZSBpdHMgb3duIGNv
bmRpdGlvbiwKICBpbmNyZW1lbnQsIG9yIGluaXQtc3RhdGVtZW50IGluIGFsbCBDIGFuZCBDKysg
bGFuZ3VhZ2UgbW9kZXMuIFRoaXMgbWVhbnMgdGhhdCBjb2RlIHN1Y2ggYXMKCiAgYGBgYysrCiAg
d2hpbGUgKCh7IGJyZWFrOyB9KSkge30KICBgYGAKCiAgaXMgbm93IGlsbC1mb3JtZWQuIEFuIG91
dGVyIGxvb3AgY2FuIHN0aWxsIGJlIGJyb2tlbiBvdXQgb2Ygb3IgY29udGludWVkIHNvIGxvbmcg
YXMgdGhlIGlubmVyIGxvb3AgaXMKICBpbiB0aGUgYm9keSBvZiB0aGUgb3V0ZXIgbG9vcDoKCiAg
YGBgYysrCiAgLy8gT2ssIHRoaXMgYnJlYWtzIG91dCBvZiB0aGUgJ2ZvcicgbG9vcC4KICBmb3Ig
KDs7KSB7CiAgICB3aGlsZSAoKHsgYnJlYWs7IHRydWU7IH0pKSB7fQogIH0KCiAgLy8gRXJyb3I6
IGNhbid0IGJyZWFrIG91dCBvZiB0aGUgJ2ZvcicgbG9vcCBmcm9tIHdpdGhpbiBpdHMgb3duIGlu
Y3JlbWVudC4KICBmb3IgKDs7KHsgd2hpbGUgKCh7IGJyZWFrOyB0cnVlOyB9KSkge30gfSkpIHt9
CiAgYGBgCgogIFRoaXMgYWxzbyByZXNvbHZlcyBhIGRpdmVyZ2VuY2UgZnJvbSBHQ0M6IGluIGEg
Y29uc3RydWN0IHN1Y2ggYXMKCiAgYGBgYysrCiAgZm9yICg7OykgewogICAgd2hpbGUgKCh7IGJy
ZWFrOyB0cnVlOyB9KSkge30KICB9CiAgYGBgCgogIENsYW5nIHdvdWxkIHByZXZpb3VzbHkgYGJy
ZWFrYCBvdXQgb2YgdGhlIGB3aGlsZWAgbG9vcCwgd2hlcmVhcyBHQ0MgKHNpbmNlIHZlcnNpb24g
OSkgd291bGQKICBgYnJlYWtgIG91dCBvZiB0aGUgYGZvcmAgbG9vcCBoZXJlLiBOb3csIENsYW5n
IGFuZCBHQ0MgYm90aCBicmVhayBvdXQgb2YgdGhlIGBmb3JgIGxvb3AuCgotIENsYW5nIG5vdyBw
YXJzZXMgbGluZSBhbmQgZGlnaXQgZGlyZWN0aXZlcywgbW9kdWxlIG5hbWVzLCBhbmQgb3JpZ2lu
YWwgZmlsZW5hbWVzIGFzIHVuZXZhbHVhdGVkCiAgc3RyaW5ncy4gVGhpcyBtZWFucyB0aGF0IGNv
ZGUgY29udGFpbmluZyBzdHJpbmdzIHdpdGggZXNjYXBlIHNlcXVlbmNlcyBzdWNoIGFzCgogIGBg
YGMrKwogICMgMSAib3JpZ2luYWxceDEyc291cmNlLmMiCiAgI3ByYWdtYSBjbGFuZyBtb2R1bGUg
aW1wb3J0ICJceDQxIgogICMgNTAgImFcMDEyLmMiCiAgYGBgCgogIGFyZSBub3cgaWxsLWZvcm1l
ZC4KCi0gYF9faGFzX2ZlYXR1cmUobW9kdWxlcylgIGlzIG5vIGxvbmdlciB0cnVlIHdoZW4ganVz
dCBgLXN0ZD1jKysyMGAgKG9yIGhpZ2hlcikKICBpcyBwYXNzZWQuIEl0J3Mgb25seSB0cnVlIGlm
IGAtZm1vZHVsZXNgIGlzIHBhc3NlZCwgd2hpY2ggZW5hYmxlcyBDbGFuZydzCiAgbW9kdWxlIG1h
cCBzZW1hbnRpY3MuIE9iamVjdGl2ZS1DKysgb2YgdGhlIGZvcm0KCiAgYGBgb2JqYwogICNpZiBf
X2hhc19mZWF0dXJlKG1vZHVsZXMpCiAgQGltcG9ydCBGb3VuZGF0aW9uOwogICNlbHNlCiAgI2lt
cG9ydCA8Rm91bmRhdGlvbi9Gb3VuZGF0aW9uLmg+CiAgI2VuZGlmCiAgYGBgCgogIHByZXZpb3Vz
bHkgdG9vayB0aGUgYEBpbXBvcnRgIGJyYW5jaCB1bmRlciBgLXN0ZD1jKysyMGAgZXZlbiB0aG91
Z2ggbm8gbW9kdWxlCiAgbWFwcyB3ZXJlIGluIHVzZSwgd2hpY2ggd291bGQgYWx3YXlzIGZhaWwu
CgogIGBfX2NwcF9tb2R1bGVzYCBjb250aW51ZXMgdG8gYmUgdGhlIHN0YW5kYXJkIG1hY3JvIHRv
IHVzZSB0byBjaGVjayBpZiBDKysyMAogIG1vZHVsZXMgYXJlIGF2YWlsYWJsZS4KCiMjIyBDKysg
U3BlY2lmaWMgUG90ZW50aWFsbHkgQnJlYWtpbmcgQ2hhbmdlcwoKLSBDbGFuZyBub3cgbW9yZSBh
Z2dyZXNzaXZlbHkgb3B0aW1pemVzIGF3YXkgc3RvcmVzIHRvIG9iamVjdHMgYWZ0ZXIgdGhleSBh
cmUKICBkZWFkLiBUaGlzIGJlaGF2aW9yIGNhbiBiZSBkaXNhYmxlZCB3aXRoIGAtZm5vLWxpZmV0
aW1lLWRzZWAuCi0gQ2xhbmcgbm93IGNvcnJlY3RseSByZWplY3RzIGBleHBvcnRgIGRlY2xhcmF0
aW9ucyBpbiBtb2R1bGUgaW1wbGVtZW50YXRpb24KICBwYXJ0aXRpb25zLiAoI0dIMTA3NjAyKQot
IFRlbXBsYXRlIGFyZ3VtZW50IGRlZHVjdGlvbiBub3cgdHJlYXRzIHRoZSBgTmAgaW4gYF9CaXRJ
bnQoTilgCiAgYXMgYmVpbmcgb2YgdHlwZSBgc3RkOjpzaXplX3RgIGluc3RlYWQgb2YgYGludGAs
CiAgbWF0Y2hpbmcgdGhlIGRlZHVjdGlvbiBvZiBhcnJheSBzaXplcyBmcm9tIGBpbnQoJilbTl1g
LgogIFRoaXMgaXMgYSBicmVha2luZyBjaGFuZ2UgZm9yIGNvZGUgdGhhdCBkZXBlbmRlZCBvbiB0
aGUgcHJldmlvdXNseSBkZWR1Y2VkIHR5cGUuICgjR0gxOTUwMzMpCi0gQ2xhbmcgbm93IHJlamVj
dHMgbmVzdGVkIGxvY2FsIGNsYXNzZXMgZGVmaW5lZCBpbiBhIGRpZmZlcmVudAogIGJsb2NrIHNj
b3BlIHRoYW4gdGhlaXIgcGFyZW50IGNsYXNzLiAoI0dIMTkzNDcyKQoKIyMjIEFCSSBDaGFuZ2Vz
IGluIFRoaXMgVmVyc2lvbgoKLSBGaXhlZCBpbmNvcnJlY3Qgc3RydWN0IGxheW91dCBmb3IgYF9C
aXRJbnRgIGJpdGZpZWxkcyB3aWRlciB0aGFuIDI1NSBiaXRzCiAgb24gTVNWQyB0YXJnZXRzLiBJ
bnRlcm5hbCBiaXRmaWVsZCB0cmFja2luZyBmaWVsZHMgd2VyZSBjaGFuZ2VkIGZyb20KICBgdW5z
aWduZWQgY2hhcmAgdG8gYHVpbnQ2NF90YCB0byBwcmV2ZW50IG92ZXJmbG93LiBUaGlzIG1pZ2h0
IGJlIGFuIEFCSQogIGJyZWFrIGZvciBzdWNoIHN0cnVjdHMgY29tcGFyZWQgdG8gZWFybGllciBD
bGFuZyB2ZXJzaW9ucy4KLSBGaXhlZCBhIG51bWJlciBvZiBpc3N1ZXMgd2l0aCB0aGUgYF9fcmVn
Y2FsbGAgY2FsbGluZyBjb252ZW50aW9uIGZvciBwYXNzaW5nCiAgc3RydWN0cyBvbiBub24tV2lu
ZG93cyB4ODYtNjQgdGFyZ2V0cywgaW5jbHVkaW5nIGEgY3Jhc2ggd2hlbiBoYW5kbGluZyBlbXB0
eQogIHN0cnVjdCBhcmd1bWVudHMuIFRoaXMgY2hhbmdlcyBob3cgc3RydWN0cyB0aGF0IGNvbnRh
aW4gYXJyYXlzLCBmbG9hdGluZyBwb2ludAogIHR5cGVzLCBvciBgX0NvbXBsZXggZmxvYXRgIHR5
cGVzIGFyZSBwYXNzZWQsIGFuZCBtYXkgaW50cm9kdWNlCiAgaW5jb21wYXRpYmlsaXRpZXMgd2l0
aCBjb2RlIGNvbXBpbGVkIGJ5IGVhcmxpZXIgdmVyc2lvbnMgb2YgQ2xhbmcgdGhhdCB1c2VzCiAg
dGhlIGBfX3JlZ2NhbGxgIGNhbGxpbmcgY29udmVudGlvbiBvbiB0aGVzZSB0YXJnZXRzLiAoI0dI
NjI5OTkpICgjR0g5ODYzNSkKLSBGaXhlZCBJdGFuaXVtIG1hbmdsaW5nIGZvciBsYW1iZGFzIGlu
IGluc3RhbnRpYXRlZCBub24tc3RhdGljIGRhdGEgbWVtYmVyCiAgaW5pdGlhbGl6ZXJzIGJ5IHBy
ZXNlcnZpbmcgdGhlIGZpZWxkLW5hbWUgY2xvc3VyZS1wcmVmaXguIFRoaXMgY2hhbmdlcyB0aGUK
ICBtYW5nbGVkIG5hbWVzIGZvciBhZmZlY3RlZCBsYW1iZGFzLiAoI0dIMTkwNTU1KQotIENsYW5n
IG5vdyB1c2VzIE1TVkMtY29tcGF0aWJsZSBtYW5nbGluZ3MgZm9yIHN1cHBvcnRlZCBBQXJjaDY0
IFNWRSBidWlsdGluCiAgdHlwZXMgd2hlbiB0YXJnZXRpbmcgdGhlIE1pY3Jvc29mdCBBQkkuIFRo
aXMgY2hhbmdlcyBzeW1ib2wgbmFtZXMgZm9yCiAgYWZmZWN0ZWQgZGVjbGFyYXRpb25zIGNvbXBh
cmVkIHRvIHByZXZpb3VzIENsYW5nIHJlbGVhc2VzLiAoI0dIMTk2MTcwKQotIFRoZSByZXN1bWUg
YW5kIGRlc3Ryb3kgZnVuY3Rpb25zIG9mIEMrKzIwIGNvcm91dGluZXMgbm93IHVzZSB0aGUgcGxh
dGZvcm0gQwogIGNhbGxpbmcgY29udmVudGlvbiBpbnN0ZWFkIG9mIExMVk0ncyBpbnRlcm5hbCBg
ZmFzdGNjYC4gVGhpcyBtYWtlcyB0aGUKICBjb3JvdXRpbmUgQUJJIHN0YWJsZSBhY3Jvc3MgTExW
TSB2ZXJzaW9ucyBhbmQgaW50ZXJvcGVyYWJsZSB3aXRoIG90aGVyCiAgY29tcGlsZXJzLiBPbiBt
b3N0IHRhcmdldHMgdGhpcyBpcyBub3QgYSBicmVha2luZyBjaGFuZ2UgYmVjYXVzZSBgZmFzdGNj
YAogIGFuZCB0aGUgcGxhdGZvcm0gQyBjYWxsaW5nIGNvbnZlbnRpb24gYWdyZWUgZm9yIGB2b2lk
KHB0cilgLiBJdCBpcyBhbiBBQkkKICBicmVhayBvbiBpNjg2LCBNSVBTIE8zMiwgUG93ZXJQQzY0
IEVMRnYxLCBhbmQgTGFuYWkuCi0gYHZhX2FyZ2Agb24gY2xhbmcgYWFyY2g2NCBtc3ZjIG5vdyBy
ZWFkcyB0eXBlcyB3aXRoIDE2LWJ5dGUgc2l6ZSBhbmQgYWxpZ25tZW50CiAgKGUuZy4gYF9faW50
MTI4YCkgd2l0aCB0aGVpciBhY3R1YWwgYWxpZ25tZW50IChpbnN0ZWFkIG9mIGFuIGFsaWdubWVu
dCBvZiA4CiAgd2hpY2ggd2FzIHVzZWQgYmVmb3JlKS4gU3VjaCBjLXZhcmlhZGljIGFyZ3VtZW50
cyBhcmUgYWxyZWFkeSBwYXNzZWQgYXMKICBhbGlnbmVkLCBzbyBwcmV2aW91c2x5IHJlYWRpbmcg
dGhlIGFyZ3VtZW50IGNvdWxkIHJlYWQgcGFkZGluZy4gQ2xhbmcgbm93CiAgbWF0Y2hlcyBob3cg
TVNWQyByZWFkcyBzdWNoIGMtdmFyaWFkaWMgYXJndW1lbnRzLgotIEZpeGVkIGluY29ycmVjdCBz
dHJ1Y3QgcmV0dXJuIHdoZW4gc2luZ2xlIGxhcmdlIHZlY3RvciAoMjU2LzUxMi1iaXQpIHVzZWQg
b24KICB4ODYtNjQgdGFyZ2V0cy4gKCNHSDIwMzc2MCkgVGhlIGJ1ZyB3YXMgaW50cm9kdWNlZCBz
aW5jZSBDbGFuZyAyMS4gKCNHSDEyMDY3MCkKLSBDbGFuZyBub3cgYXBwbGllcyBNU1ZDJ3MgTUQ1
IHNob3J0ZW5pbmcgdG8gb3Zlci1sb25nIE1pY3Jvc29mdCBDKysgUlRUSSB0eXBlCiAgZGVzY3Jp
cHRvciBuYW1lIHN0cmluZ3MsIG1hdGNoaW5nIHRoZSBiZWhhdmlvciBhbHJlYWR5IHVzZWQgZm9y
IHRoZSBSVFRJCiAgc3ltYm9sIG5hbWVzLiBQcmV2aW91c2x5IHRoZSBmdWxsIG5hbWUgc3RyaW5n
IHdhcyBhbHdheXMgZW1pdHRlZCwgc28gZGVlcGx5CiAgbmVzdGVkIHRlbXBsYXRlIHR5cGVzIChm
b3IgZXhhbXBsZSwgb25lcyBjb250YWluaW5nIGxvY2FsIGxhbWJkYXMpIGNvdWxkCiAgcHJvZHVj
ZSB2ZXJ5IGxhcmdlIHdyaXRhYmxlIGAuZGF0YWAgc2VjdGlvbnMuIEVtaXR0ZWQgUlRUSSBuYW1l
IHN0cmluZ3MKICBjaGFuZ2Ugb25seSBmb3IgdHlwZXMgd2hvc2UgbmFtZSBleGNlZWRzIHRoZSBs
ZW5ndGggbGltaXQuICgjR0gyMDYzMTMpCi0gRml4ZWQgSXRhbml1bSBtYW5nbGluZyBmb3IgbGFt
YmRhcyBpbiBkZWZhdWx0IG1lbWJlciBpbml0aWFsaXplcnMgb2YgbG9jYWwKICBjbGFzc2VzIHRv
IHVzZSBgPGxvY2FsLW5hbWU+YCBlbmNvZGluZywgcHJldmVudGluZyBtYW5nbGluZyBjb2xsaXNp
b25zIGJldHdlZW4KICBkaXN0aW5jdCBsb2NhbCBjbGFzc2VzLgotIEZvciBgeDg2XzY0LXdpbmRv
d3MtbXN2Y2AgdGFyZ2V0cywgQ2xhbmcgbm93IGFsaWducyBnbG9iYWwgdmFyaWFibGVzIHVzaW5n
IHRoZSBNU1ZDIHNpemXigJFiYXNlZCBhbGlnbm1lbnQgc2NoZW1lIGluc3RlYWQgb2YgdGhlIHg4
NuKAkTY0IHBzQUJJICJsYXJnZSBhcnJheSIgcHJvbW90aW9uIHJ1bGUuCiAgVGhpcyBtYWtlcyBh
bGlnbm1lbnQgYmVoYXZpb3IgZnVsbHkgY29tcGF0aWJsZSB3aXRoIE1TVkMgYW5kIGZpeGVzIGlu
Y29ycmVjdCBvdmVy4oCRYWxpZ25tZW50IC8gdW5kZXLigJFhbGlnbm1lbnQgb2YgZ2xvYmFscy4K
ICBgLWZjbGFuZy1hYmktY29tcGF0PTIyYCByZXN0b3JlcyB0aGUgcHJldmlvdXMgYmVoYXZpb3Iu
ICgjR0gxOTYwNzEpLCAoI0dIMTcxODU1KQoKIyMjIEFTVCBEdW1waW5nIFBvdGVudGlhbGx5IEJy
ZWFraW5nIENoYW5nZXMKCi0gVGhlIEpTT04gQVNUIGR1bXAgbm93IGluY2x1ZGVzIGFsbCBmaWVs
ZHMgZnJvbSBgQXZhaWxhYmlsaXR5QXR0cmA6IGBwbGF0Zm9ybWAsCiAgYGludHJvZHVjZWRgLCBg
ZGVwcmVjYXRlZGAsIGBvYnNvbGV0ZWRgLCBgdW5hdmFpbGFibGVgLCBgbWVzc2FnZWAsCiAgYHN0
cmljdGAsIGByZXBsYWNlbWVudGAsIGBwcmlvcml0eWAsIGFuZCBgZW52aXJvbm1lbnRgLiBQcmV2
aW91c2x5LCB0aGVzZQogIGZpZWxkcyB3ZXJlIG1pc3NpbmcgZnJvbSB0aGUgSlNPTiBvdXRwdXQu
Ci0gQ29sb25zIHRoYXQgYXBwZWFyIGF0IHRoZSBlbmQgb2YgYSBQYXJhbUNvbW1lbnRDb21tYW5k
IG5hbWUgYXJlIG5vdCBzZXJpYWxpemVkCiAgYXMgcGFydCBvZiB0aGUgbmFtZS4KLSBBU1QgcHJl
dHR5LXByaW50aW5nIG5vdyByZXNwZWN0cyBgUHJpbnRpbmdQb2xpY3k6OkZ1bGx5UXVhbGlmaWVk
TmFtZWAgd2hlbgogIHByaW50aW5nIGBEZWNsUmVmRXhwcmAgbmFtZXMsIGluY2x1ZGluZyBleHBy
ZXNzaW9uLWZvcm0gbm9uLXR5cGUgdGVtcGxhdGUKICBhcmd1bWVudHMgaW4gcHJpbnRlZCB0eXBl
cy4gUHJldmlvdXNseSwgdGhlc2UgcmVmZXJlbmNlcyBjb3VsZCBiZSBwcmludGVkCiAgdW5xdWFs
aWZpZWQuICgjR0gyMDYwNDEpCgojIyMgQ2xhbmcgRnJvbnRlbmQgUG90ZW50aWFsbHkgQnJlYWtp
bmcgQ2hhbmdlcwoKLSBISVBTUFYgdG9vbGNoYWluOiBgLS1vZmZsb2FkLXRhcmdldHM9c3BpcnZ7
MzIsNjR9YCBvcHRpb24gaXMKICBkZXByZWNhdGVkIGFuZCB3aWxsIGJlIHJlbW92ZWQgd2hlbiB0
aGUgbmV3IG9mZmxvYWQgZHJpdmVyIGJlY29tZXMKICBkZWZhdWx0LiBUaGUgcmVwbGFjZW1lbnQg
Zm9yIHRoZSBvcHRpb24gaXMKICBgLS1vZmZsb2FkLXRhcmdldHM9c3BpcnZ7MzIsNjR9LXVua25v
d24tY2hpcHN0YXJgIHdoZW4gdXNpbmcgdGhlIG5ldwogIG9mZmxvYWQgZHJpdmVyIChgLS1vZmZs
b2FkLW5ldy1kcml2ZXJgKS4KLSBUaGUgbmV3IGRyaXZlciAoYC0tb2ZmbG9hZC1uZXctZHJpdmVy
YCkgaXMgbm93IGRlZmF1bHQgZm9yIGFsbCBvZmZsb2FkaW5nCiAgY29tcGlsYXRpb25zLiBUaGlz
IGNoYW5nZXMgdGhlIEFCSSBmb3IgcmVsb2NhdGFibGUgZGV2aWNlIGNvZGUuIEN1cnJlbnRseSwK
ICBsaWJyYXJpZXMgd2lsbCBuZWVkIHRvIGJlIHJlY29tcGlsZWQsIG9yIHVzZWQgd2l0aAogIChg
LS1uby1vZmZsb2FkLW5ldy1kcml2ZXJgKS4gVGhpcyBvcHRpb24gd2lsbCBiZSByZW1vdmVkIGlu
IHRoZSBuZXh0IHJlbGVhc2UuCi0gQ2xhbmcgbm8gbG9uZ2VyIGRlZmluZXMgdGhlIGBfX2NwcF9p
bXBsX2Nvcm91dGluZWAgZmVhdHVyZSB0ZXN0IG1hY3JvIHVuZGVyIHRoZSAzMi1iaXQgeDg2IE1p
Y3Jvc29mdCBBQkksCiAgYXMgc3VwcG9ydCBmb3IgY29yb3V0aW5lcyBvbiB0aGlzIHRhcmdldCBp
cyBpbmNvbXBsZXRlLgogIFdoZW4gdXNpbmcgY29yb3V0aW5lcyBvbiB0aGlzIHRhcmdldCBhIHdh
cm5pbmcgaXMgZW1taXR0ZWQgdG8gaW5kaWNhdGUgdGhlIGxhY2sgb2YgZnVsbCBzdXBwb3J0Lgog
IFRoYXQgd2FybmluZyBjYW4gYmUgZGlzYWJsZWQgd2l0aCBgLVduby1jb3JvdXRpbmVzLXVuc3Vw
cG9ydGVkLXRhcmdldGAuIChzZWUgI0dINTkzODIpCgojIyMgQ2xhbmcgUHl0aG9uIEJpbmRpbmdz
IFBvdGVudGlhbGx5IEJyZWFraW5nIENoYW5nZXMKCi0gUmVtb3ZlIGBDb21wbGV0aW9uU3RyaW5n
LkF2YWlsYWJpbGl0eWAuIE5vIGxpYmNsYW5nIGludGVyZmFjZXMgcmV0dXJuZWQgaW5zdGFuY2Vz
IG9mIGl0LgoKLSBgQ29tcGxldGlvblN0cmluZy5hdmFpbGFiaWxpdHlgIG5vdyByZXR1cm5zIGlu
c3RhbmNlcyBvZiBgQ29tcGxldGlvblN0cmluZy5BdmFpbGFiaWxpdHlLaW5kQ29tcGF0YC4KCiAg
SW5zdGFuY2VzIG9mIGBBdmFpbGFiaWxpdHlLaW5kQ29tcGF0YCBoYXZlIHRoZSBzYW1lIGBfX3N0
cl9fYCByZXByZXNlbnRhdGlvbgogIGFzIHRoZSBwcmV2aW91cyBgQ29tcGxldGlvbkNodW5rLktp
bmRgIGFuZCBhcmUgZXF1YWxpdHktY29tcGFyYWJsZSB3aXRoCiAgdGhlIGV4aXN0aW5nIGBBdmFp
bGFiaWxpdHlLaW5kYCBlbnVtLiBJdCB3aWxsIGJlIHJlcGxhY2VkIGJ5IGBBdmFpbGFiaWxpdHlL
aW5kYAogIGluIGEgZnV0dXJlIHJlbGVhc2UuIFdoZW4gdGhpcyBoYXBwZW5zLCB0aGUgcmV0dXJu
IHR5cGUgb2YgYENvbXBsZXRpb25TdHJpbmcuYXZhaWxhYmlsaXR5YAogIHdpbGwgY2hhbmdlIHRv
IGBBdmFpbGFiaWxpdHlLaW5kYCwgc28gaXQgaXMgcmVjb21tZW5kZWQgdG8gdXNlIGBBdmFpbGFi
aWxpdHlLaW5kYAogIHRvIGNvbXBhcmUgd2l0aCB0aGUgcmV0dXJuIHZhbHVlcyBvZiBgQ29tcGxl
dGlvblN0cmluZy5hdmFpbGFiaWxpdHlgLgoKLSBSZW1vdmUgYGF2YWlsYWJpbGl0eUtpbmRzYC4g
SW4gdGhpcyByZWxlYXNlLCB1c2VzIG9mIGBhdmFpbGFiaWxpdHlLaW5kc2AKICBuZWVkIHRvIGJl
IHJlcGxhY2VkIGJ5IGBDb21wbGV0aW9uU3RyaW5nLkF2YWlsYWJpbGl0eUtpbmRgLgoKLSBgQ29t
cGxldGlvbkNodW5rLmtpbmRgIG5vdyByZXR1cm5zIGluc3RhbmNlcyBvZiBgQ29tcGxldGlvbkNo
dW5rS2luZGAuCgogIEluc3RhbmNlcyBvZiBgQ29tcGxldGlvbkNodW5rS2luZGAgaGF2ZSB0aGUg
c2FtZSBgX19zdHJfX2AgcmVwcmVzZW50YXRpb24KICBhcyB0aGUgcHJldmlvdXMgYENvbXBsZXRp
b25DaHVuay5LaW5kYCBmb3IgY29tcGF0aWJpbGl0eS4KICBUaGVzZSByZXByZXNlbnRhdGlvbnMg
d2lsbCBiZSBjaGFuZ2VkIGluIGEgZnV0dXJlIHJlbGVhc2UgdG8gbWF0Y2ggb3RoZXIgZW51bXMu
CgotIFJlbW92ZSBgY29tcGxldGlvbkNodW5rS2luZE1hcGAuIEluIHRoaXMgcmVsZWFzZSwgdXNl
cyBvZiBgY29tcGxldGlvbkNodW5rS2luZE1hcGAKICBuZWVkIHRvIGJlIHJlcGxhY2VkIGJ5IGBD
b21wbGV0aW9uQ2h1bmtLaW5kYC4KCi0gTW92ZSBgU1BFTExJTkdfQ0FDSEVgIGludG8gYENvbXBs
ZXRpb25DaHVua2AgYW5kIGNoYW5nZSBpdCB0byB1c2UKICBgQ29tcGxldGlvbkNodW5rS2luZGAg
aW5zdGFuY2VzIGFzIGtleXMsIGluc3RlYWQgb2YgdGhlIGVudW0gdmFsdWVzLgogIEFuIGFsaWFz
IGlzIGtlcHQgaW4gdGhlIGZvcm0gb2YgYSBgU1BFTExJTkdfQ0FDSEVgIHZhcmlhYmxlLCBidXQg
aXQgb25seSBzdXBwb3J0cwogIGBfX2dldGl0ZW1fX2AgYW5kIGBfX2NvbnRhaW5zX19gLiBJdCB3
aWxsIGJlIHJlbW92ZWQgaW4gYSBmdXR1cmUgcmVsZWFzZS4KICBQbGVhc2UgbWlncmF0ZSB0byB1
c2luZyBgQ29tcGxldGlvbkNodW5rLlNQRUxMSU5HX0NBQ0hFYCBpbnN0ZWFkLgoKLSBgU291cmNl
TG9jYXRpb25gIGFuZCBgU291cmNlUmFuZ2VgIG5vdyB1c2UgYE5vdEltcGxlbWVudGVkYCB0byBk
ZWxlZ2F0ZQogIGVxdWFsaXR5IGNoZWNrcyAoYF9fZXFfX2ApIHRvIHRoZSBvdGhlciBvYmplY3Qg
dGhleSBhcmUgY29tcGFyZWQgd2l0aCB3aGVuCiAgdGhleSBhcmUgb2YgZGlmZmVyZW50IGNsYXNz
ZXMuIFRoZXkgcHJldmlvdXNseSByZXR1cm5lZCBgRmFsc2VgIHdoZW4gY29tcGFyZWQKICB3aXRo
IG9iamVjdHMgb2Ygb3RoZXIgY2xhc3Nlcy4KCi0gYFRyYW5zbGF0aW9uVW5pdC5nZXRfdG9rZW5z
YCBub3cgdGhyb3dzIGFuIGVycm9yIGlmIGJvdGggdGhlIGBleHRlbnRgIGFuZAogIGBsb2NhdGlv
bnNgIGFyZ3VtZW50IGFyZSBwYXNzZWQuIFByZXZpb3VzeSwgYGxvY2F0aW9uc2AgdG9vayBwcmVj
ZWRlbmNlLgoKLSBgX0NYVW5zYXZlZEZpbGVgIHdpbGwgYmUgcmVuYW1lZCB0byBgVW5zYXZlZEZp
bGVgIGZvciBjb25zaXN0ZW5jeS4KICBgVW5zYXZlZEZpbGVgIGlzIGFscmVhZHkgYXZhaWxhYmxl
IHRvIHVzZSBhbmQgZXhpc3RpbmcgdXNlcyBzaG91bGQKICBiZSBhZGFwdGVkIHRvIHJlZmVyIHRv
IGl0IGluc3RlYWQuIGBfQ1hVbnNhdmVkRmlsZWAgd2lsbCBiZSByZW1vdmVkIGluIGEKICBmdXR1
cmUgcmVsZWFzZS4KCiMjIyBPcGVuQ0wgUG90ZW50aWFsbHkgQnJlYWtpbmcgQ2hhbmdlcwoKLSBD
bGFuZyBub3cgZGlhZ25vc2VzIHplcm8tbGVuZ3RoIGFycmF5cyBhcyBlcnJvcnMgaW4gT3BlbkNM
LiBPcGVuQ0wgQyAzLjAKICBzZWN0aW9uIDYuMTEuZCBzdGF0ZXMgdGhhdCAiVmFyaWFibGUgbGVu
Z3RoIGFycmF5cyBhbmQgc3RydWN0dXJlcyB3aXRoCiAgZmxleGlibGUgKG9yIHVuc2l6ZWQpIGFy
cmF5cyBhcmUgbm90IHN1cHBvcnRlZC4iCgp7I3doYXQtcy1uZXctaW4tY2xhbmctcmVsZWFzZX0K
IyMgV2hhdCdzIE5ldyBpbiBDbGFuZyB7e2Vudi5jb25maWcucmVsZWFzZX19PwoKIyMjIEMrKyBM
YW5ndWFnZSBDaGFuZ2VzCgotIGBfX2lzX3RyaXZpYWxseV9lcXVhbGl0eV9jb21wYXJhYmxlYCBu
byBsb25nZXIgcmV0dXJucyBmYWxzZSBmb3IgYWxsIGVudW0gdHlwZXMuICgjR0gxMzI2NzIpCi0g
YGF1dG9gIHBhcmFtZXRlcnMgYXJlIG5vdyBhdmFpbGFibGUgaW4gYWxsIEMrKyBsYW5ndWFnZSBt
b2RlcyBhcyBhbiBleHRlbnNpb24uCgojIyMjIEMrKzJkIEZlYXR1cmUgU3VwcG9ydAoKLSBBZGRl
ZCBjb21waWxlciBmbGFncyBgLXN0ZD1jKysyZGAgYW5kIGAtc3RkPWdudSsrMmRgIGZvciBleHBl
cmltZW50YWwgQysrMmQgaW1wbGVtZW50YXRpb24gd29yay4KCi0gQ2xhbmcgbm93IHN1cHBvcnRz
IFtQMzczM1IxXShodHRwczovL3dnMjEubGluay9wMzczM3IxPikgTW9yZSBuYW1lZCB1bml2ZXJz
YWwgY2hhcmFjdGVyIGVzY2FwZXMuCiAgVGhlIGNoYW5nZSBpcyBhcHBsaWVkIGFzIGEgRFIgdG8g
YWxsIEMrKyBsYW5ndWFnZSBtb2Rlcy4gKCNHSDIwMzk0NCkKCiMjIyMgQysrMmMgRmVhdHVyZSBT
dXBwb3J0CgotIENsYW5nIG5vdyBwcm9wYWdhdGVzIGBjb25zdGluaXRgIGFuZCBgY29uc3RleHBy
YCBpbiBzdHJ1Y3R1cmVkIGJpbmRpbmdzIHdpdGggdHVwbGUtbGlrZSBpbml0aWFsaXplcnMuCgot
IENsYW5nIG5vdyBoYXMgcGFydGlhbCBzdXBwb3J0IGZvciBbUDEzMDZSNV0oaHR0cHM6Ly93ZzIx
LmxpbmsvUDEzMDZSNSkgRXhwYW5zaW9uIFN0YXRlbWVudHMuIEl0ZXJhdGluZyBleHBhbnNpb24K
ICBzdGF0ZW1lbnRzIGN1cnJlbnRseSBjYW5ub3QgYmUgZXhwYW5kZWQgYW5kIHdpbGwgcmVzdWx0
IGluIGEgZGlhZ25vc3RpYywgYnV0IG90aGVyIHR5cGVzIG9mIGV4cGFuc2lvbiBzdGF0ZW1lbnRz
IHdvcmsuCgojIyMjIEMrKzIzIEZlYXR1cmUgU3VwcG9ydAoKLSBQYXJ0aWFsbHkgaW1wbGVtZW50
IEl0YW5pdW0gbWFuZ2xpbmcgZm9yIHBhY2sgaW5kZXhpbmcuIFBhcnRpYWxseSBzdWJzdGl0dXRl
ZCBwYWNrcyBhcmUgbm90IHlldCBzdXBwb3J0ZWQuICgjR0gxMTIwMDMpCgojIyMjIEMrKzIwIEZl
YXR1cmUgU3VwcG9ydAoKLSBDbGFuZyBub3cgc3VwcG9ydHMgW1AxODU3UjNdKGh0dHBzOi8vd2cy
MS5saW5rL3AxODU3cjMpIE1vZHVsZXMgRGVwZW5kZW5jeSBEaXNjb3ZlcnkuICgjR0g1NDA0NykK
CiMjIyMgQysrMTcgRmVhdHVyZSBTdXBwb3J0CgojIyMjIFJlc29sdXRpb25zIHRvIEMrKyBEZWZl
Y3QgUmVwb3J0cwoKLSBDbGFuZyBub3cgaW1wbGVtZW50cyBbQ1dHMTUwNF0oaHR0cHM6Ly9jcGx1
c3BsdXMuZ2l0aHViLmlvL0NXRy9pc3N1ZXMvMTUwNC5odG1sKQogIHdoaWNoIG1ha2VzIHBvaW50
ZXIgYXJpdGhtZXRpYyBhZnRlciBkZXJpdmVkLWJhc2UgY29udmVyc2lvbiB1bmRlZmluZWQgYmVo
YXZpb3IsCiAgYWxsb3dpbmcgZGV2aXJ0dWFsaXphdGlvbiBvZiBjYWxscyB0aHJvdWdoIG5vbi16
ZXJvIGFycmF5IHN1YnNjcmlwdHMuCi0gSW1wbGVtZW50ZWQgW0NXRzE3ODAgRXhwbGljaXQgaW5z
dGFudGlhdGlvbi9zcGVjaWFsaXphdGlvbiBvZiBnZW5lcmljIGxhbWJkYQogIG9wZXJhdG9yKCld
KGh0dHBzOi8vY3BsdXNwbHVzLmdpdGh1Yi5pby9DV0cvaXNzdWVzLzE3ODAuaHRtbCkKLSBDbGFu
ZyBub3cgYWxsb3dzIG9taXR0aW5nIGB0eXBlbmFtZWAgYmVmb3JlIGEgdGVtcGxhdGUgbmFtZSBp
biBhCiAgY29udmVyc2lvbiBvcGVyYXRvciwgaW1wbGVtZW50aW5nIFtDV0cyNDEzXShodHRwczov
L3dnMjEubGluay9jd2cyNDEzKS4KLSBNZW1iZXIgc3BlY2lhbGl6YXRpb25zIGNhbiBub3cgYmUg
ZGVjbGFyZWQgaW4gY2xhc3Mgc2NvcGUsIGFjY29yZGluZyB0byB0aGUKICByZXNvbHV0aW9uIG9m
IFtDV0c3MjddKGh0dHBzOi8vd2cyMS5saW5rL2N3ZzcyNykuIFRoaXMgaXMgc3RpbGwgbm90IHN1
ZmZpY2llbnQKICB0byByZXNvbHZlIHRoYXQgY29yZSBpc3N1ZS4KLSBDbGFuZyBub3cgdXNlcyBu
b24tcmVmZXJlbmNlIHR5cGVzIGZvciBzdHJ1Y3R1cmVkIGJpbmRpbmdzIHdob3NlIGluaXRpYWxp
emVyCiAgcmV0dXJucyBhIHBydmFsdWUuIFRoaXMgcmVzb2x2ZXMgW0NXRzMxMzVdKGh0dHBzOi8v
d2cyMS5saW5rL2N3ZzMxMzUpLgoKIyMjIEMgTGFuZ3VhZ2UgQ2hhbmdlcwoKIyMjIyBDMnkgRmVh
dHVyZSBTdXBwb3J0CgotIEltcGxlbWVudGVkIHRoZSB0eXBlLXNwZWNpZmljIEMyeSBgPHN0ZGJp
dC5oPmAgcm90YXRlIGZ1bmN0aW9ucyB3aXRoIGNvbnN0ZXhwcgogIGV2YWx1YXRpb24gc3VwcG9y
dDoKICBgc3RkY19yb3RhdGVfbGVmdF97dWMsdXMsdWksdWwsdWxsfWAgYW5kCiAgYHN0ZGNfcm90
YXRlX3JpZ2h0X3t1Yyx1cyx1aSx1bCx1bGx9YC4KLSBJbXBsZW1lbnRlZCBDMnkgYDxzdGRiaXQu
aD5gIG1lbW9yeSByZXZlcnNhbCBmdW5jdGlvbnM6CiAgYF9fYnVpbHRpbl9zdGRjX21lbXJldmVy
c2U4YCAvIGBzdGRjX21lbXJldmVyc2U4YCAoaW4tcGxhY2UgYnl0ZQogIHJldmVyc2FsIG9mIGEg
Ynl0ZSBhcnJheSkgYW5kIGBzdGRjX21lbXJldmVyc2U4dXs4LDE2LDMyLDY0fWAgKGJ5dGUtc3dh
cAogIG9mIGFuIGV4YWN0LXdpZHRoIHVuc2lnbmVkIGludGVnZXIgdmFsdWUsIHVzYWJsZSBpbiBj
b25zdGFudCBleHByZXNzaW9ucykuCgojIyMjIEMyMyBGZWF0dXJlIFN1cHBvcnQKCi0gQ2xhbmcg
bm93IGFsbG93cyBDMjMgYGNvbnN0ZXhwcmAgc3RydWN0IG1lbWJlciBhY2Nlc3MgdGhyb3VnaCB0
aGUgZG90IG9wZXJhdG9yIGluIGNvbnN0YW50IGV4cHJlc3Npb25zLiAoI0dIMTc4MzQ5KQotIEZp
eGVkIGEgZmFpbGluZyBhc3NlcnRpb24gd2hlbiB2YWxpZGF0aW5nIGFuIGludmFsaWQgc3RydWN0
dXJlIHJlZGVmaW5pdGlvbgogIHdpdGggYSBtZW1iZXIgd2hpY2ggdXNlcyBhbiBpbmNvbXBsZXRl
IGVudW1lcmF0aW9uIHR5cGUuICgjR0gxOTAyMjcpCi0gQ2xhbmcgbm93IHN1cHBvcnRzIHRoZSBD
MjMgYHdOYCBhbmQgYHdmTmAgbGVuZ3RoIG1vZGlmaWVycy4gKCNHSDExNjk2MikKLSBDbGFuZyBu
b3cgcmVjb2duaXplcyB0aGUgQzIzIGBIYCwgYERgLCBhbmQgYEREYCBsZW5ndGggbW9kaWZpZXJz
IGluCiAgZm9ybWF0IHN0cmluZ3MgYW5kIGRpYWdub3NlcyB0aGVpciB1c2UgYmVjYXVzZSBDbGFu
ZyBkb2VzIG5vdCB5ZXQgc3VwcG9ydAogIHRoZSBjb3JyZXNwb25kaW5nIGRlY2ltYWwgZmxvYXRp
bmctcG9pbnQgdHlwZXMsIGBfRGVjaW1hbDMyYCwgYF9EZWNpbWFsNjRgLCBhbmQgYF9EZWNpbWFs
MTI4YC4gKCNHSDExNjk2MikKLSBGaXhlZCBhIGJ1ZyB3aXRoIGRlZHVjaW5nIHF1YWxpZmllZCBp
bmZlcnJlZCB0eXBlcyB3aXRoIGBhdXRvYC4gYGF1dG9gIGNhbiBub3cKICBiZSBjb21iaW5lZCB3
aXRoIGByZXN0cmljdGAgb3IgYF9BdG9taWNgIHRvIGZvcm0gYSBwcm9wZXJseS1xdWFsaWZpZWQg
dHlwZS4gKCNHSDIwNzQ2NikKLSBGaXhlZCBhIGJ1ZyB3aGVyZSBhbiBlbnVtZXJhdG9yIGZvbGxv
d2luZyBhIGBfQml0SW50YC10eXBlZCBlbnVtZXJhdG9yIGtlcHQKICB0aGUgYml0LXByZWNpc2Ug
dHlwZSBhbmQgd3JhcHBlZCBhcm91bmQgb24gb3ZlcmZsb3cgaW5zdGVhZCBvZiB0YWtpbmcgYQog
IHN1aXRhYmx5IHNpemVkIHN0YW5kYXJkIGludGVnZXIgdHlwZS4gKCNHSDIwODE2MykKCiMjIyBP
YmplY3RpdmUtQyBMYW5ndWFnZSBDaGFuZ2VzCgotIENsYW5nIG5vdyBlbWl0cyBPYmplY3RpdmUt
QyBudW1iZXIsIGFycmF5LCBhbmQgZGljdGlvbmFyeSBsaXRlcmFscyBhcwogIGNvbXBpbGUtdGlt
ZSBjb25zdGFudCBkYXRhIHN0cnVjdHVyZXMgcmF0aGVyIHRoYW4gcnVudGltZSBgb2JqY19tc2dT
ZW5kYAogIGNhbGxzIG9uIHRhcmdldHMgd2hvc2UgcnVudGltZSBzdXBwb3J0cyBjb25zdGFudCBs
aXRlcmFsIGNsYXNzZXMuIFRoZQogIGZlYXR1cmUgY2FuIGJlIGRpc2FibGVkIGFsdG9nZXRoZXIg
d2l0aCBgLWZuby1vYmpjLWNvbnN0YW50LWxpdGVyYWxzYCwKICBvciBzZWxlY3RpdmVseSBwZXIg
bGl0ZXJhbCBraW5kIHdpdGggYC1mbm8tY29uc3RhbnQtbnNudW1iZXItbGl0ZXJhbHNgLAogIGAt
Zm5vLWNvbnN0YW50LW5zYXJyYXktbGl0ZXJhbHNgLCBhbmQKICBgLWZuby1jb25zdGFudC1uc2Rp
Y3Rpb25hcnktbGl0ZXJhbHNgLgoKIyMjIE5vbi1jb21wcmVoZW5zaXZlIGxpc3Qgb2YgY2hhbmdl
cyBpbiB0aGlzIHJlbGVhc2UKCi0gQ2xhbmcgY2FuIG5vdyBkZXZpcnR1YWxpemUgdmlydHVhbCBm
dW5jdGlvbiBjYWxscyBvbiBvYmplY3RzIGFjY2Vzc2VkIHRocm91Z2gKICBhcnJheSBzdWJzY3Jp
cHQgZXhwcmVzc2lvbnMgd2l0aCBub24temVybyBjb25zdGFudCBpbmRpY2VzLCBiYXNlZCBvbiB0
aGUKICByZXNvbHV0aW9uIG9mIFtDV0cxNTA0XShodHRwczovL2NwbHVzcGx1cy5naXRodWIuaW8v
Q1dHL2lzc3Vlcy8xNTA0Lmh0bWwpLgotIEFkZGVkIHN1cHBvcnQgZm9yIGZsb2F0aW5nIHBvaW50
IGFuZCBwb2ludGVyIHZhbHVlcyBpbiBtb3N0IGBfX2F0b21pY19gCiAgYnVpbHRpbnMuCi0gQWRk
ZWQgYF9fYnVpbHRpbl9zdGRjX3JvdGF0ZV9sZWZ0YCBhbmQgYF9fYnVpbHRpbl9zdGRjX3JvdGF0
ZV9yaWdodGAKICBmb3IgYml0IHJvdGF0aW9uIG9mIHVuc2lnbmVkIGludGVnZXJzIGluY2x1ZGlu
ZyBgX0JpdEludGAgdHlwZXMuIFJvdGF0aW9uCiAgY291bnRzIGFyZSBub3JtYWxpemVkIG1vZHVs
byB0aGUgYml0LXdpZHRoIGFuZCBzdXBwb3J0IG5lZ2F0aXZlIHZhbHVlcy4KICBVc2FibGUgaW4g
Y29uc3RhbnQgZXhwcmVzc2lvbnMuIEltcGxpY2l0IGNvbnZlcnNpb24gaXMgc3VwcG9ydGVkIGZv
cgogIGNsYXNzL3N0cnVjdCB0eXBlcyB3aXRoIGNvbnZlcnNpb24gb3BlcmF0b3JzLgotIEltcGxl
bWVudGVkIHRoZSBmb2xsb3dpbmcgQzIzIGA8c3RkYml0Lmg+YCBidWlsdGlucyB3aXRoIGBfQml0
SW50YAogIHN1cHBvcnQgYW5kIGNvbnN0ZXhwciBldmFsdWF0aW9uOgogIGBfX2J1aWx0aW5fc3Rk
Y19sZWFkaW5nX3plcm9zYCwgYF9fYnVpbHRpbl9zdGRjX2xlYWRpbmdfb25lc2AsCiAgYF9fYnVp
bHRpbl9zdGRjX3RyYWlsaW5nX3plcm9zYCwgYF9fYnVpbHRpbl9zdGRjX3RyYWlsaW5nX29uZXNg
LAogIGBfX2J1aWx0aW5fc3RkY19maXJzdF9sZWFkaW5nX3plcm9gLCBgX19idWlsdGluX3N0ZGNf
Zmlyc3RfbGVhZGluZ19vbmVgLAogIGBfX2J1aWx0aW5fc3RkY19maXJzdF90cmFpbGluZ196ZXJv
YCwgYF9fYnVpbHRpbl9zdGRjX2ZpcnN0X3RyYWlsaW5nX29uZWAsCiAgYF9fYnVpbHRpbl9zdGRj
X2NvdW50X3plcm9zYCwgYF9fYnVpbHRpbl9zdGRjX2NvdW50X29uZXNgLAogIGBfX2J1aWx0aW5f
c3RkY19oYXNfc2luZ2xlX2JpdGAsIGBfX2J1aWx0aW5fc3RkY19iaXRfd2lkdGhgLAogIGBfX2J1
aWx0aW5fc3RkY19iaXRfZmxvb3JgLCBhbmQgYF9fYnVpbHRpbl9zdGRjX2JpdF9jZWlsYC4KLSBJ
bXBsZW1lbnRlZCB0aGUgdHlwZS1zcGVjaWZpYyBDMjMgYDxzdGRiaXQuaD5gIGZ1bmN0aW9ucyB3
aXRoIGNvbnN0ZXhwcgogIGV2YWx1YXRpb24gc3VwcG9ydDoKICBgc3RkY19sZWFkaW5nX3plcm9z
X3t1Yyx1cyx1aSx1bCx1bGx9YCwKICBgc3RkY19sZWFkaW5nX29uZXNfe3VjLHVzLHVpLHVsLHVs
bH1gLAogIGBzdGRjX3RyYWlsaW5nX3plcm9zX3t1Yyx1cyx1aSx1bCx1bGx9YCwKICBgc3RkY190
cmFpbGluZ19vbmVzX3t1Yyx1cyx1aSx1bCx1bGx9YCwKICBgc3RkY19maXJzdF9sZWFkaW5nX3pl
cm9fe3VjLHVzLHVpLHVsLHVsbH1gLAogIGBzdGRjX2ZpcnN0X2xlYWRpbmdfb25lX3t1Yyx1cyx1
aSx1bCx1bGx9YCwKICBgc3RkY19maXJzdF90cmFpbGluZ196ZXJvX3t1Yyx1cyx1aSx1bCx1bGx9
YCwKICBgc3RkY19maXJzdF90cmFpbGluZ19vbmVfe3VjLHVzLHVpLHVsLHVsbH1gLAogIGBzdGRj
X2NvdW50X3plcm9zX3t1Yyx1cyx1aSx1bCx1bGx9YCwKICBgc3RkY19jb3VudF9vbmVzX3t1Yyx1
cyx1aSx1bCx1bGx9YCwKICBgc3RkY19oYXNfc2luZ2xlX2JpdF97dWMsdXMsdWksdWwsdWxsfWAs
CiAgYHN0ZGNfYml0X3dpZHRoX3t1Yyx1cyx1aSx1bCx1bGx9YCwKICBgc3RkY19iaXRfZmxvb3Jf
e3VjLHVzLHVpLHVsLHVsbH1gLCBhbmQKICBgc3RkY19iaXRfY2VpbF97dWMsdXMsdWksdWwsdWxs
fWAuCi0gQSBuZXcgZ2VuZXJpYyBiaXQtcmV2ZXJzZSBidWlsdGluIGZ1bmN0aW9uIGBfX2J1aWx0
aW5fYml0cmV2ZXJzZWdgIHRoYXQKICBleHRlbmRzIGJpdC1yZXZlcnNhbCBzdXBwb3J0IHRvIGFs
bCBzdGFuZGFyZCBpbnRlZ2VycyB0eXBlLCBpbmNsdWRpbmcKICBgX0JpdEludGAKLSBBZGRlZCBg
X19idWlsdGluX2VsZW1lbnR3aXNlX2NsbXVsYCBmb3IgY2FycnktbGVzcyBtdWx0aXBsaWNhdGlv
biBvZgogIGludGVnZXJzIGluY2x1ZGluZyBgX0JpdEludGAgdHlwZXMuIFRoaXMgaW5jbHVkZXMg
Y29uc3RleHByIGV2YWx1YXRpb24KICBzdXBwb3J0LgotIEFkZGVkIGBfX2J1aWx0aW5fZWxlbWVu
dHdpc2VfcGV4dGAgYW5kIGBfX2J1aWx0aW5fZWxlbWVudHdpc2VfcGRlcGAgZm9yCiAgcGFyYWxs
ZWwgYml0IGV4dHJhY3QgYW5kIHBhcmFsbGVsIGJpdCBkZXBvc2l0IG9wZXJhdGlvbnMgb24gaW50
ZWdlcnMgaW5jbHVkaW5nCiAgYF9CaXRJbnRgIHR5cGVzLiBUaGlzIGluY2x1ZGVzIGNvbnN0ZXhw
ciBldmFsdWF0aW9uIHN1cHBvcnQuCi0gRGVwcmVjYXRlZCBmbG9hdCB0eXBlcyBzdXBwb3J0IGZy
b20gYF9fYnVpbHRpbl9lbGVtZW50d2lzZV9tYXhgIGFuZAogIGBfX2J1aWx0aW5fZWxlbWVudHdp
c2VfbWluYC4KLSBBZGRlZCBoZWFkZXIgYGVuZGlhbi5oYCB3aGljaCBjb250YWlucyBieXRlIG9y
ZGVyIGhlbHBlcnMgc3BlY2lmaWVkIGluIFBPU0lYCi0gQWRkZWQgI3ByYWdtYSBsb29wIGxpY20o
ZGlzYWJsZSkgZm9yIGxsdm0ubG9vcC5saWNtLmRpc2FibGUgbWV0YWRhdGEKLSBBZGRlZCBhIG5l
dyBgRXhwbGljaXRJbnN0YW50aWF0aW9uRGVjbGAgQVNUIG5vZGUgdG8gcmVwcmVzZW50IGV4cGxp
Y2l0CiAgdGVtcGxhdGUgaW5zdGFudGlhdGlvbnMgKGUuZy4sIGB0ZW1wbGF0ZSB2b2lkIGZvbzxp
bnQ+KCk7YCBvcgogIGBleHRlcm4gdGVtcGxhdGUgY2xhc3MgUzxpbnQ+O2ApLiBQcmV2aW91c2x5
LCBzb3VyY2UgbG9jYXRpb24gaW5mb3JtYXRpb24KICBmb3IgZXhwbGljaXQgaW5zdGFudGlhdGlv
biBzdGF0ZW1lbnRzIHdhcyBkaXNjYXJkZWQgYWZ0ZXIgcGFyc2luZy4gVGhlIG5ldwogIG5vZGUg
cHJlc2VydmVzIHRoZSBmdWxsIHNvdXJjZSByYW5nZSBpbmNsdWRpbmcgdGhlIGBleHRlcm5gIGFu
ZCBgdGVtcGxhdGVgCiAga2V5d29yZHMsIHF1YWxpZmllcnMsIHRlbXBsYXRlIGFyZ3VtZW50cyBh
cyB3cml0dGVuLCBhbmQgdGhlIGRlY2xhcmVkIHR5cGUsCiAgZW5hYmxpbmcgdG9vbHMgc3VjaCBh
cyBsYW5ndWFnZSBzZXJ2ZXJzIGFuZCByZWZhY3RvcmluZyBlbmdpbmVzIHRvIGFjY3VyYXRlbHkK
ICBtYXAgc291cmNlIGxvY2F0aW9ucyBiYWNrIHRvIGV4cGxpY2l0IGluc3RhbnRpYXRpb24gc2l0
ZXMuCi0gYHR5cGVpZGAgb24gcmVmZXJlbmNlcyBhbmQgcG9pbnRlcnMgb2YgYGZpbmFsYCB0eXBl
cyBubyBsb25nZXIgZW1pdHMgYQogIHZ0YWJsZSBsb29rdXAgYXQgcnVudGltZS4KLSBVcGRhdGVk
IHN1cHBvcnQgZm9yIFVuaWNvZGUgZnJvbSAxNS4xIHRvIDE4LjAuCi0gTGludXggYW5kIFdpbmRv
d3MgdG9vbGNoYWlucyBub3cgc3VwcG9ydCBDbGFuZyBtdWx0aWxpYnMgdXNpbmcKICBgLWZtdWx0
aWxpYi1mbGFnPWAuCi0gVGhlIFNhZmVTdGFjayBidWlsdGlucyBgX19idWlsdGluX19fZ2V0X3Vu
c2FmZV9zdGFja19wdHJgLAogIGBfX2J1aWx0aW5fX19nZXRfdW5zYWZlX3N0YWNrX2JvdHRvbWAs
IGBfX2J1aWx0aW5fX19nZXRfdW5zYWZlX3N0YWNrX3RvcGAsCiAgYW5kIGBfX2J1aWx0aW5fX19n
ZXRfdW5zYWZlX3N0YWNrX3N0YXJ0YCBhcmUgbm93IGRlcHJlY2F0ZWQuIFVzZSB0aGUKICBjb3Jy
ZXNwb25kaW5nIGZ1bmN0aW9ucyBmcm9tIGA8c2FuaXRpemVyL3NhZmVzdGFja19pbnRlcmZhY2Uu
aD5gIGluc3RlYWQuCgojIyMgTmV3IENvbXBpbGVyIEZsYWdzCgotIE5ldyBvcHRpb24gYC1mbXMt
YW5vbnltb3VzLXN0cnVjdHNgIC8gYC1mbm8tbXMtYW5vbnltb3VzLXN0cnVjdHNgIGFkZGVkCiAg
dG8gZW5hYmxlIG9yIGRpc2FibGUgTWljcm9zb2Z0J3MgYW5vbnltb3VzIHN0cnVjdC91bmlvbiBl
eHRlbnNpb24gd2l0aG91dAogIGVuYWJsaW5nIG90aGVyIGAtZm1zLWV4dGVuc2lvbnNgIGZlYXR1
cmVzICgjR0gxNzc2MDcpLgotIE5ldyBvcHRpb24gYC0tcHJlY29tcGlsZS1yZWR1Y2VkLWJtaWAg
YWxsb3dzIGJ1aWxkIHN5c3RlbSB0byBnZW5lcmF0ZSBhCiAgcmVkdWNlZCBCTUkgb25seSBmb3Ig
YSBDKysyMCBpbXBvcnRhYmxlIG1vZHVsZSB1bml0LiBQcmV2aW91c2x5IHRoZSB1c2VycwogIGNh
biBvbmx5IGdlbmVyYXRlIHRoZSByZWR1Y2VkIEJNSSBhcyBhIGJ5LXByb2R1Y3QsIGUuZywgYW4g
b2JqZWN0IGZpbGVzIG9yCiAgYSBmdWxsIEJNSS4KLSBOZXcgYC1jYzFgIG9wdGlvbiBgLWZleHBl
cmltZW50YWwtb3ZlcmZsb3ctYmVoYXZpb3ItdHlwZXNgIGFkZGVkIHRvCiAgZW5hYmxlIHBhcnNp
bmcgb2YgdGhlIGV4cGVyaW1lbnRhbCBgb3ZlcmZsb3dfYmVoYXZpb3JgIHR5cGUgYXR0cmlidXRl
IGFuZAogIHR5cGUgc3BlY2lmaWVycy4KLSBOZXcgYC1jbGAgb3B0aW9uIGAvZDJndWFyZG5vY2hl
Y2tzYCBhZGRlZCB0byBtYXRjaCBNU1ZDLiBXaGVuIFdpbmRvd3MKICBDb250cm9sIEZsb3cgR3Vh
cmQgKENGRykgaXMgZW5hYmxlZCBieSBvdGhlciBvcHRpb25zLCBpdCB3aWxsIGluc3RydWN0IENs
YW5nCiAgdG8gZW1pdCB0aGUgQ0ZHIG1ldGFkYXRhLCBidXQgZGlzYWJsZSBhZGRpbmcgY2hlY2tz
LgotIE5ldyBvcHRpb24gYC1mZGlhZ25vc3RpY3Mtc2hvdy1pbmxpbmluZy1jaGFpbmAgYWRkZWQg
dG8gc2hvdyBpbmxpbmluZyBjaGFpbgogIG5vdGVzIGZvciBgW1tnbnU6Ondhcm5pbmddXWAgYW5k
IGBbW2dudTo6ZXJyb3JdXWAgZGlhZ25vc3RpY3MuIFdoZW4gYQogIGZ1bmN0aW9uIHdpdGggdGhl
c2UgYXR0cmlidXRlcyBpcyBjYWxsZWQgZnJvbSBhbiBpbmxpbmVkIGNvbnRleHQsIENsYW5nIGNh
bgogIG5vdyBzaG93IHdoaWNoIGZ1bmN0aW9ucyB3ZXJlIGlubGluZWQgdG8gcmVhY2ggdGhlIGNh
bGwuIFdoZW4gZGVidWcgaW5mbyBpcwogIGF2YWlsYWJsZSAoYC1nbGluZS1kaXJlY3RpdmVzLW9u
bHlgIChpbXBsaWNpdGx5IGVuYWJsZWQgYXQgYC1nMWApIG9yCiAgaGlnaGVyKSwgYWNjdXJhdGUg
c291cmNlIGxvY2F0aW9ucyBhcmUgdXNlZDsgb3RoZXJ3aXNlLCBhIGhldXJpc3RpYyBmYWxsYmFj
awogIGlzIHVzZWQgd2l0aCBhIG5vdGUgc3VnZ2VzdGluZyBob3cgdG8gZW5hYmxlIGRlYnVnIGlu
Zm8gZm9yIGJldHRlciBhY2N1cmFjeS4KLSBOZXcgb3B0aW9uIGAtZndpbi1jZmctbWVjaGFuaXNt
PWAgYWRkZWQgdG8gY29udHJvbCB0aGUgbWVjaGFuaXNtIHVzZWQgYnkKICBDb250cm9sIEZsb3cg
R3VhcmQgb24gV2luZG93cy4gQWNjZXB0ZWQgdmFsdWVzIGFyZSBgYXV0b21hdGljYCAoZGVmYXVs
dCksCiAgYGRpc3BhdGNoYCwgYW5kIGBjaGVja2AuIFRoZSBgZGlzcGF0Y2hgIG1lY2hhbmlzbSB1
c2VzIHRoZSBkaXNwYXRjaAogIGZ1bmN0aW9uIHRvIHBlcmZvcm0gaW5kaXJlY3QgY2FsbCBjaGVj
a3MgYW5kIGNhbiBpbXByb3ZlIHBlcmZvcm1hbmNlLCB3aGlsZQogIGBjaGVja2AgdXNlcyB0aGUg
dHJhZGl0aW9uYWwgY2hlY2sgbWVjaGFuaXNtLgotIE5ldyBgLWNsYCBvcHRpb24gYC9kMmd1YXJk
Y2ZnZGlzcGF0Y2hgIGFkZGVkIHRvIG1hdGNoIE1TVkMuIFRoaXMgYWN0cyBhcyBhCiAgc2hvcnRo
YW5kIGZvciBgLWZ3aW4tY2ZnLW1lY2hhbmlzbT1kaXNwYXRjaGAuCi0gTmV3IGAtY2xgIG9wdGlv
biBgL2QyZ3VhcmRjZmdkaXNwYXRjaC1gIGFkZGVkIHRvIG1hdGNoIE1TVkMuIFRoaXMgYWN0cyBh
cyBhCiAgc2hvcnRoYW5kIGZvciBgLWZ3aW4tY2ZnLW1lY2hhbmlzbT1jaGVja2AuCi0gTmV3IG9w
dGlvbiBgLWZbbm8tXXN0cmljdC1ib29sYCBhZGRlZCB0byBjb250cm9sIHdoZXRoZXIgQ2xhbmcg
Y2FuIGFzc3VtZQogIHRoYXQgYGJvb2xgIHZhbHVlcyBsb2FkZWQgZnJvbSBtZW1vcnkgY2Fubm90
IGhhdmUgYSBiaXQgcGF0dGVybiBvdGhlcgogIHRoYW4gMCBvciAxLgotIE5ldyBvcHRpb24gYC1m
Y3Jhc2gtZGlhZ25vc3RpY3MtdGFyYCBhZGRlZCB0byBjcmVhdGUgYW4gYXJjaGl2ZSBvZiBjcmFz
aAogIHJlcHJvZHVjZXIgZmlsZXMgZm9yIGVhc2llciBidWcgZmlsaW5nLgotIFRoZXJlIGFyZSBh
IG5ldyBwYWlyIG9mIGZsYWdzIGZvciByaXNjdjMyIGNhbGxlZCBgLW16aWxzZC13b3JkLWFsaWdu
YCBhbmQKICBgLW16aWxzZC1zdHJpY3QtYWxpZ25gIHdoaWNoIGNvbnRyb2wgd2hldGhlciBaaWxz
ZCBhY2Nlc3NlcyBhcmUgYWxsb3dlZCB0bwogIGJlIGFsaWduZWQgdG8gNC1ieXRlIGFsaWdubWVu
dCByYXRoZXIgdGhhbiBmdWxseSB1bmFsaWduZWQgb3IgZnVsbHkgKDgtYnl0ZSkKICBhbGlnbmVk
LgotIE5ldyBgLWNsYCBvcHRpb24gYC9wYXRobWFwOmAgYWRkZWQgdG8gbWF0Y2ggTVNWQy4gVGhp
cyBvcHRpb24gYWN0cyBhcyBhCiAgY2xhbmcncyBgLWZmaWxlLXByZWZpeC1tYXA9dmFsdWVgIGFu
ZCBoYXMga25vd24gZGlmZmVyZW5jZXMgaW4gYmVoYXZpb3VyCiAgd2l0aCB0aGUgQ0wncyBvcHRp
b24gdGhhdCBkbyBub3QgYWZmZWN0IHRoZSBmdW5jdGlvbmFsaXR5OiBub21hbGl6ZXMgdGhlCiAg
bWFjcm8gcHJlZml4IG1hcCBwYXRoZXMgLS0gcmVtb3ZlcyBgLi9gIGFuZCB1c2VzIHRoZSB0YXJn
ZXQncyBwbGF0Zm9ybS0KICBzcGVjaWZpYyBwYXRoIHNlcGFyYXRvciBjaGFyYWN0ZXIgd2hlbiBl
eHBhbmRpbmcgdGhlIHByZXByb2Nlc3NvciBtYWNyb3MgLS0KICBgLWZmaWxlLXJlcHJvZHVjaWJs
ZWAgKGJ1dCBub3QgdGhlIGRlYnVnIGFuZCBjb3ZlcmFnZSBwcmVmaXggbWFwcyk7CiAgZG9lcyBu
b3QgcmVxdWlyZSBgL2V4cGVyaW1lbnRhbDpkZXRlcm1pbmlzdGljYCBhcyBieSBNU1ZDLiBJdCBu
ZWVkZWQgZm9yCiAgcmVtb3ZpbmcgYSBob3N0bmFtZSBmcm9tIGEgbWFuZ2xpbmcgaGFzaCBnZW4s
IGJ1dCBjbGFuZy1jbCBkb2VzIG5vdCB1c2UKICBhIGhvc3RuYW1lIHdoZW4gZ2VuZXJhdGVzIHRo
ZSBoYXNoZXMuIEtub3duIGlzc3VlcyAtLSBkb2VzIG5vdCByZW1hcCB0aGUKICBzb3VyY2UgZmls
ZSBwYXRoZXMgd2l0aGluIFBDSC9QQ00gZmlsZXMuCi0gTmV3IGAtY2xgIG9wdGlvbiBgL2V4cGVy
aW1lbnRhbDpkZXRlcm1pbmlzdGljYCBhZGRlZCB0byBtYXRjaCBDTCdzIG9wdGlvbi4KICBUaGlz
IGVuYWJsZXMgd2FybmluZyBlbWlzc2lvbiBvbiB1c2FnZSBvZiBub24tZGV0ZXJtaW5pc3RpYyBt
YWNyb3MgYF9fREFURV9fYCwKICBgX19USU1FX19gIGFuZCBgX19USU1FU1RBTVBfX2AgYW5kIHBy
b3ZpZGVzIHJlcHJvZHVjYWJsZSBDT0ZGJ3MgdGltZXN0YW1wIGZvcgogIHRoZSBvdXRwdXQgb2Jq
ZWN0IGZpbGVzLgotIE5ldyBgLWNsYCBvcHRpb24gYC9kMW5vZGF0ZXRpbWVgIGFkZGVkIHRvIG1h
dGNoIENMJ3Mgb3B0aW9uLiBUaGlzIG9wdGlvbgogIHVuZGVmaW5lcyB0aGUgc3RhbmRhcmQgbWFj
cm9zIGBfX0RBVEVfX2AsIGBfX1RJTUVfX2AgYW5kIGBfX1RJTUVTVEFNUF9fYCB0byBhbGxvdwog
IHJlcHJvZHVjYWJsZSBidWlsZHMuIFRoZXNlIG1hY3JvcyBjYW4gYmUgcmVkZWZpbmVkIGZyb20g
dGhlIGNvbW1hbmQgbGluZSBpZgogIG5lY2Vzc2FyeS4gYC9kMW5vZGF0ZXRpbWUtYCBjYW4gYmUg
dXNlZCB0byB0dXJuIHRoaXMgZmVhdHVyZSBvZmYgaWYKICBuZWNlc3NhcnkgdG8gb3ZlcnJpZGUg
dGhlIGNvbW1vbiBidWlsZCBzZXR0aW5ncy4KCi0gQWRkZWQgYC1tc2NzLXJlZz08cmVnPmAgb24g
SGV4YWdvbiB0byBzZWxlY3Qgd2hpY2ggY2FsbGVlLXNhdmVkIHJlZ2lzdGVyCiAgKGByMTZgLWBy
MjdgLCBkZWZhdWx0IGByMThgKSBob2xkcyB0aGUgc2hhZG93IGNhbGwgc3RhY2sgcG9pbnRlciB1
bmRlcgogIGAtZnNhbml0aXplPXNoYWRvdy1jYWxsLXN0YWNrYC4gVGhlIHNlbGVjdGVkIHJlZ2lz
dGVyIG11c3QgYWxzbyBiZSByZXNlcnZlZAogIHdpdGggdGhlIG1hdGNoaW5nIGAtZmZpeGVkLTxy
ZWc+YC4KCiMjIyBEZXByZWNhdGVkIENvbXBpbGVyIEZsYWdzCgojIyMgTW9kaWZpZWQgQ29tcGls
ZXIgRmxhZ3MKCi0gVGhlIGAtbW5vLW91dGxpbmVgIGFuZCBgLW1vdXRsaW5lYCBjb21waWxlciBm
bGFncyBhcmUgbm93IGFsbG93ZWQgb24gUklTQy1WIGFuZCBYODYsIHdoaWNoIGJvdGggc3VwcG9y
dCB0aGUgbWFjaGluZSBvdXRsaW5lci4KLSBUaGUgYC1tbm8tb3V0bGluZWAgZmxhZyB3aWxsIG5v
dyBhZGQgdGhlIGBub291dGxpbmVgIElSIGF0dHJpYnV0ZSwgc28gdGhhdAogIGAtbW5vLW91dGxp
bmVgIGFuZCBgLW1vdXRsaW5lYCBvYmplY3RzIGNhbiBiZSBtaXhlZCBjb3JyZWN0bHkgZHVyaW5n
IExUTy4KLSBUaGUgYC1memVyby1jYWxsLXVzZWQtcmVnc2AgY29tcGlsZXIgZmxhZyBpcyBub3cg
YWxsb3dlZCBvbiBSSVNDLVYsIG9ubHkgdGhlCiAgInNraXAiLCAidXNlZC1ncHIiLCAidXNlZC1n
cHItYXJnIiwgImFsbC1ncHIiIGFuZCAiYWxsLWdwci1hcmciIG9wdGlvbnMgYXJlCiAgc3VwcG9y
dGVkIGZvciB0aGUgbW9tZW50LgotIFNsaWdodGx5IGNoYW5nZWQgaGFzaCBpZCBnZW5lcmF0aW9u
IHRvIGdldCB0aGUgdW5pcXVlIGxpbmthZ2Ugc3ltYm9scyBuYW1lcwogIGJ5IGAtdW5pcXVlLWlu
dGVybmFsLWxpbmthZ2UtbmFtZXNgIG9wdGlvbi4gTm93IGl0IHVzZXMgYSBwYXRoIHRoYXQKICBu
b3JtYWxpemVkIGluIGZhdm9yIG9mIHRoZSB0YXJnZXQgc3lzdGVtIChzYW1lIGFzIHRoZSBwcmVw
cm9jZXNzb3IgZG9lcwogIGZvciB0aGUgZmlsZSBtYWNyb3MpIGFuZCBhbGxvd3MgdGhlIHJlcHJv
ZHVjYWJsZSBJRHMgb24gYW55IGJ1aWxkIHN5c3RlbS4KLSBgLWZwcm9maWxlLXVwZGF0ZT1hdG9t
aWNgIHdpbGwgbm93IHByb21vdGUgY291bnRlciB1cGRhdGVzIG91dCBvZiBsb29wcywKICBzaW1p
bGFyIHRvIHRoZSBub24tYXRvbWljIGNhc2UgKFsjMjAyNDg3XShodHRwczovL2dpdGh1Yi5jb20v
bGx2bS9sbHZtLXByb2plY3QvcHVsbC8yMDI0ODcpKS4KLSBUaGUgYC1jbGAgYC9CcmVwcm9gIG9w
dGlvbiB3YXMgbW9kaWZpZWQgdG8gbWF0Y2ggdGhlIG9yaWdpbmFsIENMJ3Mgb3B0aW9uCiAgYW5k
IG5vdyBkZWZpbmVzIHRoZSBzdGFuZGFyZCBtYWNyb3MgYF9fREFURV9fYCwgYF9fVElNRV9fYCBh
bmQgYF9fVElNRVNUQU1QX19gIHRvCiAgIjEiLiBUaGUgcHJldmlvdXMgZnVuY3Rpb25hbGl0eSBy
ZW1haW5zIHVuY2hhbmdlZC4KLSBUaGUgYC1mbXMta2VybmVsYCBmbGFnIHdpbGwgbm93IGltcGxp
Y2l0bHkgYWRkIGAtZm5vLWRlbGV0ZS1udWxsLXBvaW50ZXItY2hlY2tzYC4KICBTdGlsbCBgLWZk
ZWxldGUtbnVsbC1wb2ludGVyLWNoZWNrc2AgY2FuIGJlIHVzZWQgdG8gb3ZlcnJpZGUgdGhpcyBi
ZWhhdmlvci4KLSBFeHRlbmRlZCB0aGUgYC1tYXJtNjR4YCBmbGFnIHRvIHN1cHBvcnQgY29tcGls
aW5nIHRvIG9iamVjdCBmaWxlcy4gV2hlbiB1c2VkCiAgaW4gdGhpcyBtb2RlLCBzZXBhcmF0ZSBj
b21waWxhdGlvbiBqb2JzIGFyZSBydW4gZm9yIEFSTTY0IGFuZCBBUk02NEVDIG9iamVjdAogIGZp
bGVzLCB3aGljaCBhcmUgdGhlbiBtZXJnZWQgaW50byBhIHNpbmdsZSBmaWxlIHVzaW5nIGEgbmV3
IGAub2JqLmFybTY0ZWNgCiAgc2VjdGlvbi4gQ29uc3VtZXJzIG11c3Qgc3VwcG9ydCB0aGlzIGV4
dGVuc2lvbi4gQ3VycmVudGx5LCB0aGlzIHJlcXVpcmVzCiAgTExEIGZvciBsaW5raW5nIG9yIGBs
bHZtLWFyYC9gbGx2bS1saWJgIGZvciBhcmNoaXZpbmcuCgojIyMgUmVtb3ZlZCBDb21waWxlciBG
bGFncwoKIyMjIEF0dHJpYnV0ZSBDaGFuZ2VzIGluIENsYW5nCgotIEFkZGVkIG5ldyBhdHRyaWJ1
dGUgYHN0YWNrX3Byb3RlY3Rvcl9pZ25vcmVgIHRvIG9wdCBzcGVjaWZpYyBsb2NhbCB2YXJpYWJs
ZXMgb3V0IG9mCiAgdGhlIGFuYWx5c2lzIHdoaWNoIGRldGVybWluZXMgaWYgYSBmdW5jdGlvbiBz
aG91bGQgZ2V0IGEgc3RhY2sgcHJvdGVjdG9yLiBBIGZ1bmN0aW9uCiAgd2lsbCBzdGlsbCBnZW5l
cmF0ZSBhIHN0YWNrIHByb3RlY3RvciBpZiBvdGhlciBsb2NhbCB2YXJpYWJsZXMgb3IgY29tbWFu
ZCBsaW5lIGZsYWdzCiAgcmVxdWlyZSBpdC4KCi0gQWRkZWQgYSBuZXcgYXR0cmlidXRlLCBgW1tj
bGFuZzo6bm9fb3V0bGluZV1dYCB0byBzdXBwcmVzcyBvdXRsaW5pbmcgZnJvbQogIGFubm90YXRl
ZCBmdW5jdGlvbnMuIFRoaXMgdXNlcyB0aGUgTExWTSBgbm9vdXRsaW5lYCBhdHRyaWJ1dGUuCgot
IEludHJvZHVjZWQgYSBuZXcgdHlwZSBhdHRyaWJ1dGUgYF9fYXR0cmlidXRlX18oKG92ZXJmbG93
X2JlaGF2aW9yKSlgIHdoaWNoCiAgY3VycmVudGx5IGFjY2VwdHMgZWl0aGVyIGB3cmFwYCBvciBg
dHJhcGAgYXMgYW4gYXJndW1lbnQsIGVuYWJsaW5nCiAgdHlwZS1sZXZlbCBjb250cm9sIG92ZXIg
b3ZlcmZsb3cgYmVoYXZpb3IuIFRoZXJlIGlzIGFsc28gYW4gYWNjb21wYW55aW5nIHR5cGUKICBz
cGVjaWZpZXIgZm9yIGVhY2ggYmVoYXZpb3Iga2luZCB2aWEgYF9fb2Jfd3JhcGAgYW5kIGBfX29i
X3RyYXBgLgoKLSBJbnRyb2R1Y2VkIGEgbmV3IGZ1bmN0aW9uIGF0dHJpYnV0ZSBgX19hdHRyaWJ1
dGVfXygoX19wZXJzb25hbGl0eV9fKC4uLikpKWAKICB0byBleHBsaWNpdGx5IHNwZWNpZnkgdGhl
IHBlcnNvbmFsaXR5IHJvdXRpbmUgZm9yIGV4Y2VwdGlvbiBoYW5kbGluZy4gVEhpcyBpcwogIG1l
YW50IHRvIGJlIGEgbG93IGxldmVsIHRvb2wgZm9yIGxhbmd1YWdlIHJ1bnRpbWUgYXV0aG9ycyB0
byBhc3NvY2lhdGUgYQogIGZvcmVpZ24gbGFuZ3VhZ2UgcGVyc29uYWxpdHkgd2l0aCBhIGdpdmVu
IGZ1bmN0aW9uLiBOb3RlIHRoYXQgdGhpcyBkb2VzIG5vdAogIHBlcmZvcm0gYW55IEFCSSB2YWxp
ZGF0aW9uIGZvciB0aGUgcGVyc29uYWxpdHkgcm91dGluZS4KCi0ge2RvY31gVGhyZWFkU2FmZXR5
QW5hbHlzaXNgIGF0dHJpYnV0ZXMgbm93IGNvcnJlY3RseSBoYW5kbGUgaW1wbGljaXQgbWVtYmVy
CiAgYWNjZXNzZXMgaW4gQywgYW5kIHBhcmFtZXRlciBhdHRyaWJ1dGVzIGluIEMrKy4gVGhpcyBp
bXByb3ZlcyBkaWFnbm9zdGljCiAgcHJlY2lzaW9uIGFuZCBmaXhlcyBmYWxzZSBwb3NpdGl2ZXMu
CgotIFRoZSB7ZG9jfWBUaHJlYWRTYWZldHlBbmFseXNpc2AgYXR0cmlidXRlcyBgZ3VhcmRlZF9i
eWAgYW5kCiAgYHB0X2d1YXJkZWRfYnlgIG5vdyBhY2NlcHQgbXVsdGlwbGUgY2FwYWJpbGl0eSBh
cmd1bWVudHMgd2l0aCByZWZpbmVkCiAgYWNjZXNzIHNlbWFudGljczogKndyaXRpbmcqIHJlcXVp
cmVzIGFsbCBsaXN0ZWQgY2FwYWJpbGl0aWVzIHRvIGJlIGhlbGQKICBleGNsdXNpdmVseSwgd2hp
bGUgKnJlYWRpbmcqIHJlcXVpcmVzIGF0IGxlYXN0IG9uZSB0byBiZSBoZWxkLiBUaGlzIGlzCiAg
c291bmQgYmVjYXVzZSBhbnkgd3JpdGVyIG11c3QgaG9sZCBhbGwgY2FwYWJpbGl0aWVzLCBzbyBo
b2xkaW5nIGFueSBvbmUKICBwcmV2ZW50cyBjb25jdXJyZW50IHdyaXRlcy4KCi0ge2RvY31gVGhy
ZWFkU2FmZXR5QW5hbHlzaXNgIGF0dHJpYnV0ZXMgbGlrZSBgYWNxdWlyZV9jYXBhYmlsaXR5YCwK
ICBgcmVsZWFzZV9jYXBhYmlsaXR5YCwgYHJlcXVpcmVzX2NhcGFiaWxpdHlgLCBgbG9ja3NfZXhj
bHVkZWRgLAogIGB0cnlfYWNxdWlyZV9jYXBhYmlsaXR5YCwgYW5kIGBhc3NlcnRfY2FwYWJpbGl0
eWAgY2FuIG5vdyBiZSBhcHBsaWVkIHRvCiAgZnVuY3Rpb24gcG9pbnRlciB2YXJpYWJsZXMgYW5k
IGZpZWxkcy4gVGhlIGFuYWx5c2lzIGNoZWNrcyBjYWxscyB0aHJvdWdoCiAgYW5ub3RhdGVkIGZ1
bmN0aW9uIHBvaW50ZXJzIHRoZSBzYW1lIHdheSBpdCBjaGVja3MgZGlyZWN0IGZ1bmN0aW9uIGNh
bGxzLgogIE9ubHkgcGxhaW4gZnVuY3Rpb24gcG9pbnRlcnMgYXJlIHN1cHBvcnRlZDsgcG9pbnRl
cnMtdG8tbWVtYmVyIGZ1bmN0aW9ucywKICBibG9ja3MsIG9yIHdyYXBwZXJzIChlLmcuIGBzdGQ6
OmZ1bmN0aW9uYCkgYXJlIG5vdCB5ZXQgc3VwcG9ydGVkLgoKLSBUaGUgYFtbY2xhbmc6OnVuc2Fm
ZV9idWZmZXJfdXNhZ2VdXWAgYXR0cmlidXRlIGlzIG5vdyBzdXBwb3J0ZWQgaW4gQVBJCiAgbm90
ZXMuIEZvciBleGFtcGxlOgoKICBgYGB5YW1sCiAgRnVuY3Rpb25zOgogICAgLSBOYW1lOiBteVVu
c2FmZUZ1bmN0aW9uCiAgICAgIFVuc2FmZUJ1ZmZlclVzYWdlOiB0cnVlCiAgYGBgCgotIFdoZW4g
dXNpbmcgYC1XdW5zYWZlLWJ1ZmZlci11c2FnZWAgd2l0aG91dAogIGAtZnNhZmUtYnVmZmVyLXVz
YWdlLXN1Z2dlc3Rpb25zYCwgd2FybmluZ3MgYXJlIG5vdyBlbWl0dGVkIG9ubHkKICBvbmNlIHBl
ciBzb3VyY2UgZmlsZS4gUHJlLWNvbXBpbGVkIGNvZGUgKHN1Y2ggYXMgUENIIG9yIG1vZHVsZQog
IGhlYWRlcnMpIGlzIG5vIGxvbmdlciByZXBlYXRlZGx5IGFuYWx5emVkLCBhcyBpdCBpcyBhbmFs
eXplZCBkdXJpbmcKICBpdHMgaW5pdGlhbCBjb21waWxhdGlvbi4gKFRyYWRpdGlvbmFsbHkgaW5j
bHVkZWQgaGVhZGVycyBhcmUgc3RpbGwKICBhbmFseXplZCB3aXRoaW4gZWFjaCB0cmFuc2xhdGlv
biB1bml0IHRoYXQgaW5jbHVkZXMgdGhlbSkuIFRoaXMKICBiZWhhdmlvciBtYXRjaGVzIG1vc3Qg
b2Ygb3RoZXIgYC1XYCBkaWFnbm9zdGljcy4KCiAgV2hlbiBgLWZzYWZlLWJ1ZmZlci11c2FnZS1z
dWdnZXN0aW9uc2AgaXMgZW5hYmxlZCwgdGhlIGJlaGF2aW9yCiAgcmVtYWlucyB0aGUgc2FtZSBh
cyBiZWZvcmU6IHByZS1jb21waWxlZCBjb2RlIGlzIGRlc2VyaWFsaXplZCBhbmQKICBhbmFseXpl
ZCBhbG9uZ3NpZGUgdGhlIHRyYW5zbGF0aW9uIHVuaXQgdGhhdCB1c2VzIGl0LCBiZWNhdXNlIGZp
eC1pdAogIHN1Z2dlc3Rpb24gYW5hbHlzaXMgcmVxdWlyZXMgZnVsbCB2aXNpYmlsaXR5IG9mIHRo
ZSB0cmFuc2xhdGlvbgogIHVuaXQuCgotIEFkZGVkIHN1cHBvcnQgZm9yIGBbW21zdmM6OmZvcmNl
aW5saW5lXV1gIGZvciBmdW5jdGlvbnMgYW5kCiAgYFtbbXN2Yzo6Zm9yY2VpbmxpbmVfY2FsbHNd
XWAgZm9yIHN0YXRlbWVudHMuIEJvdGggYXJlIGFsaWFzZXMgdG8KICBgW1tjbGFuZzo6YWx3YXlz
X2lubGluZV1dYCB3aXRoIGFkZGl0aW9uYWwgY2hlY2tzIHRvIGVuc3VyZSB0aGF0IHRoZXkKICBh
cmUgb25seSBhY2NlcHRlZCBpbiBwbGFjZXMgd2hlcmUgTVNWQyBhbHNvIGRvZXMuCgotIFRoZSBB
TURHUFUgYGFtZGdwdV9udW1fc2dwcmAgYW5kIGBhbWRncHVfbnVtX3ZncHJgIGF0dHJpYnV0ZXMg
YXJlIG5vdwogIGRlcHJlY2F0ZWQuIENsYW5nIGVtaXRzIGEgYC1XZGVwcmVjYXRlZC1kZWNsYXJh
dGlvbnNgIHdhcm5pbmcgd2hlbiB0aGV5CiAgYXJlIHVzZWQuIFVzZSBgYW1kZ3B1X3dhdmVzX3Bl
cl9ldWAgaW5zdGVhZCB0byBjb250cm9sIFNHUFIgYW5kIFZHUFIKICB1c2FnZS4KCi0gQ2xhbmcg
bm93IGFsbG93cyBHTlUgYXR0cmlidXRlcyBiZXR3ZWVuIGEgbWVtYmVyIGRlY2xhcmF0b3IgYW5k
IGJpdC1maWVsZCB3aWR0aC4gKCNHSDE4NDk1NCkKCi0gVGhlIGBbW2NsYW5nOjpub2VzY2FwZV1d
YCBhdHRyaWJ1dGUgbm93IGRpc2FsbG93cyBkZWFsbG9jYXRpbmcgbWVtb3J5CiAgdGhyb3VnaCB0
aGUgYW5ub3RhdGVkIHBhcmFtZXRlci4gVGhpcyBpbmZvcm1hdGlvbiBpcyBjdXJyZW50bHkgbm90
IGV4cG9zZWQgdG8KICBMTFZNIGZvciBvcHRpbWl6YXRpb24gcHVycG9zZXMsIHRvIHByZXZlbnQg
YnJlYWtpbmcgZXhpc3RpbmcgYWRvcHRlcnMuIEl0IG1heQogIGluc3RlYWQgYmUgdXNlZCBieSB3
YXJuaW5ncyBhbmQgc3RhdGljIGFuYWx5c2VzIHRvIHByb3ZpZGUgbW9yZSBpbmZvcm1hdGlvbgog
IGFib3V0IHBvaW50ZXIgbGlmZXRpbWVzLiBJdCBtYXkgYmUgdXNlZCB0byBwb3dlciBvcHRpbWl6
YXRpb25zIGluIHRoZSBmdXR1cmUsCiAgaG93ZXZlciB0aGVyZSBhcmUgbm8gY29uY3JldGUgcGxh
bnMgdG8gZG8gc28gYXQgdGhlIG1vbWVudC4KCi0gVGhlIGF0dHJpYnV0ZXMgYFtbY2xhbmc6Om9w
ZW5jbF9nbG9iYWxfZGV2aWNlXV1gIGFuZCBgW1tjbGFuZzo6b3BlbmNsX2dsb2JhbF9ob3N0XV1g
CiAgYXJlIG5vdyBkZXByZWNhdGVkLiBDbGFuZyBlbWl0cyBhIGAtV2RlcHJlY2F0ZWQtYXR0cmli
dXRlc2Agd2FybmluZyB3aGVuCiAgdGhleSBhcmUgdXNlZC4KCi0gVGhlIGBtb2R1bGFyX2Zvcm1h
dGAgYXR0cmlidXRlIG5vdyBzdXBwb3J0cyB0aGUgYGZpeGVkYCBhc3BlY3QgZm9yIEMKICBJU08g
MTgwMzcgZml4ZWQtcG9pbnQgYHByaW50ZmAgc3BlY2lmaWVycy4KCi0gVGhlIGBsaWZldGltZV9j
YXB0dXJlX2J5YCBhdHRyaWJ1dGUgbm93IGFjY2VwdHMgdGhyZWUgbmV3IHNwZWxsaW5nIGZvcm1z
OgogIGBsaWZldGltZV9jYXB0dXJlX2J5X3RoaXNgLCBgbGlmZXRpbWVfY2FwdHVyZV9ieV9nbG9i
YWxgLCBhbmQKICBgbGlmZXRpbWVfY2FwdHVyZV9ieV91bmtub3duYC4gVGhlc2UgcmVwbGFjZSBw
YXNzaW5nIGB0aGlzYCwgYGdsb2JhbGAsIGFuZAogIGB1bmtub3duYCBhcyBhcmd1bWVudHMgdG8g
YGxpZmV0aW1lX2NhcHR1cmVfYnlgOyB0aGF0IGFyZ3VtZW50IGZvcm0gaXMgbm93CiAgZGVwcmVj
YXRlZCBiZWNhdXNlIHRob3NlIG5hbWVzIGNhbiBjb25mbGljdCB3aXRoIHVzZXItZGVmaW5lZCBw
YXJhbWV0ZXJzLgogIFRoZXkgd2lsbCBiZSByZW1vdmVkIGluIHRoZSBuZXh0IHJlbGVhc2UuIERp
c3RpbmN0IGBsaWZldGltZV9jYXB0dXJlX2J5YAogIHNwZWxsaW5ncyBtYXkgYWxzbyBiZSBjb21i
aW5lZCBvbiB0aGUgc2FtZSBkZWNsYXJhdGlvbiwgYnV0IGVhY2ggc3BlbGxpbmcgbWF5CiAgYXBw
ZWFyIGF0IG1vc3Qgb25jZS4KCi0gVGhlIGBjb25zdGAgYW5kIGBwdXJlYCBhdHRyaWJ1dGVzIG9u
bHkgYXBwbHkgdG8gZnVuY3Rpb25zOyB0aGV5IGFyZSBub3cKICBkaWFnbm9zZWQgYW5kIGlnbm9y
ZWQgd2hlbiBhcHBsaWVkIHRvIGFueXRoaW5nIGVsc2UuCgojIyMgSW1wcm92ZW1lbnRzIHRvIENs
YW5nJ3MgZGlhZ25vc3RpY3MKCi0gRml4ZWQgYnVnIGluIGAtV2RvY3VtZW50YXRpb25gIHNvIHRo
YXQgaXQgY29ycmVjdGx5IGhhbmRsZXMgZXhwbGljaXQKICBmdW5jdGlvbiB0ZW1wbGF0ZSBpbnN0
YW50aWF0aW9ucyAoIzY0MDg3KS4KCi0gRml4ZWQgY29uY2VwdCB0ZW1wbGF0ZSBwYXJhbWV0ZXJz
IG5vdCBiZWluZyByZWNvZ25pemVkIGluIGAtV2RvY3VtZW50YXRpb25gCiAgd2hlbiBtZW50aW9u
ZWQgaW4gdHBhcmFtIGNvbW1lbnRzLiAoI0dINjQwODcpCgotIGAtV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlYCBub3cgZGlhZ25vc2VzIGZpbGUtc2NvcGUgdmFyaWFibGVzIHdpdGgKICBpbnRlcm5h
bCBsaW5rYWdlIChgc3RhdGljYCBzdG9yYWdlIGNsYXNzKSB0aGF0IGFyZSBhc3NpZ25lZCBidXQg
bmV2ZXIgdXNlZC4KICBUaGlzIG5ldyBjb3ZlcmFnZSBpcyBhZGRlZCB1bmRlciB0aGUgc3ViZ3Jv
dXAgYC1XdW51c2VkLWJ1dC1zZXQtZ2xvYmFsYCwKICBhbGxvd2luZyBpdCB0byBiZSBkaXNhYmxl
ZCBpbmRlcGVuZGVudGx5IHdpdGggYC1Xbm8tdW51c2VkLWJ1dC1zZXQtZ2xvYmFsYC4KICAoI0dI
MTQ4MzYxKQoKLSBgLVd1bnVzZWQtdGVtcGxhdGVgIGlzIG5vdyBwYXJ0IG9mIGAtV3VudXNlZGAg
KHdoaWNoIGlzIGVuYWJsZWQgYnkgYC1XYWxsYCkuCiAgSXQgZGlhZ25vc2VzIHVudXNlZCBmdW5j
dGlvbiBhbmQgdmFyaWFibGUgdGVtcGxhdGVzIHdpdGggaW50ZXJuYWwgbGlua2FnZSwKICB3aGlj
aCBpbiBhIGhlYWRlciBpcyBhIGxhdGVudCBPRFIgaGF6YXJkLiBJdCBjYW4gYmUgZGlzYWJsZWQg
d2l0aAogIGAtV25vLXVudXNlZC10ZW1wbGF0ZWAuICgjR0gyMDI5NDUpCgotIEFkZGVkIGAtV2xp
ZmV0aW1lLXNhZmV0eWAgdG8gZW5hYmxlIGxpZmV0aW1lIHNhZmV0eSBhbmFseXNpcywKICBhIENG
Ry1iYXNlZCBpbnRyYS1wcm9jZWR1cmFsIGFuYWx5c2lzIHRoYXQgZGV0ZWN0cyB1c2UtYWZ0ZXIt
ZnJlZSBhbmQgcmVsYXRlZAogIHRlbXBvcmFsIHNhZmV0eSBidWdzLiBTZWUgdGhlCiAgW1JGQ10o
aHR0cHM6Ly9kaXNjb3Vyc2UubGx2bS5vcmcvdC9yZmMtaW50cmEtcHJvY2VkdXJhbC1saWZldGlt
ZS1hbmFseXNpcy1pbi1jbGFuZy84NjI5MSkKICBmb3IgbW9yZSBkZXRhaWxzLiBCeSBkZXNpZ24s
IHRoaXMgd2FybmluZyBpcyBlbmFibGVkIGluIGAtV2V2ZXJ5dGhpbmdgLiBUbyBkaXNhYmxlCiAg
dGhlIGFuYWx5c2lzLCB1c2UgYC1Xbm8tbGlmZXRpbWUtc2FmZXR5YCBvciBgLWZuby1saWZldGlt
ZS1zYWZldHlgLgoKLSBBZGRlZCBgLVdsaWZldGltZS1zYWZldHktc3VnZ2VzdGlvbnNgIHRvIGVu
YWJsZSBsaWZldGltZSBhbm5vdGF0aW9uIHN1Z2dlc3Rpb25zLgogIFRoaXMgcHJvdmlkZXMgc3Vn
Z2VzdGlvbnMgZm9yIGZ1bmN0aW9uIHBhcmFtZXRlcnMgdGhhdAogIHNob3VsZCBiZSBtYXJrZWQg
YFtbY2xhbmc6OmxpZmV0aW1lYm91bmRdXWAgYmFzZWQgb24gbGlmZXRpbWUgYW5hbHlzaXMuIEZv
cgogIGV4YW1wbGUsIGZvciB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uOgoKICBgYGBjKysKICBpbnQq
IHAoaW50ICppbikgeyByZXR1cm4gaW47IH0KICBgYGAKCiAgQ2xhbmcgd2lsbCBzdWdnZXN0OgoK
ICBgYGBjKysKICB3YXJuaW5nOiBwYXJhbWV0ZXIgaW4gaW50cmEtVFUgZnVuY3Rpb24gc2hvdWxk
IGJlIG1hcmtlZCBbW2NsYW5nOjpsaWZldGltZWJvdW5kXV0KICBpbnQqIHAoaW50ICppbikgeyBy
ZXR1cm4gaW47IH0KICAgICAgICAgXn5+fn5+fgogICAgICAgICAgICAgICAgIFtbY2xhbmc6Omxp
ZmV0aW1lYm91bmRdXQogIG5vdGU6IHBhcmFtIHJldHVybmVkIGhlcmUKICBpbnQqIHAoaW50ICpp
bikgeyByZXR1cm4gaW47IH0KICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KICBgYGAKCi0g
QWRkZWQgYC1XbGlmZXRpbWUtc2FmZXR5LW5vZXNjYXBlYCB0byBkZXRlY3QgbWlzdXNlIG9mIGBb
W2NsYW5nOjpub2VzY2FwZV1dYAogIGFubm90YXRpb24gd2hlcmUgdGhlIHBhcmFtZXRlciBlc2Nh
cGVzIHRocm91Z2ggcmV0dXJuLiBGb3IgZXhhbXBsZToKCiAgYGBgYysrCiAgaW50KiBwKGludCAq
aW4gW1tjbGFuZzo6bm9lc2NhcGVdXSkgeyByZXR1cm4gaW47IH0KICBgYGAKCiAgQ2xhbmcgd2ls
bCB3YXJuOgoKICBgYGBjKysKICB3YXJuaW5nOiBwYXJhbWV0ZXIgaXMgbWFya2VkIFtbY2xhbmc6
Om5vZXNjYXBlXV0gYnV0IGVzY2FwZXMKICBpbnQqIHAoaW50ICppbiBbW2NsYW5nOjpub2VzY2Fw
ZV1dKSB7IHJldHVybiBpbjsgfQogICAgICAgICBefn5+fn5+CiAgbm90ZTogcmV0dXJuZWQgaGVy
ZQogIGludCogcChpbnQgKmluIFtbY2xhbmc6Om5vZXNjYXBlXV0pIHsgcmV0dXJuIGluOyB9CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KICBgYGAKCi0g
QWRkZWQgYC1XbGlmZXRpbWUtc2FmZXR5LWRhbmdsaW5nLWZpZWxkYCB0byBkZXRlY3QgZGFuZ2xp
bmcgZmllbGQgcmVmZXJlbmNlcwogIHdoZW4gc3RhY2sgbWVtb3J5IGVzY2FwZXMgdG8gY2xhc3Mg
ZmllbGRzLiBUaGlzIGlzIHBhcnQgb2YgYC1XbGlmZXRpbWUtc2FmZXR5YAogIGFuZCBkZXRlY3Rz
IGNhc2VzIHdoZXJlIGxvY2FsIHZhcmlhYmxlcyBvciBwYXJhbWV0ZXJzIGFyZSBzdG9yZWQgaW4g
ZmllbGRzIGJ1dAogIG91dGxpdmUgdGhlaXIgc2NvcGUuIEZvciBleGFtcGxlOgoKICBgYGBjKysK
ICBzdHJ1Y3QgRGFuZ2xpbmdWaWV3IHsKICAgIHN0ZDo6c3RyaW5nX3ZpZXcgdmlldzsKICAgIERh
bmdsaW5nVmlldyhzdGQ6OnN0cmluZyBzKSA6IHZpZXcocykge30gIC8vIHdhcm5pbmc6IGFkZHJl
c3Mgb2Ygc3RhY2sgbWVtb3J5IGVzY2FwZXMgdG8gYSBmaWVsZAogIH07CiAgYGBgCgotIEltcHJv
dmVkIGAtV2Fzc2lnbi1lbnVtYCBwZXJmb3JtYW5jZSBieSBjYWNoaW5nIGVudW0gZW51bWVyYXRv
ciB2YWx1ZXMuICgjR0gxNzY0NTQpCgotIENsYW5nIG5vdyBlbWl0cyBgLVdwc2FiaWAgZGlhZ25v
c3RpY3MgZm9yIGV4dGVybmFsbHkgdmlzaWJsZSB4ODYtNjQKICBmdW5jdGlvbiBkZWZpbml0aW9u
cyB0aGF0IHJldHVybiBvciB0YWtlIEFWWCBvciBBVlgtNTEyIHZlY3RvciB0eXBlcyB3aXRob3V0
CiAgZW5hYmxpbmcgdGhlIGNvcnJlc3BvbmRpbmcgdGFyZ2V0IGZlYXR1cmUuCgotIEZpeGVkIGEg
ZmFsc2UgbmVnYXRpdmUgaW4gYC1XYXJyYXktYm91bmRzYCB3aGVyZSB0aGUgd2FybmluZyB3YXMg
c3VwcHJlc3NlZAogIHdoZW4gYWNjZXNzaW5nIGEgbWVtYmVyIGZ1bmN0aW9uIG9uIGEgcGFzdC10
aGUtZW5kIGFycmF5IGVsZW1lbnQuCiAgKCNHSDE3OTEyOCkKCi0gQWRkZWQgYSBtaXNzaW5nIHNw
YWNlIHRvIHRoZSBGaXhJdCBmb3IgdGhlIGBpbXBsaWNpdC1pbnRgIGdyb3VwIG9mIGRpYWdub3N0
aWNzIGFuZAogIG1hZGUgc3VyZSB0aGF0IG9ubHkgb25lIHN1Y2ggZGlhZ25vc3RpYyBhbmQgRml4
SXQgaXMgZW1pdHRlZCBwZXIgZGVjbGFyYXRpb24gZ3JvdXAuICgjR0gxNzkzNTQpCgotIEZpeGVk
IHRoZSBGaXgtSXQgaW5zZXJ0aW9uIHBvaW50IGZvciBgZXhwZWN0ZWQgJzsnIGFmdGVyIGFsaWFz
IGRlY2xhcmF0aW9uYAogIHdoZW4gcGFyc2luZyBhbGlhcyBkZWNsYXJhdGlvbnMgaW52b2x2aW5n
IGEgdG9rZW4tc3BsaXQgYD4+YCBzZXF1ZW5jZQogIChmb3IgZXhhbXBsZSwgYHVzaW5nIEEgPSBY
PGludD4+O2ApLiAoI0dIMTg0NDI1KQoKLSBGaXhlZCBpbmNvcnJlY3QgYGltcGxpY2l0bHkgZGVs
ZXRlZGAgZGlhZ25vc3RpYyBmb3IgZXhwbGljaXRseSBkZWxldGVkCiAgY2FuZGlkYXRlIGZ1bmN0
aW9uLiAoI0dIMTg1NjkzKQoKLSBUaGUgYC1XbG9vcC1hbmFseXNpc2Agd2FybmluZyBoYXMgYmVl
biBleHRlbmRlZCB0byBjYXRjaCBtb3JlIGNhc2VzIG9mCiAgdmFyaWFibGUgbW9kaWZpY2F0aW9u
IGluc2lkZSBsYW1iZGEgZXhwcmVzc2lvbnMgKCNHSDEzMjAzOCkuCgotIENsYW5nIG5vdyBlbWl0
cyBgLVdzaXplb2YtcG9pbnRlci1tZW1hY2Nlc3NgIHdoZW4gc25wcmludGYvdnNucHJpbnRmIHVz
ZSB0aGUgc2l6ZW9mCiAgdGhlIGRlc3RpbmF0aW9uIGJ1ZmZlcihkeW5hbWljYWxseSBhbGxvY2F0
ZWQpIGluIHRoZSBsZW4gcGFyYW1ldGVyKCNHSDE2MjM2NikKCi0gQWRkZWQgYC1XbW9kdWxlLW1h
cC1wYXRoLW91dHNpZGUtZGlyZWN0b3J5YCAob2ZmIGJ5IGRlZmF1bHQpIHRvIHdhcm4gb24KICBo
ZWFkZXIgYW5kIHVtYnJlbGxhIGRpcmVjdG9yeSBwYXRocyB0aGF0IHVzZSBgLi5gIHRvIHJlZmVy
IG91dHNpZGUgdGhlIG1vZHVsZQogIGRpcmVjdG9yeSBpbiBtb2R1bGUgbWFwcyBmb3VuZCB2aWEg
aW1wbGljaXQgc2VhcmNoCiAgKGAtZmltcGxpY2l0LW1vZHVsZS1tYXBzYCkuIFRoaXMgZG9lcyBu
b3QgYWZmZWN0IG1vZHVsZSBtYXBzIHNwZWNpZmllZAogIGV4cGxpY2l0bHkgdmlhIGAtZm1vZHVs
ZS1tYXAtZmlsZT1gLgoKLSBIb25vdXIgYFtbbWF5YmVfdW51c2VkXV1gIGF0dHJpYnV0ZSBvbiBw
cml2YXRlIGZpZWxkcy4KICBgLVd1bnVzZWQtcHJpdmF0ZS1maWVsZGAgbm8gbG9uZ2VyIGVtaXRz
IGEgd2FybmluZyBmb3IgYW5ub3RhdGVkIHByaXZhdGUKICBmaWVsZHMuCgotIEltcHJvdmVkIGAt
V2dudS16ZXJvLXZhcmlhZGljLW1hY3JvLWFyZ3VtZW50c2AgdG8gc3VnZ2VzdCB1c2luZwogIGBf
X1ZBX09QVF9fYCBpZiB0aGUgY3VycmVudCBsYW5ndWFnZSB2ZXJzaW9uIHN1cHBvcnRzIGl0KCNH
SDE4ODYyNCkKCi0gQ2xhbmcgbm93IGVtaXRzIGFuIGVycm9yIHdoZW4gaW1wbGljaXRseSBjYXN0
aW5nIGEgY29tcGxleCB0eXBlIHRvIGEgYnVpbHQtaW4gdmVjdG9yIHR5cGUuICgjR0gxODY4MDUp
CgotIEFkZGVkIGAtV25vbnBvcnRhYmxlLWluY2x1ZGUtcGF0aC1zZXBhcmF0b3JgIChvZmYgYnkg
ZGVmYXVsdCkgdG8gY2F0Y2gKICAjaW5jbHVkZSBkaXJlY3RpdmVzIHRoYXQgdXNlIGJhY2tzbGFz
aGVzIGFzIGEgcGF0aCBzZXBhcmF0b3IuIFRoZSB3YXJuaW5nCiAgaW5jbHVkZXMgYSBGaXhJdCB0
byBjaGFuZ2UgYWxsIHRoZSBiYWNrc2xhc2hlcyB0byBmb3J3YXJkIHNsYXNoZXMsIHNvIHRoYXQg
dGhlCiAgY29kZSBjYW4gYXV0b21hdGljYWxseSBiZSBtYWRlIHBvcnRhYmxlIHRvIG90aGVyIGhv
c3QgcGxhdGZvcm1zIHRoYXQgZG9uJ3QKICBzdXBwb3J0IGJhY2tzbGFzaGVzLgoKLSBDbGFuZyBu
b3cgZXhwbGFpbnMgd2h5IHRlbXBsYXRlIGRlZHVjdGlvbiBmYWlscyBmb3IgZXhwbGljaXQgdGVt
cGxhdGUgYXJndW1lbnRzLgoKLSBObyBsb25nZXIgZW1pdHRpbmcgYSBgLVdwcmUtYzJ5LWNvbXBh
dGAgb3IgZXh0ZW5zaW9uIGRpYWdub3N0aWMgYWJvdXQgdXNlCiAgb2Ygb2N0YWwgbGl0ZXJhbHMg
d2l0aCBhIGAwb2AgcHJlZml4LCBhbmQgbm8gbG9uZ2VyIGVtaXR0aW5nIGEKICBgLVdkZXByZWNh
dGVkLW9jdGFsLWxpdGVyYWxzYCBkaWFnbm9zdGljIGZvciB1c2Ugb2Ygb2N0YWwgbGl0ZXJhbHMg
d2l0aG91dAogIGEgYDBvYCBwcmVmaXgsIHdoZW4gdGhlIGxpdGVyYWwgaXMgZXhwYW5kZWQgZnJv
bSBhIG1hY3JvIGRlZmluZWQgaW4gYQogIHN5c3RlbSBoZWFkZXIuICgjR0gxOTIzODkpCgotIElt
cHJvdmVkIGVycm9yIHJlY292ZXJ5IGZvciBtaXNzaW5nIHNlbWljb2xvbnMgYWZ0ZXIgY2xhc3Mg
bWVtYmVycy4gQ2xhbmcgbm93IGF2b2lkcwogIHNraXBwaW5nIHN1YnNlcXVlbnQgdmFsaWQgZGVj
bGFyYXRpb25zIHdoZW4gdGhlaXIgcHJldmlvdXMgZGVjbCBpcyBtaXNzaW5nIHNlbWljb2xvbi4K
Ci0gUmVtb3ZlZCB0aGUgYm9keSBvZiBsYW1iZGFzIGZyb20gc29tZSBkaWFnbm9zdGljIG1lc3Nh
Z2VzLgoKLSBGaXhlZCBmYWxzZSBwb3NpdGl2ZSBob3N0LWRldmljZSBtaXNtYXRjaCBlcnJvcnMg
aW4gZGlzY2FyZGVkIGBpZiBjb25zdGV4cHJgIGJyYW5jaGVzIGZvciBDVURBL0hJUDsKICBzdWNo
IGNhbGxzIGFyZSBub3cgY29ycmVjdGx5IHNraXBwZWQuCgotIENsYW5nIG5vdyBlcnJvcnMgd2hl
biBhIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIGFsaWFzZXMgYSB2YXJpYWJsZSBvciB2aWNlIHZlcnNh
LiAoI0dIMTk1NTUwKQoKLSBBZGRlZCBgLVdhdHRyaWJ1dGUtYWxpYXNgIHRvIGRpYWdub3NlIHR5
cGUgbWlzbWF0Y2hlcyBiZXR3ZWVuIGFuIGFsaWFzIGFuZCBpdHMgYWxpYXNlZCBmdW5jdGlvbi4g
KCNHSDE5NTU1MCkKCi0gVGhlIGRpYWdub3N0aWNzIGFyb3VuZCBgX19ibG9ja2Agbm93IGV4cGxh
aW4gd2h5IGEgdmFyaWFibGUgY2Fubm90IGJlIG1hcmtlZCBgX19ibG9ja2AuICgjR0gxOTcyMTMp
CgotIEV4dGVuZGVkIGAtV25vbnBvcnRhYmxlLWluY2x1ZGUtcGF0aGAgdG8gd2FybiBhYm91dCB0
cmFpbGluZyB3aGl0ZXNwYWNlIGFuZCBkb3RzIGluIGAjaW5jbHVkZWAgcGF0aHMuICgjR0gxOTA2
MTApCgotIENsYW5nIG5vdyBlbWl0cyBlcnJvciB3aGVuIGF0dHJpYnV0ZSBpcyBtaXNzaW5nIGNs
b3NpbmcgYF1dYCBmb2xsb3dlZCBieSBgOztgLiAoI0dIMTg3MjIzKQoKLSBDbGFuZyBub3cgcmVq
ZWN0cyBpbmxpbmUgYXNtIGNvbnN0cmFpbnRzIGFuZCBjbG9iYmVycyB0aGF0IGNvbnRhaW4gYW4K
ICBlbWJlZGRlZCBudWxsIGNoYXJhY3RlciwgaW5zdGVhZCBvZiBzaWxlbnRseSB0cnVuY2F0aW5n
IHRoZW0uICgjR0gxNzM5MDApCgotIERpYWdub3N0aWNzIGZvciB0aGUgQysrMTEgcmFuZ2UtYmFz
ZWQgZm9yIHN0YXRlbWVudCBub3cgcmVwb3J0IHRoZSBjb3JyZWN0CiAgaXRlcmF0b3IgdHlwZSBp
biBub3RlcyBmb3IgaW52YWxpZCBpdGVyYXRvciB0eXBlcy4KCi0gYC1XZm9ydGlmeS1zb3VyY2Vg
IG5vdyB3YXJucyB3aGVuIHRoZSBjb25zdGFudC1ldmFsdWF0ZWQgYXJndW1lbnQgdG8KICBgdW1h
c2tgIGhhcyBiaXRzIHNldCBvdXRzaWRlIGAwNzc3YC4gVGhvc2UgYml0cyBhcmUgc2lsZW50bHkg
ZGlzY2FyZGVkCiAgYnkgdGhlIGtlcm5lbCwgc28gc2V0dGluZyB0aGVtIGlzIGFsbW9zdCBhbHdh
eXMgYSB0eXBvIChtYXRjaGluZyB0aGUKICBiaW9uaWMgbGliYyBgZGlhZ25vc2VfaWZgIGNoZWNr
KS4KCi0gSW1wcm92ZWQgaG93IFVuaWNvZGUgY2hhcmFjdGVycyBhcmUgZGlzcGxheWVkIGluIGRp
YWdub3N0aWMgbWVzc2FnZXMuCgotIGAtV3RhdXRvbG9naWNhbC1wb2ludGVyLWNvbXBhcmVgIGFu
ZCBgLVdwb2ludGVyLWJvb2wtY29udmVyc2lvbmAgbm93CiAgZGlhZ25vc2UgYSByZWZlcmVuY2Ug
dG8gYSBmdW5jdGlvbiAoZS5nLiBvZiB0eXBlIGB2b2lkICgmKSgpYCkgY29tcGFyZWQKICBhZ2Fp
bnN0IG9yIGNvbnZlcnRlZCB0byBhIG51bGwgcG9pbnRlciwgdGhlIHNhbWUgYXMgYSBiYXJlIGZ1
bmN0aW9uIG5hbWUuCiAgKCNHSDQ2MzYyKQoKLSBBZGRlZCBhIGNsZWFyZXIgZGlhZ25vc3RpYyBm
b3IgdW5pbml0aWFsaXplZCBkZWNvbXBvc2l0aW9uIGRlY2xhcmF0aW9ucy4gKCNHSDkwMTA3KQoK
LSBGaXhlZCBtaXNzaW5nIHNlbnRpbmVsIGF0dHJpYnV0ZSBkaWFnbm9zdGljIGRpc2NyZXBhbmN5
IHdpdGggZXhwbGljaXQgb2JqZWN0CiAgcGFyYW1ldGVycyBpbiB2YXJpYWRpYyBmdW5jdGlvbnMu
ICgjR0gyMDAwMDcpCgojIyMgSW1wcm92ZW1lbnRzIHRvIENsYW5nJ3MgdGltZS10cmFjZQoKIyMj
IEltcHJvdmVtZW50cyB0byBDb3ZlcmFnZSBNYXBwaW5nCgotIFtNQy9EQ10gTmVzdGVkIGV4cHJl
c3Npb25zIGFyZSBoYW5kbGVkIGFzIGluZGl2aWR1YWwgTUMvREMgZXhwcmVzc2lvbnMuCi0gIlNp
bmdsZSBieXRlIGNvdmVyYWdlIiBub3cgc3VwcG9ydHMgYnJhbmNoIGNvdmVyYWdlIGFuZCBjYW4g
YmUgdXNlZAogIHRvZ2V0aGVyIHdpdGggYC1mY292ZXJhZ2UtbWNkY2AuCi0gQ29uc3RldmFsIG1l
bWJlciBmdW5jdGlvbnMgYXJlIG5vIGxvbmdlciBlbWl0dGVkIGluIGNvdmVyYWdlIG1hcHBpbmdz
LAogIG1hdGNoaW5nIHRoZSBleGlzdGluZyBiZWhhdmlvciBmb3IgZnJlZSBjb25zdGV2YWwgZnVu
Y3Rpb25zLiAoI0dIMTY0NDQ4KQoKIyMjIEJ1ZyBGaXhlcyBpbiBUaGlzIFZlcnNpb24KCi0gRml4
ZWQgYW4gYXNzZXJ0aW9uIHdoZW4gY29tcGFyaW5nIGEgZml4ZWQgcG9pbnQgdHlwZSB3aXRoIGEg
YF9CaXRJbnRgIHR5cGUuICgjR0gxOTY5NDgpCi0gRml4ZWQgYXRvbWljIGJvb2xlYW4gY29tcG91
bmQgYXNzaWdubWVudDsgdGhlIGNvbnZlcnNpb24gYmFjayB0byBhdG9taWMgYm9vbCB3b3VsZCBi
ZSBtaXNjb21waWxlZC4gKCNHSDMzMjEwKQotIENvcnJlY3RseSBoYW5kbGUgZGVmYXVsdCB0ZW1w
bGF0ZSBhcmd1bWVudCB3aGVuIGVzdGFibGlzaGluZyBzdWJzdW1wdGlvbi4gKCNHSDE4ODY0MCkK
LSBGaXhlZCBhIGZhaWxlZCBhc3NlcnRpb24gaW4gdGhlIHByZXByb2Nlc3NvciB3aGVuIGBfX2hh
c19lbWJlZGAgcGFyYW1ldGVycyBhcmUgbWlzc2luZyBwYXJlbnRoZXNlcy4gKCNHSDE3NTA4OCkK
LSBGaXggbGlmZXRpbWUgZXh0ZW5zaW9uIG9mIHRlbXBvcmFyaWVzIGluIGZvci1yYW5nZS1pbml0
aWFsaXplcnMgaW4gdGVtcGxhdGVzLiAoI0dIMTY1MTgyKQotIEZpeGVkIGEgcHJlcHJvY2Vzc29y
IGNyYXNoIGluIGBfX2hhc19jcHBfYXR0cmlidXRlYCBvbiBpbmNvbXBsZXRlIHNjb3BlZCBhdHRy
aWJ1dGVzLiAoI0dIMTc4MDk4KQotIEZpeGVzIGFuIGFzc2VydGlvbiBmYWlsdXJlIHdoZW4gZXZh
bHVhdGluZyBgX191bmRlcmx5aW5nX3R5cGVgIG9uIGVudW0gcmVkZWNsYXJhdGlvbnMuICgjR0gx
Nzc5NDMpCi0gRml4ZWQgYW4gYXNzZXJ0aW9uIGZhaWx1cmUgY2F1c2VkIGJ5IG5lc3RlZCBtYWNy
byBleHBhbnNpb24gZHVyaW5nIGhlYWRlci1uYW1lIGxleGluZyAoYF9faGFzX2VtYmVkKF9faGFz
X2luY2x1ZGUpYCkuICgjR0gxNzg2MzUpCi0gQ2xhbmcgbm93IG91dHB1dHMgcmVsYXRpdmUgcGF0
aHMgb2YgZW1iZWRzIGZvciBkZXBlbmRlbmN5IG91dHB1dC4gKCNHSDE2MTk1MCkKLSBGaXggdGhl
IHJlc3VsdCB0eXBlIG9mIGEgYmluYXJ5IG9wZXJhdGlvbiB3aGVyZSBib3RoIG9wZXJhbmRzIGFy
ZSAndm9pZCcgbC12YWx1ZXMuICgjR0gxMTEzMDApCi0gRml4ZWQgYW4gYXNzZXJ0aW9uIGZhaWx1
cmUgd2hlbiBldmFsdWF0aW5nIGBfQ291bnRvZmAgb24gaW52YWxpZCBgdm9pZGAtdHlwZWQgb3Bl
cmFuZHMuICgjR0gxODA4OTMpCi0gRml4ZWQgYW4gYXNzZXJ0aW9uIGZhaWx1cmUgaW4gdGhlIHNl
cmlhbGl6ZWQgZGlhZ25vc3RpYyBwcmludGVyIHdoZW4gaXQgaXMgZGVzdHJveWVkIHdpdGhvdXQg
Y2FsbGluZyBgZmluaXNoKClgLiAoI0dIMTQwNDMzKQotIEZpeGVkIGFuIGFzc2VydGlvbiBmYWls
dXJlIGNhdXNlZCBieSBlcnJvciByZWNvdmVyeSB3aGlsZSBleHRlbmRpbmcgYSBuZXN0ZWQgbmFt
ZSBzcGVjaWZpZXIgd2l0aCByZXN1bHRzIGZyb20gb3JkaW5hcnkgbG9va3VwLiAoI0dIMTgxNDcw
KQotIEZpeGVkIGEgY3Jhc2ggd2hlbiBwYXJzaW5nIGAjcHJhZ21hIGNsYW5nIGF0dHJpYnV0ZWAg
YXJndW1lbnRzIGZvciBhdHRyaWJ1dGVzIHRoYXQgZm9yYmlkIGFyZ3VtZW50cy4gKCNHSDE4MjEy
MikKLSBGaXhlZCBhIGJ1ZyBpbiBob3cgQ2xhbmcgcmUtdHJhbnNmb3JtcyBleHByZXNzaW9ucyBw
cm9kdWNlZCBmcm9tIHN1YnN0aXRpdGlvbnMKICBmcm9tIHR5cGUgYWxpYXNlcyBhbmQgY29uY2Vw
dCBzcGVjaWFsaXphdGlvbnMuICgjR0gxOTE3MzgpICgjR0gxOTYzNzUpCi0gRml4ZWQgYSBidWcg
d2l0aCBtdWx0aXBsZS1pbmNsdWRlIG9wdGltaXphdGlvbiAoTUlPcHQpIHN0YXRlIG5vdCBiZWlu
ZyBwcmVzZXJ2ZWQgaW4gc29tZSBjYXNlcyBkdXJpbmcgbGV4aW5nLCB3aGljaCBjb3VsZCBzdXBw
cmVzcyBoZWFkZXItZ3VhcmQgbWlzbWF0Y2ggZGlhZ25vc3RpY3MgYW5kIGludGVyZmVyZSB3aXRo
IGluY2x1ZGUtZ3VhcmQgb3B0aW1pemF0aW9uLiAoI0dIMTgwMTU1KQotIEZpeGVkIGEgY3Jhc2gg
d2hlbiBub3JtYWxpemluZyBjb25zdHJhaW50cyBpbnZvbHZpbmcgY29uY2VwdCB0ZW1wbGF0ZSBw
YXJhbWV0ZXJzIHdob3NlIGluZGV4IGNvaW5jaWRlZCB3aXRoIG5vbi1jb25jZXB0IHRlbXBsYXRl
IHBhcmFtZXRlcnMgaW4gdGhlIHNhbWUgcGFyYW1ldGVyIG1hcHBpbmcuCi0gRml4ZWQgYSBjcmFz
aCBjYXVzZWQgYnkgYWNjZXNzaW5nIGRlcGVuZGVudCBkaWFnbm9zdGljcyBvZiBhIG5vbi1kZXBl
bmRlbnQgY29udGV4dC4KLSBGaXhlZCBhIGNyYXNoIHdoZW4gc3Vic3RpdHV0aW5nIGludG8gYSBu
b24tdHlwZSB0ZW1wbGF0ZSBwYXJhbWV0ZXIgdGhhdCBoYXMgYSB0eXBlIGNvbnRhaW5pbmcgYW4g
dW5kZWR1Y2VkIHBsYWNlaG9sZGVyIHR5cGUuCi0gRml4ZWQgc2V2ZXJhbCBjcmFzaGVzIGFuZCBp
bXByb3ZlZCBkaWFnbm9zdGljcyB3aGVuIGEgbXVsdGlkaW1lbnNpb25hbCBzdWJzY3JpcHQgb3Bl
cmF0b3IgaXMgYXBwbGllZCB0byBhIGJ1aWx0LWluIHR5cGUuICgjR0gxODc4MDApCi0gQ29ycmVj
dGx5IGRpYWdub3NpbmcgYW5kIG5vIGxvbmdlciBjcmFzaGluZyB3aGVuIGBleHBvcnQgbW9kdWxl
IGZvb2AKICAod2l0aG91dCBhIHNlbWljb2xvbikgYXJlIHRoZSBmaW5hbCB0b2tlbnMgaW4gYSBt
b2R1bGUgZmlsZS4gKCNHSDE4Nzc3MSkKLSBGaXhlZCBhIGNyYXNoIGluIGR1cGxpY2F0ZSBhdHRy
aWJ1dGUgY2hlY2tpbmcgY2F1c2VkIGJ5IGNvbXBhcmluZyBjb25zdGFudCBhcmd1bWVudHMgd2l0
aCBkaWZmZXJlbnQgaW50ZWdlciBzaWduZWRuZXNzLiAoI0dIMTg4MjU5KQotIENsYW5nIG5vdyBl
bWl0cyBhbiBlcnJvciB3aGVuIHJldHVybmluZyBhbiBpbml0aWFsaXplciBsaXN0IGZyb20gYSBs
YW1iZGEKICB3aXRoIGFuIGV4cGxpY2l0IHJldHVybiB0eXBlIG9mIHZvaWQuIFRoZSBkaWFnbm9z
dGljIG5vdyBjb3JyZWN0bHkgcmVmZXJzCiAgdG8gImxhbWJkYSIgaW5zdGVhZCBvZiAiYmxvY2si
LiAoI0dIMTg4NjYxKQotIEZpeGVkIGEgY3Jhc2ggb24gYF9CaXRJbnQoTilgIGFycmF5cyB3aGVy
ZSAxMjkg4omkIE4g4omkIDE5MiBkdWUgdG8gaW5jb3JyZWN0IGFycmF5IGZpbGxlciBsb3dlcmlu
Zy4gKCNHSDE4OTY0MykKLSBGaXhlZCB0aGUgYmVoYXZpb3IgaW4gQzIzIG9mIGBhdXRvYCwgYnkg
ZW1pdHRpbmcgYW4gZXJyb3Igd2hlbiBhbiBhcnJheSB0eXBlIGlzIHNwZWNpZmllZCBmb3IgYSBg
Y2hhciAqYC4gKCNHSDE2MjY5NCkKLSBGaXhlZCBhbiBpc3N1ZSB3aGVyZSBhbiBhc3NlcnQgd2Fz
IHRocm93biBpbnN0ZWFkIG9mIGFuIGVycm9yIGlmIG5vIHZ1bGthbiBlbnYgd2FzIHNwZWNpZmll
ZCB3aXRoIGAtLXRyaXBsZSBzcGlydmAuICgjR0gxODk5NjQpCi0gRml4ZWQgaW5jb3JyZWN0IHJl
amVjdGlvbiBvZiBgYXV0b2Agd2l0aCByZW9yZGVyZWQgZGVjbGFyYXRpb24gc3BlY2lmaWVycyBp
biBDMjMuICgjR0gxNjQxMjEpCi0gRml4ZWQgYSBidWcgd2hlcmUgQ2xhbmcgZmFpbHMgdG8gZmlu
ZCBpbnN0YW50aWF0aW9uIG9mIERlY2xzIGluIGNvbnN0cmFpbnQgY2hlY2tpbmcuICgjR0gxNzMw
ODYpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGFzc2lnbmluZyB0byBhbiBlbGVtZW50IG9mIGFuIGBl
eHRfdmVjdG9yX3R5cGVgIHdpdGggYGJvb2xgIGVsZW1lbnQgdHlwZS4gKCNHSDE4OTI2MCkKLSBG
aXhlZCBhIGNyYXNoIGNhdXNlZCBieSBkZWNsYXJpbmcgbXVsdGlwbGUgYG93bmVyc2hpcF9yZXR1
cm5zYCBhdHRyaWJ1dGVzIHdpdGggbWlzbWF0Y2hlZCBvciBtaXNzaW5nIGFyZ3VtZW50cy4gKCNH
SDE4ODczMykKLSBDbGFuZyBub3cgZW1pdHMgYW4gZXJyb3IgZm9yIGZyaWVuZCBkZWNsYXJhdGlv
bnMgb2YgbGFtYmRhIG1lbWJlcnMuICgjR0gyNjU0MCkKLSBGaXhlZCBhIGNyYXNoIGNhdXNlZCBi
eSBsYW1iZGEgY2FwdHVyZSBoYW5kbGluZyBpbiBkZWxheWVkIGRlZmF1bHQgYXJndW1lbnRzLiAo
I0dIMTc2NTM0KQotIEZpeGVkIGEgY3Jhc2ggd2hlbiBwYXJzaW5nIGludmFsaWQgYHN0YXRpY19h
c3NlcnRgIGRlY2xhcmF0aW9ucyB3aXRoIHN0cmluZy1saXRlcmFsIG1lc3NhZ2VzICgjR0gxODc2
OTApLgotIEZpeGVkIGEgcG90ZW50aWFsIHN0YWNrLXVzZS1hZnRlci1yZXR1cm4gaXNzdWUgaW4g
Q2xhbmcgd2hlbiBjb3B5LWluaXRpYWxpemluZwogIGFuIGFycmF5IHZpYSBhbiBlbGVtZW50LWF0
LWEtdGltZSBjb3B5IGxvb3AgKCNHSDE5MjAyNikKLSBGaXhlZCBhbiBpc3N1ZSB3aGVyZSBjZXJ0
YWluIGRlc2lnbmF0ZWQgaW5pdGlhbGl6ZXJzIHdvdWxkIGJlIHJlamVjdGVkIGZvciBjb25zdGV4
cHIgdmFyaWFibGVzLiAoI0dIMTkzMzczKQotIEZpeGVkIGBjbGFuZzo6UHJlcHJvY2Vzc29yOjpy
ZWNvbXB1dGVDdXJMZXhlcktpbmRgIHRvIGF2b2lkIGRlZmF1bHQgZmFsbGJhY2sgdG8gYEN1ckxl
eGVyQ2FsbGJhY2sgPSBDTEtfQ2FjaGluZ0xleGVyO2AuIFRoaXMgcHJldmVudHMgY29kZS1jb21w
bGV0aW9uCiAgRU9GIGhhbmRsaW5nIGZyb20gYWNjaWRlbnRhbGx5IHJlc3RvcmluZyBDTEtfQ2Fj
aGluZ0xleGVyIHdoaWxlIGEgdGVudGF0aXZlIHBhcnNlIGlzIHN0aWxsIGFjdGl2ZSwgd2hpY2gg
Y291bGQgdHJpZ2dlciBhIGNhY2hpbmcgbGV4ZXIgcmUtZW50cnkgYXNzZXJ0aW9uCiAgaW4gY2xh
bmdkIHNpZ25hdHVyZSBoZWxwLiAoI0dIMjAwNjc3KQotIEZpeGVkIGluY29ycmVjdCBleHBhbnNp
b24gc291cmNlIHJhbmdlcyBmb3Igc3ludGhlc2l6ZWQgdG9rZW5zIHByb2R1Y2VkIGJ5CiAgZmVh
dHVyZS1saWtlIGJ1aWx0aW4gbWFjcm9zIHN1Y2ggYXMgYF9faGFzX2J1aWx0aW5gLCB3aGljaCBj
b3VsZCB0cmlnZ2VyCiAgYXNzZXJ0aW9ucyBpbiBzeW50YXggdG9rZW4gY29sbGVjdGlvbi4gKCNH
SDE5NjA2NykKLSBGaXhlZCBhIGNyYXNoIHdoZW4gYCNlbWJlZGAgaXMgdXNlZCB3aXRoIEMrKyBt
b2R1bGVzICgjR0gxOTUzNTApCi0gRml4ZWQgYW4gYXNzZXJ0aW9uIGluIGNvbnN0YW50IGV2YWx1
YXRpb24gd2hlbiB1c2luZyBhIGRlZmF1bHRlZCBjb21wYXJpc29uIG9wZXJhdG9yIGluIGEgYHVu
aW9uYC4gKCNHSDE0NzEyNykKLSBGaXhlZCBhIGJ1ZyB3aGVyZSBgLXggY3VkYWAgY2F1c2VkIGNs
YW5nIHRvIGltbWVkaWF0ZWx5IHJlc29sdmUgdGVtcGxhdGVzIHRoYXQgc2hvdWxkIG5vdCBiZS4g
KCNHSDIwMDU0NSkKLSBGaXhlZCBhbiBpc3N1ZSB3aGVyZSBgX190eXBlb2ZfdW5xdWFsYCBhbmQg
YF9fdHlwZW9mX3VucXVhbF9fYCB3ZXJlIHJlamVjdGVkIGFzIGEgZGVjbGFyYXRpb24gc3BlY2lm
aWVyIGluIGJsb2NrIHNjb3BlIGluIEMrKy4KLSBGaXhlZCBjcmFzaCB3aGVuIGNoZWNraW5nIGZv
ciBvdmVyZmxvdyBmb3IgdW5hcnkgb3BlcmF0b3IgdGhhdCBjYW4ndCBvdmVyZmxvdyAoI0dIMTcw
MDcyKQotIENsYW5nIG5vIGxvbmdlciBoYW5kbGVzIGEgYCIgcS1jaGFyLXNlcXVlbmNlICJgIGhl
YWRlciBuYW1lIGFzIGEgc3RyaW5nIGxpdGVyYWwgKCNHSDEzMjY0MykuCi0gVW5kZXIgYC1mZG9s
bGFycy1pbi1pZGVudGlmaWVyc2AsIHRoZSBgJGAgY2FuIG5vdyBhcHBlYXIgaW4gdXNlci1kZWZp
bmVkLWxpdGVyYWxzLiAoI0dIMTczOTg1KQotIENsYW5nIG5vdyBkZXRlY3RzIGludmFsaWQgdW5p
Y29kZSBjaGFyYWN0ZXJzIGluIGlkZW50aWZpZXJzIGZvcm1lZCBieSB0b2tlbiBjb25jYXRlbmF0
aW9uLiAoI0dIMTAxMzQyKQotIEZpeGVkIGFuIGFzc2VydGlvbiB3aGVyZSB3ZSBpbXByb3Blcmx5
IGhhbmRsZWQgaW1wbGljaXQgY29udmVyc2lvbnMgdG8gaW50ZWdyYWwgdHlwZXMgZnJvbSBhbiBh
dG9taWMtdHlwZSB3aXRoIGEgY29udmVyc2lvbiBmdW5jdGlvbi4gKCNHSDIwMTc3MCkKLSBGaXhl
ZCBhc3NlcnRpb24gZmFpbHVyZXMgaW52b2x2aW5nIGNvZGUgY29tcGxldGlvbiB3aXRoIGRlbGF5
ZWQgZGVmYXVsdCBhcmd1bWVudHMgYW5kIGV4Y2VwdGlvbiBzcGVjaWZpY2F0aW9ucy4gKCNHSDIw
MDg3OSkKLSBGaXhlZCBhIHJlZ3Jlc3Npb24gd2hlcmUgY2FsbGluZyBhIGZ1bmN0aW9uIHRoYXQg
dGFrZXMgYSBjbGFzcy10eXBlIHBhcmFtZXRlciBieSB2YWx1ZSBpbnNpZGUgYGRlY2x0eXBlYCBv
ZiBhIGNvbmNlcHQgY291bGQgYmUgaW5jb3JyZWN0bHkgcmVqZWN0ZWQgd2hlbiB1c2VkIGFzIGEg
bm9uLXR5cGUgdGVtcGxhdGUgYXJndW1lbnQuICgjR0gxNzU4MzEpCi0gQ2xhbmcgbm8gbG9uZ2Vy
IGNyYXNoZXMgaWYgYF9fYXR0cmlidXRlX18oKGNsZWFudXApKWAgaXMgYXBwbGllZCB0byBhbiBp
bnZhbGlkIGRlY2xhcmF0aW9uLiBGdXJ0aGVybW9yZSwgaW4gZGVjbGFyYXRpb25zIHRoYXQKICBj
b250YWluIG11bHRpcGxlIGBjbGVhbnVwYCBhdHRyaWJ1dGVzLCBDbGFuZyBub3cgb25seSB1c2Vz
IHRoZSBsYXN0IG9uZSwgbWF0Y2hpbmcgR0NDJ3MgYmVoYXZpb3VyIChwcmV2aW91c2x5LCBDbGFu
ZwogIHdvdWxkIG9ubHkgdXNlIHRoZSBmaXJzdCBvbmUpLiBBIG5ldyB3YXJuaW5nIHRoYXQgZGlh
Z25vc2VzIHN1Y2ggZGVjbGFyYXRpb25zIGhhcyBiZWVuIGFkZGVkIHRvIGAtV2lnbm9yZWQtYXR0
cmlidXRlc2AuCiAgKCNHSDE5MTgyOSkKLSBGaXhlZCBhIGNyYXNoIGluIHRoZSBjb25zdGFudCBl
dmFsdWF0b3Igd2hlbiBhbiBpbGwtZm9ybWVkIGFycmF5IG5ldy1leHByZXNzaW9uIHdob3NlIGJv
dW5kIGNvdWxkIG5vdCBiZSBkZXRlcm1pbmVkIChlLmcuIGBuZXcgaW50W10oKWApIHdhcyB1c2Vk
IGluIGEgY29uc3RhbnQgZXhwcmVzc2lvbi4gKCNHSDIwMDEzOSkKLSBGaXhlZCBhIGNhc2Ugd2hl
cmUgZnVuY3Rpb24gZWZmZWN0IGFuYWx5c2lzIChgbm9uYmxvY2tpbmdgIGV0Yy4pIGRpZCBub3Qg
dmlzaXQgYSBkZXN0cnVjdG9yIGludm9rZWQgZnJvbSBhIGBkZWxldGVgIGV4cHJlc3Npb24uICgj
R0gxODQ0NjApCi0gQ2xhbmcgbm93IGRlZmluZXMgdGhlIEdDQy1jb21wYXRpYmxlIHByZWRlZmlu
ZWQgbWFjcm9zIGBfX1dDSEFSX01JTl9fYCwgYF9fV0lOVF9NSU5fX2AsIGFuZCBgX19TSUdfQVRP
TUlDX01JTl9fYC4gKCNHSDE5OTY3OCkKLSBDbGFuZyBub3cgZGVmaW5lcyB0aGUgR0NDLWNvbXBh
dGlibGUgcHJlZGVmaW5lZCBtYWNybyBgX19TSUdfQVRPTUlDX1RZUEVfX2AuICgjR0gyMTM4OTUp
Ci0gRml4IGEgY3Jhc2ggaW4gYWRkVW5zaXplZEFycmF5IGR1ZSBhc3NlcnQgbm90IHZlcmlmeWlu
ZyB3ZSBoYXZlIGEgQmFzZSBiZWZvcmUgZG9pbmcgY2hlY2tzIG9uIGl0LiAoI0dINDQyMTIpCi0g
Rml4ZWQgYW4gYXNzZXJ0aW9uIHRoYXQgY291bGQgb2NjdXIgd2hlbiByZWJ1aWxkaW5nIHBhcmVu
dGhlc2l6ZWQgbGlzdCBpbml0aWFsaXphdGlvbiBleHByZXNzaW9ucyBkdXJpbmcgdGVtcGxhdGUg
aW5zdGFudGlhdGlvbiBvciBBU1QgdHJhbnNmb3JtYXRpb24uCgojIyMjIEJ1ZyBGaXhlcyB0byBD
b21waWxlciBCdWlsdGlucwoKLSBGaXggYSBjcmFzaCB3aGVuIHBhc3NpbmcgYW4gdW5yZXNvbHZl
ZCBvdmVybG9hZCBzZXQgdG8gYF9fYnVpbHRpbl9jbGFzc2lmeV90eXBlYC4gKCNHSDE3NTU4OSkK
LSBGaXhlZCBhIGNyYXNoIHdoZW4gY2FsbGluZyBgX19idWlsdGluX2FsbG93X3Nhbml0aXplX2No
ZWNrYCB3aXRoIG5vIGFyZ3VtZW50cy4gKCNHSDE4MzkyNykKLSBgX19hbm5vdGF0aW9uYCBpcyBu
b3cgZGlhZ25vc2VkIGFzIHVuc3VwcG9ydGVkIG9uIG5vbi1XaW5kb3dzL1VFRkkgdGFyZ2V0cywg
Zml4aW5nIGEKICBjcmFzaCB3aGVuIHVzaW5nIGl0IHdpdGggYC1mbXMtZXh0ZW5zaW9uc2Agb24g
b3RoZXIgcGxhdGZvcm1zLiAoI0dIMTg0MzE4KQotIEZpeGVkIGEgY29tcGlsZXIgY3Jhc2ggZHVl
IHRvIGFuIHVucmVzb2x2ZWQgb3ZlcmxvYWRlZCBmdW5jdGlvbiB0eXBlIHdoZW4KICBjYWxsaW5n
IGBfX2J1aWx0aW5fYml0X2Nhc3RgLiAoI0dIMjAwMTEyKQotIENsYW5nIG5vdyBTRklOQUUgZnJp
ZW5kbHkgd2hlbiB0aGUgYGBfX3JlZmVyZW5jZV9tZW93c19mcm9tX3RlbXBvcmFyeWBgIGJ1aWx0
aW5zCiAgc2hvdWxkIFNGSU5BRSBmcmllbmRseSB3aGVuIHRoZSAxc3QgdHlwZSBpcyBub3QgYSBy
ZWZlcmVuY2UgdHlwZS4gKCNHSDIwNjUyNCkKLSBGaXhlZCBgX19idWlsdGluX29mZnNldG9mYCBp
bmNvcnJlY3RseSBzaWduLWV4dGVuZGluZyB1bnNpZ25lZCBhcnJheSBpbmRpY2VzCiAgd2l0aCB0
aGUgaGlnaCBiaXQgc2V0IChlLmcuIGB1aW50OF90YCB2YWx1ZXMgPj0gMTI4KSwgd2hpY2ggcHJv
ZHVjZWQgd3JvbmcKICBvZmZzZXQgdmFsdWVzIGluIGNvbnN0YW50IGV4cHJlc3Npb25zLiAoI0dI
MTk5MzE5KQoKIyMjIyBCdWcgRml4ZXMgdG8gQXR0cmlidXRlIFN1cHBvcnQKCi0gRml4ZWQgYSBi
ZWhhdmlvcmFsIGRpc2NyZXBhbmN5IGJldHdlZW4gZGVsZXRlZCBmdW5jdGlvbnMgYW5kIHByaXZh
dGUgbWVtYmVycyB3aGVuIGNoZWNraW5nIHRoZSBgZW5hYmxlX2lmYCBhdHRyaWJ1dGUuICgjR0gx
NzU4OTUpCi0gRml4ZWQgYGluaXRfcHJpb3JpdHlgIGF0dHJpYnV0ZSBieSBkZWxheWluZyB0eXBl
IGNoZWNrcyB1bnRpbCBhZnRlciB0aGUgdHlwZSBpcyBkZWR1Y2VkLgotIEZpeGVkIGEgY3Jhc2gg
d2hlbiBhIGBzZWN0aW9uYCBhdHRyaWJ1dGUgb3IgYCNwcmFnbWEgY2xhbmcgc2VjdGlvbmAgY2F1
c2VkIGEKICBzZWN0aW9uIHR5cGUgY29uZmxpY3Qgd2l0aCBhIGRlY2xhcmF0aW9uIHdob3NlIG5h
bWUgaXMgbm90IGEgc2ltcGxlIGlkZW50aWZpZXIsCiAgc3VjaCBhcyBhIGxhbWJkYSdzIGNhbGwg
b3BlcmF0b3IuICgjR0gxOTIyNjQpCi0gRml4ZWQgYSByZWdyZXNzaW9uIHdoZXJlIGF0dHJpYnV0
ZWQgdHlwZXMgKHN1Y2ggYXMgdGhvc2UgY2FycnlpbmcgYF9Ob25udWxsYC9gX051bGxhYmxlYCBh
dHRyaWJ1dGVzKQogIHdlcmUgbm90IGRlZHVwbGljYXRlZCwgYmVjYXVzZSB0aGUgYXR0cmlidXRl
cycgYXJndW1lbnRzIHdlcmUgbm90IHRha2VuIGludG8KICBhY2NvdW50IHdoZW4gdW5pcXVpbmcg
dGhlbS4gVGhlIGR1cGxpY2F0aW9ucyBjb3VsZCBzdWJzdGFudGlhbGx5IGluY3JlYXNlIHRoZQog
IHNpemUgb2YgcHJlY29tcGlsZWQgaGVhZGVycyBhbmQgbW9kdWxlcyAoUENIL1BDTSksIGFuZCB0
aGUgdGltZSBzcGVudCBsb2FkaW5nCiAgdGhlbS4gKCNHSDIwMDk2MSkKCiMjIyMgQnVnIEZpeGVz
IHRvIEMrKyBTdXBwb3J0CgotIEZpeGVkIGEgcHJlcHJvY2Vzc29yIGFzc2VydGlvbiBmYWlsdXJl
IHRyaWdnZXJlZCB3aGVuIHBhcnNpbmcgYW4gaW52YWxpZCB0ZW1wbGF0ZS1pZCBzdGFydGluZyB3
aXRoIGA6OnRlbXBsYXRlIG9wZXJhdG9yYC4gKCNHSDE4NjU4MikKLSBGaXhlZCBhIGNyYXNoIHdo
ZW4gYSBmdW5jdGlvbiB0ZW1wbGF0ZSBpcyBkZWZpbmVkIGFzIGEgbm9uLXRlbXBsYXRlIGZyaWVu
ZCB3aXRoIGEgZ2xvYmFsIHNjb3BlIHF1YWxpZmllci4gKCNHSDE4NTM0MSkKLSBGaXhlZCBhIGJ1
ZyBvZiBpbmNvcnJlY3QgdGVtcGxhdGUgZGVwdGggZm9yIGFiYnJldmlhdGVkIHRlbXBsYXRlcy4g
KCNHSDIwMDY4MikKLSBGaXhlZCB2YWxpZCBDKysgY29kZSB0aGF0IHVzZXMgYW4gYWRkcmVzcy1v
Zi1mdW5jdGlvbi10ZW1wbGF0ZSBleHByZXNzaW9uLAogIHN1Y2ggYXMgYGRlY2x0eXBlKCZUOjpm
dW5jPEFyZ3MuLi4+KWAsIGluIFNGSU5BRSBjaGVja3Mgd2hlbiBzdWJzdGl0dXRpbmcgdGhlCiAg
ZnVuY3Rpb24gdGVtcGxhdGUncyB0cmFpbGluZyByZXR1cm4gdHlwZSBmYWlscywgc3VjaCBhcyB3
aGVuIHRoZSByZXR1cm4gdHlwZQogIGNvbnRhaW5zIGEgYGRlY2x0eXBlYCBwcm9iZSB0aGF0IGNh
bGxzIGEgZGVsZXRlZCBmdW5jdGlvbi4KLSBDbGFuZyBub3cgcmVqZWN0cyBjb25zdGFudCB0ZW1w
bGF0ZSBwYXJhbWV0ZXJzIHdpdGggYmxvY2sgcG9pbnRlciB0eXBlcywgc2luY2UgdGhlc2UgYXJl
IG5vdCBpbXBsZW1lbnRlZCBhbnl3YXkgYW5kIHdvdWxkIGxlYWQgdG8gY3Jhc2hlcy4gKCNHSDE4
OTI0NykKLSBGaXhlZCBzb21lIGNvbmNlcHQgYnVncyBpbnRyb2R1Y2VkIGluIENsYW5nIDIyICgj
R0gxOTc1OTcpCi0gQ2xhbmcgbm8gbG9uZ2VyIHJlamVjdCBjYWxsIGV4cHJlc3Npb25zIHdob3Nl
IHR5cGUgaXMgYSBub3QteWV0LWRlZHVjZWQgYXV0byB0eXBlLiAoI0dIMjA3NTY1KQotIEZpeGVk
IGEgY3Jhc2ggb24gZXJyb3IgcmVjb3Zlcnkgd2hlbiBkZWFsaW5nIHdpdGggaW52YWxpZCB0ZW1w
bGF0ZXMuICgjR0gxODMwNzUpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGluc3RhbnRpYXRpbmcgYHJl
cXVpcmVzYCBleHByZXNzaW9ucyBpbnZvbHZpbmcgc3Vic3RpdHV0aW9uIGZhaWx1cmVzIGluIEMr
KyBjb25jZXB0cy4gKCNHSDE3NjQwMikKLSBDb25jZXB0cyBhcHBlYXJpbmcgaW4gdGhlIHJlcXVp
cmUtY2xhdXNlIG9mIGEgbWVtYmVyIGZ1bmN0aW9uIG5vIGxvbmdlciBoYXZlIGFjY2VzcyB0byBu
b24tcHVibGljIG1lbWJlcnMgb2YgdGhhdCBjbGFzcywKICBvciB0byBhIGN1cnJlbnQgY2xhc3Mg
b2JqZWN0LiAoI0dIMTE1ODM4KSAoI0dIMTk0ODAzKSAoI0dIMTk3MDY3KQotIFdlIG5vIGxvbmdl
ciBjYWNoZXMgaW52YWxpZCB2YXJpYWJsZSBzcGVjaWFsaXphdGlvbnMuICgjR0gxMzI1OTIpCi0g
Rml4ZWQgYW4gaW5jb3JyZWN0IHRlbXBsYXRlIGFyZ3VtZW50IGRlZHVjdGlvbiB3aGVuIG1hdGNo
aW5nIHBhY2tzIG9mIHRlbXBsYXRlCiAgdGVtcGxhdGUgcGFyYW1ldGVycyB3aGVuIG9uZSBvZiBp
dHMgcGFyYW1ldGVycyBpcyBhbHNvIGEgcGFjay4gKCNHSDE4MTE2NikKLSBDbGFuZyBubyBsb25n
ZXIgZXJyb3JzIG9uIG92ZXJsb2FkcyB3aXRoIGRpZmZlcmVudCByZWYtcXVhbGlmaWVycyBhbmQg
Y29uc3RyYWludHMuICgjR0gxMjA4MTIpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGEgZGVmYXVsdCBh
cmd1bWVudCBpcyBwYXNzZWQgdG8gYW4gZXhwbGljaXQgb2JqZWN0IHBhcmFtZXRlci4gKCNHSDE3
NjYzOSkKLSBGaXhlZCBhbiBhbGlhcyB0ZW1wbGF0ZSBDVEFEIGNyYXNoLgotIEltcHJvdmVtZW50
cyB0byB0eXBvIGNvcnJlY3Rpb24gaW52b2x2aW5nIHRlbXBsYXRlIG5hbWVzLiAoI0dIMjA3NDk4
KQotIENvcnJlY3RseSBkaWFnbm9zZSB1c2VzIG9mIGBjb19hd2FpdGAgLyBgY29feWllbGRgIGlu
IHRoZSBkZWZhdWx0IGFyZ3VtZW50IG9mIG5lc3RlZCBmdW5jdGlvbiBkZWNsYXJhdGlvbnMuICgj
R0g5ODkyMykKLSBGaXhlZCBhIGNyYXNoIHdoZW4gZGlhZ25vc2luZyBhbiBpbnZhbGlkIHN0YXRp
YyBtZW1iZXIgZnVuY3Rpb24gd2l0aCBhbiBleHBsaWNpdCBvYmplY3QgcGFyYW1ldGVyICgjR0gx
Nzc3NDEpCi0gQ2xhbmcgaW5jb3JyZWN0bHkgaW5zdGFudGlhdGVkIHZhcmlhYmxlIHNwZWNpYWxp
emF0aW9ucyBvdXRzaWRlIG9mIHRoZSBpbW1lZGlhdGUgY29udGV4dC4gKCNHSDU0NDM5KQotIEZp
eGVkIGEgY3Jhc2ggd2hlbiBwYWNrIGV4cGFuc2lvbnMgYXJlIHVzZWQgYXMgYXJndW1lbnRzIGZv
ciBub24tcGFjayBwYXJhbWV0ZXJzIG9mIGJ1aWx0LWluIHRlbXBsYXRlcy4gKCNHSDE4MDMwNykK
LSBGaXhlZCBjcmFzaCBpbnN0YW50aWF0aW5nIGNsYXNzIG1lbWJlciBzcGVjaWFsaXphdGlvbnMu
Ci0gRml4ZWQgYSBjcmFzaCBkdXJpbmcgY2xhc3MgdGVtcGxhdGUgaW5zdGFudGlhdGlvbiB3aGVu
IGEgbWVtYmVyIHZhcmlhYmxlCiAgdGVtcGxhdGUncyB0eXBlIHN1YnN0aXR1dGlvbiBmYWlscyAo
ZS5nLiBgdHlwZW5hbWUgVDo6dHlwZWAgd2l0aCBgVD1pbnRgKSwKICB3aGljaCBsZWZ0IHRoZSBg
VmFyVGVtcGxhdGVEZWNsYCB1bnJlZ2lzdGVyZWQgYW5kIGNhdXNlZCBhIHN1YnNlcXVlbnQKICBh
c3NlcnRpb24gZmFpbHVyZSB3aGVuIGluc3RhbnRpYXRpbmcgYSBwYXJ0aWFsIHNwZWNpYWxpemF0
aW9uIG9mIHRoYXQgbWVtYmVyLgogICgjR0gxOTg4OTApCi0gRml4IGEgcHJvYmxlbSB3aGVyZSBh
IHN1YnN0aXR1dGlvbiBmYWlsdXJlIHdoZW4gZXZhbHVhdGluZyBhIHR5cGUgcmVxdWlyZW1lbnQK
ICBjb3VsZCBkaXJlY3RseSBtYWtlIHRoZSBwcm9ncmFtIGlsbC1mb3JtZWQuCi0gVHlwbyBjb3Jy
ZWN0aW9uIG5vdyBjb3JyZWN0cyB0aGUgbmFtZSBxdWFsaWZpZXIgZm9yIGludmFsaWQgdGVtcGxh
dGUgbmFtZXMuCi0gRml4IGEgcHJvYmxlbSB3aGVyZSBwYWNrIGluZGV4IGV4cHJlc3Npb25zIHdo
ZXJlIGluY29ycmVjdGx5IGJlaW5nIHJlZ2FyZGVkIGFzIGVxdWl2YWxlbnQuCi0gQ29ycmVjdGx5
IGRpYWdub3NlIG5hcnJvd2luZyBpbiBwYWNrIGluZGV4IGV4cHJlc3Npb25zLiAoI0dIMjA1NjUw
KQotIEZpeGVkIGEgYnVnIHdoZXJlIGNhcHR1cmVkIHZhcmlhYmxlcyBpbiBub24tbXV0YWJsZSBs
YW1iZGFzIHdlcmUgaW5jb3JyZWN0bHkgdHJlYXRlZCBhcyBtdXRhYmxlCiAgd2hlbiB1c2VkIGlu
c2lkZSBkZWNsdHlwZSBpbiB0aGUgcmV0dXJuIHR5cGUuICgjR0gxODA0NjApCi0gRml4ZWQgYSBj
cmFzaCB3aGVuIGV2YWx1YXRpbmcgdW5pbml0aWFsaXplZCBHQ0MgdmVjdG9yL2V4dF92ZWN0b3Jf
dHlwZSB2ZWN0b3JzIGluIGBjb25zdGV4cHJgLiAoI0dIMTgwMDQ0KQotIEZpeGVkIGEgY3Jhc2gg
d2hlbiBgZXhwbGljaXQoYm9vbClgIGlzIHVzZWQgd2l0aCBhbiBpbmNvbXBsZXRlIGVudW1lcmF0
aW9uLiAoI0dIMTgzODg3KQotIEZpeCBjcmFzaC1vbi1pbnZhbGlkIGNhdXNlZCBieSBxdWFsaWZp
ZWQgZm9yd2FyZCBkZWNsYXJhdGlvbnMuICgjR0gyMDIzMjApCi0gRml4ZWQgYSBjcmFzaCBvbiBg
dHlwZWlkYCBvZiBpbmNvbXBsZXRlIGxvY2FsIHR5cGVzIGR1cmluZyB0ZW1wbGF0ZSBpbnN0YW50
aWF0aW9uLiAoI0dINjMyNDIpLCAoI0dIMTc2Mzk3KQotIEZpeGVkIHNwdXJpb3VzIGRpYWdub3N0
aWNzIHByb2R1Y2VkIHdoZW4gY2hlY2tpbmcgaWYgY29uc3RyYWludHMgYXJlIGVxdWl2YWxlbnQg
Zm9yIHJlZGVjbGFyYXRpb25zLAogIHdoaWNoIGNvdWxkIG1ha2UgdGhlIHByb2dyYW0gbWlzdGFr
ZW5seSBpbGwtZm9ybWVkLgotIEZpeGVkIGEgY3Jhc2ggd2hlbiBhbiBpbW1lZGlhdGUtaW52b2tl
ZCBgY29uc3RldmFsYCBsYW1iZGEgaXMgdXNlZCBhcyBhbiBpbnZhbGlkIGluaXRpYWxpemVyLiAo
I0dIMTg1MjcwKQotIEZpeGVkIGFuIGFzc2VydGlvbiBmYWlsdXJlIHdoZW4gdXNpbmcgYSBnbG9i
YWwgZGVzdHJ1Y3RvciB3aXRoIGEgdGFyZ2V0IHdpdGggYSBub24tZGVmYXVsdCBwcm9ncmFtIGFk
ZHJlc3Mgc3BhY2UuICgjR0gxODY0ODQpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGluc3RhbnRpYXRp
bmcgYW4gaW52YWxpZCBvdXQtb2YtbGluZSBzdGF0aWMgZGF0YSBtZW1iZXIgZGVmaW5pdGlvbiBp
biBhIGxvY2FsIGNsYXNzLiAoI0dIMTc2MTUyKQotIEluaGVyaXRlZCBjb25zdHJ1Y3RvcnMgaW4g
YGRsbGV4cG9ydGAgY2xhc3NlcyBhcmUgbm93IGV4cG9ydGVkIGZvciBBQkktY29tcGF0aWJsZSBj
YXNlcywgbWF0Y2hpbmcKICBNU1ZDIGJlaGF2aW9yLiBDb25zdHJ1Y3RvcnMgd2l0aCB2YXJpYWRp
YyBhcmd1bWVudHMgb3IgY2FsbGVlLWNsZWFudXAgcGFyYW1ldGVycyBhcmUgbm90IHlldCBzdXBw
b3J0ZWQKICBhbmQgcHJvZHVjZSBhIHdhcm5pbmcuICgjR0gxNjI2NDApCi0gQ29ycmVjdGx5IGRp
YWdub3NlIGludmFsaWQgbm9uLWRlcGVuZGVudCBjYWxscyBpbiBkZXBlbmRlbnQgY29udGV4dHMu
ICgjR0gxMzU2OTQpCi0gRml4IGluaXRpYWxpemF0aW9uIG9mIEdSTyB3aGVuIEdSTy1yZXR1cm4g
dHlwZSBtaXNtYXRjaGVzLCBhcyBwYXJ0IG9mIENXRzI1NjMuICgjR0g5ODc0NCkKLSBGaXggYW4g
ZXJyb3IgdXNpbmcgYW4gaW5pdGlhbGl6ZXIgbGlzdCB3aXRoIGFycmF5IG5ldyBmb3IgYSB0eXBl
IHRoYXQgaXMgbm90IGRlZmF1bHQtY29uc3RydWN0aWJsZS4gKCNHSDgxMTU3KQotIEZpeGVkIGEg
Y3Jhc2ggaW4gaW52YWxpZCBgYCNtb2R1bGVgYCBwcmVwcm9jZXNzaW5nIGRpcmVjdGl2ZS4gKCNH
SDE3OTIyMCkKLSBXZSBubyBsb25nZXIgY29uc2lkZXIgY29udmVyc2lvbiBvcGVyYXRvcnMgd2hl
biBjb3B5LWluaXRpYWxpemluZyBmcm9tIHRoZSBzYW1lIHR5cGUuIFRoaXMgd2FzIG5vbgogIGNv
bmZvcm1pbmcgYW5kIGNvdWxkIGxlYWQgdG8gcmVjdXJzaXZlIGNvbnN0cmFpbnQgc2F0aXNmYWN0
aW9uIGNoZWNraW5nLiAoI0dIMTQ5NDQzKQotIEZpeGVkIGEgY3Jhc2ggaW4gSXRhbml1bSBDKysg
bmFtZSBtYW5nbGluZyBmb3IgYSBsYW1iZGEgaW4gYSBsb2NhbCBjbGFzcyBmaWVsZCBpbml0aWFs
aXplciBpbnNpZGUgYSBjb25zdHJ1Y3Rvci9kZXN0cnVjdG9yLiAoI0dIMTc2Mzk1KQotIEZpeGVk
IGEgY3Jhc2ggd2hlbiBFeHByOjpDbGFzc2lmeUltcGwgY29tcHV0ZXMgYSBjbGFzc2lmaWNhdGlv
biBsaWtlIENMX0xWYWx1ZSBvciBDTF9QUlZhbHVlLCB0aGVuIGFzc2VydHMgdGhhdCB0aGlzCiAg
YWdyZWVzIHdpdGggdGhlIEFTVCBub2RlJ3Mgb3duIHZhbHVlIGNhdGVnb3J5LiAoI0dIMjAyNjkz
KQotIEZpeGVkIGNyYXNoZXMgaW4gSXRhbml1bSBDKysgbmFtZSBtYW5nbGluZyBmb3IgbGFtYmRh
cyB3aXRoIHRyYWlsaW5nIHJlcXVpcmVzLWNsYXVzZXMgaW52b2x2aW5nIHJlcXVpcmVzLWV4cHJl
c3Npb25zLiAoI0dIMTAwNzc0KSAoI0dIMTIzODU0KQotIEZpeGVkIGFuIGludmFsaWQgcmVqZWN0
aW9uIGFuZCBhc3NlcnRpb24gZmFpbHVyZSB3aGlsZSBnZW5lcmF0aW5nIGBvcGVyYXRvcj1gIGZv
ciBmaWVsZHMgd2l0aCB0aGUgYF9fcmVzdHJpY3RgIHF1YWxpZmllci4gKCNHSDM3OTc5KQotIEZp
eGVkIGEgdXNlLWFmdGVyLWZyZWUgYnVnIHdoZW4gcGFyc2luZyBkZWZhdWx0IGFyZ3VtZW50cyBj
b250YWluaW5nIGxhbWJkYXMgaW4gZGVjbGFyYXRpb25zIHdpdGggdGVtcGxhdGUtaWQgZGVjbGFy
YXRvcnMuICgjR0gxOTY3MjUpCi0gRml4ZWQgbWlzc2luZyBkZXN0cnVjdG9yIGNsZWFudXBzIGZv
ciBsYW1iZGEgaW5pdC1jYXB0dXJlcyBpbiBkZWZhdWx0IG1lbWJlcgogIGluaXRpYWxpemVycyB1
c2VkIGR1cmluZyBhZ2dyZWdhdGUgaW5pdGlhbGl6YXRpb24uICgjR0gxOTY0NjkpCi0gRml4ZWQg
YSBjcmFzaCBpbiBjb25zdGFudCBldmFsdWF0aW9uIHVzaW5nIHBsYWNlbWVudCBuZXcgb24gYW4g
YXJyYXkgd2hpY2ggd2FzIGxhdGVyIGluaXRpYWxpemVkLiAoI0dIMTk2NDUwKQotIEZpeGVkIGFu
IGlzc3VlIHdoZXJlIENsYW5nIGluY29ycmVjdGx5IGFjY2VwdGVkIGludmFsaWQgdW5xdWFsaWZp
ZWQgdXNlcyBvZiBsb2NhbCBuZXN0ZWQgY2xhc3MgbmFtZXMgb3V0c2lkZSB0aGVpciBkZWNsYXJp
bmcgc2NvcGUuICgjR0gxODQ2MjIpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGluc3RhbnRpYXRpbmcg
YSBjbGFzcyB0ZW1wbGF0ZSB3aG9zZSBtZW1iZXIgdmFyaWFibGUgcGFydGlhbCBzcGVjaWFsaXph
dGlvbiBoYXMgYW4gaW52YWxpZCBwcmltYXJ5IHRlbXBsYXRlLiAoI0dIMTk1OTg4KQotIEZpeGVk
IGEgY3Jhc2ggd2hlbiBwYXJzaW5nIGludmFsaWQgZnJpZW5kIGRlY2xhcmF0aW9uIHdpdGggc3Rv
cmFnZS1jbGFzcyBzcGVjaWZpZXIuICgjR0gxODY1NjkpCi0gRml4ZWQgYSBtaXNzaW5nIHZ0YWJs
ZSBmb3IgYGR5bmFtaWNfY2FzdDxGaW5hbENsYXNzICo+KHRoaXMpYCBpbiBhIGZ1bmN0aW9uIHRl
bXBsYXRlLiAoI0dIMTk4NTExKQotIEZpeGVkIGFuIGFzc2VydGlvbiBmYWlsdXJlIGR1cmluZyBp
bml0LWxpc3QgY2hlY2tpbmcgb2YgYW4gYXJyYXkgd2hvc2UgZWxlbWVudCB0eXBlIGlzIGFuIGlu
Y29tcGxldGUgY2xhc3MuICgjR0gxNDA2ODUpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIHVzaW5nIGEg
cGFjayBpbmRleGluZyB0eXBlIChlLmcuIGBgVHMuLi5bMF1gYCkgaW1wb3J0ZWQgZnJvbSBhbm90
aGVyIG1vZHVsZS4gKCNHSDIwNDQ3OSkKLSBGaXhlZCBhbiBPRFItbWVyZ2luZyBlcnJvciBpbiBt
b2R1bGVzLCB3aGVyZSBjbGFzcy1zY29wZSBgdXNpbmcgZW51bWAgZGVjbGFyYXRpb25zIHdlcmUg
bm90IHJlY29nbml6ZWQgYXMgbWF0Y2hpbmcgYWNyb3NzIG1vZHVsZQogIGJvdW5kYXJpZXMuICAo
I0dIMjA3MDY2KQotIEZpeGVkIGEgY3Jhc2ggd2hlbiBjb25zdGFudCBldmFsdWF0aW9uIGFjY2Vz
c2VkIGEgYmFzZSBjbGFzcyBvciBtZW1iZXIgb2YgYW4gb2JqZWN0IHdyYXBwZWQgaW4gYF9BdG9t
aWNgLiAoI0dIMjAzMzI4KQoKIyMjIyBCdWcgRml4ZXMgdG8gQVNUIEhhbmRsaW5nCgotIEZpeGVk
IGEgYnVnIHdoZXJlIGV4cGxpY2l0IG51bGxhYmlsaXR5IHByb3BlcnR5IGF0dHJpYnV0ZXMgd2Vy
ZSBub3Qgc3RvcmVkIGluIEFTVCBub2RlcyBpbiBPYmplY3RpdmUtQy4gKCNHSDE3OTcwMykKLSBG
aXhlZCBhIGJ1ZyB3aGVyZSBhbGlhcyBDVEFELCBvciBhbiBpbnZhbGlkIHRlbXBsYXRlIHRlbXBs
YXRlIHBhcmFtZXRlciwgY291bGQgY3JlYXRlIGEgdGVtcGxhdGUgd2l0aCBhbiBlbXB0eSB0ZW1w
bGF0ZQogIHBhcmFtZXRlciBsaXN0LiBUaGlzIGFsc28gYWRkcyBhc3NlcnRzIHRvIHByZXZlbnQg
dGhpcyBmcm9tIGhhcHBlbmluZyBhZ2Fpbi4KLSBGaXhlZCBhIGNyYXNoIHdoZW4gcGFyc2luZyBE
b3h5Z2VuIGBAcGFyYW1gIGNvbW1hbmRzIGF0dGFjaGVkIHRvIGludmFsaWQgZGVjbGFyYXRpb25z
IG9yIG5vbi1mdW5jdGlvbiBlbnRpdGllcy4gKCNHSDE4MjczNykKLSBGaXhlZCB0aGUgU291cmNl
TG9jYXRpb24gYW5kIFNvdXJjZVJhbmdlIG9mIHJldmVyc2VkIHJld3JpdHRlbiBDWFhPcGVyYXRv
ckNhbGxFeHByLiAoI0dIMTkyNDY3KQotIEZpeGVkIGEgYXNzZXJ0aW9uIHdoZW4gYF9fYmxvY2tg
IGlzIHVzZWQgb24gZ2xvYmFsIHZhcmlhYmxlcyBpbiBDIG1vZGUuICgjR0gxODM5NzQpCi0gQWRk
ZWQgbWlzc2luZyBBU1Qgbm9kZXMgcmVwcmVzZW50aW5nIHRoZSBgZGVjbHR5cGVgIHNwZWNpZmll
cnMgaW4gZGVzdHJ1Y3RvciBjYWxsIHRvIEFTVC4KLSBGaXhlZCBhIG1pc3NpbmcgT0RSIHZpb2xh
dGlvbiBkaWFnbm9zdGljIGludHJvZHVjZWQgYnkgdGhlIGlubGluZSBhc3NlbWJseSBzdHJpbmcg
b3IgY2xvYmJlciBsaXN0LiAoI0dIMTk4NjE2KQotIEZpeGVkIGEgbm9uLWRldGVybWluaXN0aWMg
b3JkZXJpbmcgb2YgdW51c2VkIGxvY2FsIHR5cGVkZWZzIHRoYXQgbWFkZQogIHNlcmlhbGl6ZWQg
UENIL0FTVCBmaWxlcyBhbmQgYC1XdW51c2VkLWxvY2FsLXR5cGVkZWZgIGRpYWdub3N0aWNzCiAg
bm9uLXJlcHJvZHVjaWJsZSBhY3Jvc3MgcnVucy4gKCNHSDIwOTYzOSkKCiMjIyMgTWlzY2VsbGFu
ZW91cyBCdWcgRml4ZXMKCi0gRml4ZWQgYSBjcmFzaCB3aGl0aCB0aGUgQVNUIHRleHQgZHVtcGVy
LCB3aGVuIGR1bXBpbmcgYSByZWZlcmVuY2UgdG8gYQogIGRlY29tcG9zaXRpb24gd2l0aCBubyBi
aW5kaW5kcy4gKCNHSDE5ODg0MikKLSBGaXhlZCB0aGUgYXJndW1lbnRzIG9mIHRoZSBmb3JtYXQg
YXR0cmlidXRlIG9uIGBfX2J1aWx0aW5fb3NfbG9nX2Zvcm1hdGAuIFByZXZpb3VzbHksIHRoZXkg
d2VyZSBvZmYgYnkgMS4KCiMjIyMgTWlzY2VsbGFuZW91cyBDbGFuZyBDcmFzaGVzIEZpeGVkCgot
IEZpeGVkIGEgY3Jhc2ggd2hlbiBhdHRlbXB0aW5nIHRvIGp1bXAgb3ZlciBpbml0aWFsaXphdGlv
biBvZiBhIHZhcmlhYmxlIHdpdGggdmFyaWFibHkgbW9kaWZpZWQgdHlwZS4gKCNHSDE3NTU0MCkK
LSBGaXhlZCBhIGNyYXNoIHdoZW4gdXNpbmcgbG9vcCBoaW50IHdpdGggYSB2YWx1ZSBkZXBlbmRl
bnQgYXJndW1lbnQgaW5zaWRlIGEKICBnZW5lcmljIGxhbWJkYS4gKCNHSDE3MjI4OSkKLSBGaXhl
ZCBhIGNyYXNoIGluIEMrKyBvdmVybG9hZCByZXNvbHV0aW9uIHdpdGggYF9BdG9taWNgLXF1YWxp
ZmllZCBhcmd1bWVudCB0eXBlcy4gKCNHSDE3MDQzMykKLSBGaXhlZCBhIGNyYXNoIHJlbGF0ZWQg
dG8gbWlzc2luZyBzb3VyY2UgbG9jYXRpb25zICgjR0gxODY2NTUpCi0gRml4ZWQgYSBjcmFzaCB3
aGVuIGNhc3RpbmcgYSBwYXJlbnRoZXNpemVkIHVucmVzb2x2ZWQgdGVtcGxhdGUtaWQgb3IgYXJy
YXkgc2VjdGlvbi4gKCNHSDE4MzUwNSkKLSBGaXhlZCBhIGNyYXNoIHdoZW4gaW5pdGlhbGl6aW5n
IGEgYGNvbnN0ZXhwcmAgcG9pbnRlciB3aXRoIGEgZmxvYXRpbmctcG9pbnQgbGl0ZXJhbCBpbiBD
MjMuICgjR0gxODAzMTMpCi0gRml4ZWQgYSBsYWNrIG9mIGRpYWdub3N0aWMgZm9yIHN1YnN0aXR1
dGlvbiBmYWlsdXJlcyBpbiBiYXNlIGNsYXNzZXMgd2hlbiB1c2luZyBgc3RkOjp2b2lkX3RgLWxp
a2UgdHlwZXMuCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGVtaXR0aW5nIGRlYnVnIGluZm8gZm9yIGJh
c2UgY2xhc3NlcyB3aXRoIGluc3RhbnRpYXRpb24tZGVwZW5kZW50LW9ubHkgdHlwZXMgKCNHSDE5
MzkzMikKLSBGaXhlZCBhbiBhc3NlcnRpb24gd2hlbiBkaWFnbm9zaW5nIGFkZHJlc3Mtc3BhY2Ug
cXVhbGlmaWVkIGBuZXdgL2BkZWxldGVgIGluIGxhbmd1YWdlLWRlZmluZWQgYWRkcmVzcyBzcGFj
ZXMgc3VjaCBhcyBPcGVuQ0wgYF9fbG9jYWxgLiAoI0dIMTc4MzE5KQotIEZpeGVkIGFuIGFzc2Vy
dGlvbiBmYWlsdXJlIGluIE9iakMrKyBBUkMgd2hlbiBiaW5kaW5nIGEgcnZhbHVlIHJlZmVyZW5j
ZSB0byByZWZlcmVuY2Ugd2l0aCBkaWZmZXJlbnQgbGlmZXRpbWVzICgjR0gxNzg1MjQpCi0gRml4
ZWQgYSBjcmFzaCB3aGVuIHN1YnNjcmlwdGluZyBhIHZlY3RvciB0eXBlIHdpdGggbGFyZ2UgdW5z
aWduZWQgaW50ZWdlciB2YWx1ZXMuICgjR0gxODA1NjMpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGF0
dGVtcHRpbmcgdG8gZGlhZ25vc2UgaW5jb21wYXRpYmxlIGNvbnZlcnNpb25zIGludm9sdmluZyBm
dW5jdGlvbiB0eXBlcyAoI0dIMTgyNTM0KQotIEZpeGVkIGEgY3Jhc2ggd2hlbiBldmFsdWF0aW5n
IGBfX2lzX2JpdHdpc2VfY2xvbmVhYmxlYCBvbiBpbnZhbGlkIHJlY29yZCB0eXBlcy4gKCNHSDE4
MzcwNykKLSBGaXhlZCBhbiBhc3NlcnRpb24gZmFpbHVyZSB3aGVuIGNhc3RpbmcgYSBmdW5jdGlv
biBwb2ludGVyIHdpdGggYSB0YXJnZXQgd2l0aCBhIG5vbi1kZWZhdWx0IHByb2dyYW0gYWRkcmVz
cyBzcGFjZS4gKCNHSDE4NjIxMCkKLSBGaXhlZCBhIGNyYXNoIHdoZW4gYGRlY2x0eXBlKF9fYnVp
bHRpbl9GVU5DVElPTigpKWAgaXMgdXNlZCBhcyBhIHRlbXBsYXRlIHR5cGUgYXJndW1lbnQuICgj
R0gxNjc0MzMpCi0gRml4ZWQgYW4gYXNzZXJ0aW9uIGZhaWx1cmUgd2hlbiBwYXJzaW5nIGFuIGlu
dmFsaWQgYGRlY2x0eXBlYCBzcGVjaWZpZXIgd2l0aCBtaXNzaW5nIHBhcmVudGhlc2VzIG9yIGV4
dHJhIHNlbWljb2xvbnMuICgjR0gxODgwMTQpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGV4cGxpY2l0
bHkgY2FzdGluZyBhIGNvbXBsZXggdHlwZSB0byBvciBmcm9tIGFuIGF0b21pYyBjb21wbGV4IHR5
cGUuICgjR0gxNzIyMDgpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGV4cGxpY2l0bHkgY2FzdGluZyBh
IHNjYWxhciB0byBhbiBhdG9taWMgY29tcGxleC4gKCNHSDExNDg4NSkKLSBGaXhlZCBhbiBhc3Nl
cnRpb24gZmFpbHVyZSB3aGVuIHBhcnNpbmcgYW4gaW52YWxpZCBvdXQtb2YtbGluZSBlbnVtIGRl
ZmluaXRpb24gd2l0aCB0ZW1wbGF0ZSBwYXJhbWV0ZXJzLiAoI0dIMTg3OTA5KQotIEZpeGVkIGFu
IGFzc2VydGlvbiBmYWlsdXJlIG9uIGludmFsaWQgdGVtcGxhdGUgdGVtcGxhdGUgcGFyYW1ldGVy
IGR1cmluZyB0eXBvIGNvcnJlY3Rpb24uICgjR0gxODM5ODMpCi0gRml4ZWQgYW4gYXNzZXJ0aW9u
IGZhaWx1cmUgaW4gYGlzQXRFbmRPZk1hY3JvRXhwYW5zaW9uYCBvbiBtYWNybyBleHBhbnNpb25z
IGNyb3NzaW5nIHRoZSBib3VuZGFyeSBvZiB0d28gZmlsZUlEcy4gKCNHSDExNTAwNyksICgjR0gy
MTc1NSkKLSBGaXhlZCBhbiBhc3NlcnRpb24gZmFpbHVyZSB3aGVuIGBfX2J1aWx0aW5fZHVtcF9z
dHJ1Y3RgIGlzIHVzZWQgd2l0aCBhbgogIGltbWVkaWF0ZS1lc2NhbGF0ZWQgY2FsbGFibGUuICgj
R0gxOTI4NDYpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIHBhc3Npbmcgb25lIHNpemVkIGltcGxpY2l0
bHkgY2FzdGVkIHZlY3RvciB0byBhIGBhYnNgIGZ1bmN0aW9uLiAoI0dIMjA0Nzc3KQotIEZpeGVk
IGEgY3Jhc2ggd2hlbiBkaWFnbm9zaW5nIGFuIGludmFsaWQgb3V0LW9mLWxpbmUgZGVmaW5pdGlv
biBvZiBhIG1lbWJlciBjbGFzcyB0ZW1wbGF0ZS4gKCNHSDIwMTQ5MCkKLSBGaXhlZCBhIGNyYXNo
IGluIHRoZSBwYXJzZXIgd2hlbiBhIG1pc3Npbmcgc2VtaWNvbG9uIGFmdGVyIGEgdGFnIGRlZmlu
aXRpb24gaXMgZm9sbG93ZWQgYnkgYSB0ZW1wbGF0ZS1pZCBub3QgcHJlY2VkZWQgYnkgYDo6YC4g
KCNHSDIwNzk5MikKCiMjIyBPcGVuQUNDIFNwZWNpZmljIENoYW5nZXMKCiMjIyBPcGVuQ0wgU3Bl
Y2lmaWMgQ2hhbmdlcwoKLSBBZGRlZCBzdXBwb3J0IGZvciBPcGVuQ0wgQyAzLjEgbGFuZ3VhZ2Ug
dmVyc2lvbiAoYC1jbC1zdGQ9Q0wzLjFgKS4KCiMjIyBUYXJnZXQgU3BlY2lmaWMgQ2hhbmdlcwoK
IyMjIyBBTURHUFUgU3VwcG9ydAoKLSBJbnRyb2R1Y2VkIGEgbmV3IHRhcmdldCBzcGVjaWZpYyBi
dWlsdGluIGBfX2J1aWx0aW5fYW1kZ2NuX3Byb2Nlc3Nvcl9pc2AsCiAgYSBsYXRlIC8gZGVmZXJy
ZWQgcXVlcnkgZm9yIHRoZSBjdXJyZW50IHRhcmdldCBwcm9jZXNzb3IuCi0gSW50cm9kdWNlZCBh
IG5ldyB0YXJnZXQgc3BlY2lmaWMgYnVpbHRpbiBgX19idWlsdGluX2FtZGdjbl9pc19pbnZvY2Fi
bGVgLAogIGEgbGF0ZSAvIGRlZmVycmVkIHF1ZXJ5IGZvciB0aGUgYXZhaWxhYmlsaXR5IG9mIHRh
cmdldCBzcGVjaWZpYyBidWlsdGlucy4KLSBJbml0aWFsIHN1cHBvcnQgZm9yIGdmeDEzMTAKLSBU
aGUgYGFtZGdwdV9udW1fc2dwcmAgYW5kIGBhbWRncHVfbnVtX3ZncHJgIGZ1bmN0aW9uIGF0dHJp
YnV0ZXMgYXJlIG5vdwogIGRlcHJlY2F0ZWQuIFVzaW5nIHRoZW0gcHJvZHVjZXMgYSBgLVdkZXBy
ZWNhdGVkLWRlY2xhcmF0aW9uc2Agd2FybmluZy4gVXNlCiAgYGFtZGdwdV93YXZlc19wZXJfZXVg
IGluc3RlYWQuCgojIyMjIE5WUFRYIFN1cHBvcnQKCiMjIyMgWDg2IFN1cHBvcnQKCi0gYG1hcmNo
PXpudmVyNmAgaXMgbm93IHN1cHBvcnRlZC4KLSBTdXBwb3J0IElTQSBvZiBgQVZYNTEyQk1NYC4K
ICAtIFN1cHBvcnQgaW50cmluc2ljIG9mIGBfbW01MTJfYm1hY29yMTZ4MTZ4MTZgLgogIC0gU3Vw
cG9ydCBpbnRyaW5zaWMgb2YgYF9tbTUxMl9ibWFjeG9yMTZ4MTZ4MTZgLgogIC0gU3VwcG9ydCBp
bnRyaW5zaWMgb2YgYF9tbTUxMl9tYXNrX2JpdHJldl9lcGk4YC4KICAtIFN1cHBvcnQgaW50cmlu
c2ljIG9mIGBfbW01MTJfbWFza3pfYml0cmV2X2VwaThgLgogIC0gU3VwcG9ydCBpbnRyaW5zaWMg
b2YgYF9tbTUxMl9iaXRyZXZfZXBpOGAuCiAgLSBTdXBwb3J0IGludHJpbnNpYyBvZiBgX21tMjU2
X2JtYWNvcjE2eDE2eDE2YC4KICAtIFN1cHBvcnQgaW50cmluc2ljIG9mIGBfbW0yNTZfYm1hY3hv
cjE2eDE2eDE2YC4KICAtIFN1cHBvcnQgaW50cmluc2ljIG9mIGBfbW1fbWFza19iaXRyZXZfZXBp
OGAuCiAgLSBTdXBwb3J0IGludHJpbnNpYyBvZiBgX21tMjU2X21hc2tfYml0cmV2X2VwaThgLgog
IC0gU3VwcG9ydCBpbnRyaW5zaWMgb2YgYF9tbV9tYXNrel9iaXRyZXZfZXBpOGAuCiAgLSBTdXBw
b3J0IGludHJpbnNpYyBvZiBgX21tMjU2X21hc2t6X2JpdHJldl9lcGk4YC4KICAtIFN1cHBvcnQg
aW50cmluc2ljIG9mIGBfbW1fYml0cmV2X2VwaThgLgogIC0gU3VwcG9ydCBpbnRyaW5zaWMgb2Yg
YF9tbTI1Nl9iaXRyZXZfZXBpOGAuCi0gUmVtb3ZlZCBzdXBwb3J0IGZvciBgQU1YLVRGMzJgIChg
LW1hbXgtdGYzMmApIGFuZCBgVE1NVUxURjMyUFNgIGluc3RydWN0aW9uLgoKIyMjIyBBcm0gYW5k
IEFBcmNoNjQgU3VwcG9ydAoKLSBPbiBBcHBsZSBBQXJjaDY0IHRhcmdldHMsIGBfX0dDQ19ERVNU
UlVDVElWRV9TSVpFYCBpcyBub3cgYDEyOGAgKGRvd24gZnJvbSBgMjU2YCkKICB0byBtYXRjaCB0
aGUgMTI4LWJ5dGUgY2FjaGUgbGluZSB1c2VkIGJ5IEFwcGxlIGNvcmVzLCBhdm9pZGluZyBuZWVk
bGVzcwogIG92ZXItYWxpZ25tZW50LiBUaGlzIHZhbHVlIGlzIGltcGxlbWVudGF0aW9uLWRlZmlu
ZWQgYW5kIHNob3VsZCBub3QgYmUgcmVsaWVkIHVwb24KICBpbiBhbiBBQkktc2Vuc2l0aXZlIHdh
eS4KCi0gU3VwcG9ydCBoYXMgYmVlbiBhZGRlZCBmb3IgdGhlIGZvbGxvd2luZyBwcm9jZXNzb3Jz
ICgtbWNwdSBpZGVudGlmaWVycyBpbiBwYXJlbnRoZXNpcyk6CgogIC0gQXJtIEFHSSBDUFUgKGFy
bWFnaWNwdSkuCiAgLSBIaXNpbGljb24gaGlwMTIgY29yZSAoaGlwMTIpLgogIC0gTlZJRElBIFJp
Z2VsIGNvcmUgKHJpZ2VsKS4KCi0gT24gQUFyY2g2NCBXaW5kb3dzIHRhcmdldHMsIGAtbWJyYW5j
aC1wcm90ZWN0aW9uPXN0YW5kYXJkYCBhbmQgYC1tYnJhbmNoLXByb3RlY3Rpb249cGFjLXJldGAK
ICBub3cgdXNlcyB0aGUgQi1rZXkgYnkgZGVmYXVsdC4KCiMjIyMgQW5kcm9pZCBTdXBwb3J0Cgoj
IyMjIFdpbmRvd3MgU3VwcG9ydAoKLSBDbGFuZyBub3cgZGVmaW5lcyB0aGUgYF9NU1ZDX1RSQURJ
VElPTkFMYCBtYWNybyBhcyBgMWAgd2hlbiBlbXVsYXRpbmcgTVNWQwogIDE5LjE1IChWaXN1YWwg
U3R1ZGlvIDIwMTcgdmVyc2lvbiAxNS44KSBhbmQgbGF0ZXIuICgjR0g0NzExNCkKCi0gYC1mbWFj
cm8tcHJlZml4LW1hcD1gIChgLWZmaWxlLXByZWZpeC1tYXA9YCkgbm93IGFmZmVjdHMgYW4gYW5v
bnltb3VzIG5hbWVzcGFjZSBoYXNoIGdlbmVyYXRpb24KICBmb3IgdGhlIE1TVkMgdGFyZ2V0cyBh
bmQgYWxsb3dzIGRldGVybWluaXN0aWMgc3ltYm9sIG1hbmdsaW5nIGZvciByZXByb2R1Y2libGUg
YnVpbGRzLgoKLSBBZGRlZCB0aGUgYC1md2lueDY0LWVoLXVud2luZD1gIGZsYWcgdG8gc2VsZWN0
IHRoZSB4NjQgV2luZG93cyB1bndpbmQgaW5mbwogIHZlcnNpb24gKGB2MWAsIGB2Mi1iZXN0LWVm
Zm9ydGAsIGB2Mi1yZXF1aXJlZGAsIG9yIGB2M2ApLiBUaGUgbGVnYWN5CiAgYC1md2lueDY0LWVo
LXVud2luZHYyPWAgZmxhZyBpcyBkZXByZWNhdGVkOyBpdCBpcyBzdGlsbCBhY2NlcHRlZCBhbmQg
bWFwcGVkCiAgb250byB0aGUgbmV3IGZsYWcgYXMgZm9sbG93czoKCiAgfCBMZWdhY3kgYC1md2lu
eDY0LWVoLXVud2luZHYyPWAgfCBOZXcgYC1md2lueDY0LWVoLXVud2luZD1gIHwKICB8IC0tLSB8
IC0tLSB8CiAgfCBgZGlzYWJsZWRgIHwgYHYxYCAoZGVmYXVsdDsgbm8gZmxhZyBmb3J3YXJkZWQp
IHwKICB8IGBiZXN0LWVmZm9ydGAgfCBgdjItYmVzdC1lZmZvcnRgIHwKICB8IGByZXF1aXJlZGAg
fCBgdjItcmVxdWlyZWRgIHwKCiAgVGhlIE1TVkMtY29tcGF0aWJsZSBgL2QyZXBpbG9ndW53aW5k
YCBhbmQgYC9kMmVwaWxvZ3Vud2luZHJlcXVpcmV2MmAKICBvcHRpb25zIG1hcCB0byBgdjItYmVz
dC1lZmZvcnRgIGFuZCBgdjItcmVxdWlyZWRgIHJlc3BlY3RpdmVseS4KCi0gV2hlbiB0YXJnZXRp
bmcgV2luZG93cyB4NjQgd2l0aCBFR1BSIChgLW1hcHgtZmVhdHVyZXM9ZWdwcmApLCBDbGFuZyBu
b3cKICBhdXRvbWF0aWNhbGx5IGVuYWJsZXMgVjMgdW53aW5kIGluZm8gKGAtZndpbng2NC1laC11
bndpbmQ9djNgKSBpZiBubwogIGV4cGxpY2l0IHVud2luZCB2ZXJzaW9uIHdhcyBzcGVjaWZpZWQu
CgotIEluIE1TVkMgY29tcGF0aWJpbGl0eSBtb2RlLCBzY2FsYXIgYW5kIHZlY3RvciBkZWxldGlu
ZyBkZXN0cnVjdG9ycyBub3cgY2FsbAogIGBgX19nbG9iYWxfZGVsZXRlYGAgKG9yIGBgX19nbG9i
YWxfYXJyYXlfZGVsZXRlYGAgZm9yIHRoZSBhcnJheSBgYGRlbGV0ZVtdYGAKICBwYXRoKSBpbnN0
ZWFkIG9mIGRpcmVjdGx5IHJlZmVyZW5jaW5nIGBgOjpvcGVyYXRvciBkZWxldGVgYC4KICBUaGlz
IG1hdGNoZXMgTVNWQydzIGJlaGF2aW9yIGFuZCBmaXhlcyBgYExOSzIwMDFgYCBsaW5rZXIgZXJy
b3JzIGluCiAgZW52aXJvbm1lbnRzIHdoZXJlIG5vIGdsb2JhbCBgYDo6b3BlcmF0b3IgZGVsZXRl
YGAgZXhpc3RzLiBXaGVuIHRoZQogIHRyYW5zbGF0aW9uIHVuaXQgY29udGFpbnMgYSBgYDo6ZGVs
ZXRlYGAgZXhwcmVzc2lvbiwgYSBgYF9fZ2xvYmFsX2RlbGV0ZWBgCiAgZm9yd2FyZGluZyBib2R5
IHRoYXQgY2FsbHMgYGA6Om9wZXJhdG9yIGRlbGV0ZWBgIGlzIGVtaXR0ZWQgYXV0b21hdGljYWxs
eS4KICBPdGhlcndpc2UsIGlmIG5vIGJvZHkgaXMgZW1pdHRlZCwgYW4gYC9BTFRFUk5BVEVOQU1F
YCBsaW5rZXIgZGlyZWN0aXZlIHdpbGwKICBjYXVzZSB0aGUgbGlua2VyIHRvIHVzZSB0aGUgZ2Vu
ZXJhdGVkIGBfX2VtcHR5X2dsb2JhbF9kZWxldGVgIHRyYXAgZnVuY3Rpb24KICBpbnN0ZWFkLgoK
LSBDbGFuZyBub3cgc3VwcG9ydHMgYC1zdGQ6YysrMjZwcmV2aWV3YCBmb3IgY29tcGF0aWJpbGl0
eSB3aXRoIE1TVkMuIFRoaXMgZW5hYmxlcyBDKysyNiBmZWF0dXJlcy4KCiMjIyMgTG9vbmdBcmNo
IFN1cHBvcnQKCi0gRFdBUkYgZmlzc2lvbiBpcyBub3cgY29tcGF0aWJsZSB3aXRoIGxpbmtlciBy
ZWxheGF0aW9ucywgYWxsb3dpbmcgYC1nc3BsaXQtZHdhcmZgIGFuZCBgLW1yZWxheGAKICB0byBi
ZSB1c2VkIHRvZ2V0aGVyIHdoZW4gYnVpbGRpbmcgZm9yIHRoZSBMb29uZ0FyY2ggcGxhdGZvcm0u
CgojIyMjIFJJU0MtViBTdXBwb3J0CgotIFRlbnN0b3JyZW50IEFzY2Fsb24gRDggd2FzIHJlbmFt
ZWQgdG8gQXNjYWxvbiBYLiBVc2UgYHR0LWFzY2Fsb24teGAgd2l0aCBgLW1jcHVgIG9yIGAtbXR1
bmVgLgotIEludHJpbnNpY3Mgd2VyZSBhZGRlZCBmb3IgdGhlIGBadmFiZGAgKFJJU0MtViBJbnRl
Z2VyIFZlY3RvciBBYnNvbHV0ZSBEaWZmZXJlbmNlKSBleHRlbnNpb24uCi0gSW50cmluc2ljcyB3
ZXJlIGFkZGVkIGZvciB0aGUgYFp2emlwYCAoUmVvcmRlcmluZyBTdHJ1Y3R1cmVkIERhdGEgaW4g
VmVjdG9yIFJlZ2lzdGVycykgZXh0ZW5zaW9uLgotIEEgbmV3IGAtbXR1bmVgIHN5bnRheCB3YXMg
YWRkZWQgdG8gc3VwcG9ydCBwcm9jZXNzb3Itc3BlY2lmaWMgdHVuaW5nIGZlYXR1cmUgc3RyaW5n
CiAgQ3VycmVudGx5IHRoaXMgbmV3IHN5bnRheCBpcyBnYXRlZCBieSB0aGUgYC1tZXhwZXJpbWVu
dGFsLW10dW5lLXN5bnRheGAgZmxhZy4KCiMjIyMgQ1VEQS9ISVAgTGFuZ3VhZ2UgQ2hhbmdlcwoK
LSBUaGUgbmV3IG9mZmxvYWRpbmcgZHJpdmVyIGlzIG5vdyB0aGUgZGVmYXVsdCBmb3IgSElQLiBV
c2UKICBgLS1uby1vZmxmb2FkLW5ldy1kcml2ZXJgIHRvIHJldHVybiB0byB0aGUgb2xkIGJlaGF2
aW9yLgoKIyMjIyBDVURBIFN1cHBvcnQKCi0gRml4ZWQgYSBidWcgd2hlcmUgaG9zdC1kZXZpY2Ug
YW1iaWd1aXRpZXMgaW4gQ1VEQS9ISVAgd2hlbiByZXRyaWV2aW5nIHRoZQogIGFkZHJlc3Mgb2Yg
c3BlY2lhbGl6YXRpb25zIG9mIHRlbXBsYXRlZCBmdW5jdGlvbnMgdGhhdCBoYXZlIG92ZXJsb2Fk
cyBmb3IgYm90aAogIGhvc3QgYW5kIGRldmljZS4gKCNHSDE5OTI5OSkKCiMjIyMgUG93ZXJQQyBT
dXBwb3J0CgotIEFkZGVkIHN1cHBvcnQgZm9yIEFNTyBsb2FkIGFuZCBzdG9yZSBidWlsdGlucy4K
LSBBZGRlZCBETUYgY3J5cHRvIGJ1aWx0aW5zIGZvciBleHRlbmRlZCBtbmVtb25pY3MuCi0gQWRk
ZWQgSVNBIEZ1dHVyZSAoYC1tY3B1PWZ1dHVyZWApIGJ1aWx0aW5zIGZvciBBRVMgZW5jcnlwdC9k
ZWNyeXB0L2tleS1nZW5lcmF0aW9uLAogIFBvc3QtUXVhbnR1bSBDcnlwdG9ncmFwaHkgQWNjZWxl
cmF0aW9uIChgdmVjX211bGhgKSwgRGVlcGx5IENvbXByZXNzZWQgV2VpZ2h0cwogIChgdmVjX3Vu
Y29tcHJlc3MqYC9gdmVjX3VucGFja18qYCksIGFuZCBFbGxpcHRpYyBDdXJ2ZSBDcnlwdG9ncmFw
aHkuCi0gVXBkYXRlZCBETVIgYnVpbHRpbiBuYW1lcyB0byByZW1vdmUgdGhlIGBfbW1hYCBpbmZp
eC4KLSBBZGRlZCBlYXJseSB0YXJnZXQgZmVhdHVyZSB2YWxpZGF0aW9uIGZvciBQb3dlclBDIGJ1
aWx0aW5zIGR1cmluZyBzZW1hbnRpYyBhbmFseXNpcy4KLSBBZGRlZCBzdXBwb3J0IGZvciB0aGUg
Zm9sbG93aW5nIFBvd2VyUEMgQkNEIChCaW5hcnktQ29kZWQgRGVjaW1hbCkgYnVpbHRpbnMKICBm
b3IgUE9XRVI5IHRhcmdldHMgKHJlcXVpcmVzIGluY2x1ZGluZyBgYmNkLmhgKToKICBgX19idWls
dGluX2JjZHNoaWZ0YCwgYF9fYnVpbHRpbl9iY2RzaGlmdHJvdW5kYCwgYF9fYnVpbHRpbl9iY2R0
cnVuY2F0ZWAsCiAgYF9fYnVpbHRpbl9iY2R1bnNpZ25lZHRydW5jYXRlYCwgYW5kIGBfX2J1aWx0
aW5fYmNkdW5zaWduZWRzaGlmdGAuCgojIyMjIEFJWCBTdXBwb3J0CgotIEltcGxlbWVudGVkIHRo
ZSBgaWZ1bmNgIGF0dHJpYnV0ZSB3aXRoIEZ1bmN0aW9uIE11bHRpLVZlcnNpb25pbmcgKEZNVikg
LwogIGB0YXJnZXRfY2xvbmVzYCAoY3B1LW9ubHkpIHN1cHBvcnQuCi0gQWRkZWQgZGlhZ25vc2lz
IG9mIGludmFsaWQgZmVhdHVyZSBzdHJpbmdzIG9uIHRoZSBgdGFyZ2V0YCBhdHRyaWJ1dGUuCi0g
VGhlIGRyaXZlciBkZWZhdWx0IGZvciB0aGUgbGlua2VyIGZsYWcgYC1iY2R0b3JzYCBub3cgZGVm
YXVsdHMgdG8gYG1icmAKICAoaW5zdGVhZCBvZiBgYWxsYCkgd2hpY2ggb25seSBleHRyYWN0cyBz
dGF0aWMgaW5pdCBmcm9tIGFyY2hpdmUgbWVtYmVycyB3aGljaAogIHdvdWxkIG90aGVyd2lzZSBi
ZSByZWZlcmVuY2VkLgogIChTZWUgPGh0dHBzOi8vd3d3LmlibS5jb20vZG9jcy9lbi9haXgvNy4y
LjA/dG9waWM9bC1sZC1jb21tYW5kPiBmb3IgZGV0YWlscykuCi0gVGhlIGRyaXZlciBub3cgdXNl
cyBgLWxjb21waWxlcl9ydGAgaW5zdGVhZCBvZiBgLWxhdG9taWNgLCBhbmQgdGhlIGNvbXBpbGVy
LXJ0CiAgYXJjaGl2ZSBoYXMgYmVlbiByZW5hbWVkIGZyb20gYGxpYmF0b21pYy5hYCB0byBgbGli
Y29tcGlsZXJfcnQuYWAgdG8gYXZvaWQgY29uZmxpY3RzCiAgYmV0d2VlbiB0aGUgTExWTSBsaWJh
dG9taWMgYW5kIHRoZSBHTlUgbGliYXRvbWljIGZyb20gdGhlIEFJWCB0b29sYm94IGFzIHRoZXkg
c2hhcmUKICB0aGUgc2FtZSBsaWJyYXJ5IG5hbWUuCi0gQWRkZWQgc3VwcG9ydCBmb3IgYCNwcmFn
bWEgY29tbWVudChjb3B5cmlnaHQsICJ0b2tlbl9zZXF1ZW5jZSIpYCBvbiBBSVguCiAgVGhpcyBk
aXJlY3RpdmUgZW1iZWRzIGEgY29weXJpZ2h0IG9yIGlkZW50aWZ5aW5nIHN0cmluZyBpbnRvIHRo
ZSBjb21waWxlZCBvYmplY3QgZmlsZS4KICBUaGUgc3RyaW5nIGlzIGluY2x1ZGVkIGluIHRoZSBm
aW5hbCBleGVjdXRhYmxlIGFuZCBsb2FkZWQgaW50byBtZW1vcnkgYXQgcHJvZ3JhbSBydW50aW1l
LgotIFRoZSBkcml2ZXIgcmVsYXhlcyB0aGUgcmVzdHJpY3Rpb25zIG9uIHRoZSBgT0JKRUNUX01P
REVgIGVudmlyb25tZW50CiAgdmFyaWFibGUgYW5kIG5vdyBzaWxlbnRseSBhY2NlcHRzIGAzMl82
NGAgYW5kIGBhbnlgLgotIEZpeGVkIGEgYnVnIHdoZXJlIHRoZSBgT0JKRUNUX01PREVgIGVudmly
b25tZW50IHZhcmlhYmxlIGNvdWxkIG92ZXJyaWRlIGFuCiAgZXhwbGljaXRseSBzcGVjaWZpZWQg
YC0tdGFyZ2V0YCB0cmlwbGUuIGAtLXRhcmdldGAgbm93IHRha2VzIHByZWNlZGVuY2Ugb3Zlcgog
IGBPQkpFQ1RfTU9ERWAsIGVuc3VyaW5nIGxpdCB0ZXN0cyBhbmQgb3RoZXIgY2FsbGVycyB0aGF0
IHNwZWNpZnkgYW4gZXhwbGljaXQKICAzMi1iaXQgb3IgNjQtYml0IHRyaXBsZSBnZXQgdGhlIGNv
cnJlY3QgYml0IG1vZGUgcmVnYXJkbGVzcyBvZiBlbnZpcm9ubWVudC4KLSBUaGUgZHJpdmVyJ3Mg
YC1wcmludC1zZWFyY2gtZGlyc2Agb3V0cHV0IG5vdyBpbmNsdWRlcyB0aGUgQUlYIHN5c3RlbSBs
aWJyYXJ5CiAgcGF0aHMgKGAvdXNyL2xpYmAgYW5kIGAvbGliYCksIG1hdGNoaW5nIEdDQyBiZWhh
dmlvciBhbmQgZml4aW5nIGJ1aWxkLXRvb2wKICBmYWlsdXJlcyAoTWVzb24sIENNYWtlKSB0aGF0
IHJlbHkgb24gdGhpcyBvdXRwdXQgdG8gY29uc3RydWN0IGBibGlicGF0aGAuCiAgVGhlIGBBZGRG
aWxlUGF0aExpYkFyZ3MoKWAgb3ZlcnJpZGUgYWxzbyBwcmV2ZW50cyBkdXBsaWNhdGUgYC1MYCBm
bGFncyBpbgogIGxpbmtlciBjb21tYW5kcy4KLSBUaGUgYCttb2Rlcm4tYWl4LWFzYCB0YXJnZXQg
ZmVhdHVyZSBpcyBub3cgYXV0b21hdGljYWxseSBlbmFibGVkIHdoZW4KICB0YXJnZXRpbmcgQUlY
IHdpdGggdGhlIGludGVncmF0ZWQgYXNzZW1ibGVyICh0aGUgZGVmYXVsdCwgb3IKICBgLWZpbnRl
Z3JhdGVkLWFzYCkuIFRoaXMgbWFrZXMgaW5zdHJ1Y3Rpb24gYWxpYXNlcyBnYXRlZCBvbiBgTW9k
ZXJuQXNgCiAgKGUuZy4gYG1mc3ByZ2ApIGF2YWlsYWJsZSB3aXRob3V0IHJlcXVpcmluZyBtYW51
YWwKICBgLVhjbGFuZyAtdGFyZ2V0LWZlYXR1cmUgLVhjbGFuZyArbW9kZXJuLWFpeC1hc2AuIFRo
ZSBmZWF0dXJlIGlzIG5vdAogIGVuYWJsZWQgd2hlbiBgLWZuby1pbnRlZ3JhdGVkLWFzYCBpcyBz
cGVjaWZpZWQuCi0gVGhlIGNvbXBpbGVyLXJ0IGJ1aWxkIG5vdyBkZXRlY3RzIHRoZSBSUEMgWERS
IGhlYWRlciAoYHRpcnBjL3JwYy94ZHIuaGAKICBvbiBBSVgsIGBycGMveGRyLmhgIGVsc2V3aGVy
ZSkuIEEgbmV3IGBDT01QSUxFUl9SVF9SRVFVSVJFX1JQQ19YRFJfSGAKICBDTWFrZSBvcHRpb24g
KGRlZmF1bHQgYE9OYCBvbiBBSVgsIGBPRkZgIGVsc2V3aGVyZSkgdHVybnMgYSBtaXNzaW5nCiAg
aGVhZGVyIGludG8gYSBmYXRhbCBjb25maWd1cmF0aW9uIGVycm9yIHdpdGggYW4gYWN0aW9uYWJs
ZSBtZXNzYWdlLgoKIyMjIyBOZXRCU0QgU3VwcG9ydAoKIyMjIyBXZWJBc3NlbWJseSBTdXBwb3J0
CgotIEZpeGVkIGEgY3Jhc2ggd2hlbiBgX19mdW5jcmVmYCBpcyBhcHBsaWVkIHRvIGEgbm9uLWZ1
bmN0aW9uIHBvaW50ZXIgdHlwZS4KICAoI0dIMTE4MjMzKQotIFdlYkFzc2VtYmx5IHJlZmVyZW5j
ZSB0eXBlcyAoYF9fZXh0ZXJucmVmX3RgIGFuZCBgX19mdW5jcmVmYCBmdW5jdGlvbgogIHBvaW50
ZXJzKSBub3cgbG93ZXIgdG8gdGhlIG9wYXF1ZSBJUiB0eXBlcyBgdGFyZ2V0KCJ3YXNtLmV4dGVy
bnJlZiIpYCBhbmQKICBgdGFyZ2V0KCJ3YXNtLmZ1bmNyZWYiKWAgaW5zdGVhZCBvZiBgcHRyIGFk
ZHJzcGFjZSgxMClgIC8KICBgcHRyIGFkZHJzcGFjZSgyMClgLgotIEZpeGVkIGEgY29tcGlsZXIg
Y3Jhc2ggYXQgYC1PMmAgd2hlbiByZWZlcmVuY2UtdHlwZSB2YWx1ZXMgd2VyZSBwYXNzZWQKICB0
aHJvdWdoIGNvbnRyb2wgZmxvdyB0aGF0IHRoZSBTTFAgdmVjdG9yaXplciB0cmllZCB0byB2ZWN0
b3JpemUuCgojIyMjIEFWUiBTdXBwb3J0CgojIyMjIEhleGFnb24gU3VwcG9ydAoKLSBgSDJgIGFu
ZCBgUVVSVGAgYXJlIG5vdyByZWNvZ25pemVkIGFzIG9wZXJhdGluZyBzeXN0ZW1zIGluIHRoZSBI
ZXhhZ29uCiAgdGFyZ2V0IHRyaXBsZS4gVGhlIGRyaXZlciBjYW4gYnVpbGQgYWdhaW5zdCBQaWNv
bGliYyBmb3IgSDIsIGFuZCBhCiAgYC0tY3N0ZGxpYmAgZmxhZyBzZWxlY3RzIFBpY29saWJjLgot
IFJUU2FuLCBUeVNhbiwgYW5kIHRoZSBDRkkgaW5kaXJlY3QtY2FsbCBzYW5pdGl6ZXIgbm93IHN1
cHBvcnQgSGV4YWdvbi4KICBgLWZzYW5pdGl6ZT10eXBlYCBpcyBlbmFibGVkIGZvciBIZXhhZ29u
IExpbnV4LgotIGAtZmZpeGVkLXJYWGAgY2FuIG5vdyByZXNlcnZlIGNhbGxlci1zYXZlZCByZWdp
c3RlcnMgcjE2LXIyOC4KLSBTaGFkb3dDYWxsU3RhY2sgKGAtZnNhbml0aXplPXNoYWRvdy1jYWxs
LXN0YWNrYCkgaXMgc3VwcG9ydGVkLgotIFRoZSBkcml2ZXIgcGFzc2VzIExUTyBvcHRpb25zIHRo
cm91Z2ggdG8gdGhlIEhleGFnb24gbGlua2VyIGludm9jYXRpb24uCi0gYF9HTlVfU09VUkNFYCBp
cyBwcmVkZWZpbmVkIGZvciBIZXhhZ29uIEMrKyBjb21waWxhdGlvbnMuCi0gYF9fSFZYX0lFRUVf
RlBfX2AgaXMgZGVmaW5lZCB3aGVuIGAtbWh2eC1pZWVlLWZwYCBpcyBlbmFibGVkLgoKIyMjIyBT
eXN0ZW1aIFN1cHBvcnQKCi0gQWRkIHN1cHBvcnQgZm9yIGAjcHJhZ21hIGV4cG9ydGAgZm9yIHov
T1MuIFRoaXMgaXMgYSBwcmFnbWEgdXNlZCB0byBleHBvcnQgZnVuY3Rpb25zIGFuZCB2YXJpYWJs
ZXMKICB3aXRoIGV4dGVybmFsIGxpbmthZ2UgZnJvbSBzaGFyZWQgbGlicmFyaWVzLiBJdCBwcm92
aWRlcyBjb21wYXRpYmlsaXR5IHdpdGggdGhlIElCTSBYTCBDL0MrKwogIGNvbXBpbGVyLgotIEFk
ZCBzdXBwb3J0IGZvciB2YXJpYWJsZSBhcmd1bWVudCBsaXN0cyBvbiB6L09TLgotIEFkZCBjb21w
YXJlLWFuZC1zd2FwIGJ1aWx0aW4gZnVuY3Rpb25zLCBhcyBwcm92aWRlZCBieSB0aGUgSUJNIEMv
QysrIGNvbXBpbGVyIGZvciB6L09TLgotIEFkZCBuZXcgd3JhcHBlciBoZWFkZXJzIGZvciB6L09T
IHRvIGltcHJvdmUgY29tcGF0aWJpbGl0eSB3aXRoIHRoZSBzeXN0ZW0gaGVhZGVycy4KLSBSYWlz
ZWQgbWluaW1hbCBzdXBwb3J0ZWQgdGFyZ2V0IE9TIGxldmVsIHRvIHovT1MgMy4xLgoKIyMjIERX
QVJGIFN1cHBvcnQgaW4gQ2xhbmcKCiMjIyBGbG9hdGluZyBQb2ludCBTdXBwb3J0IGluIENsYW5n
CgojIyMgRml4ZWQgUG9pbnQgU3VwcG9ydCBpbiBDbGFuZwoKIyMjIEFTVCBNYXRjaGVycwoKLSBG
aXhlZCBgbnVsbFBvaW50ZXJDb25zdGFudGAgbWF0Y2hlciBmYWxzZWx5IG1hdGNoaW5nIGludGVn
ZXIgbGl0ZXJhbCBgMGAKICBpbiBub24tbnVsbC1wb2ludGVyIGNvbnRleHRzIHN1Y2ggYXMgYXJy
YXkgc3Vic2NyaXB0cyBhbmQgcG9pbnRlciBhcml0aG1ldGljLgotIEFkZCBgZnVuY3Rpb25UeXBl
TG9jYCBtYXRjaGVyIGZvciBtYXRjaGluZyBgRnVuY3Rpb25UeXBlTG9jYC4KLSBBZGQgbWlzc2lu
ZyBzdXBwb3J0IGZvciBgVHJhdmVyc2FsS2luZGAgaW4gc29tZSBgYWRkTWF0Y2hlcigpYCBvdmVy
bG9hZHMuCgojIyMgY2xhbmctZm9ybWF0CgotIEFkZCBgT2JqQ1NwYWNlQWZ0ZXJNZXRob2REZWNs
YXJhdGlvblByZWZpeGAgb3B0aW9uIHRvIGNvbnRyb2wgc3BhY2UgYmV0d2VlbiB0aGUKICAnLScv
JysnIGFuZCB0aGUgcmV0dXJuIHR5cGUgaW4gT2JqZWN0aXZlLUMgbWV0aG9kIGRlY2xhcmF0aW9u
cwotIERlcHJlY2F0ZSB0aGUgYEJpblBhY2tQYXJhbWV0ZXJzYCBhbmQgYEJpblBhY2tBcmd1bWVu
dHNgIG9wdGlvbnMgYW5kIHJlcGxhY2UKICB0aGVtIHdpdGggdGhlIGBQYWNrUGFyYW1ldGVyc2Ag
YW5kIGBQYWNrQXJndW1lbnRzYCBzdHJ1Y3RzIChyZXNwZWN0aXZlbHkpIHRvCiAgdW5pZnkgcGFj
a2luZyBiZWhhdmlvci4gQWRkIHRoZSBgQnJlYWtBZnRlcmAgb3B0aW9uIHRvIHRoZSBzdHJ1Y3Rz
LCBhbGxvd2luZwogIHBhcmFtZXRlciBhbmQgYXJndW1lbnQgbGlzdHMgdG8gYmUgZm9ybWF0dGVk
IHdpdGggb25lIHBhcmFtZXRlci9hcmd1bWVudCBvbiBlYWNoCiAgbGluZSBpZiB0aGV5IGV4Y2Vl
ZCB0aGUgc3BlY2lmaWVkIGNvdW50LgotIEFkZCBgQWZ0ZXJDb21tYWAgdmFsdWUgdG8gYEJyZWFr
Q29uc3RydWN0b3JJbml0aWFsaXplcnNgIHRvIGFsbG93IGJyZWFraW5nCiAgY29uc3RydWN0b3Ig
aW5pdGlhbGl6ZXJzIGFmdGVyIGNvbW1hcywga2VlcGluZyB0aGUgY29sb24gb24gdGhlIHNhbWUg
bGluZS4KLSBFeHRlbmQgYEJyZWFrQmluYXJ5T3BlcmF0aW9uc2AgdG8gYWNjZXB0IGEgc3RydWN0
dXJlZCBjb25maWd1cmF0aW9uIHdpdGgKICBwZXItb3BlcmF0b3IgYnJlYWsgcnVsZXMgYW5kIG1p
bmltdW0gY2hhaW4gbGVuZ3RoIGdhdGluZyB2aWEgYFBlck9wZXJhdG9yYC4KLSBBZGQgYEFsbG93
U2hvcnRSZWNvcmRPbkFTaW5nbGVMaW5lYCBvcHRpb24gYW5kIHNldCBpdCB0byBgRW1wdHlBbmRB
dHRhY2hlZGAgZm9yIExMVk0gc3R5bGUuCi0gQWRkIGBCcmVha0Z1bmN0aW9uRGVjbGFyYXRpb25Q
YXJhbWV0ZXJzYCBvcHRpb24gdG8gYWx3YXlzIGJyZWFrIGJlZm9yZSBmdW5jdGlvbgogIGRlY2xh
cmF0aW9uIHBhcmFtZXRlcnMuCi0gQWRkIGBFbnVtQXNzaWdubWVudHNgIG9wdGlvbiB0byBgQWxp
Z25Db25zZWN1dGl2ZUFzc2lnbm1lbnRzYCBmb3IgYWxpZ25pbmcKICBlbnVtIGFzc2lnbm1lbnRz
IHdpdGhvdXQgYWZmZWN0aW5nIG90aGVyIGFzc2lnbm1lbnRzLgotIEFkZCBgQnJlYWtCZWZvcmVS
ZXR1cm5UeXBlYCBvcHRpb24gdG8gYnJlYWsgYmVmb3JlIHRoZSBmdW5jdGlvbiByZXR1cm4KICB0
eXBlLgoKIyMjIGxpYmNsYW5nCgotIFZpc2l0IGNvbnN0cmFpbnRzIG9mIGBhdXRvYCB0eXBlIHRv
IHByb3Blcmx5IHZpc2l0IGNvbmNlcHQgdXNhZ2VzICgjR0gxNjY1ODApCi0gVmlzaXQgc3dpdGNo
IGluaXRpYWxpemVyIHN0YXRlbWVudHMgKDxodHRwczovL2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9NDE1NTM3I2MyPikKLSBGaXggY3Jhc2ggaW4gY2xhbmdfZ2V0QmluYXJ5T3BlcmF0b3JL
aW5kU3BlbGxpbmcgYW5kIGNsYW5nX2dldFVuYXJ5T3BlcmF0b3JLaW5kU3BlbGxpbmcKLSBUaGUg
Y2xhbmdfTW9kdWxlX2dldEFTVEZpbGUgQVBJIGlzIGRlcHJlY2F0ZWQgYW5kIG5vdyBhbHdheXMg
cmV0dXJucyBudWxscHRyCi0gVGhlIGNsYW5nX0N1cnNvcl9nZXRDb21tZW50UmFuZ2UgQVBJIHdp
bGwgbm93IHJldHVybiBhIGNvbW1lbnQgcmFuZ2UgZm9yIG1hY3JvIGRlZmluaXRpb25zIHRoYXQg
aGF2ZSBkb2N1bWVudGF0aW9uIGNvbW1lbnRzLgotIEFkZGVkIENYVHlwZV9QcmVkZWZpbmVkU3Vn
YXIgZm9yIGBfX3B0cmRpZmZfdGAsIGBfX3NpemVfdGAsIGFuZAogIGBfX3NpZ25lZF9zaXplX3Rg
IHR5cGVzLCB3aGljaCBhcmUgbm8gbG9uZ2VyIGV4cG9zZWQgYXMKICBDWFR5cGVfVW5leHBvc2Vk
LgoKIyMjIENvZGUgQ29tcGxldGlvbgoKLSBGaXhlZCBhIGNyYXNoIGluIGNvZGUgY29tcGxldGlv
biB3aGVuIHVzaW5nIGEgQy1TdHlsZSBjYXN0IHdpdGggYSBwYXJlbnRoZXNpemVkCiAgb3BlcmFu
ZCBpbiBPYmplY3RpdmUtQysrIG1vZGUuICgjR0gxODAxMjUpCi0gRml4ZWQgYSBjcmFzaCB3aGVu
IGNvZGUgY29tcGxldGlvbiBpcyB0cmlnZ2VyZWQgaW5zaWRlIGFuIGlsbC1mb3JtZWQgbGFtYmRh
J3MgdHJhaWxpbmcgcmVxdWlyZXMtY2xhdXNlLiAoI0dIMjAxNjMyKQoKIyMjIFN0YXRpYyBBbmFs
eXplcgoKJSBjb21tZW50OgolIFRoaXMgaXMgZm9yIHRoZSBTdGF0aWMgQW5hbHl6ZXIuCiUgU3Vi
c2VjdGlvbnMgKHVzaW5nIGAjIyMjYCksIGluIHRoaXMgb3JkZXIsIG9ubHkgd2hlbiB0aGV5IGhh
dmUgY29udGVudDoKJSAgIC0gTmV3IGNoZWNrZXJzIGFuZCBmZWF0dXJlcwolICAgLSBDcmFzaCBh
bmQgYnVnIGZpeGVzCiUgICAtIEltcHJvdmVtZW50cwolICAgLSBNb3ZlZCBjaGVja2VycwolICAg
LSBSZW1vdmVkIGNoZWNrZXJzCiUgICAtIERpYWdub3N0aWMgY2hhbmdlcwoKIyMjIyBOZXcgY2hl
Y2tlcnMgYW5kIGZlYXR1cmVzCgotIEludHJvZHVjZWQgdGhlIGV4cGVyaW1lbnRhbCBgYWxwaGEu
Y3BsdXNwbHVzLlVzZUFmdGVyTGlmZXRpbWVFbmRgIGNoZWNrZXIgdG8gZGV0ZWN0IGRhbmdsaW5n
IHBvaW50ZXJzIGFuZCByZWZlcmVuY2VzIGJvdW5kIHRvIGxvY2FsIHZhcmlhYmxlcyB0aGF0IGdv
IG91dCBvZiBzY29wZSwgdXNpbmcgdGhlIGBbW2NsYW5nOjpsaWZldGltZWJvdW5kXV1gIGFubm90
YXRpb24uICgjR0gyMDU1MjEpCi0gSW50cm9kdWNlZCB0aGUgYG9wdGluLmNvcmUuVW5jb25kaXRp
b25hbFZBQXJnYCBjaGVja2VyIHRvIHJlcG9ydCB2YXJpYWRpYyBmdW5jdGlvbnMgdGhhdCB1bmNv
bmRpdGlvbmFsbHkgdXNlIGB2YV9hcmcoKWAsIHdoaWNoIGlzIHVuZGVmaW5lZCBiZWhhdmlvciB3
aGVuIHRoZSBmdW5jdGlvbiBpcyBjYWxsZWQgd2l0aG91dCBhbnkgdmFyaWFkaWMgYXJndW1lbnRz
IChTRUktQ0VSVCBFWFA0Ny1DKS4gKCNHSDE3NTYwMikKLSBUaGUgYHVuaXguRHluYW1pY01lbW9y
eU1vZGVsaW5nYCBtb2RlbGluZyBnYWluZWQgYSBuZXcgb3B0aW9uIHRvIGNyZWF0ZSBicmFuY2hl
cyB3aGVyZSBhIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWxzIGFuZCByZXR1cm5zIGEgbnVsbCBwb2lu
dGVyLiBJdCBpcyBkaXNhYmxlZCBieSBkZWZhdWx0LiAoI0dIMjA1MzcxKQotIFRoZSBgc2VjdXJp
dHkuaW5zZWN1cmVBUEkuRGVwcmVjYXRlZE9yVW5zYWZlQnVmZmVySGFuZGxpbmdgIGNoZWNrZXIg
Z2FpbmVkIGEgbmV3IGBSZXBvcnRJbkM5OUFuZEVhcmxpZXJgIG9wdGlvbi4gV2hlbiBlbmFibGVk
LCBkZXByZWNhdGVkIGJ1ZmZlci1oYW5kbGluZyBmdW5jdGlvbnMgKGBtZW1jcHlgLCBgbWVtc2V0
YCwgYG1lbW1vdmVgLCBldGMuKSBhcmUgYWxzbyByZXBvcnRlZCB3aGVuIG5vdCBjb21waWxpbmcg
Zm9yIEMxMSBvciBsYXRlci4gSXQgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdC4gKCNHSDE2ODcwNCwg
I0dIMTc3Mzc5KQotIFRoZSBgb3B0aW4udGFpbnQuVGFpbnRQcm9wYWdhdGlvbmAgY2hlY2tlciBn
YWluZWQgYSBuZXcgYEVuYWJsZURlZmF1bHRDb25maWdgIG9wdGlvbiwgd2hpY2ggbWFrZXMgaXQg
cG9zc2libGUgdG8gZGlzYWJsZSB0aGUgYnVpbHQtaW4gdGFpbnQgY29uZmlndXJhdGlvbiBhbmQg
dXNlIGEgZnVsbHkgY3VzdG9tIGNvbmZpZ3VyYXRpb24gaW5zdGVhZC4gKCNHSDE3NjE4NSkKCiMj
IyMgQ3Jhc2ggYW5kIGJ1ZyBmaXhlcwoKLSBGaXhlZCB0aGUgYHNlY3VyaXR5LlZBTGlzdGAgY2hl
Y2tlciBwcm9kdWNpbmcgZmFsc2UgcG9zaXRpdmVzIHdoZW4gYW5hbHl6aW5nIEMyMyBjb2RlIHdo
ZXJlIGB2YV9zdGFydGAgZXhwYW5kcyB0byBgX19idWlsdGluX2MyM192YV9zdGFydGAuICgjR0gx
OTIwMjQpCi0gRml4ZWQgYSBjcmFzaCB3aGVuIGNvcHlpbmcgdW5pbml0aWFsaXplZCBkYXRhIGlu
IGEgZnVuY3Rpb24gbmFtZWQgYHN3YXBgLiAoI0dIMTc4Nzk3KQotIEZpeGVkIGEgY29tcGlsZXIg
Y3Jhc2ggd2hlbiBjb21iaW5pbmcgYF9BdG9taWNgIGFuZCBgX19hdXRvX3R5cGVgIGluIEMsIGZv
ciBleGFtcGxlIGBfQXRvbWljIF9fYXV0b190eXBlIHggPSBleHByYC4gKCNHSDExODA1OCkKLSBG
aXhlZCBhIGNyYXNoIGluIHRoZSBgdW5peC5NYWxsb2NgIGNoZWNrZXIgd2hlbiBhIGZ1bmN0aW9u
IGlzIGFubm90YXRlZCB3aXRoIGJvdGggYG93bmVyc2hpcF9yZXR1cm5zYCBhbmQgYG93bmVyc2hp
cF90YWtlc2AgKG9yIGBvd25lcnNoaXBfaG9sZHNgKS4gKCNHSDE4MzM0NCkKLSBGaXhlZCBhIGNy
YXNoIGluIHRoZSBgYWxwaGEudW5peC5jc3RyaW5nYCBjaGVja2VycyBvbiB6ZXJvLXNpemUgZWxl
bWVudCB0eXBlcyAoZm9yIGV4YW1wbGUgYW4gZW1wdHkgc3RydWN0IGluIEMpLiAoI0dIMTkwNDU3
KQotIEZpeGVkIGEgdXNlLWFmdGVyLWZyZWUgaW4gYENoZWNrZXJDb250ZXh0OjpnZXRNYWNyb05h
bWVPclNwZWxsaW5nYC4gKCNHSDE5NDE3NCkKLSBGaXhlZCBhIGZhbHNlIHBvc2l0aXZlIGluIHRo
ZSBgYWxwaGEudW5peC5jc3RyaW5nYCBjaGVja2VycyB3aGVuIHRoZSBidWZmZXIgYXJndW1lbnQg
cG9pbnRzIGludG8gdGhlIG1pZGRsZSBvZiBhbiBhcnJheSwgc3VjaCBhcyBgbWVtY3B5KGRzdCwg
JmFycltpXSwgc2l6ZSlgLiAoI0dIMTk4MzQ2KQotIEZpeGVkIHRoZSBkZWZhdWx0IGJpbmRpbmcg
b2YgdW5pb24gYWdncmVnYXRlcyBiZWluZyBvdmVyd3JpdHRlbiB3aGVuIGluaXRpYWxpemluZyBh
cnJheSBlbGVtZW50cyB3aXRoIHVuaW9uIG1lbWJlcnMuICgjR0gxNzg2OTQpCi0gVGhlIGFuYWx5
emVyIG5vIGxvbmdlciBydWxlcyBvdXQgdGhlIGVxdWFsaXR5IG9mIGEgcG9pbnRlciB0byB0aGUg
c3RhY2sgYW5kIGEgc3ltYm9saWMgcG9pbnRlciBpbiB1bmtub3duIHNwYWNlLCBiZWNhdXNlIGEg
ZnVuY3Rpb24gbWF5IHJldHVybiBhIHBvaW50ZXIgdG8gc29tZSBvdGhlciBzdGFjayBmcmFtZSAo
Zm9yIGV4YW1wbGUgb25lIHJlY2VpdmVkIGFzIGFuIGFyZ3VtZW50KS4gKCNHSDE4NzA4MCkKLSBG
aXhlZCB0aGUgYGdldGN3ZGAgc3VtbWFyeSBpbiB0aGUgYHVuaXguU3RkQ0xpYnJhcnlGdW5jdGlv
bnNgIGNoZWNrZXIuICgjR0gxNzUxMzYpCi0gRml4ZWQgaW52YWxpZCBIVE1MIG5lc3RpbmcgZm9y
IHBvcHVwcyBhdCBlbmQgb2YgbGluZS4gKCNHSDQ2MDg5KQotIEZpeGVkIGEgZmFsc2UtcG9zaXRp
dmUgaW4gdGhlIGB1bml4LkJsb2NrSW5Dcml0aWNhbFNlY3Rpb25gIGNoZWNrZXIgdGhhdCByZXBv
cnRlZCBkb3VibGUgbG9ja2luZyB3aGVuIHVzaW5nIGBzdGQ6OmxvY2tfZ3VhcmRgL2BzdGQ6OnVu
aXF1ZV9sb2NrYC9gc3RkOjpzY29wZWRfbG9ja2AuICgjR0gyMDg3MjkpCi0gRml4ZWQgYSBmYWxz
ZS1uZWdhdGl2ZSBpbiB0aGUgYHVuaXguTWFsbG9jYCBjaGVja2VyIGR1ZSB0byBhIHR5cG8gaW4g
dGhlIGV4cGVjdGVkIGFyZ3VtZW50cyBvZiBgaWZfbmFtZWluZGV4YC4gSXQgd2lsbCBub3cgcHJv
cGVybHkgbWF0Y2ggaXRzIHNpbmdsZSBleHBlY3RlZCBhcmd1bWVudC4gKCNHSDIwNzcyNikKLSBG
aXhlZCBhIGNyYXNoIGluIHRoZSBaMy1zb2x2ZXItYmFzZWQgKHVuc3VwcG9ydGVkKSBjb25zdHJh
aW50IG1hbmFnZXIgaW52b2x2aW5nIHVuYXJ5L2JpbmFyeSBvcGVyYXRvcnMuICgjR0gyMDUwMzcp
Ci0gRml4ZWQgYSBjcmFzaCB3aGVyZSBHTlUgc3RhdGVtZW50IGV4cHJlc3Npb24gc3ludGF4IChg
KHsgLi4uIH0pYCkgY2F1c2VkIGFyZ3VtZW50cyB0byBkaXNhcHBlYXIgZnJvbSBwYXJhbWV0ZXIg
bGlzdC4gKCNHSDIwNTcxOCkKCiMjIyMgSW1wcm92ZW1lbnRzCgotIFNpZ25pZmljYW50bHkgc3Bl
ZCB1cCBjb3JlIGRhdGEgc3RydWN0dXJlcyBsaWtlIEltbXV0YWJsZVNldC9NYXAsIGxlYWRpbmcg
dG8gdXAgdG8gNS4yeCBmYXN0ZXIgYW5hbHlzaXMgaW4gZWRnZSBjYXNlcy4gKCNHSDIwNTU1Miwg
I0dIMjA3NTk2LCAjR0gyMDg5MDcpCi0gVGhlIHVubWFpbnRhaW5lZCBhbmQgY3Jhc2gtcHJvbmUg
WjMgY29uc3RyYWludC1tYW5hZ2VyIGJhY2tlbmQgc2VsZWN0ZWQgdmlhIGAtYW5hbHl6ZXItY29u
c3RyYWludHM9ejNgIHdhcyByZW5hbWVkIHRvIGAtYW5hbHl6ZXItY29uc3RyYWludHM9dW5zdXBw
b3J0ZWQtejNgIHRvIG1ha2UgaXRzIHVuc3VwcG9ydGVkIHN0YXR1cyBleHBsaWNpdC4gKCNHSDIw
NTM3MCkKLSBUaGUgY29uc2VydmF0aXZlIGNhbGwtaW52YWxpZGF0aW9uIGxvZ2ljIG5vdyBpbnZh
bGlkYXRlcyB0aGUgb2JqZWN0IG9mIGFuIG9wYXF1ZSBjb25zdHJ1Y3RvciBjYWxsIHJlZ2FyZGxl
c3Mgb2Ygd2hldGhlciBhbiBhcmd1bWVudCByZWZlcnMgdG8gaXQuICgjR0gxNzA4ODcpCi0gSW1w
cm92ZWQgdGhlIHJlc29sdXRpb24gb2YgY29uc3RhbnQgdmFsdWVzIGZyb20gaW5pdGlhbGl6ZXJz
IGluIFJlZ2lvblN0b3JlLCBpbmNsdWRpbmcgcHJlc2VydmluZyBkZWZhdWx0IGJpbmRpbmdzIGZv
ciBhZ2dyZWdhdGUtbGlrZSBjYXNlcywgZ2VuZXJhbGl6ZWQgZmllbGQtaW5pdGlhbGl6ZXIgcmVz
b2x1dGlvbiBmb3IgYXJiaXRyYXJ5IG5lc3RpbmcsIGFuZCBub3JtYWxpemVkIHN1Yi1hcnJheSBp
bmRpY2VzLiAoI0dIMTk5MjcxKQotIFRoZSBhbmFseXplciBub3cgY29uc2VydmF0aXZlbHkgZXZh
bHVhdGVzIGBzdGQ6OnNvcnRgLCBgc3RkOjpzdGFibGVfc29ydGAsIGFuZCBgc3RkOjppbnBsYWNl
X21lcmdlYCB0byBwcmV2ZW50IGZhbHNlIHBvc2l0aXZlcyBjYXVzZWQgYnkgY29tcGxleCBTVEwg
aW50ZXJuYWxzIHRoYXQgY2Fubm90IGJlIG1vZGVsZWQgYWRlcXVhdGVseSBieSB0aGUgZW5naW5l
LiAoI0dIMTc4OTEwKQotIFRoZSBgb3B0aW4uY3BsdXNwbHVzLlZpcnR1YWxDYWxsYCBjaGVja2Vy
IG5vIGxvbmdlciByZXBvcnRzIHZpcnR1YWwgbWV0aG9kIGNhbGxzIGR1cmluZyBjb25zdHJ1Y3Rp
b24vZGVzdHJ1Y3Rpb24gd2hlbiB0aGUgY2FsbCBzaXRlIGlzIGluIGEgc3lzdGVtIGhlYWRlci4g
KCNHSDE4NDE3OCkKLSBSZWR1Y2VkIGZhbHNlIHBvc2l0aXZlcyBvZiB0aGUgYHVuaXguTWFsbG9j
U2l6ZW9mYCBjaGVja2VyIGZvciBsYXlvdXQtY29tcGF0aWJsZSB0eXBlcywgc3VjaCBhcyBgbWFs
bG9jKHNpemVvZihzdGQ6OmF0b21pYzxpbnQzMl90PikpYCBhc3NpZ25lZCB0byBhbiBgaW50MzJf
dCAqYC4gKCNHSDIwMDI1MykKLSBUaGUgYG9wdGluLmNvcmUuRml4ZWRBZGRyZXNzRGVyZWZlcmVu
Y2VgIGNoZWNrZXIgbm8gbG9uZ2VyIHJlcG9ydHMgZGVyZWZlcmVuY2VzIG9mIGEgZml4ZWQgYWRk
cmVzcyB3aGVuIHRoZSBwb2ludGVlIGlzIGB2b2xhdGlsZWAuICgjR0gxODE2NDQpCi0gSW1wcm92
ZWQgYFtbY2xhbmc6OnN1cHByZXNzXV1gIGhhbmRsaW5nIGZvciB0cmlja3kgdGVtcGxhdGUgc3Bl
Y2lhbGl6YXRpb25zLCBuZXN0ZWQgdGVtcGxhdGVzLCBhbmQgZnJpZW5kIGZ1bmN0aW9uIHRlbXBs
YXRlcyB0aGF0IGFyZSBmb3J3YXJkLWRlY2xhcmVkIGF0IG5hbWVzcGFjZSBzY29wZS4gKCNHSDE4
MjY1OSwgI0dIMTc4NDQxLCAjR0gxODM3MjcsICNHSDE4NzA0MykKLSBUaGUgYHVuaXguQmxvY2tJ
bkNyaXRpY2FsU2VjdGlvbmAgY2hlY2tlciBub3cgdW5kZXJzdGFuZHMgYHN0ZDo6c2NvcGVkX2xv
Y2tgIGluIGFkZGl0aW9uIHRvIGBzdGQ6OmxvY2tfZ3VhcmRgIGFuZCBgc3RkOjp1bmlxdWVfbG9j
a2AuICgjR0gxNzYxMzQpCi0gVGhlIGBhbHBoYS51bml4LmNzdHJpbmdgIHN1Yi1jaGVja2VycyB3
ZXJlIHVudGFuZ2xlZCBzbyB0aGF0IGVhY2ggb25lIG1vZGVscyBhbmQgcmVwb3J0cyBpbmRlcGVu
ZGVudGx5IGluc3RlYWQgb2YgcmVseWluZyBvbiBhbm90aGVyIHN1Yi1jaGVja2VyIGJlaW5nIGVu
YWJsZWQuICgjR0gxODY4MDIpCi0gVGhlIGFuYWx5emVyIG5vdyBkZXRlY3RzIHJlYWRzIG9mIHVu
aW5pdGlhbGl6ZWQgZHluYW1pY2FsbHktYWxsb2NhdGVkIG9iamVjdHMuICgjR0gxOTMwMDEpCi0g
VGhlIGBjcGx1c3BsdXMuTW92ZWAgY2hlY2tlciBjYW4gbm93IGRldGVjdCBhIHVzZS1hZnRlci1t
b3ZlIGZvciB0aGUgdGhyZWUtYXJndW1lbnQgYHN0ZDo6bW92ZWAgb24gY29udGFpbmVycyAod2hl
biBgYWxwaGEuY3BsdXNwbHVzLkl0ZXJhdG9yTW9kZWxpbmdgIGlzIGFsc28gZW5hYmxlZCkuICgj
R0gxMzcxNTcpCi0gVGhlIGNvbmRpdGlvbiBvZiBhIGBzd2l0Y2hgIHN0YXRlbWVudCBub3cgdHJp
Z2dlcnMgdGhlIGBjaGVjazo6QnJhbmNoQ29uZGl0aW9uYCBjYWxsYmFjaywgc28gY2hlY2tlcnMg
bGlrZSBgY29yZS51bmluaXRpYWxpemVkLkJyYW5jaGAgY2FuIHJlcG9ydCBhbiB1bmRlZmluZWQg
YHN3aXRjaGAgY29uZGl0aW9uLiAoI0dIMTgyMDU4KQotIEltcHJvdmVkIGhhbmRsaW5nIG9mIG11
bHRpcGxlIGBbW2Fzc3VtZV1dYCBhdHRyaWJ1dGVzIG9uIGEgc2luZ2xlIHN0YXRlbWVudC4gKCNH
SDE5ODYxOCkKLSBXaGVuIHRoZSBleGVjdXRpb24gZW52aXJvbm1lbnQgaXMgdW50cnVzdGVkLCB0
aGUgYGFyZ3ZgLCBgYXJnY2AsIGFuZCBgZW52cGAgcGFyYW1ldGVycyBvZiBgbWFpbmAgYXJlIG5v
dyB0cmVhdGVkIGFzIHRhaW50IHNvdXJjZXMuICgjR0gxNzgwNTQpCi0gVGhlIGBhbHBoYS51bml4
LlB0aHJlYWRMb2NrYCBjaGVja2VyIG5vdyBlbWl0cyBwYXRoIG5vdGVzIG9uIGxvY2ssIHVubG9j
aywgZGVzdHJveSwgYW5kIGluaXQgb3BlcmF0aW9ucy4gKCNHSDIwMjQ3MykKLSBBZGRlZCBhIG5l
dyBgY2hlY2s6OkxpZmV0aW1lRW5kYCBjYWxsYmFjayB0aGF0IGZpcmVzIGZvciBlYWNoIGBDRkdM
aWZldGltZUVuZHNgIGVsZW1lbnQsIHdoaWNoIGlzIHVzZWZ1bCBmb3IgZGV0ZWN0aW5nIGRhbmds
aW5nIHBvaW50ZXJzLiAoI0dIMjAxMTIzKQotIFRoZSBgdW5peC5TdGRDTGlicmFyeUZ1bmN0aW9u
c2Agc3RhbmRhcmQtbGlicmFyeSBzdW1tYXJpZXMgd2VyZSBvcHRpbWl6ZWQgZm9yIGJpbmFyeSBz
aXplLiAoI0dIMjAyNjYyKQotIEZpeGVkIHRoZSBhbGlnbm1lbnQgb2YgZW50cmllcyBwcmludGVk
IGJ5IGBjbGFuZyAtY2MxIC1hbmFseXplci1wcmludC1hbmFseXplci1vcHRpb25zYCAvIGAtYW5h
bHl6ZXItaGVscGAuICgjR0gxOTA1NzApCi0gSW1wcm92ZWQgdGhlIG1vZGVsaW5nIG9mIHN5bWJv
bGljIHJhbmdlcyBpbiB0aGUgZW5naW5lIHdoZW4gY2FsY3VsYXRpbmcgdGhlIGxhcmdlc3QgYW5k
IHNtYWxsZXN0IHBvc3NpYmxlIHZhbHVlcyBmb3IgcmFuZ2Ugc2V0cyBpbnZvbHZpbmcgdGhlIGAr
YCwgYC1gLCBhbmQgYCpgIGJpbmFyeSBvcGVyYXRvcnMuICgjR0gxNzMxMTMpCgojIyMjIE1vdmVk
IGNoZWNrZXJzCgotIFRoZSBjaGVja2VyIGB1bml4LmNzdHJpbmcuVW5pbml0aWFsaXplZFJlYWRg
IGlzIG5vdyBvdXQgb2YgYWxwaGEuICgjR0gxOTYyOTIpCgojIyMjIFJlbW92ZWQgY2hlY2tlcnMK
Ci0gVGhlIGBhbHBoYS5jb3JlLkZpeGVkQWRkcmAgY2hlY2tlciB3YXMgcmVtb3ZlZC4gSXQgd2Fz
IG92ZXJseSBzaW1wbGlzdGljIGFuZCBpcyBsYXJnZWx5IHN1cGVyc2VkZWQgYnkgdGhlIGBvcHRp
bi5jb3JlLkZpeGVkQWRkcmVzc0RlcmVmZXJlbmNlYCBjaGVja2VyLiAoI0dIMTgyMDMzKQoKIyMj
IyBEaWFnbm9zdGljIGNoYW5nZXMKCi0gQ3Jvc3MgVHJhbnNsYXRpb24gVW5pdCAoQ1RVKSBpbXBv
cnQgZmFpbHVyZXMgYXJlIG5vdyByZXBvcnRlZCBhdCB0aGUgbG9jYXRpb24gd2hlcmUgdGhlIGlt
cG9ydGVkIHN5bWJvbCB3b3VsZCBiZSB1c2VkLCBtYWtpbmcgaXQgZWFzaWVyIHRvIHVuZGVyc3Rh
bmQgd2h5IGEgY3Jvc3MtVFUgYnVnIHdhcyBtaXNzZWQuICgjR0gxODg3OTUpCi0gVW5pbml0aWFs
aXplZC12YWx1ZSBkaWFnbm9zdGljcyBubyBsb25nZXIgZW1pdCBhIG1pc2xlYWRpbmcgImluaXRp
YWxpemVkIGhlcmUiIG5vdGUgZm9yIGEgdmFyaWFibGUgdGhhdCB3YXMgZGVjbGFyZWQgd2l0aG91
dCBhbiBpbml0aWFsaXplcjsgdGhlIG5vdGUgbm93IHJlYWRzICJkZWNsYXJlZCB3aXRob3V0IGFu
IGluaXRpYWwgdmFsdWUiLiAoI0dIMTk4MzQ1KQoKKHJlbGVhc2Utbm90ZXMtc2FuaXRpemVycyk9
CgojIyMgU2FuaXRpemVycwoKLSBVbmRlZmluZWRCZWhhdmlvclNhbml0aXplciBub3cgc3VwcG9y
dHMgYF9fdWJzYW5fZGVmYXVsdF9zdXBwcmVzc2lvbnNgLgotIFVuZGVmaW5lZEJlaGF2aW9yU2Fu
aXRpemVyIG5vdyBwZXJmb3JtcyBudWxsLCBhbGlnbm1lbnQsIGFuZCBhcnJheS1ib3VuZHMKICBj
aGVja3MgZm9yIGFnZ3JlZ2F0ZSAoYXMgb3Bwb3NlZCB0byBzY2FsYXIpIGNvcHkgb3BlcmF0aW9u
cyBpbiBDOyBmb3IgQysrLAogIHRoaXMgYXBwbGllcyB0byB0cml2aWFsIGNvcHkvbW92ZSBvcGVy
YXRpb25zIGFuZCBzb21lIGNhc2VzIHJlbWFpbgogIHVuY2hlY2tlZC4gKCNHSDE5MDczOSwgI0dI
MjAzNzM3KQotIFNhbml0aXplciBTcGVjaWFsIENhc2UgTGlzdHMgKGAtZnNhbml0aXplLWlnbm9y
ZWxpc3RgKSBub3cgc3VwcG9ydAogIFZlcnNpb24gNCBvZiB0aGUgU3BlY2lhbCBDYXNlIExpc3Qg
Zm9ybWF0LCB3aGljaCBpbnRyb2R1Y2VzIGEgdHJhbnNpdGlvbgogIHBlcmlvZCBmb3IgbGVhZGlu
ZyBkb3Qtc2xhc2ggKGAuL2ApIGNhbm9uaWNhbGl6YXRpb24gaW4gcGF0aCBtYXRjaGluZy4KICBW
ZXJzaW9uIDQgbWF0Y2hlcyBib3RoIGNhbm9uaWNhbGl6ZWQgYW5kIG5vbi1jYW5vbmljYWxpemVk
IHBhdGhzIGJ1dCBlbWl0cyBhCiAgd2FybmluZyBmb3IgZGVwcmVjYXRlZCBtYXRjaGVzLiBWZXJz
aW9uIDUgZHJvcHMgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBhbmQKICByZXF1aXJlcyBydWxlcyB0
byBtYXRjaCBjYW5vbmljYWxpemVkIHBhdGhzICh3aXRob3V0IGxlYWRpbmcgYC4vYCkuCi0gU2Fu
aXRpemVyIFNwZWNpYWwgQ2FzZSBMaXN0cyAoYC1mc2FuaXRpemUtaWdub3JlbGlzdGApIGFuZCB3
YXJuaW5nCiAgc3VwcHJlc3Npb24gbWFwcGluZ3MgKGAtLXdhcm5pbmctc3VwcHJlc3Npb24tbWFw
cGluZ3NgKSBub3cgcmVjb2duaXplIHZlcnNpb24KICA0IG9mIHRoZSBTcGVjaWFsIENhc2UgTGlz
dCBmb3JtYXQgKGluZGljYXRlZCBieSBgIyFzcGVjaWFsLWNhc2UtbGlzdC12NGApLgogIE9uIFdp
bmRvd3MgaG9zdHMsIHBhdGggbWF0Y2hpbmcgaXMgc2xhc2gtYWdub3N0aWMgKGJvdGggZm9yd2Fy
ZCBzbGFzaGVzIChgL2ApCiAgYW5kIGJhY2tzbGFzaGVzIChgXGApIG1hdGNoIGVpdGhlciBwYXRo
IHNlcGFyYXRvciBpbiBib3RoIHBhdHRlcm5zIGFuZCBwYXRocykuCgojIyMgUHl0aG9uIEJpbmRp
bmcgQ2hhbmdlcwoKLSBBZGQgZGVwcmVjYXRpb24gd2FybmluZ3MgdG8gYENvbXBsZXRpb25DaHVu
ay5pc0tpbmQuLi5gIG1ldGhvZHMuCiAgVGhlc2Ugd2lsbCBiZSByZW1vdmVkIGluIGEgZnV0dXJl
IHJlbGVhc2UuIEV4aXN0aW5nIHVzZXMgc2hvdWxkIGJlIGFkYXB0ZWQKICB0byBkaXJlY3RseSBj
b21wYXJlIGVxdWFsaXR5IG9mIHRoZSBgQ29tcGxldGlvbkNodW5rYCBraW5kIHdpdGgKICB0aGUg
Y29ycmVzcG9uZGluZyBgQ29tcGxldGlvbkNodW5rS2luZGAgdmFyaWFudC4KCiAgQWZmZWN0ZWQg
bWV0aG9kczogYGlzS2luZE9wdGlvbmFsYCwgYGlzS2luZFR5cGVkVGV4dGAsIGBpc0tpbmRQbGFj
ZUhvbGRlcmAsCiAgYGlzS2luZEluZm9ybWF0aXZlYCBhbmQgYGlzS2luZFJlc3VsdFR5cGVgLgoK
LSBBZGQgYSBkZXByZWNhdGlvbiB3YXJuaW5nIHRvIGBDb2RlQ29tcGxldGlvblJlc3VsdHMucmVz
dWx0c2AuCiAgVGhpcyBwcm9wZXJ0eSB3aWxsIGJlY29tZSBhbiBpbXBsZW1lbnRhdGlvbiBkZXRh
aWwgd2l0aCBjaGFuZ2VkIGJlaGF2aW9yIGluIGEKICBmdXR1cmUgcmVsZWFzZSBhbmQgc2hvdWxk
IG5vdCBiZSB1c2VkIGRpcmVjdGx5Li4gRXhpc3RpbmcgdXNlcyBvZgogIGBDb2RlQ29tcGxldGlv
blJlc3VsdHMucmVzdWx0c2Agc2hvdWxkIGJlIGNoYW5nZWQgdG8gZGlyZWN0bHkgdXNlCiAgYENv
ZGVDb21wbGV0aW9uUmVzdWx0c2A6IGl0IG5vd3Mgc3VwcG9ydHMgYF9fbGVuX19gIGFuZCBgX19n
ZXRpdGVtX19gLAogIHNvIGl0IGNhbiBiZSB1c2VkIHRoZSBzYW1lIGFzIGBDb2RlQ29tcGxldGlv
blJlc3VsdHMucmVzdWx0c2AuCgotIEFkZGVkIGEgbmV3IGhlbHBlciBtZXRob2QgYGdldF9jbGFu
Z192ZXJzaW9uYCB0byB0aGUgY2xhc3MgYENvbmZpZ2AgdG8KICByZWFkIHRoZSB2ZXJzaW9uIHN0
cmluZyBvZiB0aGUgbGliY2xhbmcgaW4gdXNlLgoKIyMjIE9wZW5NUCBTdXBwb3J0CgotIEFkZGVk
IHN1cHBvcnQgZm9yIGB0cmFuc3BhcmVudGAgY2xhdXNlIGluIHRhc2sgYW5kIHRhc2tsb29wIGRp
cmVjdGl2ZXMuCi0gQWRkZWQgc3VwcG9ydCBmb3IgYHVzZV9kZXZpY2VfcHRyYCBjbGF1c2UgdG8g
YWNjZXB0IGFuIG9wdGlvbmFsCiAgYGZhbGxiYWNrYCBtb2RpZmllciAoYGZiX251bGxpZnlgIG9y
IGBmYl9wcmVzZXJ2ZWApIHdpdGggT3Blbk1QID49IDYxLgotIEFkZGVkIHN1cHBvcnQgZm9yIGBs
b2NhbGAgY2xhdXNlIHdpdGggZGVjbGFyZV90YXJnZXQgZGlyZWN0aXZlIHdoZW4KICBPcGVuTVAg
Pj0gNjAuCi0gRml4ZWQgdGhlIGlkZW50aXR5IGVsZW1lbnQgdXNlZCBmb3IgYHJlZHVjdGlvbigq
IDogeClgIG92ZXIgQysrIGNsYXNzIHR5cGVzCiAgKGUuZy4gYHN0ZDo6Y29tcGxleGApLiBUaGUg
cHJpdmF0ZSBjb3B5IGlzIG5vdyBpbml0aWFsaXplZCB0byB0aGUKICBtdWx0aXBsaWNhdGl2ZSBp
ZGVudGl0eSBpbnN0ZWFkIG9mIGJlaW5nIHZhbHVlLWluaXRpYWxpemVkLCB3aGljaCBwcmV2aW91
c2x5CiAgcHJvZHVjZWQgYSB3cm9uZyByZXN1bHQgKHRoZSBwcm9kdWN0IGNvbGxhcHNlZCB0byB0
aGUgYWRkaXRpdmUgaWRlbnRpdHkpLgoKIyMjIFNZQ0wgU3VwcG9ydAoKLSBTWUNMIGNvbXBpbGF0
aW9ucyBub3cgZGVmYXVsdCB0byBgLXN0ZD1jKysxN2Agd2hlbiBubyBleHBsaWNpdCBsYW5ndWFn
ZQogIHN0YW5kYXJkIGlzIHNwZWNpZmllZC4gU3RhbmRhcmRzIGJlbG93IEMrKzE3IGFyZSByZWpl
Y3RlZCB3aXRoIGEgZGlhZ25vc3RpYy4KLSBDbGFuZyBub3cgYXNzdW1lcyBkZWZhdWx0IHRhcmdl
dCBmb3IgU1lDTCBkZXZpY2UgY29tcGlsYXRpb24gaXMgNjQtYml0IFNQSVItVgogIGFuZCBpdCBu
b3cgZGlhZ25vc2VzIGlmIGEgbm9uLXN1cHBvcnRpbmcgdGFyZ2V0IGlzIHNwZWNpZmllZCB2aWEg
Y29tbWFuZCBsaW5lLgogICgjR0gxNjczNTgpCi0gVGhlIFNZQ0wgcnVudGltZSBzaGFyZWQgbGli
cmFyeSBoYXMgYmVlbiByZW5hbWVkIGZyb20gYGxpYnN5Y2wuc29gIHRvCiAgYGxpYkxMVk1TWUNM
LnNvYCB0byBhbGlnbiB3aXRoIExMVk0gbmFtaW5nIGNvbnZlbnRpb25zLgotIFNZQ0wgaGVhZGVy
IGluY2x1ZGUgcGF0aHMgYXJlIG5vdyBhZGRlZCBhdXRvbWF0aWNhbGx5IGZvciBib3RoIGhvc3Qg
YW5kCiAgZGV2aWNlIGNvbXBpbGF0aW9ucy4KLSBTWUNMIHJ1bnRpbWUgbGlicmFyeSBsaW5raW5n
IGlzIG5vdyBzdXBwb3J0ZWQgb24gV2luZG93cy4gV2hlbiBgLWZzeWNsYCBpcwogIHNwZWNpZmll
ZCwgQ2xhbmcgYXV0b21hdGljYWxseSBhZGRzIGAvTURgIGlmIG5vIGV4cGxpY2l0IENSVCBmbGFn
IGlzCiAgcHJlc2VudCwgbGlua3MgdGhlIGFwcHJvcHJpYXRlIGRlYnVnIChgTExWTVNZQ0xkLmxp
YmApIG9yIHJlbGVhc2UKICAoYExMVk1TWUNMLmxpYmApIGxpYnJhcnksIGFuZCByZWplY3RzIHN0
YXRpYyBDUlQgZmxhZ3MgKGAvTVRgLAogIGAvTVRkYCkgd2l0aCBhIGRpYWdub3N0aWMuIFVzZSBg
LW5vbGlic3ljbGAgdG8gc3VwcHJlc3MgYXV0b21hdGljCiAgbGlicmFyeSBsaW5raW5nLgotIEZp
eGVkIGAtbm9saWJzeWNsYCBiZWluZyBzaWxlbnRseSBpZ25vcmVkIG9uIExpbnV4OiB0aGUgU1lD
TCBydW50aW1lCiAgbGlicmFyeSB3YXMgdW5jb25kaXRpb25hbGx5IGFkZGVkIHRvIHRoZSBsaW5r
IGxpbmUgZXZlbiB3aGVuIHRoZSBmbGFnIHdhcwogIHBhc3NlZC4KLSBBZGRlZCB0aGUgYC1mc3lj
bC1kZXZpY2UtaW1hZ2Utc3BsaXQ9YCBvcHRpb24gdG8gc2VsZWN0IHRoZSBncmFudWxhcml0eSBh
dAogIHdoaWNoIFNZQ0wgZGV2aWNlIGNvZGUgaXMgZ3JvdXBlZCBpbnRvIGRldmljZSBpbWFnZXMu
IFN1cHBvcnRlZCB2YWx1ZXMgYXJlCiAgYGtlcm5lbGAgKG9uZSBkZXZpY2UgaW1hZ2UgcGVyIGtl
cm5lbCksIGB0cmFuc2xhdGlvbl91bml0YCAob25lIGRldmljZSBpbWFnZQogIHBlciB0cmFuc2xh
dGlvbiB1bml0KSwgYW5kIGBsaW5rX3VuaXRgIChvbmUgZGV2aWNlIGltYWdlIHBlciBsaW5raW5n
IHVuaXQpLgogIFRoZSBiYXJlIGAtZnN5Y2wtZGV2aWNlLWltYWdlLXNwbGl0YCBmbGFnIGlzIGFu
IGFsaWFzIGZvcgogIGAtZnN5Y2wtZGV2aWNlLWltYWdlLXNwbGl0PXRyYW5zbGF0aW9uX3VuaXRg
LCB3aGljaCBpcyBhbHNvIHRoZSBkZWZhdWx0LgotIENsYW5nIG5vdyBpcyBjYXBhYmxlIG9mIGRp
YWdub3NpbmcgcmVmZXJlbmNlIGtlcm5lbCBwYXJhbWV0ZXJzIHdoaWNoIGFyZSBub3QKICBhbGxv
d2VkIGJ5IFNZQ0wgMjAyMCBzcGVjLgoKIyMjIyBJbXByb3ZlbWVudHMKCi0gSW1wcm92ZWQgc3Vi
c3RpdHV0aW9uIHBlcmZvcm1hbmNlIGluIGNvbmNlcHQgY2hlY2tpbmcuICgjR0gxNzIyNjYpCi0g
Q2xhbmcgbm93IHByZXNlcnZlcyB0aGUgbGVmdC1oYW5kIHNpZGUgb2YgYSBiaW5hcnkgZXhwcmVz
c2lvbiAoc3VjaCBhcyBhbgogIGFzc2lnbm1lbnQgb3IgY29tcGFyaXNvbikgaW4gYSBgUmVjb3Zl
cnlFeHByYCB3aGVuIHRoZSByaWdodC1oYW5kIHNpZGUgZmFpbHMKICB0byBwYXJzZS4gVGhpcyBp
bXByb3ZlcyBJREUgZmVhdHVyZXMgbGlrZSBnby10by1kZWZpbml0aW9uIGluIGBjbGFuZ2RgLgoK
IyMgQWRkaXRpb25hbCBJbmZvcm1hdGlvbgoKQSB3aWRlIHZhcmlldHkgb2YgYWRkaXRpb25hbCBp
bmZvcm1hdGlvbiBpcyBhdmFpbGFibGUgb24gdGhlIFtDbGFuZyB3ZWIKcGFnZV0oaHR0cHM6Ly9j
bGFuZy5sbHZtLm9yZy8pLiBUaGUgd2ViIHBhZ2UgY29udGFpbnMgdmVyc2lvbnMgb2YgdGhlCkFQ
SSBkb2N1bWVudGF0aW9uIHdoaWNoIGFyZSB1cC10by1kYXRlIHdpdGggdGhlIEdpdCB2ZXJzaW9u
IG9mCnRoZSBzb3VyY2UgY29kZS4gWW91IGNhbiBhY2Nlc3MgdmVyc2lvbnMgb2YgdGhlc2UgZG9j
dW1lbnRzIHNwZWNpZmljIHRvCnRoaXMgcmVsZWFzZSBieSBnb2luZyBpbnRvIHRoZSAiYGNsYW5n
L2RvY3MvYCIgZGlyZWN0b3J5IGluIHRoZSBDbGFuZwp0cmVlLgoKSWYgeW91IGhhdmUgYW55IHF1
ZXN0aW9ucyBvciBjb21tZW50cyBhYm91dCBDbGFuZywgcGxlYXNlIGZlZWwgZnJlZSB0bwpjb250
YWN0IHVzIG9uIHRoZSBbRGlzY291cnNlIGZvcnVtcyAoQ2xhbmcgRnJvbnRlbmQgY2F0ZWdvcnkp
XShodHRwczovL2Rpc2NvdXJzZS5sbHZtLm9yZy9jL2NsYW5nLzYpLgo=

--===============1357478407085866056==--

