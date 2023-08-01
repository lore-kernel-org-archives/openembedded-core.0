Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3D2C04FE1
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.17600.1690907330634867851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y+tMWh2P;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C19DzT0p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010189b1ee44be-06007974-96ea-40a4-a92c-88655225c357-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xodwJUpMxDgAlKbCB7Ay+MQpFJScQ5EY1b/NjCQO64A=;
	b=Y+tMWh2PwZckkv8PYkrGO4JDtB6TIcFoAXBToUETiz8ACxO/t1FKdJwA7W6tXjck
	vhgtkSfj3oU49F4upQ1DuojE85vr2JkWqc8mkNJPIOTMv948FBZZ11KjXBIAiIxyStl
	AQlAmjV79uXMR6d1qi6jZvYjAUtq7GGyzH5ias0o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xodwJUpMxDgAlKbCB7Ay+MQpFJScQ5EY1b/NjCQO64A=;
	b=C19DzT0puboVGzukafdPN6a08Xi/EmUXweLWR99dYOTr5fTun9wBUwmyPKtEkMt2
	yd27uVOpPBSmH/M+wBQfAZuCiziNp7m1e5s05YtM1RQNnNOtvabHsRZ72ztNJMbwHab
	RrJ2UUCMJqXLnXXXLwPkyVoZzIpNUTLcqqXt9k94=
Content-Type: multipart/mixed; boundary="===============2217463580356148259=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] perl: upgrading to 5.38.0 FAILED
Message-ID: <01010189b1ee44be-06007974-96ea-40a4-a92c-88655225c357-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185286

