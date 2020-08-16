Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19881.1597558950212712552
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 160B9E0203C; Sat, 15 Aug 2020 23:22:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8785E02086
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:44 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] boost: upgrading to 1.74.0 FAILED
Message-Id: <20200816062230.160B9E0203C@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:30 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============7045428527990759140=="

--===============7045428527990759140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *boost* to *1.74.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe boost failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1342 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200816"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a6a76f19d7fc3bbd8a945ce9c8f2717be9e6620"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://dl.bintray.com/boostorg/release/1.74.0/source/boost_1_74_0.tar.bz2...
Loading cache...done.
Loaded 1342 entries from dependency cache.
Parsing recipes...done.
Parsing of 779 .bb files complete (777 cached, 2 parsed). 1343 targets, 33 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200816"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a6a76f19d7fc3bbd8a945ce9c8f2717be9e6620"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:31
Adding changed files:   1% |                                    | ETA:  0:00:22
Adding changed files:   2% |#                                   | ETA:  0:00:19
Adding changed files:   3% |#                                   | ETA:  0:00:17
Adding changed files:   4% |#                                   | ETA:  0:00:16
Adding changed files:   5% |##                                  | ETA:  0:00:16
Adding changed files:   6% |##                                  | ETA:  0:00:15
Adding changed files:   7% |##                                  | ETA:  0:00:15
Adding changed files:   8% |###                                 | ETA:  0:00:14
Adding changed files:   9% |###                                 | ETA:  0:00:14
Adding changed files:  10% |###                                 | ETA:  0:00:14
Adding changed files:  11% |####                                | ETA:  0:00:13
Adding changed files:  12% |####                                | ETA:  0:00:13
Adding changed files:  13% |####                                | ETA:  0:00:13
Adding changed files:  14% |#####                               | ETA:  0:00:13
Adding changed files:  15% |#####                               | ETA:  0:00:12
Adding changed files:  16% |#####                               | ETA:  0:00:12
Adding changed files:  17% |######                              | ETA:  0:00:12
Adding changed files:  18% |######                              | ETA:  0:00:12
Adding changed files:  19% |#######                             | ETA:  0:00:12
Adding changed files:  20% |#######                             | ETA:  0:00:11
Adding changed files:  21% |#######                             | ETA:  0:00:11
Adding changed files:  22% |########                            | ETA:  0:00:11
Adding changed files:  23% |########                            | ETA:  0:00:11
Adding changed files:  24% |########                            | ETA:  0:00:11
Adding changed files:  25% |#########                           | ETA:  0:00:11
Adding changed files:  26% |#########                           | ETA:  0:00:11
Adding changed files:  27% |#########                           | ETA:  0:00:11
Adding changed files:  28% |##########                          | ETA:  0:00:11
Adding changed files:  29% |##########                          | ETA:  0:00:11
Adding changed files:  30% |##########                          | ETA:  0:00:10
Adding changed files:  31% |###########                         | ETA:  0:00:10
Adding changed files:  32% |###########                         | ETA:  0:00:10
Adding changed files:  33% |###########                         | ETA:  0:00:10
Adding changed files:  34% |############                        | ETA:  0:00:10
Adding changed files:  35% |############                        | ETA:  0:00:10
Adding changed files:  36% |############                        | ETA:  0:00:10
Adding changed files:  37% |#############                       | ETA:  0:00:10
Adding changed files:  38% |#############                       | ETA:  0:00:10
Adding changed files:  38% |##############                      | ETA:  0:00:09
Adding changed files:  39% |##############                      | ETA:  0:00:09
Adding changed files:  40% |##############                      | ETA:  0:00:09
Adding changed files:  41% |###############                     | ETA:  0:00:09
Adding changed files:  42% |###############                     | ETA:  0:00:09
Adding changed files:  43% |###############                     | ETA:  0:00:09
Adding changed files:  44% |################                    | ETA:  0:00:09
Adding changed files:  45% |################                    | ETA:  0:00:08
Adding changed files:  46% |################                    | ETA:  0:00:08
Adding changed files:  47% |#################                   | ETA:  0:00:08
Adding changed files:  48% |#################                   | ETA:  0:00:08
Adding changed files:  49% |#################                   | ETA:  0:00:08
Adding changed files:  50% |##################                  | ETA:  0:00:08
Adding changed files:  51% |##################                  | ETA:  0:00:08
Adding changed files:  52% |##################                  | ETA:  0:00:08
Adding changed files:  53% |###################                 | ETA:  0:00:07
Adding changed files:  54% |###################                 | ETA:  0:00:07
Adding changed files:  55% |####################                | ETA:  0:00:07
Adding changed files:  56% |####################                | ETA:  0:00:07
Adding changed files:  57% |####################                | ETA:  0:00:07
Adding changed files:  58% |#####################               | ETA:  0:00:06
Adding changed files:  59% |#####################               | ETA:  0:00:06
Adding changed files:  60% |#####################               | ETA:  0:00:06
Adding changed files:  61% |######################              | ETA:  0:00:06
Adding changed files:  62% |######################              | ETA:  0:00:06
Adding changed files:  63% |######################              | ETA:  0:00:06
Adding changed files:  64% |#######################             | ETA:  0:00:06
Adding changed files:  65% |#######################             | ETA:  0:00:07
Adding changed files:  66% |#######################             | ETA:  0:00:06
Adding changed files:  67% |########################            | ETA:  0:00:06
Adding changed files:  68% |########################            | ETA:  0:00:06
Adding changed files:  69% |########################            | ETA:  0:00:06
Adding changed files:  70% |#########################           | ETA:  0:00:06
Adding changed files:  71% |#########################           | ETA:  0:00:05
Adding changed files:  72% |#########################           | ETA:  0:00:05
Adding changed files:  73% |##########################          | ETA:  0:00:05
Adding changed files:  74% |##########################          | ETA:  0:00:05
Adding changed files:  75% |###########################         | ETA:  0:00:05
Adding changed files:  76% |###########################         | ETA:  0:00:04
Adding changed files:  77% |###########################         | ETA:  0:00:04
Adding changed files:  77% |############################        | ETA:  0:00:04
Adding changed files:  78% |############################        | ETA:  0:00:04
Adding changed files:  79% |############################        | ETA:  0:00:04
Adding changed files:  80% |#############################       | ETA:  0:00:03
Adding changed files:  81% |#############################       | ETA:  0:00:03
Adding changed files:  82% |#############################       | ETA:  0:00:03
Adding changed files:  83% |##############################      | ETA:  0:00:03
Adding changed files:  84% |##############################      | ETA:  0:00:03
Adding changed files:  85% |##############################      | ETA:  0:00:02
Adding changed files:  86% |###############################     | ETA:  0:00:02
Adding changed files:  87% |###############################     | ETA:  0:00:02
Adding changed files:  88% |###############################     | ETA:  0:00:02
Adding changed files:  89% |################################    | ETA:  0:00:02
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:01
Adding changed files:  93% |#################################   | ETA:  0:00:01
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:20
WARNING: Command 'git rebase 966250554ebe47951b8198e4e53544a3d4e0ad94' failed:
First, rewinding head to replay your work on top of it...
Applying: Add boost from OE.dev
Applying: Reference
Applying: boost-math: disable pch for gcc
Applying: Apply boost-1.62.0-no-forced-flags.patch
Applying: Don't set up arch/instruction-set flags, we do that
Using index info to reconstruct a base tree...
M	tools/build/src/tools/gcc.jam
Falling back to patching base and 3-way merge...
Auto-merging tools/build/src/tools/gcc.jam
CONFLICT (content): Merge conflict in tools/build/src/tools/gcc.jam
error: Failed to merge in the changes.
Patch failed at 0005 Don't set up arch/instruction-set flags, we do that
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/boost
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/boost/boost_1.74.0.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============7045428527990759140==--
