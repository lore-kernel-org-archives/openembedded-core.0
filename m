Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1833.1792823002329842721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iVwKoUgD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GSe5aKIH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a16c940120-b2007b0e-09c0-49bf-8b25-0730fe9afcfb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792823001;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=yBs9YNlZjvb4zUiwTXZYBlO/O3H81ASEIWa/YSFz4M0=;
	b=iVwKoUgDZlJic/dG9Uu0Jkytd/rMlUA8cij3lwtMmCJbFMwv08SLLHbS7o0/IxES
	O/LARtXNaT/AlOYbavUqzmGNfdJ1wLiVKCflkio1X6lQTMj/HGSvvu/OaIqi5tzfSLv
	V5wgBzUO0AfYTa5y7/2pYV3wiIf1Bz23CDTVQUAo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792823001;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=yBs9YNlZjvb4zUiwTXZYBlO/O3H81ASEIWa/YSFz4M0=;
	b=GSe5aKIHBwwRRGG+YL6i/zooT7NLD1ZGn/mdRe1ISk/zCbFA48hTBtbbmYzxtHdj
	3S76sqmHcxgi8PNjehXyCq+es39PijJ8PUXnvXGocHdrXIBYHNNZgtqoVfhIAH2Hj3c
	8SMq72Xu87+94Ftqo6R3DZCv+Gw0YJMYNmAJ4qVs=
Content-Type: multipart/mixed; boundary="===============9187149634313765075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.54.2 FAILED
Message-ID: <010101a16c940120-b2007b0e-09c0-49bf-8b25-0730fe9afcfb-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248583

--===============9187149634313765075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *webkitgtk* to *2.54.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe webkitgtk failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1996 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-f68823c959317c20a1158e8457d0008fdd754299"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f68823c959317c20a1158e8457d0008fdd754299"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
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
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1997 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-f68823c959317c20a1158e8457d0008fdd754299"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f68823c959317c20a1158e8457d0008fdd754299"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
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
Adding changed files:   0% |                                    | ETA:  0:00:53
Adding changed files:   0% |                                    | ETA:  0:00:36
Adding changed files:   1% |                                    | ETA:  0:00:31
Adding changed files:   1% |                                    | ETA:  0:00:29
Adding changed files:   2% |                                    | ETA:  0:00:27
Adding changed files:   2% |                                    | ETA:  0:00:25
Adding changed files:   3% |#                                   | ETA:  0:00:25
Adding changed files:   3% |#                                   | ETA:  0:00:24
Adding changed files:   3% |#                                   | ETA:  0:00:23
Adding changed files:   4% |#                                   | ETA:  0:00:23
Adding changed files:   4% |#                                   | ETA:  0:00:22
Adding changed files:   5% |#                                   | ETA:  0:00:22
Adding changed files:   5% |##                                  | ETA:  0:00:22
Adding changed files:   6% |##                                  | ETA:  0:00:21
Adding changed files:   6% |##                                  | ETA:  0:00:21
Adding changed files:   6% |##                                  | ETA:  0:00:21
Adding changed files:   7% |##                                  | ETA:  0:00:21
Adding changed files:   7% |##                                  | ETA:  0:00:20
Adding changed files:   8% |##                                  | ETA:  0:00:20
Adding changed files:   8% |###                                 | ETA:  0:00:22
Adding changed files:   9% |###                                 | ETA:  0:00:21
Adding changed files:   9% |###                                 | ETA:  0:00:21
Adding changed files:   9% |###                                 | ETA:  0:00:21
Adding changed files:  10% |###                                 | ETA:  0:00:21
Adding changed files:  10% |###                                 | ETA:  0:00:20
Adding changed files:  11% |####                                | ETA:  0:00:20
Adding changed files:  11% |####                                | ETA:  0:00:20
Adding changed files:  12% |####                                | ETA:  0:00:20
Adding changed files:  12% |####                                | ETA:  0:00:20
Adding changed files:  13% |####                                | ETA:  0:00:20
Adding changed files:  13% |####                                | ETA:  0:00:20
Adding changed files:  13% |####                                | ETA:  0:00:20
Adding changed files:  14% |#####                               | ETA:  0:00:19
Adding changed files:  14% |#####                               | ETA:  0:00:19
Adding changed files:  15% |#####                               | ETA:  0:00:19
Adding changed files:  15% |#####                               | ETA:  0:00:19
Adding changed files:  16% |#####                               | ETA:  0:00:19
Adding changed files:  16% |#####                               | ETA:  0:00:18
Adding changed files:  16% |######                              | ETA:  0:00:18
Adding changed files:  17% |######                              | ETA:  0:00:18
Adding changed files:  17% |######                              | ETA:  0:00:18
Adding changed files:  18% |######                              | ETA:  0:00:18
Adding changed files:  18% |######                              | ETA:  0:00:18
Adding changed files:  19% |######                              | ETA:  0:00:17
Adding changed files:  19% |#######                             | ETA:  0:00:17
Adding changed files:  19% |#######                             | ETA:  0:00:17
Adding changed files:  20% |#######                             | ETA:  0:00:17
Adding changed files:  20% |#######                             | ETA:  0:00:17
Adding changed files:  21% |#######                             | ETA:  0:00:17
Adding changed files:  21% |#######                             | ETA:  0:00:17
Adding changed files:  22% |#######                             | ETA:  0:00:16
Adding changed files:  22% |########                            | ETA:  0:00:16
Adding changed files:  22% |########                            | ETA:  0:00:16
Adding changed files:  23% |########                            | ETA:  0:00:16
Adding changed files:  23% |########                            | ETA:  0:00:16
Adding changed files:  24% |########                            | ETA:  0:00:16
Adding changed files:  24% |########                            | ETA:  0:00:16
Adding changed files:  25% |#########                           | ETA:  0:00:16
Adding changed files:  25% |#########                           | ETA:  0:00:16
Adding changed files:  26% |#########                           | ETA:  0:00:16
Adding changed files:  26% |#########                           | ETA:  0:00:16
Adding changed files:  26% |#########                           | ETA:  0:00:15
Adding changed files:  27% |#########                           | ETA:  0:00:15
Adding changed files:  27% |#########                           | ETA:  0:00:15
Adding changed files:  28% |##########                          | ETA:  0:00:15
Adding changed files:  28% |##########                          | ETA:  0:00:15
Adding changed files:  29% |##########                          | ETA:  0:00:15
Adding changed files:  29% |##########                          | ETA:  0:00:15
Adding changed files:  29% |##########                          | ETA:  0:00:15
Adding changed files:  30% |##########                          | ETA:  0:00:15
Adding changed files:  30% |###########                         | ETA:  0:00:15
Adding changed files:  31% |###########                         | ETA:  0:00:14
Adding changed files:  31% |###########                         | ETA:  0:00:14
Adding changed files:  32% |###########                         | ETA:  0:00:14
Adding changed files:  32% |###########                         | ETA:  0:00:14
Adding changed files:  32% |###########                         | ETA:  0:00:14
Adding changed files:  33% |############                        | ETA:  0:00:14
Adding changed files:  33% |############                        | ETA:  0:00:14
Adding changed files:  34% |############                        | ETA:  0:00:14
Adding changed files:  34% |############                        | ETA:  0:00:14
Adding changed files:  35% |############                        | ETA:  0:00:14
Adding changed files:  35% |############                        | ETA:  0:00:14
Adding changed files:  36% |############                        | ETA:  0:00:14
Adding changed files:  36% |#############                       | ETA:  0:00:13
Adding changed files:  36% |#############                       | ETA:  0:00:13
Adding changed files:  37% |#############                       | ETA:  0:00:13
Adding changed files:  37% |#############                       | ETA:  0:00:13
Adding changed files:  38% |#############                       | ETA:  0:00:13
Adding changed files:  38% |#############                       | ETA:  0:00:13
Adding changed files:  39% |##############                      | ETA:  0:00:13
Adding changed files:  39% |##############                      | ETA:  0:00:13
Adding changed files:  39% |##############                      | ETA:  0:00:13
Adding changed files:  40% |##############                      | ETA:  0:00:13
Adding changed files:  40% |##############                      | ETA:  0:00:13
Adding changed files:  41% |##############                      | ETA:  0:00:12
Adding changed files:  41% |##############                      | ETA:  0:00:12
Adding changed files:  42% |###############                     | ETA:  0:00:12
Adding changed files:  42% |###############                     | ETA:  0:00:12
Adding changed files:  42% |###############                     | ETA:  0:00:12
Adding changed files:  43% |###############                     | ETA:  0:00:12
Adding changed files:  43% |###############                     | ETA:  0:00:12
Adding changed files:  44% |###############                     | ETA:  0:00:12
Adding changed files:  44% |################                    | ETA:  0:00:12
Adding changed files:  45% |################                    | ETA:  0:00:12
Adding changed files:  45% |################                    | ETA:  0:00:11
Adding changed files:  45% |################                    | ETA:  0:00:11
Adding changed files:  46% |################                    | ETA:  0:00:11
Adding changed files:  46% |################                    | ETA:  0:00:11
Adding changed files:  47% |#################                   | ETA:  0:00:11
Adding changed files:  47% |#################                   | ETA:  0:00:11
Adding changed files:  48% |#################                   | ETA:  0:00:11
Adding changed files:  48% |#################                   | ETA:  0:00:11
Adding changed files:  49% |#################                   | ETA:  0:00:11
Adding changed files:  49% |#################                   | ETA:  0:00:11
Adding changed files:  49% |#################                   | ETA:  0:00:11
Adding changed files:  50% |##################                  | ETA:  0:00:11
Adding changed files:  50% |##################                  | ETA:  0:00:10
Adding changed files:  51% |##################                  | ETA:  0:00:10
Adding changed files:  51% |##################                  | ETA:  0:00:10
Adding changed files:  52% |##################                  | ETA:  0:00:10
Adding changed files:  52% |##################                  | ETA:  0:00:10
Adding changed files:  52% |###################                 | ETA:  0:00:10
Adding changed files:  53% |###################                 | ETA:  0:00:10
Adding changed files:  53% |###################                 | ETA:  0:00:10
Adding changed files:  54% |###################                 | ETA:  0:00:10
Adding changed files:  54% |###################                 | ETA:  0:00:10
Adding changed files:  55% |###################                 | ETA:  0:00:09
Adding changed files:  55% |###################                 | ETA:  0:00:09
Adding changed files:  55% |####################                | ETA:  0:00:09
Adding changed files:  56% |####################                | ETA:  0:00:09
Adding changed files:  56% |####################                | ETA:  0:00:09
Adding changed files:  57% |####################                | ETA:  0:00:09
Adding changed files:  57% |####################                | ETA:  0:00:09
Adding changed files:  58% |####################                | ETA:  0:00:09
Adding changed files:  58% |#####################               | ETA:  0:00:09
Adding changed files:  58% |#####################               | ETA:  0:00:09
Adding changed files:  59% |#####################               | ETA:  0:00:08
Adding changed files:  59% |#####################               | ETA:  0:00:08
Adding changed files:  60% |#####################               | ETA:  0:00:08
Adding changed files:  60% |#####################               | ETA:  0:00:08
Adding changed files:  61% |######################              | ETA:  0:00:08
Adding changed files:  61% |######################              | ETA:  0:00:08
Adding changed files:  62% |######################              | ETA:  0:00:08
Adding changed files:  62% |######################              | ETA:  0:00:08
Adding changed files:  62% |######################              | ETA:  0:00:08
Adding changed files:  63% |######################              | ETA:  0:00:08
Adding changed files:  63% |######################              | ETA:  0:00:08
Adding changed files:  64% |#######################             | ETA:  0:00:07
Adding changed files:  64% |#######################             | ETA:  0:00:07
Adding changed files:  65% |#######################             | ETA:  0:00:07
Adding changed files:  65% |#######################             | ETA:  0:00:07
Adding changed files:  65% |#######################             | ETA:  0:00:07
Adding changed files:  66% |#######################             | ETA:  0:00:07
Adding changed files:  66% |########################            | ETA:  0:00:07
Adding changed files:  67% |########################            | ETA:  0:00:07
Adding changed files:  67% |########################            | ETA:  0:00:07
Adding changed files:  68% |########################            | ETA:  0:00:07
Adding changed files:  68% |########################            | ETA:  0:00:06
Adding changed files:  68% |########################            | ETA:  0:00:06
Adding changed files:  69% |########################            | ETA:  0:00:06
Adding changed files:  69% |#########################           | ETA:  0:00:06
Adding changed files:  70% |#########################           | ETA:  0:00:06
Adding changed files:  70% |#########################           | ETA:  0:00:06
Adding changed files:  71% |#########################           | ETA:  0:00:06
Adding changed files:  71% |#########################           | ETA:  0:00:06
Adding changed files:  72% |#########################           | ETA:  0:00:06
Adding changed files:  72% |##########################          | ETA:  0:00:06
Adding changed files:  72% |##########################          | ETA:  0:00:06
Adding changed files:  73% |##########################          | ETA:  0:00:05
Adding changed files:  73% |##########################          | ETA:  0:00:05
Adding changed files:  74% |##########################          | ETA:  0:00:05
Adding changed files:  74% |##########################          | ETA:  0:00:05
Adding changed files:  75% |###########################         | ETA:  0:00:05
Adding changed files:  75% |###########################         | ETA:  0:00:05
Adding changed files:  75% |###########################         | ETA:  0:00:05
Adding changed files:  76% |###########################         | ETA:  0:00:05
Adding changed files:  76% |###########################         | ETA:  0:00:05
Adding changed files:  77% |###########################         | ETA:  0:00:05
Adding changed files:  77% |###########################         | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:04
Adding changed files:  79% |############################        | ETA:  0:00:04
Adding changed files:  79% |############################        | ETA:  0:00:04
Adding changed files:  80% |############################        | ETA:  0:00:04
Adding changed files:  80% |#############################       | ETA:  0:00:04
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  81% |#############################       | ETA:  0:00:04
Adding changed files:  82% |#############################       | ETA:  0:00:03
Adding changed files:  82% |#############################       | ETA:  0:00:03
Adding changed files:  83% |#############################       | ETA:  0:00:03
Adding changed files:  83% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:03
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  85% |##############################      | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:03
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  88% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:02
Adding changed files:  91% |################################    | ETA:  0:00:02
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:22
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.54.2.tar.xz...
INFO: Rebasing devtool onto 366e4de015dcb6d326a921ac39bbb5249abbb566
WARNING: Command 'git rebase 366e4de015dcb6d326a921ac39bbb5249abbb566' failed:
Auto-merging Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
Auto-merging Source/cmake/WebKitCompilerFlags.cmake
CONFLICT (content): Merge conflict in Source/cmake/WebKitCompilerFlags.cmake

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/webkitgtk
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/webkitgtk/webkitgtk_2.54.2.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/webkitgtk.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/webkitgtk.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9187149634313765075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="webkitgtk-changelog.txt"

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit &ndash; 6.0: Migrating WebKitGTK Applications to GTK 4</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit: Migrating WebKitGTK Applications to
  GTK 4"/>
  <meta property="og:description" content="Reference for WebKit-6.0: Migrating
  WebKitGTK Applications to GTK 4"/>
  <meta name="twitter:title" content="WebKit: Migrating WebKitGTK Applications
  to GTK 4"/>
  <meta name="twitter:description" content="Reference for WebKit-6.0: Migrating
  WebKitGTK Applications to GTK 4"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">

  <h4 id="title" style="display:flex;">
    Migrating WebKitGTK Applications to GTK 4
    <a href="#title" class="anchor"></a>

  </h4>

  <section>
    <div class="docblock">
    <h1 id="migrating-webkitgtk-applications-to-gtk-4">Migrating WebKitGTK
    Applications to GTK 4<a class="md-anchor" href="#migrating-webkitgtk-
    applications-to-gtk-4" title="Permanent link"></a></h1>
