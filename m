Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D7ACCA48A
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.4407.1655298222619444223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CjKcCtVg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101018167766732-ad936541-00ad-4d72-a3d6-ec6009bc8780-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a0wXDzEHmf5atE4SrB0ye6N1Sm7pw6S8yDEKT1FrQF0=;
	b=CjKcCtVgWXGfhjlWNQX1P9FjS4RbBaSjj7KzrjwBLDpjntG0kDFGmwyoWmlz2FJ8
	GIdSjAK6ENUM42rt6jqEYWVdHo5mmB/pHGMfvUSE6LKs8RJEIEbv6WrmwhTjGEeS0yM
	UTXaxILL3WnPlFtwAOXMUaFtAHhOhhTflqVI1XhM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a0wXDzEHmf5atE4SrB0ye6N1Sm7pw6S8yDEKT1FrQF0=;
	b=h8W7vYxoIi32iD4mbrknnd3prix93WudJvWS6QK9+QO21Ab8h8Rl6l8mpsrRrbqN
	0XwiraKtFvbvKpaTkW7cpL9FWaZC/jj7bNywn3UXWt/6p+1PCuIbpsE6hv9cJMNYymS
	+dG8GGWoDMg9/EdAe5vEiY4z2bBV+RVUuV+o+lSY=
Content-Type: multipart/mixed; boundary="===============7194792542031104711=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.4 FAILED
Message-ID: 
 <0101018167766732-ad936541-00ad-4d72-a3d6-ec6009bc8780-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166969

