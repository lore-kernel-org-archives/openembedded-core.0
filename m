Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5DCC48BF4
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2162.1706810406746505550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CyxhfMmg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PlVENcWH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d65d3f42b-4b1fc74e-9432-4571-a01c-0d035db8dd5f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=552n7R3MqVWZn5r1ruCxfPV4a6IMniPz3BjTVBz3iF0=;
	b=CyxhfMmgQprkc9bW7jVDwmKvoxFnnr4vL72QAVJdtwdf+NQeyDhdPrENN6pW8MZF
	w+5nISYZERocwFqdTuhw5CXYxH3ypeqHppM8wHBKzLH6qgN9LGVxfGx1AmWmioNYJER
	4g17F0e2tk559JDflLpZb94ujgrN4C3N2GyZP3TQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=552n7R3MqVWZn5r1ruCxfPV4a6IMniPz3BjTVBz3iF0=;
	b=PlVENcWHDJpcSodx7IZFU4IbhaMf5SpPw3GAvLiTzEtkEM36xjIa3qkUQZyY3eYq
	9sayh2aAPDNVNlx+NUmWvY1/WiMyE7XIPByJSSj9oxTd+lo0JOXQ4pLVJ4R2yhPQWPq
	V0ox5t/Q4fcgB8zvj/4vMjHnHBriLO6JnJz2jJYA=
Content-Type: multipart/mixed; boundary="===============1563747664841465653=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.75.0 FAILED
Message-ID: <0101018d65d3f42b-4b1fc74e-9432-4571-a01c-0d035db8dd5f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194655