<p>This document contains guidance to application developers looking to migrate
applications that use WebKitGTK from <span class="caps">GTK</span> 3 to <span
class="caps">GTK</span>&nbsp;4.</p>
<p>webkitgtk-6.0 is a new <span class="caps">API</span> version of WebKitGTK
designed for use with <span class="caps">GTK</span> 4 and
libsoup 3. This <span class="caps">API</span> version obsoletes webkit2gtk-4.0
and webkit2gtk-4.1, the
<span class="caps">GTK</span> 3 <span class="caps">API</span> versions for
libsoup 2 and libsoup 3, respectively. It also obsoletes
webkit2gtk-5.0, which was an earlier unstable <span class="caps">API</span>
version for <span class="caps">GTK</span>&nbsp;4.</p>
<h2 id="upgrade-to-libsoup-3">Upgrade to libsoup 3<a class="md-anchor"
href="#upgrade-to-libsoup-3" title="Permanent link"></a></h2>
<p>libsoup 2 and libsoup 3 cannot be linked together. If your application
currently
uses webkit2gtk-4.0, you must first port to webkit2gtk-4.1 by eliminating use
of libsoup 2. See <a
href="https://gnome.pages.gitlab.gnome.org/libsoup/libsoup-3.0/migrating-from-
libsoup-2.html">Migrating from libsoup 2</a>
for guidance on this. After first migrating to webkit2gtk-4.1, it is
time to start looking into&nbsp;webkitgtk-6.0.</p>
<h2 id="stop-using-deprecated-apis">Stop Using Deprecated APIs<a class="md-
anchor" href="#stop-using-deprecated-apis" title="Permanent link"></a></h2>
<p>All APIs that were previously deprecated in webkit2gtk-4.0 and webkit2gtk-4.1
have been removed. This includes the original JavaScriptCore <span
class="caps">API</span> (e.g.
<code>JSContextRef</code> and <code>JSObjectRef</code>), which has been replaced
by the GObject-style
JavaScriptCore <span class="caps">API</span> (e.g. <a href="javascript:void(0)"
data-namespace="JavaScriptCore" data-link="class.Context.html"
class="external"><code>JSCContext</code></a> and <a href="javascript:void(0)"
data-namespace="JavaScriptCore" data-link="class.Value.html"
class="external"><code>JSCValue</code></a>)
that is available since 2.22. It also includes the entire GObject <span
class="caps">DOM</span> <span class="caps">API</span> (e.g.
<code>WebKitDOMDocument</code>), which has been removed without replacement. Use
JavaScript
to interact with and manipulate the <span class="caps">DOM</span> instead,
perhaps via
<a href="method.WebView.evaluate_javascript.html"><code>webkit_web_view_evaluate
_javascript()</code></a> or
<a href="method.WebView.call_async_javascript_function.html"><code>webkit_web_vi
ew_call_async_javascript_function()</code></a> in the <span
class="caps">UI</span> process, or
<a href="javascript:void(0)" data-namespace="JavaScriptCore" data-
link="method.Value.object_invoke_method.html"
class="external"><code>jsc_value_object_invoke_method()</code></a> in the
web&nbsp;process.</p>
<p>Run your application with the environment variable
<code>G_ENABLE_DIAGNOSTIC=1</code> to
notice use of deprecated signals and&nbsp;properties.</p>
<h2 id="upgrade-to-gtk-4">Upgrade to GTK 4<a class="md-anchor" href="#upgrade-
to-gtk-4" title="Permanent link"></a></h2>
<p>After successfully building your webkit2gtk-4.1 application without
deprecation
warnings, it is time to attempt to upgrade to <span class="caps">GTK</span> 4
and webkitgtk-6.0.
This is easier said than done, but <a
href="https://docs.gtk.org/gtk4/migrating-3to4.html">the <span
class="caps">GTK</span> 4 migration guide</a>
will help. Good&nbsp;luck.</p>
<h2 id="most-types-are-final">Most Types Are Final<a class="md-anchor"
href="#most-types-are-final" title="Permanent link"></a></h2>
<p>Only two types are now&nbsp;derivable:</p>
<ul>
<li><a href="class.WebView.html"><code>WebKitWebView</code></a> has been often
subclassed to customize its behavior for a
  specific application. This possibility has been kept, as it has proved
  useful in the&nbsp;past.</li>
