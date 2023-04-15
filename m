Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE80C88CBC
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13813.1681581686364824448
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H3Qstxqi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018786143ba4-359f9d50-e133-4b5a-9e8f-07cd49db651b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UyD9EniTyMyqsW3JvdDFUwFTwLf+XNRr+Cv6Svuj4rw=;
	b=H3QstxqipZHnw4E3drrriNdZSRXF+vTqO7THE0n60WMNjHXqs9EJpEUMcy5oRPEE
	IWU+kVMQ/Lo5cxWWkTYBx4oJlUR1y5OKcrAICPLmEpP2s3SG0+DJqBG1ACJrWi7smNo
	0O9570QFJOlgCkNF+uIhKphBI/NFXJp2xP6koyYA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UyD9EniTyMyqsW3JvdDFUwFTwLf+XNRr+Cv6Svuj4rw=;
	b=d73HoavO9l5JaF9xD745nWIKvrQ2oekV/9anyUKYeFghB8fFWszXw/y+6LtPrL6T
	CY8IaQIXCi5n8rxim6zIqAfucKTh5EKk5UND/Y6zZDgNWIdUfbOwhyGC14BNqFfCxkn
	HFshntexX/acCrfmVrxaM1BixD4t8O52bHDav/7I=
Content-Type: multipart/mixed; boundary="===============0574236566256529752=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.56.0 FAILED
Message-ID: <0101018786143ba4-359f9d50-e133-4b5a-9e8f-07cd49db651b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180070