--===============1563747664841465653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.75.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe cargo failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a9ebf1e0b9daabb9d605076da2686d974e931129"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a9ebf1e0b9daabb9d605076da2686d974e931129"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 5 Local 5 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1850 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (911 cached, 2 parsed). 1850 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a9ebf1e0b9daabb9d605076da2686d974e931129"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a9ebf1e0b9daabb9d605076da2686d974e931129"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 5 Mirrors 0 Missed 1 Current 22 (83% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:02:13
Adding changed files:   1% |                                    | ETA:  0:01:35
Adding changed files:   1% |                                    | ETA:  0:01:26
Adding changed files:   2% |                                    | ETA:  0:01:18
Adding changed files:   2% |                                    | ETA:  0:01:13
Adding changed files:   3% |#                                   | ETA:  0:01:11
Adding changed files:   3% |#                                   | ETA:  0:01:10
Adding changed files:   4% |#                                   | ETA:  0:01:09
Adding changed files:   4% |#                                   | ETA:  0:01:07
Adding changed files:   5% |#                                   | ETA:  0:01:06
Adding changed files:   6% |##                                  | ETA:  0:01:05
Adding changed files:   6% |##                                  | ETA:  0:01:05
Adding changed files:   7% |##                                  | ETA:  0:01:04
Adding changed files:   7% |##                                  | ETA:  0:01:03
Adding changed files:   8% |##                                  | ETA:  0:01:02
Adding changed files:   8% |###                                 | ETA:  0:01:02
Adding changed files:   9% |###                                 | ETA:  0:01:01
Adding changed files:   9% |###                                 | ETA:  0:01:01
Adding changed files:  10% |###                                 | ETA:  0:01:00
Adding changed files:  11% |###                                 | ETA:  0:01:00
Adding changed files:  11% |####                                | ETA:  0:00:59
Adding changed files:  12% |####                                | ETA:  0:00:59
Adding changed files:  12% |####                                | ETA:  0:00:59
Adding changed files:  13% |####                                | ETA:  0:00:58
Adding changed files:  13% |####                                | ETA:  0:00:57
Adding changed files:  14% |#####                               | ETA:  0:00:57
Adding changed files:  14% |#####                               | ETA:  0:00:56
Adding changed files:  15% |#####                               | ETA:  0:00:56
Adding changed files:  16% |#####                               | ETA:  0:00:56
Adding changed files:  16% |#####                               | ETA:  0:00:55
Adding changed files:  17% |######                              | ETA:  0:00:55
Adding changed files:  17% |######                              | ETA:  0:00:55
Adding changed files:  18% |######                              | ETA:  0:00:54
Adding changed files:  18% |######                              | ETA:  0:00:54
Adding changed files:  19% |######                              | ETA:  0:00:53
Adding changed files:  19% |#######                             | ETA:  0:00:53
Adding changed files:  20% |#######                             | ETA:  0:00:53
Adding changed files:  21% |#######                             | ETA:  0:00:52
Adding changed files:  21% |#######                             | ETA:  0:00:52
Adding changed files:  22% |#######                             | ETA:  0:00:52
Adding changed files:  22% |########                            | ETA:  0:00:51
Adding changed files:  23% |########                            | ETA:  0:00:51
Adding changed files:  23% |########                            | ETA:  0:00:50
Adding changed files:  24% |########                            | ETA:  0:00:50
Adding changed files:  24% |########                            | ETA:  0:00:50
Adding changed files:  25% |#########                           | ETA:  0:00:49
Adding changed files:  25% |#########                           | ETA:  0:00:49
Adding changed files:  26% |#########                           | ETA:  0:00:48
Adding changed files:  27% |#########                           | ETA:  0:00:48
Adding changed files:  27% |#########                           | ETA:  0:00:47
Adding changed files:  28% |##########                          | ETA:  0:00:47
Adding changed files:  28% |##########                          | ETA:  0:00:47
Adding changed files:  29% |##########                          | ETA:  0:00:47
Adding changed files:  29% |##########                          | ETA:  0:00:46
Adding changed files:  30% |##########                          | ETA:  0:00:46
Adding changed files:  30% |###########                         | ETA:  0:00:45
Adding changed files:  31% |###########                         | ETA:  0:00:45
Adding changed files:  32% |###########                         | ETA:  0:00:45
Adding changed files:  32% |###########                         | ETA:  0:00:46
Adding changed files:  33% |###########                         | ETA:  0:00:46
Adding changed files:  33% |############                        | ETA:  0:00:45
Adding changed files:  34% |############                        | ETA:  0:00:45
Adding changed files:  34% |############                        | ETA:  0:00:45
Adding changed files:  35% |############                        | ETA:  0:00:45
Adding changed files:  35% |############                        | ETA:  0:00:44
Adding changed files:  36% |#############                       | ETA:  0:00:44
Adding changed files:  37% |#############                       | ETA:  0:00:44
Adding changed files:  37% |#############                       | ETA:  0:00:43
Adding changed files:  38% |#############                       | ETA:  0:00:43
Adding changed files:  38% |#############                       | ETA:  0:00:42
Adding changed files:  39% |##############                      | ETA:  0:00:42
Adding changed files:  39% |##############                      | ETA:  0:00:42
Adding changed files:  40% |##############                      | ETA:  0:00:42
Adding changed files:  40% |##############                      | ETA:  0:00:41
Adding changed files:  41% |##############                      | ETA:  0:00:41
Adding changed files:  42% |###############                     | ETA:  0:00:41
Adding changed files:  42% |###############                     | ETA:  0:00:41
Adding changed files:  43% |###############                     | ETA:  0:00:40
Adding changed files:  43% |###############                     | ETA:  0:00:40
Adding changed files:  44% |###############                     | ETA:  0:00:40
Adding changed files:  44% |################                    | ETA:  0:00:39
Adding changed files:  45% |################                    | ETA:  0:00:39
Adding changed files:  45% |################                    | ETA:  0:00:38
Adding changed files:  46% |################                    | ETA:  0:00:38
Adding changed files:  46% |################                    | ETA:  0:00:38
Adding changed files:  47% |#################                   | ETA:  0:00:37
Adding changed files:  48% |#################                   | ETA:  0:00:37
Adding changed files:  48% |#################                   | ETA:  0:00:37
Adding changed files:  49% |#################                   | ETA:  0:00:36
Adding changed files:  49% |#################                   | ETA:  0:00:36
Adding changed files:  50% |##################                  | ETA:  0:00:36
Adding changed files:  50% |##################                  | ETA:  0:00:35
Adding changed files:  51% |##################                  | ETA:  0:00:35
Adding changed files:  51% |##################                  | ETA:  0:00:35
Adding changed files:  52% |##################                  | ETA:  0:00:34
Adding changed files:  53% |###################                 | ETA:  0:00:34
Adding changed files:  53% |###################                 | ETA:  0:00:33
Adding changed files:  54% |###################                 | ETA:  0:00:33
Adding changed files:  54% |###################                 | ETA:  0:00:33
Adding changed files:  55% |###################                 | ETA:  0:00:32
Adding changed files:  55% |####################                | ETA:  0:00:32
Adding changed files:  56% |####################                | ETA:  0:00:32
Adding changed files:  56% |####################                | ETA:  0:00:31
Adding changed files:  57% |####################                | ETA:  0:00:31
Adding changed files:  58% |####################                | ETA:  0:00:31
Adding changed files:  58% |#####################               | ETA:  0:00:30
Adding changed files:  59% |#####################               | ETA:  0:00:30
Adding changed files:  59% |#####################               | ETA:  0:00:29
Adding changed files:  60% |#####################               | ETA:  0:00:29
Adding changed files:  60% |#####################               | ETA:  0:00:29
Adding changed files:  61% |######################              | ETA:  0:00:28
Adding changed files:  61% |######################              | ETA:  0:00:28
Adding changed files:  62% |######################              | ETA:  0:00:27
Adding changed files:  63% |######################              | ETA:  0:00:27
Adding changed files:  63% |######################              | ETA:  0:00:27
Adding changed files:  64% |#######################             | ETA:  0:00:26
Adding changed files:  64% |#######################             | ETA:  0:00:26
Adding changed files:  65% |#######################             | ETA:  0:00:26
Adding changed files:  65% |#######################             | ETA:  0:00:25
Adding changed files:  66% |#######################             | ETA:  0:00:25
Adding changed files:  66% |########################            | ETA:  0:00:24
Adding changed files:  67% |########################            | ETA:  0:00:24
Adding changed files:  67% |########################            | ETA:  0:00:24
Adding changed files:  68% |########################            | ETA:  0:00:23
Adding changed files:  69% |########################            | ETA:  0:00:23
Adding changed files:  69% |#########################           | ETA:  0:00:23
Adding changed files:  70% |#########################           | ETA:  0:00:22
Adding changed files:  70% |#########################           | ETA:  0:00:22
Adding changed files:  71% |#########################           | ETA:  0:00:21
Adding changed files:  71% |#########################           | ETA:  0:00:21
Adding changed files:  72% |##########################          | ETA:  0:00:21
Adding changed files:  72% |##########################          | ETA:  0:00:20
Adding changed files:  73% |##########################          | ETA:  0:00:20
Adding changed files:  74% |##########################          | ETA:  0:00:19
Adding changed files:  74% |##########################          | ETA:  0:00:19
Adding changed files:  75% |###########################         | ETA:  0:00:18
Adding changed files:  75% |###########################         | ETA:  0:00:18
Adding changed files:  76% |###########################         | ETA:  0:00:18
Adding changed files:  76% |###########################         | ETA:  0:00:17
Adding changed files:  77% |###########################         | ETA:  0:00:17
Adding changed files:  77% |############################        | ETA:  0:00:16
Adding changed files:  78% |############################        | ETA:  0:00:16
Adding changed files:  79% |############################        | ETA:  0:00:16
Adding changed files:  79% |############################        | ETA:  0:00:15
Adding changed files:  80% |############################        | ETA:  0:00:15
Adding changed files:  80% |#############################       | ETA:  0:00:14
Adding changed files:  81% |#############################       | ETA:  0:00:14
Adding changed files:  81% |#############################       | ETA:  0:00:14
Adding changed files:  82% |#############################       | ETA:  0:00:13
Adding changed files:  82% |#############################       | ETA:  0:00:13
Adding changed files:  83% |##############################      | ETA:  0:00:12
Adding changed files:  84% |##############################      | ETA:  0:00:12
Adding changed files:  84% |##############################      | ETA:  0:00:11
Adding changed files:  85% |##############################      | ETA:  0:00:11
Adding changed files:  85% |##############################      | ETA:  0:00:11
Adding changed files:  86% |###############################     | ETA:  0:00:10
Adding changed files:  86% |###############################     | ETA:  0:00:10
Adding changed files:  87% |###############################     | ETA:  0:00:09
Adding changed files:  87% |###############################     | ETA:  0:00:09
Adding changed files:  88% |###############################     | ETA:  0:00:08
Adding changed files:  88% |################################    | ETA:  0:00:08
Adding changed files:  89% |################################    | ETA:  0:00:08
Adding changed files:  90% |################################    | ETA:  0:00:07
Adding changed files:  90% |################################    | ETA:  0:00:07
Adding changed files:  91% |################################    | ETA:  0:00:06
Adding changed files:  91% |#################################   | ETA:  0:00:06
Adding changed files:  92% |#################################   | ETA:  0:00:05
Adding changed files:  92% |#################################   | ETA:  0:00:05
Adding changed files:  93% |#################################   | ETA:  0:00:05
Adding changed files:  93% |#################################   | ETA:  0:00:04
Adding changed files:  94% |##################################  | ETA:  0:00:04
Adding changed files:  95% |##################################  | ETA:  0:00:03
Adding changed files:  95% |##################################  | ETA:  0:00:03
Adding changed files:  96% |##################################  | ETA:  0:00:02
Adding changed files:  96% |##################################  | ETA:  0:00:02
Adding changed files:  97% |################################### | ETA:  0:00:02
Adding changed files:  97% |################################### | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:01:18
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.75.0-src.tar.xz;name=rust...
INFO: Rebasing devtool onto 8876e80eb54bf2b163dad7ef928ced6c8ef0d721
WARNING: Command 'git rebase 8876e80eb54bf2b163dad7ef928ced6c8ef0d721' failed:
Auto-merging vendor/libc/.cargo-checksum.json
CONFLICT (content): Merge conflict in vendor/libc/.cargo-checksum.json
Auto-merging vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mod.rs
Auto-merging vendor/libc/src/unix/linux_like/linux/musl/b32/hexagon.rs
CONFLICT (content): Merge conflict in vendor/libc/src/unix/linux_like/linux/musl/b32/hexagon.rs
Auto-merging vendor/libc/src/unix/linux_like/linux/musl/b32/mips/mod.rs
Auto-merging vendor/libc/src/unix/linux_like/linux/musl/b32/powerpc.rs
Auto-merging vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mod.rs
Auto-merging vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
CONFLICT (content): Merge conflict in vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
Auto-merging vendor/libc/src/unix/linux_like/linux/musl/mod.rs

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/cargo
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/cargo/cargo_1.75.0.bb
WARNING: Version is pinned to 1.74% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1563747664841465653==--