--===============7194792542031104711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.13.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-3a33211ff9a43b959d6cac45cfe3e86d6e691da5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3a33211ff9a43b959d6cac45cfe3e86d6e691da5"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (881 cached, 2 parsed). 1643 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-3a33211ff9a43b959d6cac45cfe3e86d6e691da5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3a33211ff9a43b959d6cac45cfe3e86d6e691da5"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Cloning into bare repository '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 20247, done.        
remote: Counting objects:   0% (1/20247)        
remote: Counting objects:   1% (203/20247)        
remote: Counting objects:   2% (405/20247)        
remote: Counting objects:   3% (608/20247)        
remote: Counting objects:   4% (810/20247)        
remote: Counting objects:   5% (1013/20247)        
remote: Counting objects:   6% (1215/20247)        
remote: Counting objects:   7% (1418/20247)        
remote: Counting objects:   8% (1620/20247)        
remote: Counting objects:   9% (1823/20247)        
remote: Counting objects:  10% (2025/20247)        
remote: Counting objects:  11% (2228/20247)        
remote: Counting objects:  12% (2430/20247)        
remote: Counting objects:  13% (2633/20247)        
remote: Counting objects:  14% (2835/20247)        
remote: Counting objects:  15% (3038/20247)        
remote: Counting objects:  16% (3240/20247)        
remote: Counting objects:  17% (3442/20247)        
remote: Counting objects:  18% (3645/20247)        
remote: Counting objects:  19% (3847/20247)        
remote: Counting objects:  20% (4050/20247)        
remote: Counting objects:  21% (4252/20247)        
remote: Counting objects:  22% (4455/20247)        
remote: Counting objects:  23% (4657/20247)        
remote: Counting objects:  24% (4860/20247)        
remote: Counting objects:  25% (5062/20247)        
remote: Counting objects:  26% (5265/20247)        
remote: Counting objects:  27% (5467/20247)        
remote: Counting objects:  28% (5670/20247)        
remote: Counting objects:  29% (5872/20247)        
remote: Counting objects:  30% (6075/20247)        
remote: Counting objects:  31% (6277/20247)        
remote: Counting objects:  32% (6480/20247)        
remote: Counting objects:  33% (6682/20247)        
remote: Counting objects:  34% (6884/20247)        
remote: Counting objects:  35% (7087/20247)        
remote: Counting objects:  36% (7289/20247)        
remote: Counting objects:  37% (7492/20247)        
remote: Counting objects:  38% (7694/20247)        
remote: Counting objects:  39% (7897/20247)        
remote: Counting objects:  40% (8099/20247)        
remote: Counting objects:  41% (8302/20247)        
remote: Counting objects:  42% (8504/20247)        
remote: Counting objects:  43% (8707/20247)        
remote: Counting objects:  44% (8909/20247)        
remote: Counting objects:  45% (9112/20247)        
remote: Counting objects:  46% (9314/20247)        
remote: Counting objects:  47% (9517/20247)        
remote: Counting objects:  48% (9719/20247)        
remote: Counting objects:  49% (9922/20247)        
remote: Counting objects:  50% (10124/20247)        
remote: Counting objects:  51% (10326/20247)        
remote: Counting objects:  52% (10529/20247)        
remote: Counting objects:  53% (10731/20247)        
remote: Counting objects:  54% (10934/20247)        
remote: Counting objects:  55% (11136/20247)        
remote: Counting objects:  56% (11339/20247)        
remote: Counting objects:  57% (11541/20247)        
remote: Counting objects:  58% (11744/20247)        
remote: Counting objects:  59% (11946/20247)        
remote: Counting objects:  60% (12149/20247)        
remote: Counting objects:  61% (12351/20247)        
remote: Counting objects:  62% (12554/20247)        
remote: Counting objects:  63% (12756/20247)        
remote: Counting objects:  64% (12959/20247)        
remote: Counting objects:  65% (13161/20247)        
remote: Counting objects:  66% (13364/20247)        
remote: Counting objects:  67% (13566/20247)        
remote: Counting objects:  68% (13768/20247)        
remote: Counting objects:  69% (13971/20247)        
remote: Counting objects:  70% (14173/20247)        
remote: Counting objects:  71% (14376/20247)        
remote: Counting objects:  72% (14578/20247)        
remote: Counting objects:  73% (14781/20247)        
remote: Counting objects:  74% (14983/20247)        
remote: Counting objects:  75% (15186/20247)        
remote: Counting objects:  76% (15388/20247)        
remote: Counting objects:  77% (15591/20247)        
remote: Counting objects:  78% (15793/20247)        
remote: Counting objects:  79% (15996/20247)        
remote: Counting objects:  80% (16198/20247)        
remote: Counting objects:  81% (16401/20247)        
remote: Counting objects:  82% (16603/20247)        
remote: Counting objects:  83% (16806/20247)        
remote: Counting objects:  84% (17008/20247)        
remote: Counting objects:  85% (17210/20247)        
remote: Counting objects:  86% (17413/20247)        
remote: Counting objects:  87% (17615/20247)        
remote: Counting objects:  88% (17818/20247)        
remote: Counting objects:  89% (18020/20247)        
remote: Counting objects:  90% (18223/20247)        
remote: Counting objects:  91% (18425/20247)        
remote: Counting objects:  92% (18628/20247)        
remote: Counting objects:  93% (18830/20247)        
remote: Counting objects:  94% (19033/20247)        
remote: Counting objects: 100% (20247/20247), done.        
remote: Compressing objects:   0% (1/8990)        
remote: Compressing objects:   1% (90/8990)        
remote: Compressing objects:   2% (180/8990)        
remote: Compressing objects:   3% (270/8990)        
remote: Compressing objects:   4% (360/8990)        
remote: Compressing objects:   5% (450/8990)        
remote: Compressing objects:   6% (540/8990)        
remote: Compressing objects:   7% (630/8990)        
remote: Compressing objects:   8% (720/8990)        
remote: Compressing objects:   9% (810/8990)        
remote: Compressing objects:  10% (899/8990)        
remote: Compressing objects:  11% (989/8990)        
remote: Compressing objects:  12% (1079/8990)        
remote: Compressing objects:  13% (1169/8990)        
remote: Compressing objects:  14% (1259/8990)        
remote: Compressing objects:  15% (1349/8990)        
remote: Compressing objects:  16% (1439/8990)        
remote: Compressing objects:  17% (1529/8990)        
remote: Compressing objects:  18% (1619/8990)        
remote: Compressing objects:  19% (1709/8990)        
remote: Compressing objects:  20% (1798/8990)        
remote: Compressing objects:  21% (1888/8990)        
remote: Compressing objects:  22% (1978/8990)        
remote: Compressing objects:  23% (2068/8990)        
remote: Compressing objects:  24% (2158/8990)        
remote: Compressing objects:  25% (2248/8990)        
remote: Compressing objects:  26% (2338/8990)        
remote: Compressing objects:  27% (2428/8990)        
remote: Compressing objects:  28% (2518/8990)        
remote: Compressing objects:  29% (2608/8990)        
remote: Compressing objects:  30% (2697/8990)        
remote: Compressing objects:  31% (2787/8990)        
remote: Compressing objects:  32% (2877/8990)        
remote: Compressing objects:  33% (2967/8990)        
remote: Compressing objects:  34% (3057/8990)        
remote: Compressing objects:  35% (3147/8990)        
remote: Compressing objects:  36% (3237/8990)        
remote: Compressing objects:  37% (3327/8990)        
remote: Compressing objects:  38% (3417/8990)        
remote: Compressing objects:  39% (3507/8990)        
remote: Compressing objects:  40% (3596/8990)        
remote: Compressing objects:  41% (3686/8990)        
remote: Compressing objects:  42% (3776/8990)        
remote: Compressing objects:  43% (3866/8990)        
remote: Compressing objects:  44% (3956/8990)        
remote: Compressing objects:  45% (4046/8990)        
remote: Compressing objects:  46% (4136/8990)        
remote: Compressing objects:  47% (4226/8990)        
remote: Compressing objects:  48% (4316/8990)        
remote: Compressing objects:  49% (4406/8990)        
remote: Compressing objects:  50% (4495/8990)        
remote: Compressing objects:  51% (4585/8990)        
remote: Compressing objects:  52% (4675/8990)        
remote: Compressing objects:  53% (4765/8990)        
remote: Compressing objects:  54% (4855/8990)        
remote: Compressing objects:  55% (4945/8990)        
remote: Compressing objects:  56% (5035/8990)        
remote: Compressing objects:  57% (5125/8990)        
remote: Compressing objects:  58% (5215/8990)        
remote: Compressing objects:  59% (5305/8990)        
remote: Compressing objects:  60% (5394/8990)        
remote: Compressing objects:  61% (5484/8990)        
remote: Compressing objects:  62% (5574/8990)        
remote: Compressing objects:  63% (5664/8990)        
remote: Compressing objects:  64% (5754/8990)        
remote: Compressing objects:  65% (5844/8990)        
remote: Compressing objects:  66% (5934/8990)        
remote: Compressing objects:  67% (6024/8990)        
remote: Compressing objects:  68% (6114/8990)        
remote: Compressing objects:  69% (6204/8990)        
remote: Compressing objects:  70% (6293/8990)        
remote: Compressing objects:  71% (6383/8990)        
remote: Compressing objects:  72% (6473/8990)        
remote: Compressing objects:  73% (6563/8990)        
remote: Compressing objects:  74% (6653/8990)        
remote: Compressing objects:  75% (6743/8990)        
remote: Compressing objects:  76% (6833/8990)        
remote: Compressing objects:  77% (6923/8990)        
remote: Compressing objects:  78% (7013/8990)        
remote: Compressing objects:  79% (7103/8990)        
remote: Compressing objects:  80% (7192/8990)        
remote: Compressing objects:  81% (7282/8990)        
remote: Compressing objects:  82% (7372/8990)        
remote: Compressing objects:  83% (7462/8990)        
remote: Compressing objects:  84% (7552/8990)        
remote: Compressing objects:  85% (7642/8990)        
remote: Compressing objects:  86% (7732/8990)        
remote: Compressing objects:  87% (7822/8990)        
remote: Compressing objects:  88% (7912/8990)        
remote: Compressing objects:  89% (8002/8990)        
remote: Compressing objects:  90% (8091/8990)        
remote: Compressing objects:  91% (8181/8990)        
remote: Compressing objects:  92% (8271/8990)        
remote: Compressing objects:  93% (8361/8990)        
remote: Compressing objects:  94% (8451/8990)        
remote: Compressing objects:  95% (8541/8990)        
remote: Compressing objects:  96% (8631/8990)        
remote: Compressing objects: 100% (8990/8990), done.        
Receiving objects:   0% (1/20247)
Receiving objects:   1% (203/20247)
Receiving objects:   2% (405/20247)
Receiving objects:   3% (608/20247)
Receiving objects:   4% (810/20247)
Receiving objects:   5% (1013/20247)
Receiving objects:   6% (1215/20247)
Receiving objects:   7% (1418/20247)
Receiving objects:   8% (1620/20247)
Receiving objects:   9% (1823/20247)
Receiving objects:  10% (2025/20247)
Receiving objects:  11% (2228/20247)
Receiving objects:  12% (2430/20247)
Receiving objects:  13% (2633/20247)
Receiving objects:  14% (2835/20247)
Receiving objects:  15% (3038/20247)
Receiving objects:  16% (3240/20247)
Receiving objects:  17% (3442/20247)
Receiving objects:  18% (3645/20247)
Receiving objects:  19% (3847/20247)
Receiving objects:  20% (4050/20247)
Receiving objects:  21% (4252/20247)
Receiving objects:  22% (4455/20247)
Receiving objects:  23% (4657/20247)
Receiving objects:  24% (4860/20247)
Receiving objects:  25% (5062/20247)
Receiving objects:  26% (5265/20247)
Receiving objects:  27% (5467/20247)
Receiving objects:  28% (5670/20247)
Receiving objects:  29% (5872/20247)
Receiving objects:  30% (6075/20247)
Receiving objects:  31% (6277/20247)
Receiving objects:  32% (6480/20247)
Receiving objects:  33% (6682/20247)
Receiving objects:  34% (6884/20247)
Receiving objects:  35% (7087/20247)
Receiving objects:  36% (7289/20247)
Receiving objects:  37% (7492/20247)
Receiving objects:  38% (7694/20247)
Receiving objects:  39% (7897/20247)
Receiving objects:  40% (8099/20247)
Receiving objects:  41% (8302/20247)
Receiving objects:  42% (8504/20247)
Receiving objects:  43% (8707/20247)
Receiving objects:  44% (8909/20247)
Receiving objects:  45% (9112/20247)
Receiving objects:  46% (9314/20247)
Receiving objects:  47% (9517/20247)
Receiving objects:  48% (9719/20247)
Receiving objects:  49% (9922/20247)
Receiving objects:  50% (10124/20247)
Receiving objects:  51% (10326/20247)
Receiving objects:  52% (10529/20247)
Receiving objects:  53% (10731/20247)
Receiving objects:  54% (10934/20247)
Receiving objects:  55% (11136/20247)
Receiving objects:  56% (11339/20247)
Receiving objects:  57% (11541/20247)
Receiving objects:  58% (11744/20247)
Receiving objects:  59% (11946/20247)
Receiving objects:  60% (12149/20247)
Receiving objects:  61% (12351/20247)
Receiving objects:  62% (12554/20247)
Receiving objects:  63% (12756/20247)
Receiving objects:  64% (12959/20247)
Receiving objects:  65% (13161/20247)
Receiving objects:  66% (13364/20247)
Receiving objects:  67% (13566/20247)
Receiving objects:  68% (13768/20247)
Receiving objects:  69% (13971/20247)
Receiving objects:  70% (14173/20247)
Receiving objects:  71% (14376/20247)
Receiving objects:  72% (14578/20247)
Receiving objects:  73% (14781/20247)
Receiving objects:  74% (14983/20247)
Receiving objects:  75% (15186/20247)
Receiving objects:  76% (15388/20247)
Receiving objects:  77% (15591/20247)
Receiving objects:  78% (15793/20247)
Receiving objects:  79% (15996/20247)
Receiving objects:  80% (16198/20247)
Receiving objects:  81% (16401/20247)
Receiving objects:  82% (16603/20247)
Receiving objects:  83% (16806/20247)
Receiving objects:  84% (17008/20247)
Receiving objects:  85% (17210/20247)
Receiving objects:  86% (17413/20247)
Receiving objects:  87% (17615/20247)
Receiving objects:  88% (17818/20247)
Receiving objects:  89% (18020/20247)
Receiving objects:  90% (18223/20247)
Receiving objects:  91% (18425/20247)
Receiving objects:  92% (18628/20247)
Receiving objects:  93% (18830/20247)
Receiving objects:  94% (19033/20247)
Receiving objects:  95% (19235/20247)
Receiving objects:  96% (19438/20247)
Receiving objects:  97% (19640/20247)
remote: Total 20247 (delta 15465), reused 15063 (delta 11062), pack-reused 0        
Receiving objects:  98% (19843/20247)
Receiving objects:  99% (20045/20247)
Receiving objects: 100% (20247/20247), 3.64 MiB | 7.86 MiB/s, done.
Resolving deltas:   0% (0/15465)
Resolving deltas:   1% (155/15465)
Resolving deltas:   2% (310/15465)
Resolving deltas:   3% (464/15465)
Resolving deltas:   4% (619/15465)
Resolving deltas:   5% (774/15465)
Resolving deltas:   6% (928/15465)
Resolving deltas:   7% (1083/15465)
Resolving deltas:   8% (1238/15465)
Resolving deltas:   9% (1392/15465)
Resolving deltas:  10% (1547/15465)
Resolving deltas:  11% (1702/15465)
Resolving deltas:  12% (1856/15465)
Resolving deltas:  13% (2011/15465)
Resolving deltas:  14% (2166/15465)
Resolving deltas:  15% (2320/15465)
Resolving deltas:  16% (2475/15465)
Resolving deltas:  17% (2630/15465)
Resolving deltas:  18% (2784/15465)
Resolving deltas:  19% (2939/15465)
Resolving deltas:  20% (3093/15465)
Resolving deltas:  21% (3248/15465)
Resolving deltas:  22% (3403/15465)
Resolving deltas:  23% (3557/15465)
Resolving deltas:  24% (3712/15465)
Resolving deltas:  25% (3867/15465)
Resolving deltas:  26% (4021/15465)
Resolving deltas:  27% (4176/15465)
Resolving deltas:  28% (4331/15465)
Resolving deltas:  29% (4485/15465)
Resolving deltas:  30% (4640/15465)
Resolving deltas:  31% (4795/15465)
Resolving deltas:  32% (4949/15465)
Resolving deltas:  33% (5104/15465)
Resolving deltas:  34% (5259/15465)
Resolving deltas:  35% (5413/15465)
Resolving deltas:  36% (5568/15465)
Resolving deltas:  37% (5723/15465)
Resolving deltas:  38% (5877/15465)
Resolving deltas:  39% (6032/15465)
Resolving deltas:  40% (6186/15465)
Resolving deltas:  41% (6341/15465)
Resolving deltas:  42% (6496/15465)
Resolving deltas:  43% (6650/15465)
Resolving deltas:  44% (6805/15465)
Resolving deltas:  45% (6960/15465)
Resolving deltas:  46% (7114/15465)
Resolving deltas:  47% (7269/15465)
Resolving deltas:  48% (7424/15465)
Resolving deltas:  49% (7578/15465)
Resolving deltas:  50% (7733/15465)
Resolving deltas:  51% (7888/15465)
Resolving deltas:  52% (8043/15465)
Resolving deltas:  53% (8197/15465)
Resolving deltas:  54% (8352/15465)
Resolving deltas:  55% (8507/15465)
Resolving deltas:  56% (8661/15465)
Resolving deltas:  57% (8816/15465)
Resolving deltas:  58% (8970/15465)
Resolving deltas:  59% (9125/15465)
Resolving deltas:  60% (9279/15465)
Resolving deltas:  61% (9434/15465)
Resolving deltas:  62% (9589/15465)
Resolving deltas:  63% (9743/15465)
Resolving deltas:  64% (9898/15465)
Resolving deltas:  65% (10054/15465)
Resolving deltas:  66% (10207/15465)
Resolving deltas:  67% (10363/15465)
Resolving deltas:  68% (10517/15465)
Resolving deltas:  69% (10671/15465)
Resolving deltas:  70% (10826/15465)
Resolving deltas:  71% (10981/15465)
Resolving deltas:  72% (11135/15465)
Resolving deltas:  73% (11290/15465)
Resolving deltas:  74% (11447/15465)
Resolving deltas:  75% (11599/15465)
Resolving deltas:  76% (11754/15465)
Resolving deltas:  77% (11909/15465)
Resolving deltas:  78% (12063/15465)
Resolving deltas:  79% (12218/15465)
Resolving deltas:  80% (12372/15465)
Resolving deltas:  81% (12527/15465)
Resolving deltas:  82% (12682/15465)
Resolving deltas:  83% (12837/15465)
Resolving deltas:  84% (12991/15465)
Resolving deltas:  85% (13146/15465)
Resolving deltas:  86% (13300/15465)
Resolving deltas:  87% (13455/15465)
Resolving deltas:  88% (13611/15465)
Resolving deltas:  89% (13764/15465)
Resolving deltas:  90% (13920/15465)
Resolving deltas:  91% (14074/15465)
Resolving deltas:  92% (14228/15465)
Resolving deltas:  93% (14383/15465)
Resolving deltas:  94% (14538/15465)
Resolving deltas:  95% (14692/15465)
Resolving deltas:  96% (14848/15465)
Resolving deltas:  97% (15002/15465)
Resolving deltas:  98% (15156/15465)
Resolving deltas:  99% (15311/15465)
Resolving deltas: 100% (15465/15465)
Resolving deltas: 100% (15465/15465), done.
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.4.tar.bz2...
INFO: Rebasing devtool onto ef47387d60fd66102959b61451121f516f250d5e
WARNING: Command 'git rebase ef47387d60fd66102959b61451121f516f250d5e' failed:
Auto-merging include/instrumentation/events/compaction.h
CONFLICT (content): Merge conflict in include/instrumentation/events/compaction.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lttng-modules
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lttng-modules/lttng-modules_2.13.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7194792542031104711==--