<li><a
href="class.InputMethodContext.html"><code>WebKitInputMethodContext</code></a>
is specifically designed in a way that subclassing
  is required to make use of&nbsp;it.</li>
</ul>
<p>The rest of the types are no longer derivable; they are defined with the
<code>G_TYPE_FLAG_FINAL</code> flag set. Use composition instead
of&nbsp;derivation.</p>
<h2 id="mandatory-web-process-sandbox">Mandatory Web Process Sandbox<a
class="md-anchor" href="#mandatory-web-process-sandbox" title="Permanent
link"></a></h2>
<p>The <code>webkit_web_context_set_sandbox_enabled()</code> and
<code>webkit_web_context_get_sandbox_enabled()</code>
functions have been removed. The web process sandbox is now always enabled. If
your application&#8217;s web process needs to access extra directories, use
<a href="method.WebContext.add_path_to_sandbox.html"><code>webkit_web_context_ad
d_path_to_sandbox()</code></a> to mount them in the&nbsp;sandbox.</p>
<h2 id="mandatory-process-swap-on-cross-site-navigation">Mandatory Process Swap
on Cross-site Navigation<a class="md-anchor" href="#mandatory-process-swap-on-
cross-site-navigation" title="Permanent link"></a></h2>
<p>The <code>WebKitWebContext:process-swap-on-cross-site-navigation-
enabled</code> property
has been removed. Process swapping is now mandatory. Your application should be
prepared for the web view&#8217;s web process to be replaced when navigating
between
different security origins. You can ensure that your application is prepared for
this change before porting to <span class="caps">GTK</span> 4 by testing your
application with the
<code>WebKitWebContext:process-swap-on-cross-site-navigation-enabled</code>
property
enabled. This property was previously disabled by&nbsp;default.</p>
<h2 id="event-parameter-removed-from-context-menu-and-option-menu-signals">Event
Parameter Removed from Context Menu and Option Menu Signals<a class="md-anchor"
href="#event-parameter-removed-from-context-menu-and-option-menu-signals"
title="Permanent link"></a></h2>
<p><a href="signal.WebView.context-menu.html"><code>WebKitWebView::context-
menu</code></a> and <a href="signal.WebView.show-option-
menu.html"><code>WebKitWebView::show-option-menu</code></a>
no longer have a <a href="javascript:void(0)" data-namespace="Gdk" data-
link="class.Event.html" class="external"><code>GdkEvent</code></a> parameter.
Adjust your signal handlers&nbsp;accordingly.</p>
<h2 id="changes-to-webkitwebview-construction">Changes to WebKitWebView
Construction<a class="md-anchor" href="#changes-to-webkitwebview-construction"
title="Permanent link"></a></h2>
<p><code>webkit_web_view_new_with_context()</code>,
<code>webkit_web_view_new_with_settings()</code>,
<code>webkit_web_view_new_with_user_content_manager()</code>, and
<code>webkit_web_view_new_with_related_view()</code> have all been removed. You
may directly use <code>g_object_new()</code> instead. <a href="ctor.WebView.new.
html"><code>webkit_web_view_new()</code></a>&nbsp;remains.</p>
<h2 id="network-session-api">Network Session API<a class="md-anchor"
href="#network-session-api" title="Permanent link"></a></h2>
<p>WebKit now uses a single global network process for all web contexts, and
different
network sessions can be created and used in the same network process. All the
networking
APIs have been moved from <a
href="class.WebContext.html"><code>WebKitWebContext</code></a> and <a
href="class.WebsiteDataManager.html"><code>WebKitWebsiteDataManager</code></a>
to the new class
<a href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a>.
There&#8217;s a default global persistent session that you can get with
<a href="type_func.NetworkSession.get_default.html"><code>webkit_network_session
_get_default()</code></a>. You can also create new sessions with
<a href="ctor.NetworkSession.new.html"><code>webkit_network_session_new()</code>
</a> for persistent sessions and <a href="ctor.NetworkSession.new_ephemeral.html
"><code>webkit_network_session_new_ephemeral()</code></a>
for ephemeral sessions. It&#8217;s no longer possible to create a <a
href="class.WebsiteDataManager.html"><code>WebKitWebsiteDataManager</code></a>;
it&#8217;s now
created by the <a
href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a>
automatically at construction time. The <a
href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a>
to be used must be passed to the <a
href="class.WebView.html"><code>WebKitWebView</code></a> as a construct
parameter. You can pass the
same <a href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a>
object to several web views to use the same session. The only exception
is automation mode, which uses its own ephemeral session that is configured by
the automation
session capabilities. If you notice that your application uses <a
href="class.WebContext.html"><code>WebKitWebContext</code></a> or
<a
href="class.WebsiteDataManager.html"><code>WebKitWebsiteDataManager</code></a>
APIs that no longer exist, look for replacement APIs
in <a
href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a>.</p>
<p><code>webkit_web_context_clear_cache()</code> does not have a direct
replacement, but you
can use <a href="method.WebsiteDataManager.clear.html"><code>webkit_website_data
_manager_clear()</code></a> to achieve the same&nbsp;effect.</p>
<p>The <code>WebKitWebContext::download-started</code> signal has been removed.
Use
<a href="signal.NetworkSession.download-
started.html"><code>WebKitNetworkSession::download-
started</code></a>&nbsp;instead.</p>
<h2 id="favicon-database">Favicon Database<a class="md-anchor" href="#favicon-
database" title="Permanent link"></a></h2>
<p><a href="class.FaviconDatabase.html"><code>WebKitFaviconDatabase</code></a>
is now owned by <a
href="class.WebsiteDataManager.html"><code>WebKitWebsiteDataManager</code></a>
instead of <a href="class.WebContext.html"><code>WebKitWebContext</code></a>.
Use
<a href="method.WebsiteDataManager.set_favicons_enabled.html"><code>webkit_websi
te_data_manager_set_favicons_enabled()</code></a> to enable the
favicon&nbsp;database.</p>
<p>There is no replacement for
<code>webkit_web_context_set_favicon_database_directory()</code>.
Favicons will be stored in the base cache directory of the website
data&nbsp;manager.</p>
<h2 id="hardware-acceleration-policy">Hardware Acceleration Policy<a class="md-
anchor" href="#hardware-acceleration-policy" title="Permanent link"></a></h2>
<p><code>WEBKIT_HARDWARE_ACCELERATION_POLICY_ON_DEMAND</code> has been removed
from
<a href="enum.HardwareAccelerationPolicy.html"><code>WebKitHardwareAccelerationP
olicy</code></a>. You may still use
<a href="method.Settings.set_hardware_acceleration_policy.html"><code>webkit_set
tings_set_hardware_acceleration_policy()</code></a> to enable or disable
hardware&nbsp;acceleration.</p>
<h2 id="scrollbar-appearance">Scrollbar Appearance<a class="md-anchor"
href="#scrollbar-appearance" title="Permanent link"></a></h2>
<p>Because <span class="caps">GTK</span> 4 does not contain a foreign drawing
<span class="caps">API</span>, it is no longer possible
to draw scrollbars that match arbitrary <span class="caps">GTK</span> themes.
Accordingly, the
<code>webkit_web_context_get_use_system_appearance_for_scrollbars</code> and
<code>webkit_web_context_set_use_system_appearance_for_scrollbars</code> APIs
have been
removed. WebKit will draw scrollbars that match the Adwaita <span
class="caps">GTK</span>&nbsp;theme.</p>
<h2 id="user-script-message-handlers">User Script Message Handlers<a class="md-
anchor" href="#user-script-message-handlers" title="Permanent link"></a></h2>
<p><code>webkit_user_content_manager_register_script_message_handler_in_world()<
/code> and
<code>webkit_user_content_manager_unregister_script_message_handler_in_world()</
code> have
been removed. Instead, <a href="method.UserContentManager.register_script_messag
e_handler.html"><code>webkit_user_content_manager_register_script_message_handle
r()</code></a>
and <a href="method.UserContentManager.unregister_script_message_handler.html"><
code>webkit_user_content_manager_unregister_script_message_handler()</code></a>
have
gained parameters to specify the script world to&nbsp;use.</p>
<h2 id="download-destination">Download Destination<a class="md-anchor"
href="#download-destination" title="Permanent link"></a></h2>
<p><a href="method.Download.set_destination.html"><code>webkit_download_set_dest
ination()</code></a>, <a href="method.Download.get_destination.html"><code>webki
t_download_get_destination()</code></a>,
<a href="property.Download.destination.html"><code>WebKitDownload:destination</c
ode></a>, and <a href="signal.Download.created-
destination.html"><code>WebKitDownload::created-destination</code></a>
now all use a filesystem path rather than a <span class="caps">URI</span>. All
uses must be updated&nbsp;accordingly.</p>
<h2 id="javascript-results">JavaScript Results<a class="md-anchor"
href="#javascript-results" title="Permanent link"></a></h2>
<p>WebKitJavascriptResult has been removed. <a
href="signal.UserContentManager.script-message-
received.html"><code>WebKitUserContentManager::script-message-
received</code></a>
now directly returns a <a href="javascript:void(0)" data-
namespace="JavaScriptCore" data-link="class.Value.html"
class="external"><code>JSCValue</code></a>&nbsp;instead.</p>
<h2 id="web-process-extension">Web Process Extension<a class="md-anchor"
href="#web-process-extension" title="Permanent link"></a></h2>
<p>WebKitWebExtension has been renamed to WebKitWebProcessExtension to avoid
confusion with WebExtensions, which are unrelated. This affects many methods and
signals of other objects as well, e.g. <a href="signal.WebContext.initialize-
web-process-extensions.html"><code>WebKitWebContext::initialize-web-process-
extensions</code></a>.
The name of your extension&#8217;s entry point must now be
<code>webkit_web_process_extension_initialize()</code>
or <code>webkit_web_process_extension_initialize_with_user_data()</code>.</p>
<p>Beware that as of WebKitGTK 2.40, the entire web process <span
class="caps">API</span> may unfortunately
be removed in the future. For more information on why, see
<a href="https://lists.webkit.org/archives/list/webkit-
dev@lists.webkit.org/thread/SDXWZE54IUJZTD2245RXXTFSWJ4TZZSR/">this mailing list
thread</a>.</p>
    </div>
  </section>