--===============0574236566256529752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librsvg* to *2.56.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade librsvg -V 2.56.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:47:49.693176)
Loading cache...done.
Loaded 1799 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a13df9167584bb5c0d151295916691326eb0c1bc"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1800 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a13df9167584bb5c0d151295916691326eb0c1bc"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:18
Adding changed files:   1% |                                    | ETA:  0:00:14
Adding changed files:   2% |                                    | ETA:  0:00:12
Adding changed files:   3% |#                                   | ETA:  0:00:11
Adding changed files:   3% |#                                   | ETA:  0:00:10
Adding changed files:   4% |#                                   | ETA:  0:00:10
Adding changed files:   5% |#                                   | ETA:  0:00:09
Adding changed files:   6% |##                                  | ETA:  0:00:09
Adding changed files:   7% |##                                  | ETA:  0:00:09
Adding changed files:   7% |##                                  | ETA:  0:00:08
Adding changed files:   8% |###                                 | ETA:  0:00:08
Adding changed files:   9% |###                                 | ETA:  0:00:08
Adding changed files:  10% |###                                 | ETA:  0:00:08
Adding changed files:  10% |###                                 | ETA:  0:00:08
Adding changed files:  11% |####                                | ETA:  0:00:07
Adding changed files:  12% |####                                | ETA:  0:00:07
Adding changed files:  13% |####                                | ETA:  0:00:07
Adding changed files:  14% |#####                               | ETA:  0:00:07
Adding changed files:  14% |#####                               | ETA:  0:00:07
Adding changed files:  15% |#####                               | ETA:  0:00:07
Adding changed files:  16% |#####                               | ETA:  0:00:07
Adding changed files:  17% |######                              | ETA:  0:00:07
Adding changed files:  17% |######                              | ETA:  0:00:07
Adding changed files:  18% |######                              | ETA:  0:00:06
Adding changed files:  19% |#######                             | ETA:  0:00:06
Adding changed files:  20% |#######                             | ETA:  0:00:06
Adding changed files:  21% |#######                             | ETA:  0:00:06
Adding changed files:  21% |#######                             | ETA:  0:00:06
Adding changed files:  22% |########                            | ETA:  0:00:06
Adding changed files:  23% |########                            | ETA:  0:00:06
Adding changed files:  24% |########                            | ETA:  0:00:06
Adding changed files:  24% |########                            | ETA:  0:00:06
Adding changed files:  25% |#########                           | ETA:  0:00:06
Adding changed files:  26% |#########                           | ETA:  0:00:06
Adding changed files:  27% |#########                           | ETA:  0:00:06
Adding changed files:  28% |##########                          | ETA:  0:00:05
Adding changed files:  28% |##########                          | ETA:  0:00:05
Adding changed files:  29% |##########                          | ETA:  0:00:05
Adding changed files:  30% |##########                          | ETA:  0:00:05
Adding changed files:  31% |###########                         | ETA:  0:00:05
Adding changed files:  31% |###########                         | ETA:  0:00:05
Adding changed files:  32% |###########                         | ETA:  0:00:05
Adding changed files:  33% |############                        | ETA:  0:00:05
Adding changed files:  34% |############                        | ETA:  0:00:05
Adding changed files:  35% |############                        | ETA:  0:00:05
Adding changed files:  35% |############                        | ETA:  0:00:05
Adding changed files:  36% |#############                       | ETA:  0:00:05
Adding changed files:  37% |#############                       | ETA:  0:00:05
Adding changed files:  38% |#############                       | ETA:  0:00:04
Adding changed files:  38% |##############                      | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:04
Adding changed files:  40% |##############                      | ETA:  0:00:04
Adding changed files:  41% |##############                      | ETA:  0:00:04
Adding changed files:  42% |###############                     | ETA:  0:00:04
Adding changed files:  42% |###############                     | ETA:  0:00:04
Adding changed files:  43% |###############                     | ETA:  0:00:04
Adding changed files:  44% |################                    | ETA:  0:00:04
Adding changed files:  45% |################                    | ETA:  0:00:04
Adding changed files:  46% |################                    | ETA:  0:00:04
Adding changed files:  46% |################                    | ETA:  0:00:04
Adding changed files:  47% |#################                   | ETA:  0:00:04
Adding changed files:  48% |#################                   | ETA:  0:00:04
Adding changed files:  49% |#################                   | ETA:  0:00:03
Adding changed files:  49% |#################                   | ETA:  0:00:03
Adding changed files:  50% |##################                  | ETA:  0:00:03
Adding changed files:  51% |##################                  | ETA:  0:00:03
Adding changed files:  52% |##################                  | ETA:  0:00:03
Adding changed files:  53% |###################                 | ETA:  0:00:03
Adding changed files:  53% |###################                 | ETA:  0:00:03
Adding changed files:  54% |###################                 | ETA:  0:00:03
Adding changed files:  55% |###################                 | ETA:  0:00:03
Adding changed files:  56% |####################                | ETA:  0:00:03
Adding changed files:  56% |####################                | ETA:  0:00:03
Adding changed files:  57% |####################                | ETA:  0:00:03
Adding changed files:  58% |#####################               | ETA:  0:00:03
Adding changed files:  59% |#####################               | ETA:  0:00:03
Adding changed files:  60% |#####################               | ETA:  0:00:03
Adding changed files:  60% |#####################               | ETA:  0:00:02
Adding changed files:  61% |######################              | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  63% |######################              | ETA:  0:00:02
Adding changed files:  63% |#######################             | ETA:  0:00:02
Adding changed files:  64% |#######################             | ETA:  0:00:02
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  66% |#######################             | ETA:  0:00:02
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  68% |########################            | ETA:  0:00:02
Adding changed files:  69% |########################            | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  72% |##########################          | ETA:  0:00:02
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  77% |############################        | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  80% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  83% |##############################      | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  88% |################################    | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:06

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//librsvg/2.56/librsvg-2.56.0.tar.xz;name=archive...
INFO: Rebasing devtool onto 79062de710891b4bfcf44ecf2257a6a0a3e4b8d2
WARNING: Command 'git rebase 79062de710891b4bfcf44ecf2257a6a0a3e4b8d2' failed:
CONFLICT (modify/delete): vendor/system-deps/.cargo-checksum.json deleted in HEAD and modified in 57d77fe (system-deps/src/lib.rs: do not probe into harcoded list of targets).  Version 57d77fe (system-deps/src/lib.rs: do not probe into harcoded list of targets) of vendor/system-deps/.cargo-checksum.json left in tree.
CONFLICT (modify/delete): vendor/system-deps/src/lib.rs deleted in HEAD and modified in 57d77fe (system-deps/src/lib.rs: do not probe into harcoded list of targets).  Version 57d77fe (system-deps/src/lib.rs: do not probe into harcoded list of targets) of vendor/system-deps/src/lib.rs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
vendor/system-deps/.cargo-checksum.json: needs merge
vendor/system-deps/src/lib.rs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0574236566256529752==--

