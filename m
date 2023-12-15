Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CB2C47DDC
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.63143.1702649863864014524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JHI/jaY3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=c5MBjJv5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018c6dd71f46-4a79941a-65d0-49d0-bf54-64698a8bf7e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649864;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nhHGt4EcUfhq3B+ChABkE7xeOVMZ0w5JM3UGVY9SiiA=;
	b=JHI/jaY3YEV0UGXD9s0J6bTkhvJjN3soMZh5YI4bYqEYIEwq9ROOAXle7Ef5nVL8
	MTcOmhDh8nyCFAFwuxoJ+J2NvaxGbDjNbY80jJ42Ltnd54lSZIH3IcyEY9cNrY2T9qF
	yDoAEmUtfAQpcb7QL3BLDIDqfUPzUSav+vtNZT6U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649864;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nhHGt4EcUfhq3B+ChABkE7xeOVMZ0w5JM3UGVY9SiiA=;
	b=c5MBjJv5LXCdpOdbSu+1J5qGi3UG4Kn1J93ufxRdgxY+evYovAF9WeClctdebP+D
	fSP3hWnX8UiO8z4xWMtxk9aAI3FB5fRd9xxsmXTJsj0JLuLave/XFDIdcKEiynR0Eoj
	GncxN2WS3jJtPH7Q2DaWGh78IHboW8+Y200JyHug=
Content-Type: multipart/mixed; boundary="===============4945934185616908675=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs: upgrading to 1.74.1 FAILED
Message-ID: <0101018c6dd71f46-4a79941a-65d0-49d0-bf54-64698a8bf7e4-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:44 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192474

