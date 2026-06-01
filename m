Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDB5CD98D6
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1555.1780328130323382964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IN0VfygL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gG7lKsnd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d3c610-f9e9df91-f0d7-44d9-897e-61734fdca436-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AbwewokWu/76yPMSZJzWX7LsuFJxB29Q4INpa5ij4mE=;
	b=IN0VfygLghHlnjZUMEGeEVy1eKp0OBSZJ61louLr6IEgpMcptBL3NhNr7Vo0hvy6
	1dt6Jcw/KGkA8gPzcAZ4n90MfOvOtK3HIHc2ts6kxAHbiELk2W87ZT6JKQqq3tkwCh9
	QQ8/2jpDb/YbPfPcS+XYwWpEReEabeCosx7wDpDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AbwewokWu/76yPMSZJzWX7LsuFJxB29Q4INpa5ij4mE=;
	b=gG7lKsnd6tRUySLW8DCEn0omhme6hwi+Ih077V5jz1bjI4zJndrjp9actUEz1c/L
	R1RNzXBd1IfEe1DfvBfDlaWMwvguDRw7vp5vf+Hi6MB6skNH2dYDUIBG4sJ6ps51T++
	VeQv/Kf4UFqz22pSghNrRkCUCA82kzLz3w2x7WGY=
Content-Type: multipart/mixed; boundary="===============8969925640481915548=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost: upgrading to 1.91.0 FAILED
Message-ID: <0101019e83d3c610-f9e9df91-f0d7-44d9-897e-61734fdca436-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237948

