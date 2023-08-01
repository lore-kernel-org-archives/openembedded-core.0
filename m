Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED26FC07E8A
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.17589.1690907328808840636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cIBfQIGP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LCg8IFzn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189b1ee42ab-38157fa6-1134-46a0-b905-2d2643337965-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907329;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=IsJyhu0uUXT+W3wTnxERBaUCL5WpfcWNJr0BFGhwaek=;
	b=cIBfQIGP+6IfYMnUucXP+1UpnbKk4ZsOZ8EZ/lxK1MH4HbkYe/4qX1WSCHRiJRCQ
	wF0Zgo0VV9VTxPapoS3nXnCzIDhSneqxvxp5IqFsNPgXzUS/8+2bkh+7dSa9yfqkd0O
	xtK2Dwd7Hba5EtAv7uH7Cd7UajMZExFi1KkA/zFM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907329;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=IsJyhu0uUXT+W3wTnxERBaUCL5WpfcWNJr0BFGhwaek=;
	b=LCg8IFznFi/vS2Hyb7wgl7d2JOM8yyMdQf/ZzT520zsG7cDbgm7/x4wk8hS7BW1C
	lHPE6fk8SLqaQNQUkm/6rMNYz74kcSRqw17vFci5z95usitCvZFdTAdVi2+m/0s8uc0
	h7wSS1y6gJmC+DC3PRokCyOMi92ZU0M23CgEm7Ug=
Content-Type: multipart/mixed; boundary="===============2968647024310375077=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.27.1 FAILED
Message-ID: <01010189b1ee42ab-38157fa6-1134-46a0-b905-2d2643337965-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185269