</section>

<div id="toc" class="toc">
  <nav aria-labelledby="toc-title">
    <p id="toc-title">Content</p>
    <ul class="toc-list">

        <li class="toc-list-item"><a href="#upgrade-to-libsoup-3"><span
        class="link-text">Upgrade to libsoup 3</span></a></li>

        <li class="toc-list-item"><a href="#stop-using-deprecated-apis"><span
        class="link-text">Stop Using Deprecated APIs</span></a></li>

        <li class="toc-list-item"><a href="#upgrade-to-gtk-4"><span class="link-
        text">Upgrade to GTK 4</span></a></li>

        <li class="toc-list-item"><a href="#most-types-are-final"><span
        class="link-text">Most Types Are Final</span></a></li>

        <li class="toc-list-item"><a href="#mandatory-web-process-sandbox"><span
        class="link-text">Mandatory Web Process Sandbox</span></a></li>

        <li class="toc-list-item"><a href="#mandatory-process-swap-on-cross-
        site-navigation"><span class="link-text">Mandatory Process Swap on
        Cross-site Navigation</span></a></li>

        <li class="toc-list-item"><a href="#event-parameter-removed-from-
        context-menu-and-option-menu-signals"><span class="link-text">Event
        Parameter Removed from Context Menu and Option Menu
        Signals</span></a></li>

        <li class="toc-list-item"><a href="#changes-to-webkitwebview-
        construction"><span class="link-text">Changes to WebKitWebView
        Construction</span></a></li>

        <li class="toc-list-item"><a href="#network-session-api"><span
        class="link-text">Network Session API</span></a></li>

        <li class="toc-list-item"><a href="#favicon-database"><span class="link-
        text">Favicon Database</span></a></li>

        <li class="toc-list-item"><a href="#hardware-acceleration-policy"><span
        class="link-text">Hardware Acceleration Policy</span></a></li>

        <li class="toc-list-item"><a href="#scrollbar-appearance"><span
        class="link-text">Scrollbar Appearance</span></a></li>

        <li class="toc-list-item"><a href="#user-script-message-handlers"><span
        class="link-text">User Script Message Handlers</span></a></li>

        <li class="toc-list-item"><a href="#download-destination"><span
        class="link-text">Download Destination</span></a></li>

        <li class="toc-list-item"><a href="#javascript-results"><span
        class="link-text">JavaScript Results</span></a></li>

        <li class="toc-list-item"><a href="#web-process-extension"><span
        class="link-text">Web Process Extension</span></a></li>

    </ul>
  </nav>
</div>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.BackForwardList::changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit.BackForwardList::changed"/>
  <meta property="og:description" content="Reference for signal
  WebKit.BackForwardList::changed"/>
  <meta name="twitter:title" content="WebKit.BackForwardList::changed"/>
  <meta name="twitter:description" content="Reference for signal
  WebKit.BackForwardList::changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.BackForwardList.html">BackForwardList</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">

    <a class="signal current"
    href="signal.BackForwardList.changed.html">changed</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.BackForwardList.html">BackForwardList</a>::changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitBackForwardList</span><span
class="o">*</span><span class="w"> </span><span class="n">self</span><span
class="p">,</span>
<span class="w">  </span><span class="n">WebKitBackForwardListItem</span><span
class="o">*</span><span class="w"> </span><span class="n">item_added</span><span
class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w">
</span><span class="n">items_removed</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w">
</span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitBackFor
        wardList.cpp#L70">[src]</a>

      </h4>

      <div class="docblock">
        <p>This signal is emitted when <code>back_forward_list</code> changes.
        This happens
when the current item is updated, a new item is added or one or more
items are removed. Note that both <code>item_added</code> and
<code>items_removed</code> can
be <code>NULL</code> when only the current item is updated. Items are only
removed
when the list is cleared or the maximum items limit is&nbsp;reached.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the
          handlers added via <code>g_signal_connect()</code>.</p></td></tr>

        </table>
      </div>

    </div>

    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">

          <dt class="arg-name"><code>item_added</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a href="class.BackForwardListItem.html"><cod
            e>WebKitBackForwardListItem</code></a></p>
            <p>The <code>WebKitBackForwardListItem</code> added or
            <code>NULL</code>.</p>
            <table>

            <tr><td>The argument can be <code>NULL</code>.</td></tr>

            <tr><td title="transfer: none">The data is owned by the caller of
            the function.</td></tr>

            </table>
          </dd>

          <dt class="arg-name"><code>items_removed</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>gpointer</code></p>
            <p>A <code>GList</code> of <code>WebKitBackForwardListItem</code>
            objects.</p>
            <table>

            <tr><td>The argument can be <code>NULL</code>.</td></tr>

            <tr><td title="transfer: none">The data is owned by the caller of
            the function.</td></tr>

            </table>
          </dd>

        </dl>
      </div>
    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.CookieManager::changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit.CookieManager::changed"/>
  <meta property="og:description" content="Reference for signal
  WebKit.CookieManager::changed"/>
  <meta name="twitter:title" content="WebKit.CookieManager::changed"/>
  <meta name="twitter:description" content="Reference for signal
  WebKit.CookieManager::changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.CookieManager.html">CookieManager</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">

    <a class="signal current"
    href="signal.CookieManager.changed.html">changed</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.CookieManager.html">CookieManager</a>::changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitCookieManager</span><span
class="o">*</span><span class="w"> </span><span class="n">self</span><span
class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w">
</span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitCookieM
        anager.cpp#L152">[src]</a>

      </h4>

      <div class="docblock">
        <p>This signal is emitted when cookies are added, removed
        or&nbsp;modified.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the
          handlers added via <code>g_signal_connect()</code>.</p></td></tr>

        </table>
      </div>

    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.EditorState::changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit.EditorState::changed"/>
  <meta property="og:description" content="Reference for signal
  WebKit.EditorState::changed"/>
  <meta name="twitter:title" content="WebKit.EditorState::changed"/>
  <meta name="twitter:description" content="Reference for signal
  WebKit.EditorState::changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.EditorState.html">EditorState</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">

    <a class="signal current" href="signal.EditorState.changed.html">changed</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.EditorState.html">EditorState</a>::changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p><span class="emblem available">since: 2.44</span></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitEditorState</span><span
class="o">*</span><span class="w"> </span><span class="n">self</span><span
class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w">
</span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitEditorS
        tate.cpp#L107">[src]</a>

      </h4>

      <div class="docblock">
        <p>Emitted when the <code>WebKitEditorState</code> is&nbsp;changed.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the
          handlers added via <code>g_signal_connect()</code>.</p></td></tr>

          <tr><td>Available since: 2.44</td></tr>

        </table>
      </div>

    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.FaviconDatabase::favicon-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit.FaviconDatabase::favicon-changed"/>
  <meta property="og:description" content="Reference for signal
  WebKit.FaviconDatabase::favicon-changed"/>
  <meta name="twitter:title" content="WebKit.FaviconDatabase::favicon-changed"/>
  <meta name="twitter:description" content="Reference for signal
  WebKit.FaviconDatabase::favicon-changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.FaviconDatabase.html">FaviconDatabase</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">

    <a class="signal current" href="signal.FaviconDatabase.favicon-
    changed.html">favicon-changed</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.FaviconDatabase.html">FaviconDatabase</a>::favicon-changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p><span class="emblem deprecated">deprecated: 2.54</span>&nbsp;</p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">favicon_changed</span><span class="w"> </span><span