--===============4945934185616908675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libstd-rs* to *1.74.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libstd-rs failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1843 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3bb688de751df35afebb89f5555057ea1eace62d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3bb688de751df35afebb89f5555057ea1eace62d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3bb688de751df35afebb89f5555057ea1eace62d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3bb688de751df35afebb89f5555057ea1eace62d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:07:08
Adding changed files:   0% |                                    | ETA:  0:05:04
Adding changed files:   0% |                                    | ETA:  0:04:24
Adding changed files:   0% |                                    | ETA:  0:04:10
Adding changed files:   0% |                                    | ETA:  0:03:58
Adding changed files:   1% |                                    | ETA:  0:03:49
Adding changed files:   1% |                                    | ETA:  0:03:44
Adding changed files:   1% |                                    | ETA:  0:03:37
Adding changed files:   1% |                                    | ETA:  0:03:34
Adding changed files:   1% |                                    | ETA:  0:03:33
Adding changed files:   1% |                                    | ETA:  0:03:31
Adding changed files:   2% |                                    | ETA:  0:03:28
Adding changed files:   2% |                                    | ETA:  0:03:26
Adding changed files:   2% |                                    | ETA:  0:03:25
Adding changed files:   2% |                                    | ETA:  0:03:23
Adding changed files:   2% |                                    | ETA:  0:03:21
Adding changed files:   2% |#                                   | ETA:  0:03:19
Adding changed files:   3% |#                                   | ETA:  0:03:18
Adding changed files:   3% |#                                   | ETA:  0:03:17
Adding changed files:   3% |#                                   | ETA:  0:03:16
Adding changed files:   3% |#                                   | ETA:  0:03:15
Adding changed files:   3% |#                                   | ETA:  0:03:14
Adding changed files:   3% |#                                   | ETA:  0:03:12
Adding changed files:   4% |#                                   | ETA:  0:03:12
Adding changed files:   4% |#                                   | ETA:  0:03:12
Adding changed files:   4% |#                                   | ETA:  0:03:11
Adding changed files:   4% |#                                   | ETA:  0:03:10
Adding changed files:   4% |#                                   | ETA:  0:03:08
Adding changed files:   4% |#                                   | ETA:  0:03:08
Adding changed files:   5% |#                                   | ETA:  0:03:07
Adding changed files:   5% |#                                   | ETA:  0:03:07
Adding changed files:   5% |#                                   | ETA:  0:03:07
Adding changed files:   5% |##                                  | ETA:  0:03:06
Adding changed files:   5% |##                                  | ETA:  0:03:06
Adding changed files:   5% |##                                  | ETA:  0:03:05
Adding changed files:   6% |##                                  | ETA:  0:03:04
Adding changed files:   6% |##                                  | ETA:  0:03:04
Adding changed files:   6% |##                                  | ETA:  0:03:03
Adding changed files:   6% |##                                  | ETA:  0:03:03
Adding changed files:   6% |##                                  | ETA:  0:03:03
Adding changed files:   6% |##                                  | ETA:  0:03:03
Adding changed files:   7% |##                                  | ETA:  0:03:02
Adding changed files:   7% |##                                  | ETA:  0:03:01
Adding changed files:   7% |##                                  | ETA:  0:03:01
Adding changed files:   7% |##                                  | ETA:  0:03:00
Adding changed files:   7% |##                                  | ETA:  0:03:00
Adding changed files:   7% |##                                  | ETA:  0:03:00
Adding changed files:   8% |##                                  | ETA:  0:03:00
Adding changed files:   8% |##                                  | ETA:  0:03:00
Adding changed files:   8% |###                                 | ETA:  0:02:59
Adding changed files:   8% |###                                 | ETA:  0:02:59
Adding changed files:   8% |###                                 | ETA:  0:02:59
Adding changed files:   8% |###                                 | ETA:  0:02:59
Adding changed files:   9% |###                                 | ETA:  0:02:58
Adding changed files:   9% |###                                 | ETA:  0:02:58
Adding changed files:   9% |###                                 | ETA:  0:02:58
Adding changed files:   9% |###                                 | ETA:  0:02:58
Adding changed files:   9% |###                                 | ETA:  0:02:58
Adding changed files:   9% |###                                 | ETA:  0:02:58
Adding changed files:  10% |###                                 | ETA:  0:02:57
Adding changed files:  10% |###                                 | ETA:  0:02:57
Adding changed files:  10% |###                                 | ETA:  0:02:56
Adding changed files:  10% |###                                 | ETA:  0:02:56
Adding changed files:  10% |###                                 | ETA:  0:02:56
Adding changed files:  10% |###                                 | ETA:  0:02:55
Adding changed files:  11% |####                                | ETA:  0:02:55
Adding changed files:  11% |####                                | ETA:  0:02:55
Adding changed files:  11% |####                                | ETA:  0:02:54
Adding changed files:  11% |####                                | ETA:  0:02:54
Adding changed files:  11% |####                                | ETA:  0:02:54
Adding changed files:  11% |####                                | ETA:  0:02:54
Adding changed files:  12% |####                                | ETA:  0:02:54
Adding changed files:  12% |####                                | ETA:  0:02:54
Adding changed files:  12% |####                                | ETA:  0:02:54
Adding changed files:  12% |####                                | ETA:  0:02:54
Adding changed files:  12% |####                                | ETA:  0:02:53
Adding changed files:  12% |####                                | ETA:  0:02:53
Adding changed files:  13% |####                                | ETA:  0:02:53
Adding changed files:  13% |####                                | ETA:  0:02:52
Adding changed files:  13% |####                                | ETA:  0:02:52
Adding changed files:  13% |####                                | ETA:  0:02:52
Adding changed files:  13% |####                                | ETA:  0:02:52
Adding changed files:  13% |#####                               | ETA:  0:02:52
Adding changed files:  14% |#####                               | ETA:  0:02:51
Adding changed files:  14% |#####                               | ETA:  0:02:50
Adding changed files:  14% |#####                               | ETA:  0:02:50
Adding changed files:  14% |#####                               | ETA:  0:02:49
Adding changed files:  14% |#####                               | ETA:  0:02:49
Adding changed files:  15% |#####                               | ETA:  0:02:48
Adding changed files:  15% |#####                               | ETA:  0:02:48
Adding changed files:  15% |#####                               | ETA:  0:02:47
Adding changed files:  15% |#####                               | ETA:  0:02:47
Adding changed files:  15% |#####                               | ETA:  0:02:47
Adding changed files:  15% |#####                               | ETA:  0:02:47
Adding changed files:  16% |#####                               | ETA:  0:02:46
Adding changed files:  16% |#####                               | ETA:  0:02:46
Adding changed files:  16% |#####                               | ETA:  0:02:45
Adding changed files:  16% |#####                               | ETA:  0:02:45
Adding changed files:  16% |######                              | ETA:  0:02:45
Adding changed files:  16% |######                              | ETA:  0:02:44
Adding changed files:  17% |######                              | ETA:  0:02:44
Adding changed files:  17% |######                              | ETA:  0:02:43
Adding changed files:  17% |######                              | ETA:  0:02:43
Adding changed files:  17% |######                              | ETA:  0:02:43
Adding changed files:  17% |######                              | ETA:  0:02:42
Adding changed files:  17% |######                              | ETA:  0:02:42
Adding changed files:  18% |######                              | ETA:  0:02:42
Adding changed files:  18% |######                              | ETA:  0:02:41
Adding changed files:  18% |######                              | ETA:  0:02:41
Adding changed files:  18% |######                              | ETA:  0:02:40
Adding changed files:  18% |######                              | ETA:  0:02:40
Adding changed files:  18% |######                              | ETA:  0:02:40
Adding changed files:  19% |######                              | ETA:  0:02:39
Adding changed files:  19% |######                              | ETA:  0:02:39
Adding changed files:  19% |######                              | ETA:  0:02:39
Adding changed files:  19% |#######                             | ETA:  0:02:38
Adding changed files:  19% |#######                             | ETA:  0:02:38
Adding changed files:  19% |#######                             | ETA:  0:02:38
Adding changed files:  20% |#######                             | ETA:  0:02:38
Adding changed files:  20% |#######                             | ETA:  0:02:37
Adding changed files:  20% |#######                             | ETA:  0:02:37
Adding changed files:  20% |#######                             | ETA:  0:02:37
Adding changed files:  20% |#######                             | ETA:  0:02:37
Adding changed files:  20% |#######                             | ETA:  0:02:37
Adding changed files:  21% |#######                             | ETA:  0:02:37
Adding changed files:  21% |#######                             | ETA:  0:02:37
Adding changed files:  21% |#######                             | ETA:  0:02:36
Adding changed files:  21% |#######                             | ETA:  0:02:36
Adding changed files:  21% |#######                             | ETA:  0:02:36
Adding changed files:  21% |#######                             | ETA:  0:02:36
Adding changed files:  22% |#######                             | ETA:  0:02:36
Adding changed files:  22% |########                            | ETA:  0:02:36
Adding changed files:  22% |########                            | ETA:  0:02:36
Adding changed files:  22% |########                            | ETA:  0:02:35
Adding changed files:  22% |########                            | ETA:  0:02:35
Adding changed files:  22% |########                            | ETA:  0:02:35
Adding changed files:  23% |########                            | ETA:  0:02:35
Adding changed files:  23% |########                            | ETA:  0:02:34
Adding changed files:  23% |########                            | ETA:  0:02:34
Adding changed files:  23% |########                            | ETA:  0:02:34
Adding changed files:  23% |########                            | ETA:  0:02:34
Adding changed files:  23% |########                            | ETA:  0:02:34
Adding changed files:  24% |########                            | ETA:  0:02:33
Adding changed files:  24% |########                            | ETA:  0:02:33
Adding changed files:  24% |########                            | ETA:  0:02:33
Adding changed files:  24% |########                            | ETA:  0:02:33
Adding changed files:  24% |########                            | ETA:  0:02:32
Adding changed files:  24% |########                            | ETA:  0:02:32
Adding changed files:  25% |#########                           | ETA:  0:02:32
Adding changed files:  25% |#########                           | ETA:  0:02:32
Adding changed files:  25% |#########                           | ETA:  0:02:31
Adding changed files:  25% |#########                           | ETA:  0:02:31
Adding changed files:  25% |#########                           | ETA:  0:02:31
Adding changed files:  25% |#########                           | ETA:  0:02:31
Adding changed files:  26% |#########                           | ETA:  0:02:30
Adding changed files:  26% |#########                           | ETA:  0:02:30
Adding changed files:  26% |#########                           | ETA:  0:02:30
Adding changed files:  26% |#########                           | ETA:  0:02:30
Adding changed files:  26% |#########                           | ETA:  0:02:29
Adding changed files:  26% |#########                           | ETA:  0:02:29
Adding changed files:  27% |#########                           | ETA:  0:02:29
Adding changed files:  27% |#########                           | ETA:  0:02:28
Adding changed files:  27% |#########                           | ETA:  0:02:28
Adding changed files:  27% |#########                           | ETA:  0:02:28
Adding changed files:  27% |##########                          | ETA:  0:02:28
Adding changed files:  27% |##########                          | ETA:  0:02:27
Adding changed files:  28% |##########                          | ETA:  0:02:27
Adding changed files:  28% |##########                          | ETA:  0:02:27
Adding changed files:  28% |##########                          | ETA:  0:02:27
Adding changed files:  28% |##########                          | ETA:  0:02:26
Adding changed files:  28% |##########                          | ETA:  0:02:26
Adding changed files:  29% |##########                          | ETA:  0:02:25
Adding changed files:  29% |##########                          | ETA:  0:02:25
Adding changed files:  29% |##########                          | ETA:  0:02:25
Adding changed files:  29% |##########                          | ETA:  0:02:25
Adding changed files:  29% |##########                          | ETA:  0:02:24
Adding changed files:  29% |##########                          | ETA:  0:02:24
Adding changed files:  30% |##########                          | ETA:  0:02:23
Adding changed files:  30% |##########                          | ETA:  0:02:23
Adding changed files:  30% |##########                          | ETA:  0:02:23
Adding changed files:  30% |##########                          | ETA:  0:02:22
Adding changed files:  30% |###########                         | ETA:  0:02:22
Adding changed files:  30% |###########                         | ETA:  0:02:22
Adding changed files:  31% |###########                         | ETA:  0:02:21
Adding changed files:  31% |###########                         | ETA:  0:02:21
Adding changed files:  31% |###########                         | ETA:  0:02:21
Adding changed files:  31% |###########                         | ETA:  0:02:20
Adding changed files:  31% |###########                         | ETA:  0:02:20
Adding changed files:  31% |###########                         | ETA:  0:02:19
Adding changed files:  32% |###########                         | ETA:  0:02:19
Adding changed files:  32% |###########                         | ETA:  0:02:19
Adding changed files:  32% |###########                         | ETA:  0:02:18
Adding changed files:  32% |###########                         | ETA:  0:02:18
Adding changed files:  32% |###########                         | ETA:  0:02:18
Adding changed files:  32% |###########                         | ETA:  0:02:17
Adding changed files:  33% |###########                         | ETA:  0:02:17
Adding changed files:  33% |###########                         | ETA:  0:02:17
Adding changed files:  33% |############                        | ETA:  0:02:17
Adding changed files:  33% |############                        | ETA:  0:02:17
Adding changed files:  33% |############                        | ETA:  0:02:17
Adding changed files:  33% |############                        | ETA:  0:02:16
Adding changed files:  34% |############                        | ETA:  0:02:16
Adding changed files:  34% |############                        | ETA:  0:02:16
Adding changed files:  34% |############                        | ETA:  0:02:16
Adding changed files:  34% |############                        | ETA:  0:02:16
Adding changed files:  34% |############                        | ETA:  0:02:15
Adding changed files:  34% |############                        | ETA:  0:02:15
Adding changed files:  35% |############                        | ETA:  0:02:15
Adding changed files:  35% |############                        | ETA:  0:02:15
Adding changed files:  35% |############                        | ETA:  0:02:15
Adding changed files:  35% |############                        | ETA:  0:02:14
Adding changed files:  35% |############                        | ETA:  0:02:14
Adding changed files:  35% |############                        | ETA:  0:02:14
Adding changed files:  36% |############                        | ETA:  0:02:14
Adding changed files:  36% |#############                       | ETA:  0:02:14
Adding changed files:  36% |#############                       | ETA:  0:02:13
Adding changed files:  36% |#############                       | ETA:  0:02:13
Adding changed files:  36% |#############                       | ETA:  0:02:13
Adding changed files:  36% |#############                       | ETA:  0:02:13
Adding changed files:  37% |#############                       | ETA:  0:02:13
Adding changed files:  37% |#############                       | ETA:  0:02:12
Adding changed files:  37% |#############                       | ETA:  0:02:12
Adding changed files:  37% |#############                       | ETA:  0:02:12
Adding changed files:  37% |#############                       | ETA:  0:02:11
Adding changed files:  37% |#############                       | ETA:  0:02:11
Adding changed files:  38% |#############                       | ETA:  0:02:11
Adding changed files:  38% |#############                       | ETA:  0:02:10
Adding changed files:  38% |#############                       | ETA:  0:02:10
Adding changed files:  38% |#############                       | ETA:  0:02:10
Adding changed files:  38% |#############                       | ETA:  0:02:10
Adding changed files:  38% |##############                      | ETA:  0:02:10
Adding changed files:  39% |##############                      | ETA:  0:02:09
Adding changed files:  39% |##############                      | ETA:  0:02:09
Adding changed files:  39% |##############                      | ETA:  0:02:09
Adding changed files:  39% |##############                      | ETA:  0:02:09
Adding changed files:  39% |##############                      | ETA:  0:02:09
Adding changed files:  39% |##############                      | ETA:  0:02:08
Adding changed files:  40% |##############                      | ETA:  0:02:08
Adding changed files:  40% |##############                      | ETA:  0:02:08
Adding changed files:  40% |##############                      | ETA:  0:02:07
Adding changed files:  40% |##############                      | ETA:  0:02:07
Adding changed files:  40% |##############                      | ETA:  0:02:07
Adding changed files:  40% |##############                      | ETA:  0:02:06
Adding changed files:  41% |##############                      | ETA:  0:02:06
Adding changed files:  41% |##############                      | ETA:  0:02:06
Adding changed files:  41% |##############                      | ETA:  0:02:05
Adding changed files:  41% |##############                      | ETA:  0:02:05
Adding changed files:  41% |###############                     | ETA:  0:02:05
Adding changed files:  41% |###############                     | ETA:  0:02:05
Adding changed files:  42% |###############                     | ETA:  0:02:04
Adding changed files:  42% |###############                     | ETA:  0:02:04
Adding changed files:  42% |###############                     | ETA:  0:02:04
Adding changed files:  42% |###############                     | ETA:  0:02:04
Adding changed files:  42% |###############                     | ETA:  0:02:04
Adding changed files:  42% |###############                     | ETA:  0:02:03
Adding changed files:  43% |###############                     | ETA:  0:02:03
Adding changed files:  43% |###############                     | ETA:  0:02:03
Adding changed files:  43% |###############                     | ETA:  0:02:02
Adding changed files:  43% |###############                     | ETA:  0:02:02
Adding changed files:  43% |###############                     | ETA:  0:02:02
Adding changed files:  44% |###############                     | ETA:  0:02:01
Adding changed files:  44% |###############                     | ETA:  0:02:01
Adding changed files:  44% |###############                     | ETA:  0:02:01
Adding changed files:  44% |################                    | ETA:  0:02:00
Adding changed files:  44% |################                    | ETA:  0:02:00
Adding changed files:  44% |################                    | ETA:  0:02:00
Adding changed files:  45% |################                    | ETA:  0:01:59
Adding changed files:  45% |################                    | ETA:  0:01:59
Adding changed files:  45% |################                    | ETA:  0:01:59
Adding changed files:  45% |################                    | ETA:  0:01:59
Adding changed files:  45% |################                    | ETA:  0:01:58
Adding changed files:  45% |################                    | ETA:  0:01:58
Adding changed files:  46% |################                    | ETA:  0:01:58
Adding changed files:  46% |################                    | ETA:  0:01:57
Adding changed files:  46% |################                    | ETA:  0:01:57
Adding changed files:  46% |################                    | ETA:  0:01:57
Adding changed files:  46% |################                    | ETA:  0:01:56
Adding changed files:  46% |################                    | ETA:  0:01:56
Adding changed files:  47% |################                    | ETA:  0:01:56
Adding changed files:  47% |################                    | ETA:  0:01:56
Adding changed files:  47% |#################                   | ETA:  0:01:55
Adding changed files:  47% |#################                   | ETA:  0:01:55
Adding changed files:  47% |#################                   | ETA:  0:01:55
Adding changed files:  47% |#################                   | ETA:  0:01:54
Adding changed files:  48% |#################                   | ETA:  0:01:54
Adding changed files:  48% |#################                   | ETA:  0:01:53
Adding changed files:  48% |#################                   | ETA:  0:01:53
Adding changed files:  48% |#################                   | ETA:  0:01:53
Adding changed files:  48% |#################                   | ETA:  0:01:53
Adding changed files:  48% |#################                   | ETA:  0:01:52
Adding changed files:  49% |#################                   | ETA:  0:01:52
Adding changed files:  49% |#################                   | ETA:  0:01:52
Adding changed files:  49% |#################                   | ETA:  0:01:51
Adding changed files:  49% |#################                   | ETA:  0:01:51
Adding changed files:  49% |#################                   | ETA:  0:01:51
Adding changed files:  49% |#################                   | ETA:  0:01:50
Adding changed files:  50% |##################                  | ETA:  0:01:50
Adding changed files:  50% |##################                  | ETA:  0:01:50
Adding changed files:  50% |##################                  | ETA:  0:01:49
Adding changed files:  50% |##################                  | ETA:  0:01:49
Adding changed files:  50% |##################                  | ETA:  0:01:49
Adding changed files:  50% |##################                  | ETA:  0:01:48
Adding changed files:  51% |##################                  | ETA:  0:01:48
Adding changed files:  51% |##################                  | ETA:  0:01:47
Adding changed files:  51% |##################                  | ETA:  0:01:47
Adding changed files:  51% |##################                  | ETA:  0:01:47
Adding changed files:  51% |##################                  | ETA:  0:01:46
Adding changed files:  51% |##################                  | ETA:  0:01:46
Adding changed files:  52% |##################                  | ETA:  0:01:45
Adding changed files:  52% |##################                  | ETA:  0:01:45
Adding changed files:  52% |##################                  | ETA:  0:01:45
Adding changed files:  52% |##################                  | ETA:  0:01:44
Adding changed files:  52% |##################                  | ETA:  0:01:44
Adding changed files:  52% |###################                 | ETA:  0:01:44
Adding changed files:  53% |###################                 | ETA:  0:01:43
Adding changed files:  53% |###################                 | ETA:  0:01:43
Adding changed files:  53% |###################                 | ETA:  0:01:43
Adding changed files:  53% |###################                 | ETA:  0:01:42
Adding changed files:  53% |###################                 | ETA:  0:01:42
Adding changed files:  53% |###################                 | ETA:  0:01:42
Adding changed files:  54% |###################                 | ETA:  0:01:41
Adding changed files:  54% |###################                 | ETA:  0:01:41
Adding changed files:  54% |###################                 | ETA:  0:01:41
Adding changed files:  54% |###################                 | ETA:  0:01:40
Adding changed files:  54% |###################                 | ETA:  0:01:40
Adding changed files:  54% |###################                 | ETA:  0:01:40
Adding changed files:  55% |###################                 | ETA:  0:01:40
Adding changed files:  55% |###################                 | ETA:  0:01:39
Adding changed files:  55% |###################                 | ETA:  0:01:39
Adding changed files:  55% |####################                | ETA:  0:01:39
Adding changed files:  55% |####################                | ETA:  0:01:38
Adding changed files:  55% |####################                | ETA:  0:01:38
Adding changed files:  56% |####################                | ETA:  0:01:38
Adding changed files:  56% |####################                | ETA:  0:01:37
Adding changed files:  56% |####################                | ETA:  0:01:37
Adding changed files:  56% |####################                | ETA:  0:01:37
Adding changed files:  56% |####################                | ETA:  0:01:36
Adding changed files:  56% |####################                | ETA:  0:01:36
Adding changed files:  57% |####################                | ETA:  0:01:36
Adding changed files:  57% |####################                | ETA:  0:01:35
Adding changed files:  57% |####################                | ETA:  0:01:35
Adding changed files:  57% |####################                | ETA:  0:01:35
Adding changed files:  57% |####################                | ETA:  0:01:35
Adding changed files:  58% |####################                | ETA:  0:01:34
Adding changed files:  58% |####################                | ETA:  0:01:34
Adding changed files:  58% |#####################               | ETA:  0:01:33
Adding changed files:  58% |#####################               | ETA:  0:01:33
Adding changed files:  58% |#####################               | ETA:  0:01:33
Adding changed files:  58% |#####################               | ETA:  0:01:32
Adding changed files:  59% |#####################               | ETA:  0:01:32
Adding changed files:  59% |#####################               | ETA:  0:01:32
Adding changed files:  59% |#####################               | ETA:  0:01:31
Adding changed files:  59% |#####################               | ETA:  0:01:31
Adding changed files:  59% |#####################               | ETA:  0:01:30
Adding changed files:  59% |#####################               | ETA:  0:01:30
Adding changed files:  60% |#####################               | ETA:  0:01:30
Adding changed files:  60% |#####################               | ETA:  0:01:29
Adding changed files:  60% |#####################               | ETA:  0:01:29
Adding changed files:  60% |#####################               | ETA:  0:01:29
Adding changed files:  60% |#####################               | ETA:  0:01:28
Adding changed files:  60% |#####################               | ETA:  0:01:28
Adding changed files:  61% |#####################               | ETA:  0:01:28
Adding changed files:  61% |######################              | ETA:  0:01:27
Adding changed files:  61% |######################              | ETA:  0:01:27
Adding changed files:  61% |######################              | ETA:  0:01:27
Adding changed files:  61% |######################              | ETA:  0:01:26
Adding changed files:  61% |######################              | ETA:  0:01:26
Adding changed files:  62% |######################              | ETA:  0:01:26
Adding changed files:  62% |######################              | ETA:  0:01:25
Adding changed files:  62% |######################              | ETA:  0:01:25
Adding changed files:  62% |######################              | ETA:  0:01:24
Adding changed files:  62% |######################              | ETA:  0:01:24
Adding changed files:  62% |######################              | ETA:  0:01:24
Adding changed files:  63% |######################              | ETA:  0:01:23
Adding changed files:  63% |######################              | ETA:  0:01:23
Adding changed files:  63% |######################              | ETA:  0:01:23
Adding changed files:  63% |######################              | ETA:  0:01:22
Adding changed files:  63% |######################              | ETA:  0:01:22
Adding changed files:  63% |#######################             | ETA:  0:01:22
Adding changed files:  64% |#######################             | ETA:  0:01:21
Adding changed files:  64% |#######################             | ETA:  0:01:21
Adding changed files:  64% |#######################             | ETA:  0:01:21
Adding changed files:  64% |#######################             | ETA:  0:01:20
Adding changed files:  64% |#######################             | ETA:  0:01:20
Adding changed files:  64% |#######################             | ETA:  0:01:19
Adding changed files:  65% |#######################             | ETA:  0:01:19
Adding changed files:  65% |#######################             | ETA:  0:01:19
Adding changed files:  65% |#######################             | ETA:  0:01:18
Adding changed files:  65% |#######################             | ETA:  0:01:18
Adding changed files:  65% |#######################             | ETA:  0:01:18
Adding changed files:  65% |#######################             | ETA:  0:01:17
Adding changed files:  66% |#######################             | ETA:  0:01:17
Adding changed files:  66% |#######################             | ETA:  0:01:17
Adding changed files:  66% |#######################             | ETA:  0:01:16
Adding changed files:  66% |#######################             | ETA:  0:01:16
Adding changed files:  66% |########################            | ETA:  0:01:16
Adding changed files:  66% |########################            | ETA:  0:01:15
Adding changed files:  67% |########################            | ETA:  0:01:15
Adding changed files:  67% |########################            | ETA:  0:01:15
Adding changed files:  67% |########################            | ETA:  0:01:14
Adding changed files:  67% |########################            | ETA:  0:01:14
Adding changed files:  67% |########################            | ETA:  0:01:13
Adding changed files:  67% |########################            | ETA:  0:01:13
Adding changed files:  68% |########################            | ETA:  0:01:13
Adding changed files:  68% |########################            | ETA:  0:01:12
Adding changed files:  68% |########################            | ETA:  0:01:12
Adding changed files:  68% |########################            | ETA:  0:01:12
Adding changed files:  68% |########################            | ETA:  0:01:11
Adding changed files:  68% |########################            | ETA:  0:01:11
Adding changed files:  69% |########################            | ETA:  0:01:10
Adding changed files:  69% |########################            | ETA:  0:01:10
Adding changed files:  69% |#########################           | ETA:  0:01:10
Adding changed files:  69% |#########################           | ETA:  0:01:09
Adding changed files:  69% |#########################           | ETA:  0:01:09
Adding changed files:  69% |#########################           | ETA:  0:01:09
Adding changed files:  70% |#########################           | ETA:  0:01:08
Adding changed files:  70% |#########################           | ETA:  0:01:08
Adding changed files:  70% |#########################           | ETA:  0:01:08
Adding changed files:  70% |#########################           | ETA:  0:01:07
Adding changed files:  70% |#########################           | ETA:  0:01:07
Adding changed files:  70% |#########################           | ETA:  0:01:06
Adding changed files:  71% |#########################           | ETA:  0:01:06
Adding changed files:  71% |#########################           | ETA:  0:01:06
Adding changed files:  71% |#########################           | ETA:  0:01:05
Adding changed files:  71% |#########################           | ETA:  0:01:05
Adding changed files:  71% |#########################           | ETA:  0:01:05
Adding changed files:  71% |#########################           | ETA:  0:01:04
Adding changed files:  72% |#########################           | ETA:  0:01:04
Adding changed files:  72% |##########################          | ETA:  0:01:04
Adding changed files:  72% |##########################          | ETA:  0:01:03
Adding changed files:  72% |##########################          | ETA:  0:01:03
Adding changed files:  72% |##########################          | ETA:  0:01:02
Adding changed files:  73% |##########################          | ETA:  0:01:02
Adding changed files:  73% |##########################          | ETA:  0:01:02
Adding changed files:  73% |##########################          | ETA:  0:01:01
Adding changed files:  73% |##########################          | ETA:  0:01:01
Adding changed files:  73% |##########################          | ETA:  0:01:01
Adding changed files:  73% |##########################          | ETA:  0:01:00
Adding changed files:  74% |##########################          | ETA:  0:01:00
Adding changed files:  74% |##########################          | ETA:  0:01:00
Adding changed files:  74% |##########################          | ETA:  0:00:59
Adding changed files:  74% |##########################          | ETA:  0:00:59
Adding changed files:  74% |##########################          | ETA:  0:00:58
Adding changed files:  74% |##########################          | ETA:  0:00:58
Adding changed files:  75% |###########################         | ETA:  0:00:58
Adding changed files:  75% |###########################         | ETA:  0:00:57
Adding changed files:  75% |###########################         | ETA:  0:00:57
Adding changed files:  75% |###########################         | ETA:  0:00:57
Adding changed files:  75% |###########################         | ETA:  0:00:56
Adding changed files:  75% |###########################         | ETA:  0:00:56
Adding changed files:  76% |###########################         | ETA:  0:00:55
Adding changed files:  76% |###########################         | ETA:  0:00:55
Adding changed files:  76% |###########################         | ETA:  0:00:55
Adding changed files:  76% |###########################         | ETA:  0:00:54
Adding changed files:  76% |###########################         | ETA:  0:00:54
Adding changed files:  76% |###########################         | ETA:  0:00:54
Adding changed files:  77% |###########################         | ETA:  0:00:53
Adding changed files:  77% |###########################         | ETA:  0:00:53
Adding changed files:  77% |###########################         | ETA:  0:00:52
Adding changed files:  77% |###########################         | ETA:  0:00:52
Adding changed files:  77% |###########################         | ETA:  0:00:52
Adding changed files:  77% |############################        | ETA:  0:00:51
Adding changed files:  78% |############################        | ETA:  0:00:51
Adding changed files:  78% |############################        | ETA:  0:00:51
Adding changed files:  78% |############################        | ETA:  0:00:50
Adding changed files:  78% |############################        | ETA:  0:00:50
Adding changed files:  78% |############################        | ETA:  0:00:49
Adding changed files:  78% |############################        | ETA:  0:00:49
Adding changed files:  79% |############################        | ETA:  0:00:49
Adding changed files:  79% |############################        | ETA:  0:00:48
Adding changed files:  79% |############################        | ETA:  0:00:48
Adding changed files:  79% |############################        | ETA:  0:00:48
Adding changed files:  79% |############################        | ETA:  0:00:47
Adding changed files:  79% |############################        | ETA:  0:00:47
Adding changed files:  80% |############################        | ETA:  0:00:46
Adding changed files:  80% |############################        | ETA:  0:00:46
Adding changed files:  80% |############################        | ETA:  0:00:46
Adding changed files:  80% |#############################       | ETA:  0:00:45
Adding changed files:  80% |#############################       | ETA:  0:00:45
Adding changed files:  80% |#############################       | ETA:  0:00:45
Adding changed files:  81% |#############################       | ETA:  0:00:44
Adding changed files:  81% |#############################       | ETA:  0:00:44
Adding changed files:  81% |#############################       | ETA:  0:00:43
Adding changed files:  81% |#############################       | ETA:  0:00:43
Adding changed files:  81% |#############################       | ETA:  0:00:43
Adding changed files:  81% |#############################       | ETA:  0:00:42
Adding changed files:  82% |#############################       | ETA:  0:00:42
Adding changed files:  82% |#############################       | ETA:  0:00:41
Adding changed files:  82% |#############################       | ETA:  0:00:41
Adding changed files:  82% |#############################       | ETA:  0:00:41
Adding changed files:  82% |#############################       | ETA:  0:00:40
Adding changed files:  82% |#############################       | ETA:  0:00:40
Adding changed files:  83% |#############################       | ETA:  0:00:40
Adding changed files:  83% |#############################       | ETA:  0:00:39
Adding changed files:  83% |##############################      | ETA:  0:00:39
Adding changed files:  83% |##############################      | ETA:  0:00:38
Adding changed files:  83% |##############################      | ETA:  0:00:38
Adding changed files:  83% |##############################      | ETA:  0:00:38
Adding changed files:  84% |##############################      | ETA:  0:00:37
Adding changed files:  84% |##############################      | ETA:  0:00:37
Adding changed files:  84% |##############################      | ETA:  0:00:36
Adding changed files:  84% |##############################      | ETA:  0:00:36
Adding changed files:  84% |##############################      | ETA:  0:00:36
Adding changed files:  84% |##############################      | ETA:  0:00:35
Adding changed files:  85% |##############################      | ETA:  0:00:35
Adding changed files:  85% |##############################      | ETA:  0:00:35
Adding changed files:  85% |##############################      | ETA:  0:00:34
Adding changed files:  85% |##############################      | ETA:  0:00:34
Adding changed files:  85% |##############################      | ETA:  0:00:33
Adding changed files:  85% |##############################      | ETA:  0:00:33
Adding changed files:  86% |###############################     | ETA:  0:00:33
Adding changed files:  86% |###############################     | ETA:  0:00:32
Adding changed files:  86% |###############################     | ETA:  0:00:32
Adding changed files:  86% |###############################     | ETA:  0:00:31
Adding changed files:  86% |###############################     | ETA:  0:00:31
Adding changed files:  87% |###############################     | ETA:  0:00:31
Adding changed files:  87% |###############################     | ETA:  0:00:30
Adding changed files:  87% |###############################     | ETA:  0:00:30
Adding changed files:  87% |###############################     | ETA:  0:00:29
Adding changed files:  87% |###############################     | ETA:  0:00:29
Adding changed files:  87% |###############################     | ETA:  0:00:29
Adding changed files:  88% |###############################     | ETA:  0:00:28
Adding changed files:  88% |###############################     | ETA:  0:00:28
Adding changed files:  88% |###############################     | ETA:  0:00:27
Adding changed files:  88% |###############################     | ETA:  0:00:27
Adding changed files:  88% |###############################     | ETA:  0:00:27
Adding changed files:  88% |###############################     | ETA:  0:00:26
Adding changed files:  89% |################################    | ETA:  0:00:26
Adding changed files:  89% |################################    | ETA:  0:00:26
Adding changed files:  89% |################################    | ETA:  0:00:25
Adding changed files:  89% |################################    | ETA:  0:00:25
Adding changed files:  89% |################################    | ETA:  0:00:24
Adding changed files:  89% |################################    | ETA:  0:00:24
Adding changed files:  90% |################################    | ETA:  0:00:24
Adding changed files:  90% |################################    | ETA:  0:00:23
Adding changed files:  90% |################################    | ETA:  0:00:23
Adding changed files:  90% |################################    | ETA:  0:00:22
Adding changed files:  90% |################################    | ETA:  0:00:22
Adding changed files:  90% |################################    | ETA:  0:00:22
Adding changed files:  91% |################################    | ETA:  0:00:21
Adding changed files:  91% |################################    | ETA:  0:00:21
Adding changed files:  91% |################################    | ETA:  0:00:20
Adding changed files:  91% |################################    | ETA:  0:00:20
Adding changed files:  91% |#################################   | ETA:  0:00:20
Adding changed files:  91% |#################################   | ETA:  0:00:19
Adding changed files:  92% |#################################   | ETA:  0:00:19
Adding changed files:  92% |#################################   | ETA:  0:00:18
Adding changed files:  92% |#################################   | ETA:  0:00:18
Adding changed files:  92% |#################################   | ETA:  0:00:18
Adding changed files:  92% |#################################   | ETA:  0:00:17
Adding changed files:  92% |#################################   | ETA:  0:00:17
Adding changed files:  93% |#################################   | ETA:  0:00:16
Adding changed files:  93% |#################################   | ETA:  0:00:16
Adding changed files:  93% |#################################   | ETA:  0:00:16
Adding changed files:  93% |#################################   | ETA:  0:00:15
Adding changed files:  93% |#################################   | ETA:  0:00:15
Adding changed files:  93% |#################################   | ETA:  0:00:14
Adding changed files:  94% |#################################   | ETA:  0:00:14
Adding changed files:  94% |#################################   | ETA:  0:00:13
Adding changed files:  94% |#################################   | ETA:  0:00:13
Adding changed files:  94% |##################################  | ETA:  0:00:13
Adding changed files:  94% |##################################  | ETA:  0:00:12
Adding changed files:  94% |##################################  | ETA:  0:00:12
Adding changed files:  95% |##################################  | ETA:  0:00:11
Adding changed files:  95% |##################################  | ETA:  0:00:11
Adding changed files:  95% |##################################  | ETA:  0:00:11
Adding changed files:  95% |##################################  | ETA:  0:00:10
Adding changed files:  95% |##################################  | ETA:  0:00:10
Adding changed files:  95% |##################################  | ETA:  0:00:09
Adding changed files:  96% |##################################  | ETA:  0:00:09
Adding changed files:  96% |##################################  | ETA:  0:00:09
Adding changed files:  96% |##################################  | ETA:  0:00:08
Adding changed files:  96% |##################################  | ETA:  0:00:08
Adding changed files:  96% |##################################  | ETA:  0:00:07
Adding changed files:  96% |##################################  | ETA:  0:00:07
Adding changed files:  97% |##################################  | ETA:  0:00:07
Adding changed files:  97% |################################### | ETA:  0:00:06
Adding changed files:  97% |################################### | ETA:  0:00:06
Adding changed files:  97% |################################### | ETA:  0:00:05
Adding changed files:  97% |################################### | ETA:  0:00:05
Adding changed files:  97% |################################### | ETA:  0:00:04
Adding changed files:  98% |################################### | ETA:  0:00:04
Adding changed files:  98% |################################### | ETA:  0:00:04
Adding changed files:  98% |################################### | ETA:  0:00:03
Adding changed files:  98% |################################### | ETA:  0:00:03
Adding changed files:  98% |################################### | ETA:  0:00:02
Adding changed files:  98% |################################### | ETA:  0:00:02
Adding changed files:  99% |################################### | ETA:  0:00:02
Adding changed files:  99% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:04:05
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.74.1-src.tar.xz;name=rust...
INFO: Rebasing devtool onto 763899a76db13f62c6b066e608a131ddabed1057
WARNING: Command 'git rebase 763899a76db13f62c6b066e608a131ddabed1057' failed:
Auto-merging compiler/rustc_codegen_llvm/src/context.rs
CONFLICT (content): Merge conflict in compiler/rustc_codegen_llvm/src/context.rs

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libstd-rs
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libstd-rs/libstd-rs_1.74.1.bb
WARNING: Version is pinned to 1.71% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4945934185616908675==--