--===============2968647024310375077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.27.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cmake -V 3.27.1
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:38:14.420027)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1321cb71a958ec07abee45ad2b292c2b692f5334"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 30 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1321cb71a958ec07abee45ad2b292c2b692f5334"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:01:17
Adding changed files:   0% |                                    | ETA:  0:00:54
Adding changed files:   0% |                                    | ETA:  0:00:47
Adding changed files:   0% |                                    | ETA:  0:00:44
Adding changed files:   1% |                                    | ETA:  0:00:42
Adding changed files:   1% |                                    | ETA:  0:00:40
Adding changed files:   1% |                                    | ETA:  0:00:39
Adding changed files:   1% |                                    | ETA:  0:00:38
Adding changed files:   1% |                                    | ETA:  0:00:37
Adding changed files:   2% |                                    | ETA:  0:00:37
Adding changed files:   2% |                                    | ETA:  0:00:36
Adding changed files:   2% |                                    | ETA:  0:00:36
Adding changed files:   2% |#                                   | ETA:  0:00:35
Adding changed files:   3% |#                                   | ETA:  0:00:35
Adding changed files:   3% |#                                   | ETA:  0:00:35
Adding changed files:   3% |#                                   | ETA:  0:00:34
Adding changed files:   3% |#                                   | ETA:  0:00:34
Adding changed files:   3% |#                                   | ETA:  0:00:34
Adding changed files:   4% |#                                   | ETA:  0:00:33
Adding changed files:   4% |#                                   | ETA:  0:00:33
Adding changed files:   4% |#                                   | ETA:  0:00:33
Adding changed files:   4% |#                                   | ETA:  0:00:33
Adding changed files:   5% |#                                   | ETA:  0:00:33
Adding changed files:   5% |#                                   | ETA:  0:00:33
Adding changed files:   5% |#                                   | ETA:  0:00:33
Adding changed files:   5% |##                                  | ETA:  0:00:33
Adding changed files:   5% |##                                  | ETA:  0:00:33
Adding changed files:   6% |##                                  | ETA:  0:00:33
Adding changed files:   6% |##                                  | ETA:  0:00:33
Adding changed files:   6% |##                                  | ETA:  0:00:33
Adding changed files:   6% |##                                  | ETA:  0:00:33
Adding changed files:   7% |##                                  | ETA:  0:00:32
Adding changed files:   7% |##                                  | ETA:  0:00:32
Adding changed files:   7% |##                                  | ETA:  0:00:32
Adding changed files:   7% |##                                  | ETA:  0:00:32
Adding changed files:   7% |##                                  | ETA:  0:00:32
Adding changed files:   8% |##                                  | ETA:  0:00:32
Adding changed files:   8% |###                                 | ETA:  0:00:32
Adding changed files:   8% |###                                 | ETA:  0:00:32
Adding changed files:   8% |###                                 | ETA:  0:00:32
Adding changed files:   9% |###                                 | ETA:  0:00:32
Adding changed files:   9% |###                                 | ETA:  0:00:33
Adding changed files:   9% |###                                 | ETA:  0:00:33
Adding changed files:   9% |###                                 | ETA:  0:00:33
Adding changed files:   9% |###                                 | ETA:  0:00:33
Adding changed files:  10% |###                                 | ETA:  0:00:33
Adding changed files:  10% |###                                 | ETA:  0:00:33
Adding changed files:  10% |###                                 | ETA:  0:00:33
Adding changed files:  10% |###                                 | ETA:  0:00:32
Adding changed files:  11% |###                                 | ETA:  0:00:32
Adding changed files:  11% |####                                | ETA:  0:00:32
Adding changed files:  11% |####                                | ETA:  0:00:32
Adding changed files:  11% |####                                | ETA:  0:00:32
Adding changed files:  11% |####                                | ETA:  0:00:32
Adding changed files:  12% |####                                | ETA:  0:00:32
Adding changed files:  12% |####                                | ETA:  0:00:32
Adding changed files:  12% |####                                | ETA:  0:00:32
Adding changed files:  12% |####                                | ETA:  0:00:32
Adding changed files:  13% |####                                | ETA:  0:00:32
Adding changed files:  13% |####                                | ETA:  0:00:32
Adding changed files:  13% |####                                | ETA:  0:00:32
Adding changed files:  13% |####                                | ETA:  0:00:32
Adding changed files:  13% |#####                               | ETA:  0:00:32
Adding changed files:  14% |#####                               | ETA:  0:00:32
Adding changed files:  14% |#####                               | ETA:  0:00:31
Adding changed files:  14% |#####                               | ETA:  0:00:31
Adding changed files:  14% |#####                               | ETA:  0:00:31
Adding changed files:  15% |#####                               | ETA:  0:00:31
Adding changed files:  15% |#####                               | ETA:  0:00:31
Adding changed files:  15% |#####                               | ETA:  0:00:31
Adding changed files:  15% |#####                               | ETA:  0:00:31
Adding changed files:  15% |#####                               | ETA:  0:00:31
Adding changed files:  16% |#####                               | ETA:  0:00:31
Adding changed files:  16% |#####                               | ETA:  0:00:31
Adding changed files:  16% |#####                               | ETA:  0:00:31
Adding changed files:  16% |######                              | ETA:  0:00:31
Adding changed files:  17% |######                              | ETA:  0:00:31
Adding changed files:  17% |######                              | ETA:  0:00:31
Adding changed files:  17% |######                              | ETA:  0:00:31
Adding changed files:  17% |######                              | ETA:  0:00:30
Adding changed files:  17% |######                              | ETA:  0:00:30
Adding changed files:  18% |######                              | ETA:  0:00:30
Adding changed files:  18% |######                              | ETA:  0:00:30
Adding changed files:  18% |######                              | ETA:  0:00:30
Adding changed files:  18% |######                              | ETA:  0:00:30
Adding changed files:  19% |######                              | ETA:  0:00:30
Adding changed files:  19% |######                              | ETA:  0:00:30
Adding changed files:  19% |#######                             | ETA:  0:00:30
Adding changed files:  19% |#######                             | ETA:  0:00:30
Adding changed files:  19% |#######                             | ETA:  0:00:30
Adding changed files:  20% |#######                             | ETA:  0:00:30
Adding changed files:  20% |#######                             | ETA:  0:00:30
Adding changed files:  20% |#######                             | ETA:  0:00:29
Adding changed files:  20% |#######                             | ETA:  0:00:29
Adding changed files:  21% |#######                             | ETA:  0:00:29
Adding changed files:  21% |#######                             | ETA:  0:00:29
Adding changed files:  21% |#######                             | ETA:  0:00:29
Adding changed files:  21% |#######                             | ETA:  0:00:29
Adding changed files:  21% |#######                             | ETA:  0:00:29
Adding changed files:  22% |#######                             | ETA:  0:00:29
Adding changed files:  22% |########                            | ETA:  0:00:29
Adding changed files:  22% |########                            | ETA:  0:00:29
Adding changed files:  22% |########                            | ETA:  0:00:29
Adding changed files:  23% |########                            | ETA:  0:00:29
Adding changed files:  23% |########                            | ETA:  0:00:28
Adding changed files:  23% |########                            | ETA:  0:00:28
Adding changed files:  23% |########                            | ETA:  0:00:28
Adding changed files:  23% |########                            | ETA:  0:00:28
Adding changed files:  24% |########                            | ETA:  0:00:28
Adding changed files:  24% |########                            | ETA:  0:00:28
Adding changed files:  24% |########                            | ETA:  0:00:28
Adding changed files:  24% |########                            | ETA:  0:00:28
Adding changed files:  25% |#########                           | ETA:  0:00:28
Adding changed files:  25% |#########                           | ETA:  0:00:28
Adding changed files:  25% |#########                           | ETA:  0:00:28
Adding changed files:  25% |#########                           | ETA:  0:00:28
Adding changed files:  25% |#########                           | ETA:  0:00:28
Adding changed files:  26% |#########                           | ETA:  0:00:27
Adding changed files:  26% |#########                           | ETA:  0:00:27
Adding changed files:  26% |#########                           | ETA:  0:00:27
Adding changed files:  26% |#########                           | ETA:  0:00:27
Adding changed files:  27% |#########                           | ETA:  0:00:27
Adding changed files:  27% |#########                           | ETA:  0:00:27
Adding changed files:  27% |#########                           | ETA:  0:00:27
Adding changed files:  27% |#########                           | ETA:  0:00:27
Adding changed files:  27% |##########                          | ETA:  0:00:27
Adding changed files:  28% |##########                          | ETA:  0:00:27
Adding changed files:  28% |##########                          | ETA:  0:00:27
Adding changed files:  28% |##########                          | ETA:  0:00:27
Adding changed files:  28% |##########                          | ETA:  0:00:27
Adding changed files:  28% |##########                          | ETA:  0:00:27
Adding changed files:  29% |##########                          | ETA:  0:00:26
Adding changed files:  29% |##########                          | ETA:  0:00:26
Adding changed files:  29% |##########                          | ETA:  0:00:26
Adding changed files:  29% |##########                          | ETA:  0:00:26
Adding changed files:  30% |##########                          | ETA:  0:00:26
Adding changed files:  30% |##########                          | ETA:  0:00:26
Adding changed files:  30% |##########                          | ETA:  0:00:26
Adding changed files:  30% |###########                         | ETA:  0:00:26
Adding changed files:  30% |###########                         | ETA:  0:00:26
Adding changed files:  31% |###########                         | ETA:  0:00:26
Adding changed files:  31% |###########                         | ETA:  0:00:26
Adding changed files:  31% |###########                         | ETA:  0:00:26
Adding changed files:  31% |###########                         | ETA:  0:00:26
Adding changed files:  32% |###########                         | ETA:  0:00:26
Adding changed files:  32% |###########                         | ETA:  0:00:25
Adding changed files:  32% |###########                         | ETA:  0:00:25
Adding changed files:  32% |###########                         | ETA:  0:00:25
Adding changed files:  32% |###########                         | ETA:  0:00:25
Adding changed files:  33% |###########                         | ETA:  0:00:25
Adding changed files:  33% |############                        | ETA:  0:00:25
Adding changed files:  33% |############                        | ETA:  0:00:25
Adding changed files:  33% |############                        | ETA:  0:00:25
Adding changed files:  34% |############                        | ETA:  0:00:25
Adding changed files:  34% |############                        | ETA:  0:00:25
Adding changed files:  34% |############                        | ETA:  0:00:25
Adding changed files:  34% |############                        | ETA:  0:00:25
Adding changed files:  34% |############                        | ETA:  0:00:25
Adding changed files:  35% |############                        | ETA:  0:00:25
Adding changed files:  35% |############                        | ETA:  0:00:24
Adding changed files:  35% |############                        | ETA:  0:00:24
Adding changed files:  35% |############                        | ETA:  0:00:24
Adding changed files:  36% |############                        | ETA:  0:00:24
Adding changed files:  36% |#############                       | ETA:  0:00:24
Adding changed files:  36% |#############                       | ETA:  0:00:24
Adding changed files:  36% |#############                       | ETA:  0:00:24
Adding changed files:  36% |#############                       | ETA:  0:00:24
Adding changed files:  37% |#############                       | ETA:  0:00:24
Adding changed files:  37% |#############                       | ETA:  0:00:24
Adding changed files:  37% |#############                       | ETA:  0:00:24
Adding changed files:  37% |#############                       | ETA:  0:00:24
Adding changed files:  38% |#############                       | ETA:  0:00:24
Adding changed files:  38% |#############                       | ETA:  0:00:24
Adding changed files:  38% |#############                       | ETA:  0:00:23
Adding changed files:  38% |#############                       | ETA:  0:00:23
Adding changed files:  38% |##############                      | ETA:  0:00:23
Adding changed files:  39% |##############                      | ETA:  0:00:23
Adding changed files:  39% |##############                      | ETA:  0:00:23
Adding changed files:  39% |##############                      | ETA:  0:00:23
Adding changed files:  39% |##############                      | ETA:  0:00:23
Adding changed files:  40% |##############                      | ETA:  0:00:23
Adding changed files:  40% |##############                      | ETA:  0:00:23
Adding changed files:  40% |##############                      | ETA:  0:00:23
Adding changed files:  40% |##############                      | ETA:  0:00:23
Adding changed files:  40% |##############                      | ETA:  0:00:23
Adding changed files:  41% |##############                      | ETA:  0:00:23
Adding changed files:  41% |##############                      | ETA:  0:00:23
Adding changed files:  41% |##############                      | ETA:  0:00:22
Adding changed files:  41% |###############                     | ETA:  0:00:22
Adding changed files:  42% |###############                     | ETA:  0:00:22
Adding changed files:  42% |###############                     | ETA:  0:00:22
Adding changed files:  42% |###############                     | ETA:  0:00:22
Adding changed files:  42% |###############                     | ETA:  0:00:22
Adding changed files:  42% |###############                     | ETA:  0:00:22
Adding changed files:  43% |###############                     | ETA:  0:00:22
Adding changed files:  43% |###############                     | ETA:  0:00:22
Adding changed files:  43% |###############                     | ETA:  0:00:22
Adding changed files:  43% |###############                     | ETA:  0:00:22
Adding changed files:  44% |###############                     | ETA:  0:00:22
Adding changed files:  44% |###############                     | ETA:  0:00:22
Adding changed files:  44% |################                    | ETA:  0:00:22
Adding changed files:  44% |################                    | ETA:  0:00:21
Adding changed files:  44% |################                    | ETA:  0:00:21
Adding changed files:  45% |################                    | ETA:  0:00:21
Adding changed files:  45% |################                    | ETA:  0:00:21
Adding changed files:  45% |################                    | ETA:  0:00:21
Adding changed files:  45% |################                    | ETA:  0:00:21
Adding changed files:  46% |################                    | ETA:  0:00:21
Adding changed files:  46% |################                    | ETA:  0:00:21
Adding changed files:  46% |################                    | ETA:  0:00:21
Adding changed files:  46% |################                    | ETA:  0:00:21
Adding changed files:  46% |################                    | ETA:  0:00:21
Adding changed files:  47% |################                    | ETA:  0:00:21
Adding changed files:  47% |#################                   | ETA:  0:00:21
Adding changed files:  47% |#################                   | ETA:  0:00:21
Adding changed files:  47% |#################                   | ETA:  0:00:21
Adding changed files:  48% |#################                   | ETA:  0:00:20
Adding changed files:  48% |#################                   | ETA:  0:00:20
Adding changed files:  48% |#################                   | ETA:  0:00:20
Adding changed files:  48% |#################                   | ETA:  0:00:20
Adding changed files:  48% |#################                   | ETA:  0:00:20
Adding changed files:  49% |#################                   | ETA:  0:00:20
Adding changed files:  49% |#################                   | ETA:  0:00:20
Adding changed files:  49% |#################                   | ETA:  0:00:20
Adding changed files:  49% |#################                   | ETA:  0:00:20
Adding changed files:  50% |##################                  | ETA:  0:00:20
Adding changed files:  50% |##################                  | ETA:  0:00:20
Adding changed files:  50% |##################                  | ETA:  0:00:20
Adding changed files:  50% |##################                  | ETA:  0:00:20
Adding changed files:  50% |##################                  | ETA:  0:00:20
Adding changed files:  51% |##################                  | ETA:  0:00:20
Adding changed files:  51% |##################                  | ETA:  0:00:20
Adding changed files:  51% |##################                  | ETA:  0:00:20
Adding changed files:  51% |##################                  | ETA:  0:00:20
Adding changed files:  52% |##################                  | ETA:  0:00:19
Adding changed files:  52% |##################                  | ETA:  0:00:19
Adding changed files:  52% |##################                  | ETA:  0:00:19
Adding changed files:  52% |##################                  | ETA:  0:00:19
Adding changed files:  52% |###################                 | ETA:  0:00:19
Adding changed files:  53% |###################                 | ETA:  0:00:19
Adding changed files:  53% |###################                 | ETA:  0:00:19
Adding changed files:  53% |###################                 | ETA:  0:00:19
Adding changed files:  53% |###################                 | ETA:  0:00:19
Adding changed files:  54% |###################                 | ETA:  0:00:19
Adding changed files:  54% |###################                 | ETA:  0:00:19
Adding changed files:  54% |###################                 | ETA:  0:00:19
Adding changed files:  54% |###################                 | ETA:  0:00:19
Adding changed files:  54% |###################                 | ETA:  0:00:19
Adding changed files:  55% |###################                 | ETA:  0:00:18
Adding changed files:  55% |###################                 | ETA:  0:00:18
Adding changed files:  55% |####################                | ETA:  0:00:18
Adding changed files:  55% |####################                | ETA:  0:00:18
Adding changed files:  56% |####################                | ETA:  0:00:18
Adding changed files:  56% |####################                | ETA:  0:00:18
Adding changed files:  56% |####################                | ETA:  0:00:18
Adding changed files:  56% |####################                | ETA:  0:00:18
Adding changed files:  56% |####################                | ETA:  0:00:18
Adding changed files:  57% |####################                | ETA:  0:00:18
Adding changed files:  57% |####################                | ETA:  0:00:18
Adding changed files:  57% |####################                | ETA:  0:00:18
Adding changed files:  57% |####################                | ETA:  0:00:18
Adding changed files:  57% |####################                | ETA:  0:00:18
Adding changed files:  58% |####################                | ETA:  0:00:17
Adding changed files:  58% |#####################               | ETA:  0:00:17
Adding changed files:  58% |#####################               | ETA:  0:00:17
Adding changed files:  58% |#####################               | ETA:  0:00:17
Adding changed files:  59% |#####################               | ETA:  0:00:17
Adding changed files:  59% |#####################               | ETA:  0:00:17
Adding changed files:  59% |#####################               | ETA:  0:00:17
Adding changed files:  59% |#####################               | ETA:  0:00:17
Adding changed files:  59% |#####################               | ETA:  0:00:17
Adding changed files:  60% |#####################               | ETA:  0:00:17
Adding changed files:  60% |#####################               | ETA:  0:00:17
Adding changed files:  60% |#####################               | ETA:  0:00:17
Adding changed files:  60% |#####################               | ETA:  0:00:16
Adding changed files:  61% |#####################               | ETA:  0:00:16
Adding changed files:  61% |######################              | ETA:  0:00:16
Adding changed files:  61% |######################              | ETA:  0:00:16
Adding changed files:  61% |######################              | ETA:  0:00:16
Adding changed files:  61% |######################              | ETA:  0:00:16
Adding changed files:  62% |######################              | ETA:  0:00:16
Adding changed files:  62% |######################              | ETA:  0:00:16
Adding changed files:  62% |######################              | ETA:  0:00:16
Adding changed files:  62% |######################              | ETA:  0:00:16
Adding changed files:  63% |######################              | ETA:  0:00:16
Adding changed files:  63% |######################              | ETA:  0:00:16
Adding changed files:  63% |######################              | ETA:  0:00:15
Adding changed files:  63% |######################              | ETA:  0:00:15
Adding changed files:  63% |#######################             | ETA:  0:00:15
Adding changed files:  64% |#######################             | ETA:  0:00:15
Adding changed files:  64% |#######################             | ETA:  0:00:15
Adding changed files:  64% |#######################             | ETA:  0:00:15
Adding changed files:  64% |#######################             | ETA:  0:00:15
Adding changed files:  65% |#######################             | ETA:  0:00:15
Adding changed files:  65% |#######################             | ETA:  0:00:15
Adding changed files:  65% |#######################             | ETA:  0:00:15
Adding changed files:  65% |#######################             | ETA:  0:00:15
Adding changed files:  65% |#######################             | ETA:  0:00:14
Adding changed files:  66% |#######################             | ETA:  0:00:14
Adding changed files:  66% |#######################             | ETA:  0:00:14
Adding changed files:  66% |#######################             | ETA:  0:00:14
Adding changed files:  66% |########################            | ETA:  0:00:14
Adding changed files:  67% |########################            | ETA:  0:00:14
Adding changed files:  67% |########################            | ETA:  0:00:14
Adding changed files:  67% |########################            | ETA:  0:00:14
Adding changed files:  67% |########################            | ETA:  0:00:14
Adding changed files:  67% |########################            | ETA:  0:00:14
Adding changed files:  68% |########################            | ETA:  0:00:14
Adding changed files:  68% |########################            | ETA:  0:00:13
Adding changed files:  68% |########################            | ETA:  0:00:13
Adding changed files:  68% |########################            | ETA:  0:00:13
Adding changed files:  69% |########################            | ETA:  0:00:13
Adding changed files:  69% |########################            | ETA:  0:00:13
Adding changed files:  69% |#########################           | ETA:  0:00:13
Adding changed files:  69% |#########################           | ETA:  0:00:13
Adding changed files:  69% |#########################           | ETA:  0:00:13
Adding changed files:  70% |#########################           | ETA:  0:00:13
Adding changed files:  70% |#########################           | ETA:  0:00:13
Adding changed files:  70% |#########################           | ETA:  0:00:13
Adding changed files:  70% |#########################           | ETA:  0:00:12
Adding changed files:  71% |#########################           | ETA:  0:00:12
Adding changed files:  71% |#########################           | ETA:  0:00:12
Adding changed files:  71% |#########################           | ETA:  0:00:12
Adding changed files:  71% |#########################           | ETA:  0:00:12
Adding changed files:  71% |#########################           | ETA:  0:00:12
Adding changed files:  72% |#########################           | ETA:  0:00:12
Adding changed files:  72% |##########################          | ETA:  0:00:12
Adding changed files:  72% |##########################          | ETA:  0:00:12
Adding changed files:  72% |##########################          | ETA:  0:00:12
Adding changed files:  73% |##########################          | ETA:  0:00:11
Adding changed files:  73% |##########################          | ETA:  0:00:11
Adding changed files:  73% |##########################          | ETA:  0:00:11
Adding changed files:  73% |##########################          | ETA:  0:00:11
Adding changed files:  73% |##########################          | ETA:  0:00:11
Adding changed files:  74% |##########################          | ETA:  0:00:11
Adding changed files:  74% |##########################          | ETA:  0:00:11
Adding changed files:  74% |##########################          | ETA:  0:00:11
Adding changed files:  74% |##########################          | ETA:  0:00:11
Adding changed files:  75% |###########################         | ETA:  0:00:11
Adding changed files:  75% |###########################         | ETA:  0:00:10
Adding changed files:  75% |###########################         | ETA:  0:00:10
Adding changed files:  75% |###########################         | ETA:  0:00:10
Adding changed files:  75% |###########################         | ETA:  0:00:10
Adding changed files:  76% |###########################         | ETA:  0:00:10
Adding changed files:  76% |###########################         | ETA:  0:00:10
Adding changed files:  76% |###########################         | ETA:  0:00:10
Adding changed files:  76% |###########################         | ETA:  0:00:10
Adding changed files:  77% |###########################         | ETA:  0:00:10
Adding changed files:  77% |###########################         | ETA:  0:00:10
Adding changed files:  77% |###########################         | ETA:  0:00:09
Adding changed files:  77% |###########################         | ETA:  0:00:09
Adding changed files:  77% |############################        | ETA:  0:00:09
Adding changed files:  78% |############################        | ETA:  0:00:09
Adding changed files:  78% |############################        | ETA:  0:00:09
Adding changed files:  78% |############################        | ETA:  0:00:09
Adding changed files:  78% |############################        | ETA:  0:00:09
Adding changed files:  79% |############################        | ETA:  0:00:09
Adding changed files:  79% |############################        | ETA:  0:00:09
Adding changed files:  79% |############################        | ETA:  0:00:09
Adding changed files:  79% |############################        | ETA:  0:00:09
Adding changed files:  79% |############################        | ETA:  0:00:08
Adding changed files:  80% |############################        | ETA:  0:00:08
Adding changed files:  80% |############################        | ETA:  0:00:08
Adding changed files:  80% |#############################       | ETA:  0:00:08
Adding changed files:  80% |#############################       | ETA:  0:00:08
Adding changed files:  81% |#############################       | ETA:  0:00:08
Adding changed files:  81% |#############################       | ETA:  0:00:08
Adding changed files:  81% |#############################       | ETA:  0:00:08
Adding changed files:  81% |#############################       | ETA:  0:00:08
Adding changed files:  81% |#############################       | ETA:  0:00:08
Adding changed files:  82% |#############################       | ETA:  0:00:07
Adding changed files:  82% |#############################       | ETA:  0:00:07
Adding changed files:  82% |#############################       | ETA:  0:00:07
Adding changed files:  82% |#############################       | ETA:  0:00:07
Adding changed files:  83% |#############################       | ETA:  0:00:07
Adding changed files:  83% |#############################       | ETA:  0:00:07
Adding changed files:  83% |##############################      | ETA:  0:00:07
Adding changed files:  83% |##############################      | ETA:  0:00:07
Adding changed files:  83% |##############################      | ETA:  0:00:07
Adding changed files:  84% |##############################      | ETA:  0:00:07
Adding changed files:  84% |##############################      | ETA:  0:00:06
Adding changed files:  84% |##############################      | ETA:  0:00:06
Adding changed files:  84% |##############################      | ETA:  0:00:06
Adding changed files:  85% |##############################      | ETA:  0:00:06
Adding changed files:  85% |##############################      | ETA:  0:00:06
Adding changed files:  85% |##############################      | ETA:  0:00:06
Adding changed files:  85% |##############################      | ETA:  0:00:06
Adding changed files:  85% |##############################      | ETA:  0:00:06
Adding changed files:  86% |###############################     | ETA:  0:00:06
Adding changed files:  86% |###############################     | ETA:  0:00:06
Adding changed files:  86% |###############################     | ETA:  0:00:05
Adding changed files:  86% |###############################     | ETA:  0:00:05
Adding changed files:  86% |###############################     | ETA:  0:00:05
Adding changed files:  87% |###############################     | ETA:  0:00:05
Adding changed files:  87% |###############################     | ETA:  0:00:05
Adding changed files:  87% |###############################     | ETA:  0:00:05
Adding changed files:  87% |###############################     | ETA:  0:00:05
Adding changed files:  88% |###############################     | ETA:  0:00:05
Adding changed files:  88% |###############################     | ETA:  0:00:05
Adding changed files:  88% |###############################     | ETA:  0:00:05
Adding changed files:  88% |###############################     | ETA:  0:00:04
Adding changed files:  88% |################################    | ETA:  0:00:04
Adding changed files:  89% |################################    | ETA:  0:00:04
Adding changed files:  89% |################################    | ETA:  0:00:04
Adding changed files:  89% |################################    | ETA:  0:00:04
Adding changed files:  89% |################################    | ETA:  0:00:04
Adding changed files:  90% |################################    | ETA:  0:00:04
Adding changed files:  90% |################################    | ETA:  0:00:04
Adding changed files:  90% |################################    | ETA:  0:00:04
Adding changed files:  90% |################################    | ETA:  0:00:04
Adding changed files:  90% |################################    | ETA:  0:00:03
Adding changed files:  91% |################################    | ETA:  0:00:03
Adding changed files:  91% |################################    | ETA:  0:00:03
Adding changed files:  91% |################################    | ETA:  0:00:03
Adding changed files:  91% |#################################   | ETA:  0:00:03
Adding changed files:  92% |#################################   | ETA:  0:00:03
Adding changed files:  92% |#################################   | ETA:  0:00:03
Adding changed files:  92% |#################################   | ETA:  0:00:03
Adding changed files:  92% |#################################   | ETA:  0:00:03
Adding changed files:  92% |#################################   | ETA:  0:00:03
Adding changed files:  93% |#################################   | ETA:  0:00:02
Adding changed files:  93% |#################################   | ETA:  0:00:02
Adding changed files:  93% |#################################   | ETA:  0:00:02
Adding changed files:  93% |#################################   | ETA:  0:00:02
Adding changed files:  94% |#################################   | ETA:  0:00:02
Adding changed files:  94% |#################################   | ETA:  0:00:02
Adding changed files:  94% |##################################  | ETA:  0:00:02
Adding changed files:  94% |##################################  | ETA:  0:00:02
Adding changed files:  94% |##################################  | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  97% |##################################  | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:43

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://cmake.org/files/v3.27/cmake-3.27.1.tar.gz...
INFO: Rebasing devtool onto 114286d83143c5fc4d81711c9033fec84e683684
INFO: Rebasing devtool-override-class-nativesdk onto 114286d83143c5fc4d81711c9033fec84e683684
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 349, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 565, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 473, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/cmake/Copyright.txt'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2968647024310375077==--