--===============8969925640481915548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost* to *1.91.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe boost failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-8e8d5f976b6da93691f9132f22de3156ccb9d6be"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8e8d5f976b6da93691f9132f22de3156ccb9d6be"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-8e8d5f976b6da93691f9132f22de3156ccb9d6be"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8e8d5f976b6da93691f9132f22de3156ccb9d6be"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
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
Adding changed files:   0% |                                    | ETA:  0:01:31
Adding changed files:   1% |                                    | ETA:  0:01:14
Adding changed files:   1% |                                    | ETA:  0:01:14
Adding changed files:   2% |                                    | ETA:  0:01:07
Adding changed files:   2% |                                    | ETA:  0:01:04
Adding changed files:   3% |#                                   | ETA:  0:01:02
Adding changed files:   3% |#                                   | ETA:  0:00:59
Adding changed files:   4% |#                                   | ETA:  0:00:57
Adding changed files:   4% |#                                   | ETA:  0:00:55
Adding changed files:   5% |#                                   | ETA:  0:00:54
Adding changed files:   5% |##                                  | ETA:  0:00:53
Adding changed files:   6% |##                                  | ETA:  0:00:52
Adding changed files:   6% |##                                  | ETA:  0:00:50
Adding changed files:   7% |##                                  | ETA:  0:00:49
Adding changed files:   7% |##                                  | ETA:  0:00:48
Adding changed files:   8% |##                                  | ETA:  0:00:48
Adding changed files:   8% |###                                 | ETA:  0:00:48
Adding changed files:   9% |###                                 | ETA:  0:00:49
Adding changed files:   9% |###                                 | ETA:  0:00:49
Adding changed files:  10% |###                                 | ETA:  0:00:49
Adding changed files:  10% |###                                 | ETA:  0:00:49
Adding changed files:  11% |####                                | ETA:  0:00:48
Adding changed files:  11% |####                                | ETA:  0:00:48
Adding changed files:  12% |####                                | ETA:  0:00:47
Adding changed files:  12% |####                                | ETA:  0:00:47
Adding changed files:  13% |####                                | ETA:  0:00:46
Adding changed files:  13% |####                                | ETA:  0:00:46
Adding changed files:  14% |#####                               | ETA:  0:00:45
Adding changed files:  14% |#####                               | ETA:  0:00:45
Adding changed files:  15% |#####                               | ETA:  0:00:45
Adding changed files:  15% |#####                               | ETA:  0:00:44
Adding changed files:  16% |#####                               | ETA:  0:00:44
Adding changed files:  16% |######                              | ETA:  0:00:43
Adding changed files:  17% |######                              | ETA:  0:00:43
Adding changed files:  17% |######                              | ETA:  0:00:42
Adding changed files:  18% |######                              | ETA:  0:00:42
Adding changed files:  18% |######                              | ETA:  0:00:41
Adding changed files:  19% |######                              | ETA:  0:00:41
Adding changed files:  19% |#######                             | ETA:  0:00:41
Adding changed files:  20% |#######                             | ETA:  0:00:40
Adding changed files:  20% |#######                             | ETA:  0:00:40
Adding changed files:  21% |#######                             | ETA:  0:00:40
Adding changed files:  21% |#######                             | ETA:  0:00:40
Adding changed files:  22% |########                            | ETA:  0:00:39
Adding changed files:  22% |########                            | ETA:  0:00:39
Adding changed files:  23% |########                            | ETA:  0:00:39
Adding changed files:  23% |########                            | ETA:  0:00:38
Adding changed files:  24% |########                            | ETA:  0:00:38
Adding changed files:  24% |########                            | ETA:  0:00:38
Adding changed files:  25% |#########                           | ETA:  0:00:37
Adding changed files:  25% |#########                           | ETA:  0:00:37
Adding changed files:  26% |#########                           | ETA:  0:00:37
Adding changed files:  26% |#########                           | ETA:  0:00:37
Adding changed files:  27% |#########                           | ETA:  0:00:36
Adding changed files:  27% |##########                          | ETA:  0:00:36
Adding changed files:  28% |##########                          | ETA:  0:00:36
Adding changed files:  28% |##########                          | ETA:  0:00:36
Adding changed files:  29% |##########                          | ETA:  0:00:35
Adding changed files:  29% |##########                          | ETA:  0:00:35
Adding changed files:  30% |##########                          | ETA:  0:00:35
Adding changed files:  30% |###########                         | ETA:  0:00:34
Adding changed files:  31% |###########                         | ETA:  0:00:34
Adding changed files:  31% |###########                         | ETA:  0:00:34
Adding changed files:  32% |###########                         | ETA:  0:00:33
Adding changed files:  32% |###########                         | ETA:  0:00:33
Adding changed files:  33% |############                        | ETA:  0:00:33
Adding changed files:  33% |############                        | ETA:  0:00:33
Adding changed files:  34% |############                        | ETA:  0:00:33
Adding changed files:  34% |############                        | ETA:  0:00:32
Adding changed files:  35% |############                        | ETA:  0:00:32
Adding changed files:  35% |############                        | ETA:  0:00:32
Adding changed files:  36% |#############                       | ETA:  0:00:32
Adding changed files:  37% |#############                       | ETA:  0:00:31
Adding changed files:  37% |#############                       | ETA:  0:00:31
Adding changed files:  38% |#############                       | ETA:  0:00:31
Adding changed files:  38% |#############                       | ETA:  0:00:31
Adding changed files:  39% |##############                      | ETA:  0:00:30
Adding changed files:  39% |##############                      | ETA:  0:00:30
Adding changed files:  40% |##############                      | ETA:  0:00:30
Adding changed files:  40% |##############                      | ETA:  0:00:30
Adding changed files:  41% |##############                      | ETA:  0:00:29
Adding changed files:  41% |##############                      | ETA:  0:00:29
Adding changed files:  42% |###############                     | ETA:  0:00:29
Adding changed files:  42% |###############                     | ETA:  0:00:29
Adding changed files:  43% |###############                     | ETA:  0:00:28
Adding changed files:  43% |###############                     | ETA:  0:00:28
Adding changed files:  44% |###############                     | ETA:  0:00:28
Adding changed files:  44% |################                    | ETA:  0:00:27
Adding changed files:  45% |################                    | ETA:  0:00:27
Adding changed files:  45% |################                    | ETA:  0:00:27
Adding changed files:  46% |################                    | ETA:  0:00:27
Adding changed files:  46% |################                    | ETA:  0:00:26
Adding changed files:  47% |################                    | ETA:  0:00:26
Adding changed files:  47% |#################                   | ETA:  0:00:26
Adding changed files:  48% |#################                   | ETA:  0:00:26
Adding changed files:  48% |#################                   | ETA:  0:00:26
Adding changed files:  49% |#################                   | ETA:  0:00:25
Adding changed files:  49% |#################                   | ETA:  0:00:25
Adding changed files:  50% |##################                  | ETA:  0:00:25
Adding changed files:  50% |##################                  | ETA:  0:00:25
Adding changed files:  51% |##################                  | ETA:  0:00:24
Adding changed files:  51% |##################                  | ETA:  0:00:24
Adding changed files:  52% |##################                  | ETA:  0:00:24
Adding changed files:  52% |##################                  | ETA:  0:00:23
Adding changed files:  53% |###################                 | ETA:  0:00:23
Adding changed files:  53% |###################                 | ETA:  0:00:23
Adding changed files:  54% |###################                 | ETA:  0:00:23
Adding changed files:  54% |###################                 | ETA:  0:00:22
Adding changed files:  55% |###################                 | ETA:  0:00:22
Adding changed files:  55% |####################                | ETA:  0:00:22
Adding changed files:  56% |####################                | ETA:  0:00:22
Adding changed files:  56% |####################                | ETA:  0:00:21
Adding changed files:  57% |####################                | ETA:  0:00:21
Adding changed files:  57% |####################                | ETA:  0:00:21
Adding changed files:  58% |####################                | ETA:  0:00:21
Adding changed files:  58% |#####################               | ETA:  0:00:20
Adding changed files:  59% |#####################               | ETA:  0:00:20
Adding changed files:  59% |#####################               | ETA:  0:00:20
Adding changed files:  60% |#####################               | ETA:  0:00:20
Adding changed files:  60% |#####################               | ETA:  0:00:19
Adding changed files:  61% |######################              | ETA:  0:00:19
Adding changed files:  61% |######################              | ETA:  0:00:19
Adding changed files:  62% |######################              | ETA:  0:00:19
Adding changed files:  62% |######################              | ETA:  0:00:18
Adding changed files:  63% |######################              | ETA:  0:00:18
Adding changed files:  63% |######################              | ETA:  0:00:18
Adding changed files:  64% |#######################             | ETA:  0:00:18
Adding changed files:  64% |#######################             | ETA:  0:00:17
Adding changed files:  65% |#######################             | ETA:  0:00:17
Adding changed files:  65% |#######################             | ETA:  0:00:17
Adding changed files:  66% |#######################             | ETA:  0:00:17
Adding changed files:  66% |########################            | ETA:  0:00:16
Adding changed files:  67% |########################            | ETA:  0:00:16
Adding changed files:  67% |########################            | ETA:  0:00:16
Adding changed files:  68% |########################            | ETA:  0:00:16
Adding changed files:  68% |########################            | ETA:  0:00:15
Adding changed files:  69% |#########################           | ETA:  0:00:15
Adding changed files:  69% |#########################           | ETA:  0:00:15
Adding changed files:  70% |#########################           | ETA:  0:00:15
Adding changed files:  70% |#########################           | ETA:  0:00:15
Adding changed files:  71% |#########################           | ETA:  0:00:15
Adding changed files:  71% |#########################           | ETA:  0:00:15
Adding changed files:  72% |##########################          | ETA:  0:00:14
Adding changed files:  72% |##########################          | ETA:  0:00:14
Adding changed files:  73% |##########################          | ETA:  0:00:14
Adding changed files:  74% |##########################          | ETA:  0:00:14
Adding changed files:  74% |##########################          | ETA:  0:00:13
Adding changed files:  75% |###########################         | ETA:  0:00:13
Adding changed files:  75% |###########################         | ETA:  0:00:13
Adding changed files:  76% |###########################         | ETA:  0:00:12
Adding changed files:  76% |###########################         | ETA:  0:00:12
Adding changed files:  77% |###########################         | ETA:  0:00:12
Adding changed files:  77% |###########################         | ETA:  0:00:12
Adding changed files:  78% |############################        | ETA:  0:00:11
Adding changed files:  78% |############################        | ETA:  0:00:11
Adding changed files:  79% |############################        | ETA:  0:00:11
Adding changed files:  79% |############################        | ETA:  0:00:11
Adding changed files:  80% |############################        | ETA:  0:00:10
Adding changed files:  80% |#############################       | ETA:  0:00:10
Adding changed files:  81% |#############################       | ETA:  0:00:10
Adding changed files:  81% |#############################       | ETA:  0:00:09
Adding changed files:  82% |#############################       | ETA:  0:00:09
Adding changed files:  82% |#############################       | ETA:  0:00:09
Adding changed files:  83% |#############################       | ETA:  0:00:09
Adding changed files:  83% |##############################      | ETA:  0:00:08
Adding changed files:  84% |##############################      | ETA:  0:00:08
Adding changed files:  84% |##############################      | ETA:  0:00:08
Adding changed files:  85% |##############################      | ETA:  0:00:08
Adding changed files:  85% |##############################      | ETA:  0:00:07
Adding changed files:  86% |###############################     | ETA:  0:00:07
Adding changed files:  86% |###############################     | ETA:  0:00:07
Adding changed files:  87% |###############################     | ETA:  0:00:06
Adding changed files:  87% |###############################     | ETA:  0:00:06
Adding changed files:  88% |###############################     | ETA:  0:00:06
Adding changed files:  88% |###############################     | ETA:  0:00:06
Adding changed files:  89% |################################    | ETA:  0:00:05
Adding changed files:  89% |################################    | ETA:  0:00:05
Adding changed files:  90% |################################    | ETA:  0:00:05
Adding changed files:  90% |################################    | ETA:  0:00:05
Adding changed files:  91% |################################    | ETA:  0:00:04
Adding changed files:  91% |#################################   | ETA:  0:00:04
Adding changed files:  92% |#################################   | ETA:  0:00:04
Adding changed files:  92% |#################################   | ETA:  0:00:03
Adding changed files:  93% |#################################   | ETA:  0:00:03
Adding changed files:  93% |#################################   | ETA:  0:00:03
Adding changed files:  94% |#################################   | ETA:  0:00:03
Adding changed files:  94% |##################################  | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:02
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:53
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://archives.boost.io/release/1.91.0/source/boost_1_91_0.tar.bz2...
INFO: Rebasing devtool onto c81321abcb9d4729475f46fb1c92d6b889ee0b90
WARNING: Command 'git rebase c81321abcb9d4729475f46fb1c92d6b889ee0b90' failed:
Auto-merging tools/build/src/tools/gcc.jam
CONFLICT (content): Merge conflict in tools/build/src/tools/gcc.jam

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/boost
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/boost/boost_1.91.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8969925640481915548==--