--===============2217463580356148259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *perl* to *5.38.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe perl failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:41:48.123599)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c982c4cd7f4a0212105b6986c1dc4529c9be532e"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 27 (100% match, 100% complete)
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
meta-yocto-bsp       = "tmp-auh-upgrades:c982c4cd7f4a0212105b6986c1dc4529c9be532e"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:29
Adding changed files:   1% |                                    | ETA:  0:00:17
Adding changed files:   2% |                                    | ETA:  0:00:13
Adding changed files:   3% |#                                   | ETA:  0:00:12
Adding changed files:   3% |#                                   | ETA:  0:00:11
Adding changed files:   4% |#                                   | ETA:  0:00:10
Adding changed files:   5% |#                                   | ETA:  0:00:10
Adding changed files:   6% |##                                  | ETA:  0:00:09
Adding changed files:   6% |##                                  | ETA:  0:00:09
Adding changed files:   7% |##                                  | ETA:  0:00:09
Adding changed files:   8% |###                                 | ETA:  0:00:08
Adding changed files:   9% |###                                 | ETA:  0:00:08
Adding changed files:  10% |###                                 | ETA:  0:00:08
Adding changed files:  10% |###                                 | ETA:  0:00:08
Adding changed files:  11% |####                                | ETA:  0:00:07
Adding changed files:  12% |####                                | ETA:  0:00:07
Adding changed files:  13% |####                                | ETA:  0:00:07
Adding changed files:  13% |#####                               | ETA:  0:00:07
Adding changed files:  14% |#####                               | ETA:  0:00:07
Adding changed files:  15% |#####                               | ETA:  0:00:07
Adding changed files:  16% |#####                               | ETA:  0:00:06
Adding changed files:  17% |######                              | ETA:  0:00:06
Adding changed files:  17% |######                              | ETA:  0:00:06
Adding changed files:  18% |######                              | ETA:  0:00:06
Adding changed files:  19% |######                              | ETA:  0:00:06
Adding changed files:  20% |#######                             | ETA:  0:00:06
Adding changed files:  20% |#######                             | ETA:  0:00:06
Adding changed files:  21% |#######                             | ETA:  0:00:06
Adding changed files:  22% |########                            | ETA:  0:00:06
Adding changed files:  23% |########                            | ETA:  0:00:06
Adding changed files:  24% |########                            | ETA:  0:00:06
Adding changed files:  24% |########                            | ETA:  0:00:05
Adding changed files:  25% |#########                           | ETA:  0:00:05
Adding changed files:  26% |#########                           | ETA:  0:00:05
Adding changed files:  27% |#########                           | ETA:  0:00:05
Adding changed files:  27% |##########                          | ETA:  0:00:05
Adding changed files:  28% |##########                          | ETA:  0:00:05
Adding changed files:  29% |##########                          | ETA:  0:00:05
Adding changed files:  30% |##########                          | ETA:  0:00:05
Adding changed files:  31% |###########                         | ETA:  0:00:05
Adding changed files:  31% |###########                         | ETA:  0:00:05
Adding changed files:  32% |###########                         | ETA:  0:00:05
Adding changed files:  33% |############                        | ETA:  0:00:05
Adding changed files:  34% |############                        | ETA:  0:00:05
Adding changed files:  34% |############                        | ETA:  0:00:05
Adding changed files:  35% |############                        | ETA:  0:00:05
Adding changed files:  36% |#############                       | ETA:  0:00:04
Adding changed files:  37% |#############                       | ETA:  0:00:04
Adding changed files:  38% |#############                       | ETA:  0:00:04
Adding changed files:  38% |#############                       | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:04
Adding changed files:  40% |##############                      | ETA:  0:00:05
Adding changed files:  41% |##############                      | ETA:  0:00:05
Adding changed files:  41% |###############                     | ETA:  0:00:04
Adding changed files:  42% |###############                     | ETA:  0:00:05
Adding changed files:  43% |###############                     | ETA:  0:00:05
Adding changed files:  44% |###############                     | ETA:  0:00:04
Adding changed files:  45% |################                    | ETA:  0:00:04
Adding changed files:  45% |################                    | ETA:  0:00:04
Adding changed files:  46% |################                    | ETA:  0:00:04
Adding changed files:  47% |#################                   | ETA:  0:00:04
Adding changed files:  48% |#################                   | ETA:  0:00:04
Adding changed files:  48% |#################                   | ETA:  0:00:04
Adding changed files:  49% |#################                   | ETA:  0:00:04
Adding changed files:  50% |##################                  | ETA:  0:00:04
Adding changed files:  51% |##################                  | ETA:  0:00:04
Adding changed files:  52% |##################                  | ETA:  0:00:04
Adding changed files:  52% |###################                 | ETA:  0:00:04
Adding changed files:  53% |###################                 | ETA:  0:00:04
Adding changed files:  54% |###################                 | ETA:  0:00:04
Adding changed files:  55% |###################                 | ETA:  0:00:03
Adding changed files:  55% |####################                | ETA:  0:00:03
Adding changed files:  56% |####################                | ETA:  0:00:03
Adding changed files:  57% |####################                | ETA:  0:00:03
Adding changed files:  58% |####################                | ETA:  0:00:03
Adding changed files:  59% |#####################               | ETA:  0:00:03
Adding changed files:  59% |#####################               | ETA:  0:00:03
Adding changed files:  60% |#####################               | ETA:  0:00:03
Adding changed files:  61% |######################              | ETA:  0:00:03
Adding changed files:  62% |######################              | ETA:  0:00:03
Adding changed files:  62% |######################              | ETA:  0:00:03
Adding changed files:  63% |######################              | ETA:  0:00:03
Adding changed files:  64% |#######################             | ETA:  0:00:03
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  66% |########################            | ETA:  0:00:02
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  68% |########################            | ETA:  0:00:02
Adding changed files:  69% |########################            | ETA:  0:00:02
Adding changed files:  69% |#########################           | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  72% |#########################           | ETA:  0:00:02
Adding changed files:  72% |##########################          | ETA:  0:00:02
Adding changed files:  73% |##########################          | ETA:  0:00:02
Adding changed files:  74% |##########################          | ETA:  0:00:02
Adding changed files:  75% |###########################         | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  80% |#############################       | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  83% |#############################       | ETA:  0:00:01
Adding changed files:  83% |##############################      | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:07
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.cpan.org/src/5.0/perl-5.38.0.tar.gz;name=perl...
INFO: Rebasing devtool onto 330d13088ad2873a33b763b628cce75032da29c8
WARNING: Command 'git rebase 330d13088ad2873a33b763b628cce75032da29c8' failed:
Auto-merging perl-5.38.0/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
CONFLICT (content): Merge conflict in perl-5.38.0/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 330d13088ad2873a33b763b628cce75032da29c8
WARNING: Command 'git rebase 330d13088ad2873a33b763b628cce75032da29c8' failed:
Auto-merging perl-5.38.0/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
CONFLICT (content): Merge conflict in perl-5.38.0/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 330d13088ad2873a33b763b628cce75032da29c8
WARNING: Command 'git rebase 330d13088ad2873a33b763b628cce75032da29c8' failed:
Auto-merging perl-5.38.0/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm
CONFLICT (content): Merge conflict in perl-5.38.0/cpan/HTTP-Tiny/lib/HTTP/Tiny.pm

You will need to resolve conflicts in order to complete the upgrade.
INFO: Source subdirectory has changed, updating S value
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/perl
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/perl/perl_5.38.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2217463580356148259==--