class="p">(</span>
<span class="w">  </span><span class="n">WebKitFaviconDatabase</span><span
class="o">*</span><span class="w"> </span><span class="n">self</span><span
class="p">,</span>
<span class="w">  </span><span class="n">gchar</span><span
class="o">*</span><span class="w"> </span><span class="n">page_uri</span><span
class="p">,</span>
<span class="w">  </span><span class="n">gchar</span><span
class="o">*</span><span class="w"> </span><span
class="n">favicon_uri</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w">
</span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/WebKitBuild/GTK/Release/WebKitGTK/DerivedSourc
        es/webkit/WebKitFaviconDatabase.h#L93">[src]</a>

      </h4>

      <div class="docblock">
        <p>This signal is emitted when the favicon <span class="caps">URI</span>
        of <code>page_uri</code> has
been changed to <code>favicon_uri</code> in the database. You can connect
to this signal and call <code>webkit_favicon_database_get_favicon()</code>
to get the favicon. If you are interested in the favicon of a
<code>WebKitWebView</code> it&#8217;s easier to use the
<code>WebKitWebView:favicon</code>
property. See <code>webkit_web_view_get_favicon()</code> for
more&nbsp;details.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the
          handlers added via <code>g_signal_connect()</code>.</p></td></tr>

          <tr><td>Deprecated since: 2.54</td></tr>
          <tr><td><p>Please do not use it in newly
          written&nbsp;code.</p></td></tr>

        </table>
      </div>

    </div>

    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">

          <dt class="arg-name"><code>page_uri</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>gchar*</code></p>
            <p>The <span class="caps">URI</span> of the Web page containing
            the&nbsp;icon.</p>
            <table>

            <tr><td title="transfer: none">The data is owned by the caller of
            the function.</td></tr>
            <tr><td>The value is a NUL terminated UTF-8 string.</td></tr>
            </table>
          </dd>

          <dt class="arg-name"><code>favicon_uri</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>gchar*</code></p>
            <p>The <span class="caps">URI</span> of the&nbsp;favicon.</p>
            <table>

            <tr><td title="transfer: none">The data is owned by the caller of
            the function.</td></tr>
            <tr><td>The value is a NUL terminated UTF-8 string.</td></tr>
            </table>
          </dd>

        </dl>
      </div>
    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.InputMethodContext::preedit-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit.InputMethodContext::preedit-
  changed"/>
  <meta property="og:description" content="Reference for signal
  WebKit.InputMethodContext::preedit-changed"/>
  <meta name="twitter:title" content="WebKit.InputMethodContext::preedit-
  changed"/>
  <meta name="twitter:description" content="Reference for signal
  WebKit.InputMethodContext::preedit-changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.InputMethodContext.html">InputMethodContext</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">

    <a class="signal"
    href="signal.InputMethodContext.committed.html">committed</a>

    <a class="signal" href="signal.InputMethodContext.delete-
    surrounding.html">delete-surrounding</a>

    <a class="signal current" href="signal.InputMethodContext.preedit-
    changed.html">preedit-changed</a>

    <a class="signal" href="signal.InputMethodContext.preedit-
    finished.html">preedit-finished</a>

    <a class="signal" href="signal.InputMethodContext.preedit-
    started.html">preedit-started</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.InputMethodContext.html">InputMethodContext</a>::preedit-
    changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p><span class="emblem available">since: 2.28</span></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">preedit_changed</span><span class="w"> </span><span
class="p">(</span>
<span class="w">  </span><span class="n">WebKitInputMethodContext</span><span
class="o">*</span><span class="w"> </span><span class="n">self</span><span
class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w">
</span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitInputMe
        thodContext.cpp#L272">[src]</a>

      </h4>

      <div class="docblock">
        <p>Emitted whenever the preedit sequence currently being entered has
        changed.
It is also emitted at the end of a preedit sequence, in which case
<code>webkit_input_method_context_get_preedit()</code> returns the
empty&nbsp;string.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the
          handlers added via <code>g_signal_connect()</code>.</p></td></tr>

          <tr><td>Available since: 2.28</td></tr>

        </table>
      </div>

    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.WebView::load-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit.WebView::load-changed"/>
  <meta property="og:description" content="Reference for signal
  WebKit.WebView::load-changed"/>
  <meta name="twitter:title" content="WebKit.WebView::load-changed"/>
  <meta name="twitter:description" content="Reference for signal
  WebKit.WebView::load-changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebView.html">WebView</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">

    <a class="signal" href="signal.WebView.authenticate.html">authenticate</a>
    <a class="signal" href="signal.WebView.close.html">close</a>
    <a class="signal" href="signal.WebView.context-menu.html">context-menu</a>

    <a class="signal" href="signal.WebView.context-menu-dismissed.html">context-
    menu-dismissed</a>

    <a class="signal" href="signal.WebView.create.html">create</a>
    <a class="signal" href="signal.WebView.decide-policy.html">decide-policy</a>

    <a class="signal" href="signal.WebView.enter-fullscreen.html">enter-
    fullscreen</a>

    <a class="signal" href="signal.WebView.insecure-content-
    detected.html">insecure-content-detected</a>

    <a class="signal" href="signal.WebView.leave-fullscreen.html">leave-
    fullscreen</a>

    <a class="signal current" href="signal.WebView.load-changed.html">load-
    changed</a>

    <a class="signal" href="signal.WebView.load-failed.html">load-failed</a>

    <a class="signal" href="signal.WebView.load-failed-with-tls-
    errors.html">load-failed-with-tls-errors</a>

    <a class="signal" href="signal.WebView.mouse-target-changed.html">mouse-
    target-changed</a>

    <a class="signal" href="signal.WebView.permission-request.html">permission-
    request</a>

    <a class="signal" href="signal.WebView.print.html">print</a>

    <a class="signal" href="signal.WebView.query-permission-state.html">query-
    permission-state</a>

    <a class="signal" href="signal.WebView.ready-to-show.html">ready-to-show</a>

    <a class="signal" href="signal.WebView.resource-load-started.html">resource-
    load-started</a>

    <a class="signal" href="signal.WebView.run-as-modal.html">run-as-modal</a>

    <a class="signal" href="signal.WebView.run-color-chooser.html">run-color-
    chooser</a>

    <a class="signal" href="signal.WebView.run-file-chooser.html">run-file-
    chooser</a>

    <a class="signal" href="signal.WebView.script-dialog.html">script-dialog</a>

    <a class="signal" href="signal.WebView.show-notification.html">show-
    notification</a>

    <a class="signal" href="signal.WebView.show-option-menu.html">show-option-
    menu</a>

    <a class="signal" href="signal.WebView.submit-form.html">submit-form</a>

    <a class="signal" href="signal.WebView.user-message-received.html">user-
    message-received</a>

    <a class="signal" href="signal.WebView.web-process-terminated.html">web-
    process-terminated</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.WebView.html">WebView</a>::load-changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">load_changed</span><span class="w"> </span><span
class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebView</span><span
class="o">*</span><span class="w"> </span><span class="n">self</span><span
class="p">,</span>
<span class="w">  </span><span class="n">WebKitLoadEvent</span><span class="w">
</span><span class="n">load_event</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w">
</span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitWebView
        .cpp#L1876">[src]</a>

      </h4>

      <div class="docblock">
        <p>Emitted when a load operation in <code>web_view</code> changes.
The signal is always emitted with <code>WEBKIT_LOAD_STARTED</code> when a
new load request is made and <code>WEBKIT_LOAD_FINISHED</code> when the load
finishes successfully or due to an error. When the ongoing load
operation fails <code>WebKitWebView::load-failed</code> signal is emitted
before <code>WebKitWebView::load-changed</code> is emitted with
<code>WEBKIT_LOAD_FINISHED</code>.
If a redirection is received from the server, this signal is emitted
with <code>WEBKIT_LOAD_REDIRECTED</code> after the initial emission with
<code>WEBKIT_LOAD_STARTED</code> and before <code>WEBKIT_LOAD_COMMITTED</code>.
When the page content starts arriving the signal is emitted with
<code>WEBKIT_LOAD_COMMITTED</code> event.</p>
<p>You can handle this signal and use a switch to track any ongoing
load&nbsp;operation.</p>
<div class="codehilite"><pre><span></span><code><span
class="k">static</span><span class="w"> </span><span class="kt">void</span><span
class="w"> </span><span class="nf">web_view_load_changed</span><span class="w">
</span><span class="p">(</span><span class="n">WebKitWebView</span><span
class="w">  </span><span class="o">*</span><span class="n">web_view</span><span
class="p">,</span>
<span class="w">                                   </span><span
class="n">WebKitLoadEvent</span><span class="w"> </span><span
class="n">load_event</span><span class="p">,</span>
<span class="w">                                   </span><span
class="n">gpointer</span><span class="w">        </span><span
class="n">user_data</span><span class="p">)</span>
<span class="p">{</span>
<span class="w">    </span><span class="k">switch</span><span class="w">
</span><span class="p">(</span><span class="n">load_event</span><span
class="p">)</span><span class="w"> </span><span class="p">{</span>
<span class="w">    </span><span class="k">case</span><span class="w">
</span><span class="no">WEBKIT_LOAD_STARTED</span><span class="p">:</span>
<span class="w">        </span><span class="c1">// New load, we have now a
provisional URI</span>
<span class="w">        </span><span class="n">provisional_uri</span><span
class="w"> </span><span class="o">=</span><span class="w"> </span><span
class="n">webkit_web_view_get_uri</span><span class="w"> </span><span
class="p">(</span><span class="n">web_view</span><span class="p">);</span>
<span class="w">        </span><span class="c1">// Here we could start a spinner
or update the</span>
<span class="w">        </span><span class="c1">// location bar with the
provisional URI</span>
<span class="w">        </span><span class="k">break</span><span
class="p">;</span>
<span class="w">    </span><span class="k">case</span><span class="w">
</span><span class="no">WEBKIT_LOAD_REDIRECTED</span><span class="p">:</span>
<span class="w">        </span><span class="n">redirected_uri</span><span
class="w"> </span><span class="o">=</span><span class="w"> </span><span
class="n">webkit_web_view_get_uri</span><span class="w"> </span><span
class="p">(</span><span class="n">web_view</span><span class="p">);</span>
<span class="w">        </span><span class="k">break</span><span
class="p">;</span>
<span class="w">    </span><span class="k">case</span><span class="w">
</span><span class="no">WEBKIT_LOAD_COMMITTED</span><span class="p">:</span>
<span class="w">        </span><span class="c1">// The load is being performed.
Current URI is</span>
<span class="w">        </span><span class="c1">// the final one and it
won&#39;t change unless a new</span>
<span class="w">        </span><span class="c1">// load is requested or a
navigation within the</span>
<span class="w">        </span><span class="c1">// same page is performed</span>
<span class="w">        </span><span class="n">uri</span><span class="w">
</span><span class="o">=</span><span class="w"> </span><span
class="n">webkit_web_view_get_uri</span><span class="w"> </span><span
class="p">(</span><span class="n">web_view</span><span class="p">);</span>
<span class="w">        </span><span class="k">break</span><span
class="p">;</span>
<span class="w">    </span><span class="k">case</span><span class="w">
</span><span class="no">WEBKIT_LOAD_FINISHED</span><span class="p">:</span>
<span class="w">        </span><span class="c1">// Load finished, we can now
stop the spinner</span>
<span class="w">        </span><span class="k">break</span><span
class="p">;</span>
<span class="w">    </span><span class="p">}</span>
<span class="p">}</span>
</code></pre></div>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the
          handlers added via <code>g_signal_connect()</code>.</p></td></tr>

        </table>
      </div>

    </div>

    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">

          <dt class="arg-name"><code>load_event</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a
            href="enum.LoadEvent.html"><code>WebKitLoadEvent</code></a></p>
            <p>The <code>WebKitLoadEvent</code>.</p>
            <table>

            </table>
          </dd>

        </dl>
      </div>
    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.WebView::mouse-target-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit.WebView::mouse-target-changed"/>
  <meta property="og:description" content="Reference for signal
  WebKit.WebView::mouse-target-changed"/>
  <meta name="twitter:title" content="WebKit.WebView::mouse-target-changed"/>
  <meta name="twitter:description" content="Reference for signal
  WebKit.WebView::mouse-target-changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebView.html">WebView</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">

    <a class="signal" href="signal.WebView.authenticate.html">authenticate</a>
    <a class="signal" href="signal.WebView.close.html">close</a>
    <a class="signal" href="signal.WebView.context-menu.html">context-menu</a>

    <a class="signal" href="signal.WebView.context-menu-dismissed.html">context-
    menu-dismissed</a>

    <a class="signal" href="signal.WebView.create.html">create</a>
    <a class="signal" href="signal.WebView.decide-policy.html">decide-policy</a>

    <a class="signal" href="signal.WebView.enter-fullscreen.html">enter-
    fullscreen</a>

    <a class="signal" href="signal.WebView.insecure-content-
    detected.html">insecure-content-detected</a>

    <a class="signal" href="signal.WebView.leave-fullscreen.html">leave-
    fullscreen</a>

    <a class="signal" href="signal.WebView.load-changed.html">load-changed</a>
    <a class="signal" href="signal.WebView.load-failed.html">load-failed</a>

    <a class="signal" href="signal.WebView.load-failed-with-tls-
    errors.html">load-failed-with-tls-errors</a>

    <a class="signal current" href="signal.WebView.mouse-target-
    changed.html">mouse-target-changed</a>

    <a class="signal" href="signal.WebView.permission-request.html">permission-
    request</a>

    <a class="signal" href="signal.WebView.print.html">print</a>

    <a class="signal" href="signal.WebView.query-permission-state.html">query-
    permission-state</a>

    <a class="signal" href="signal.WebView.ready-to-show.html">ready-to-show</a>

    <a class="signal" href="signal.WebView.resource-load-started.html">resource-
    load-started</a>

    <a class="signal" href="signal.WebView.run-as-modal.html">run-as-modal</a>

    <a class="signal" href="signal.WebView.run-color-chooser.html">run-color-
    chooser</a>

    <a class="signal" href="signal.WebView.run-file-chooser.html">run-file-
    chooser</a>

    <a class="signal" href="signal.WebView.script-dialog.html">script-dialog</a>

    <a class="signal" href="signal.WebView.show-notification.html">show-
    notification</a>

    <a class="signal" href="signal.WebView.show-option-menu.html">show-option-
    menu</a>

    <a class="signal" href="signal.WebView.submit-form.html">submit-form</a>

    <a class="signal" href="signal.WebView.user-message-received.html">user-
    message-received</a>

    <a class="signal" href="signal.WebView.web-process-terminated.html">web-
    process-terminated</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.WebView.html">WebView</a>::mouse-target-changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">mouse_target_changed</span><span class="w"> </span><span
class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebView</span><span
class="o">*</span><span class="w"> </span><span class="n">self</span><span
class="p">,</span>
<span class="w">  </span><span class="n">WebKitHitTestResult</span><span
class="o">*</span><span class="w"> </span><span
class="n">hit_test_result</span><span class="p">,</span>
<span class="w">  </span><span class="n">guint</span><span class="w">
</span><span class="n">modifiers</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w">
</span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitWebView
        .cpp#L2268">[src]</a>

      </h4>

      <div class="docblock">
        <p>This signal is emitted when the mouse cursor moves over an
element such as a link, image or a media element. To determine
what type of element the mouse cursor is over, a Hit Test is performed
on the current mouse coordinates and the result is passed in the
<code>hit_test_result</code> argument. The <code>modifiers</code> argument is a
bitmask of
<code>GdkModifierType</code> flags indicating the state of modifier keys.
The signal is emitted again when the mouse is moved out of the
current element with a new <code>hit_test_result</code>.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the
          handlers added via <code>g_signal_connect()</code>.</p></td></tr>

        </table>
      </div>

    </div>

    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">

          <dt class="arg-name"><code>hit_test_result</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a
            href="class.HitTestResult.html"><code>WebKitHitTestResult</code></a>
            </p>
            <p>A <code>WebKitHitTestResult</code>.</p>
            <table>

            <tr><td title="transfer: none">The data is owned by the caller of
            the function.</td></tr>

            </table>
          </dd>

          <dt class="arg-name"><code>modifiers</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>guint</code></p>
            <p>A bitmask of <code>GdkModifierType</code>.</p>
            <table>

            </table>
          </dd>

        </dl>
      </div>
    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.InputMethodContext.preedit_changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title"
  content="WebKit.InputMethodContext.preedit_changed"/>
  <meta property="og:description" content="Reference for
  WebKit.InputMethodContext.preedit_changed"/>
  <meta name="twitter:title"
  content="WebKit.InputMethodContext.preedit_changed"/>
  <meta name="twitter:description" content="Reference for
  WebKit.InputMethodContext.preedit_changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.InputMethodContext.html">InputMethodContext</a>
  </div>
</div>
<div class="section">
  <h5>Virtual methods</h5>
  <div class="links">

    <a class="method"
    href="vfunc.InputMethodContext.committed.html">committed</a>

    <a class="method"
    href="vfunc.InputMethodContext.delete_surrounding.html">delete_surrounding</
    a>

    <a class="method"
    href="vfunc.InputMethodContext.filter_key_event.html">filter_key_event</a>

    <a class="method"
    href="vfunc.InputMethodContext.get_preedit.html">get_preedit</a>

    <a class="method"
    href="vfunc.InputMethodContext.notify_cursor_area.html">notify_cursor_area</
    a>

    <a class="method"
    href="vfunc.InputMethodContext.notify_focus_in.html">notify_focus_in</a>

    <a class="method"
    href="vfunc.InputMethodContext.notify_focus_out.html">notify_focus_out</a>

    <a class="method"
    href="vfunc.InputMethodContext.notify_surrounding.html">notify_surrounding</
    a>

    <a class="method current"
    href="vfunc.InputMethodContext.preedit_changed.html">preedit_changed</a>

    <a class="method"
    href="vfunc.InputMethodContext.preedit_finished.html">preedit_finished</a>

    <a class="method"
    href="vfunc.InputMethodContext.preedit_started.html">preedit_started</a>

    <a class="method" href="vfunc.InputMethodContext.reset.html">reset</a>

    <a class="method"
    href="vfunc.InputMethodContext.set_enable_preedit.html">set_enable_preedit</
    a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Virtual Method</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.InputMethodContext.html">InputMethodContext</a><span
    class="sep"></span>preedit_changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>

    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/WebKitBuild/GTK/Release/WebKitGTK/DerivedSourc
        es/webkit/WebKitInputMethodContext.h#L105">[src]</a>

      </h4>

      <div class="docblock c-decl">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">preedit_changed</span><span class="w"> </span><span
class="p">(</span>
<span class="w">  </span><span class="n">WebKitInputMethodContext</span><span
class="o">*</span><span class="w"> </span><span class="n">context</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description">
        Description
        <a href="#description" class="anchor"></a>

      </h4>

      <div class="docblock">
        <p>No description available.</p>
      </div>

      <div class="docblock">
      </div>
    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.WebView.load_changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit.WebView.load_changed"/>
  <meta property="og:description" content="Reference for
  WebKit.WebView.load_changed"/>
  <meta name="twitter:title" content="WebKit.WebView.load_changed"/>
  <meta name="twitter:description" content="Reference for
  WebKit.WebView.load_changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebView.html">WebView</a>
  </div>
</div>
<div class="section">
  <h5>Virtual methods</h5>
  <div class="links">

    <a class="method" href="vfunc.WebView.authenticate.html">authenticate</a>
    <a class="method" href="vfunc.WebView.close.html">close</a>
    <a class="method" href="vfunc.WebView.context_menu.html">context_menu</a>

    <a class="method"
    href="vfunc.WebView.context_menu_dismissed.html">context_menu_dismissed</a>

    <a class="method" href="vfunc.WebView.create.html">create</a>
    <a class="method" href="vfunc.WebView.decide_policy.html">decide_policy</a>

    <a class="method"
    href="vfunc.WebView.enter_fullscreen.html">enter_fullscreen</a>

    <a class="method" href="vfunc.WebView.insecure_content_detected.html">insecu
    re_content_detected</a>

    <a class="method"
    href="vfunc.WebView.leave_fullscreen.html">leave_fullscreen</a>

    <a class="method current"
    href="vfunc.WebView.load_changed.html">load_changed</a>

    <a class="method" href="vfunc.WebView.load_failed.html">load_failed</a>

    <a class="method" href="vfunc.WebView.load_failed_with_tls_errors.html">load
    _failed_with_tls_errors</a>

    <a class="method"
    href="vfunc.WebView.mouse_target_changed.html">mouse_target_changed</a>

    <a class="method"
    href="vfunc.WebView.permission_request.html">permission_request</a>

    <a class="method" href="vfunc.WebView.print.html">print</a>

    <a class="method"
    href="vfunc.WebView.query_permission_state.html">query_permission_state</a>

    <a class="method" href="vfunc.WebView.ready_to_show.html">ready_to_show</a>

    <a class="method"
    href="vfunc.WebView.resource_load_started.html">resource_load_started</a>

    <a class="method" href="vfunc.WebView.run_as_modal.html">run_as_modal</a>

    <a class="method"
    href="vfunc.WebView.run_color_chooser.html">run_color_chooser</a>

    <a class="method"
    href="vfunc.WebView.run_file_chooser.html">run_file_chooser</a>

    <a class="method" href="vfunc.WebView.script_dialog.html">script_dialog</a>

    <a class="method"
    href="vfunc.WebView.show_notification.html">show_notification</a>

    <a class="method"
    href="vfunc.WebView.show_option_menu.html">show_option_menu</a>

    <a class="method" href="vfunc.WebView.submit_form.html">submit_form</a>

    <a class="method"
    href="vfunc.WebView.user_message_received.html">user_message_received</a>

    <a class="method"
    href="vfunc.WebView.web_process_crashed.html">web_process_crashed</a>

    <a class="method"
    href="vfunc.WebView.web_process_terminated.html">web_process_terminated</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Virtual Method</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.WebView.html">WebView</a><span
    class="sep"></span>load_changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>

    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/WebKitBuild/GTK/Release/WebKitGTK/DerivedSourc
        es/webkit/WebKitWebView.h#L247">[src]</a>

      </h4>

      <div class="docblock c-decl">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">load_changed</span><span class="w"> </span><span
class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebView</span><span
class="o">*</span><span class="w"> </span><span class="n">web_view</span><span
class="p">,</span>
<span class="w">  </span><span class="n">WebKitLoadEvent</span><span class="w">
</span><span class="n">load_event</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description">
        Description
        <a href="#description" class="anchor"></a>

      </h4>

      <div class="docblock">
        <p>No description available.</p>
      </div>

      <div class="docblock">
      </div>
    </div>

    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">

          <dt class="arg-name"><code>load_event</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a
            href="enum.LoadEvent.html"><code>WebKitLoadEvent</code></a></p>
            <p>No description available.</p>
            <table>

            </table>
          </dd>

        </dl>
      </div>
    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.WebView.mouse_target_changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit.WebView.mouse_target_changed"/>
  <meta property="og:description" content="Reference for
  WebKit.WebView.mouse_target_changed"/>
  <meta name="twitter:title" content="WebKit.WebView.mouse_target_changed"/>
  <meta name="twitter:description" content="Reference for
  WebKit.WebView.mouse_target_changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebView.html">WebView</a>
  </div>
</div>
<div class="section">
  <h5>Virtual methods</h5>
  <div class="links">

    <a class="method" href="vfunc.WebView.authenticate.html">authenticate</a>
    <a class="method" href="vfunc.WebView.close.html">close</a>
    <a class="method" href="vfunc.WebView.context_menu.html">context_menu</a>

    <a class="method"
    href="vfunc.WebView.context_menu_dismissed.html">context_menu_dismissed</a>

    <a class="method" href="vfunc.WebView.create.html">create</a>
    <a class="method" href="vfunc.WebView.decide_policy.html">decide_policy</a>

    <a class="method"
    href="vfunc.WebView.enter_fullscreen.html">enter_fullscreen</a>

    <a class="method" href="vfunc.WebView.insecure_content_detected.html">insecu
    re_content_detected</a>

    <a class="method"
    href="vfunc.WebView.leave_fullscreen.html">leave_fullscreen</a>

    <a class="method" href="vfunc.WebView.load_changed.html">load_changed</a>
    <a class="method" href="vfunc.WebView.load_failed.html">load_failed</a>

    <a class="method" href="vfunc.WebView.load_failed_with_tls_errors.html">load
    _failed_with_tls_errors</a>

    <a class="method current"
    href="vfunc.WebView.mouse_target_changed.html">mouse_target_changed</a>

    <a class="method"
    href="vfunc.WebView.permission_request.html">permission_request</a>

    <a class="method" href="vfunc.WebView.print.html">print</a>

    <a class="method"
    href="vfunc.WebView.query_permission_state.html">query_permission_state</a>

    <a class="method" href="vfunc.WebView.ready_to_show.html">ready_to_show</a>

    <a class="method"
    href="vfunc.WebView.resource_load_started.html">resource_load_started</a>

    <a class="method" href="vfunc.WebView.run_as_modal.html">run_as_modal</a>

    <a class="method"
    href="vfunc.WebView.run_color_chooser.html">run_color_chooser</a>

    <a class="method"
    href="vfunc.WebView.run_file_chooser.html">run_file_chooser</a>

    <a class="method" href="vfunc.WebView.script_dialog.html">script_dialog</a>

    <a class="method"
    href="vfunc.WebView.show_notification.html">show_notification</a>

    <a class="method"
    href="vfunc.WebView.show_option_menu.html">show_option_menu</a>

    <a class="method" href="vfunc.WebView.submit_form.html">submit_form</a>

    <a class="method"
    href="vfunc.WebView.user_message_received.html">user_message_received</a>

    <a class="method"
    href="vfunc.WebView.web_process_crashed.html">web_process_crashed</a>

    <a class="method"
    href="vfunc.WebView.web_process_terminated.html">web_process_terminated</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Virtual Method</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a
    href="class.WebView.html">WebView</a><span
    class="sep"></span>mouse_target_changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>

    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/WebKitBuild/GTK/Release/WebKitGTK/DerivedSourc
        es/webkit/WebKitWebView.h#L269">[src]</a>

      </h4>

      <div class="docblock c-decl">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">mouse_target_changed</span><span class="w"> </span><span
class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebView</span><span
class="o">*</span><span class="w"> </span><span class="n">web_view</span><span
class="p">,</span>
<span class="w">  </span><span class="n">WebKitHitTestResult</span><span
class="o">*</span><span class="w"> </span><span
class="n">hit_test_result</span><span class="p">,</span>
<span class="w">  </span><span class="n">guint</span><span class="w">
</span><span class="n">modifiers</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description">
        Description
        <a href="#description" class="anchor"></a>

      </h4>

      <div class="docblock">
        <p>No description available.</p>
      </div>

      <div class="docblock">
      </div>
    </div>

    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">

          <dt class="arg-name"><code>hit_test_result</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a
            href="class.HitTestResult.html"><code>WebKitHitTestResult</code></a>
            </p>
            <p>No description available.</p>
            <table>

            <tr><td title="transfer: none">The data is owned by the caller of
            the method.</td></tr>

            </table>
          </dd>

          <dt class="arg-name"><code>modifiers</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>guint</code></p>
            <p>No description available.</p>
            <table>

            </table>
          </dd>

        </dl>
      </div>
    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKitWebProcessExtension.WebEditor::selection-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />
  <meta property="og:type" content="website"/>

  <meta property="og:title"
  content="WebKitWebProcessExtension.WebEditor::selection-changed"/>
  <meta property="og:description" content="Reference for signal
  WebKitWebProcessExtension.WebEditor::selection-changed"/>
  <meta name="twitter:title"
  content="WebKitWebProcessExtension.WebEditor::selection-changed"/>
  <meta name="twitter:description" content="Reference for signal
  WebKitWebProcessExtension.WebEditor::selection-changed"/>

  <meta name="twitter:card" content="summary"/>
  <link rel="stylesheet" href="style.css" type="text/css" />
  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete"
          placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKitWebProcessExtension</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.54.2</p>
      </div>

<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebEditor.html">WebEditor</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">

    <a class="signal current" href="signal.WebEditor.selection-
    changed.html">selection-changed</a>

  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-
        docgen</a> 2023.4</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-
    arrow"></span></button>

<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKitWebProcessExtension</a><span
    class="sep"></span><a href="class.WebEditor.html">WebEditor</a>::selection-
    changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p><span class="emblem available">since: 2.10</span></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span
        class="kt">void</span>
<span class="n">selection_changed</span><span class="w"> </span><span
class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebEditor</span><span
class="o">*</span><span class="w"> </span><span class="n">self</span><span
class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w">
</span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>

        <a class="srclink" title="go to source location" href="https://github.co
        m/WebKit/WebKit/tree/main/Source/WebKit/WebProcess/InjectedBundle/API/gl
        ib/WebKitWebEditor.cpp#L59">[src]</a>

      </h4>

      <div class="docblock">
        <p>This signal is emitted for every selection change inside a
        <code>WebKitWebPage</code>
as well as for every caret position change as the caret is a
collapsed&nbsp;selection.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the
          handlers added via <code>g_signal_connect()</code>.</p></td></tr>

          <tr><td>Available since: 2.10</td></tr>

        </table>
      </div>

    </div>

  </section>
</section>

    <section id="search" class="content hidden"></section>
    <footer>

    </footer>
  </div>
</body>
</html>

Title: Migrating WebKitGTK Applications to GTK 4
Slug: migrating-to-webkitgtk-6.0

# Migrating WebKitGTK Applications to GTK 4

This document contains guidance to application developers looking to migrate
applications that use WebKitGTK from GTK 3 to GTK 4.

webkitgtk-6.0 is a new API version of WebKitGTK designed for use with GTK 4 and
libsoup 3. This API version obsoletes webkit2gtk-4.0 and webkit2gtk-4.1, the
GTK 3 API versions for libsoup 2 and libsoup 3, respectively. It also obsoletes
webkit2gtk-5.0, which was an earlier unstable API version for GTK 4.

## Upgrade to libsoup 3

libsoup 2 and libsoup 3 cannot be linked together. If your application currently
uses webkit2gtk-4.0, you must first port to webkit2gtk-4.1 by eliminating use
of libsoup 2. See [Migrating from libsoup
2](https://gnome.pages.gitlab.gnome.org/libsoup/libsoup-3.0/migrating-from-
libsoup-2.html)
for guidance on this. After first migrating to webkit2gtk-4.1, it is
time to start looking into webkitgtk-6.0.

## Stop Using Deprecated APIs

All APIs that were previously deprecated in webkit2gtk-4.0 and webkit2gtk-4.1
have been removed. This includes the original JavaScriptCore API (e.g.
`JSContextRef` and `JSObjectRef`), which has been replaced by the GObject-style
JavaScriptCore API (e.g. [type@JavaScriptCore.Context] and
[type@JavaScriptCore.Value])
that is available since 2.22. It also includes the entire GObject DOM API (e.g.
`WebKitDOMDocument`), which has been removed without replacement. Use JavaScript
to interact with and manipulate the DOM instead, perhaps via
[method@WebKit.WebView.evaluate_javascript] or
[method@WebKit.WebView.call_async_javascript_function] in the UI process, or
[method@JavaScriptCore.Value.object_invoke_method] in the web process.

Run your application with the environment variable `G_ENABLE_DIAGNOSTIC=1` to
notice use of deprecated signals and properties.

## Upgrade to GTK 4

After successfully building your webkit2gtk-4.1 application without deprecation
warnings, it is time to attempt to upgrade to GTK 4 and webkitgtk-6.0.
This is easier said than done, but [the GTK 4 migration
guide](https://docs.gtk.org/gtk4/migrating-3to4.html)
will help. Good luck.

## Most Types Are Final
Only two types are now derivable:

- [type@WebView] has been often subclassed to customize its behavior for a
  specific application. This possibility has been kept, as it has proved
  useful in the past.
- [type@InputMethodContext] is specifically designed in a way that subclassing
  is required to make use of it.

The rest of the types are no longer derivable; they are defined with the
`G_TYPE_FLAG_FINAL` flag set. Use composition instead of derivation.

## Mandatory Web Process Sandbox

The `webkit_web_context_set_sandbox_enabled()` and
`webkit_web_context_get_sandbox_enabled()`
functions have been removed. The web process sandbox is now always enabled. If
your application's web process needs to access extra directories, use
[method@WebKit.WebContext.add_path_to_sandbox] to mount them in the sandbox.

## Mandatory Process Swap on Cross-site Navigation

The `WebKitWebContext:process-swap-on-cross-site-navigation-enabled` property
has been removed. Process swapping is now mandatory. Your application should be
prepared for the web view's web process to be replaced when navigating between
different security origins. You can ensure that your application is prepared for
this change before porting to GTK 4 by testing your application with the
`WebKitWebContext:process-swap-on-cross-site-navigation-enabled` property
enabled. This property was previously disabled by default.

## Event Parameter Removed from Context Menu and Option Menu Signals

[signal@WebKit.WebView::context-menu] and [signal@WebKit.WebView::show-option-
menu]
no longer have a [type@Gdk.Event] parameter. Adjust your signal handlers
accordingly.

## Changes to WebKitWebView Construction

`webkit_web_view_new_with_context()`, `webkit_web_view_new_with_settings()`,
`webkit_web_view_new_with_user_content_manager()`, and
`webkit_web_view_new_with_related_view()` have all been removed. You
may directly use `g_object_new()` instead. [ctor@WebKit.WebView.new] remains.

## Network Session API

WebKit now uses a single global network process for all web contexts, and
different
network sessions can be created and used in the same network process. All the
networking
APIs have been moved from [type@WebKit.WebContext] and
[type@WebKit.WebsiteDataManager] to the new class
[type@WebKit.NetworkSession]. There's a default global persistent session that
you can get with
[func@WebKit.NetworkSession.get_default]. You can also create new sessions with
[ctor@WebKit.NetworkSession.new] for persistent sessions and
[ctor@WebKit.NetworkSession.new_ephemeral]
for ephemeral sessions. It's no longer possible to create a
[type@WebKit.WebsiteDataManager]; it's now
created by the [type@WebKit.NetworkSession] automatically at construction time.
The [type@WebKit.NetworkSession]
to be used must be passed to the [type@WebKit.WebView] as a construct parameter.
You can pass the
same [type@WebKit.NetworkSession] object to several web views to use the same
session. The only exception
is automation mode, which uses its own ephemeral session that is configured by
the automation
session capabilities. If you notice that your application uses
[type@WebKit.WebContext] or
[type@WebKit.WebsiteDataManager] APIs that no longer exist, look for replacement
APIs
in [type@WebKit.NetworkSession].

`webkit_web_context_clear_cache()` does not have a direct replacement, but you
can use [method@WebKit.WebsiteDataManager.clear] to achieve the same effect.

The `WebKitWebContext::download-started` signal has been removed. Use
[signal@WebKit.NetworkSession::download-started] instead.

## Favicon Database

[type@WebKit.FaviconDatabase] is now owned by [type@WebKit.WebsiteDataManager]
instead of [type@WebKit.WebContext]. Use
[method@WebKit.WebsiteDataManager.set_favicons_enabled] to enable the favicon
database.

There is no replacement for
`webkit_web_context_set_favicon_database_directory()`.
Favicons will be stored in the base cache directory of the website data manager.

## Hardware Acceleration Policy

`WEBKIT_HARDWARE_ACCELERATION_POLICY_ON_DEMAND` has been removed from
[enum@WebKit.HardwareAccelerationPolicy]. You may still use
[method@WebKit.Settings.set_hardware_acceleration_policy] to enable or disable
hardware acceleration.

## Scrollbar Appearance

Because GTK 4 does not contain a foreign drawing API, it is no longer possible
to draw scrollbars that match arbitrary GTK themes. Accordingly, the
`webkit_web_context_get_use_system_appearance_for_scrollbars` and
`webkit_web_context_set_use_system_appearance_for_scrollbars` APIs have been
removed. WebKit will draw scrollbars that match the Adwaita GTK theme.

## User Script Message Handlers

`webkit_user_content_manager_register_script_message_handler_in_world()` and
`webkit_user_content_manager_unregister_script_message_handler_in_world()` have
been removed. Instead,
[method@WebKit.UserContentManager.register_script_message_handler]
and [method@WebKit.UserContentManager.unregister_script_message_handler] have
gained parameters to specify the script world to use.

## Download Destination

[method@WebKit.Download.set_destination],
[method@WebKit.Download.get_destination],
[property@WebKit.Download:destination], and [signal@WebKit.Download::created-
destination]
now all use a filesystem path rather than a URI. All uses must be updated
accordingly.

## JavaScript Results

WebKitJavascriptResult has been removed.
[signal@WebKit.UserContentManager::script-message-received]
now directly returns a [class@JavaScriptCore.Value] instead.

## Web Process Extension

WebKitWebExtension has been renamed to WebKitWebProcessExtension to avoid
confusion with WebExtensions, which are unrelated. This affects many methods and
signals of other objects as well, e.g. [signal@WebKit.WebContext::initialize-
web-process-extensions].
The name of your extension's entry point must now be
`webkit_web_process_extension_initialize()`
or `webkit_web_process_extension_initialize_with_user_data()`.

Beware that as of WebKitGTK 2.40, the entire web process API may unfortunately
be removed in the future. For more information on why, see
[this mailing list thread](https://lists.webkit.org/archives/list/webkit-
dev@lists.webkit.org/thread/SDXWZE54IUJZTD2245RXXTFSWJ4TZZSR/).

--===============9187149634313765075==--
