Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FD0C77B7A
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.12297.1678895726020367521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UvC79dbq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010186e5fbc2da-7b492d60-b699-45d8-b6fa-013e1877f0b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f+dHKDCKyQu78RjkxoqVzNt5xX35piZ0dMpcpvg0ETg=;
	b=UvC79dbqhZU6K9AeAn1Tx+JRnZkosK8rjCj2ICSrDbqM03dD1hKG94yA7V3lscsK
	0sI8NE0otgfYpsCM7zmW2cJPCe0mcU1Qc9CQMvyDw0/fpZO0xA7r0ARHiDGdw9+gVbv
	KEYFq2RpkMQuuNPI4YR06O6rjOtZl4ckIl1X89pQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f+dHKDCKyQu78RjkxoqVzNt5xX35piZ0dMpcpvg0ETg=;
	b=Hab7tbcOpwudljC1VAdPUj/BeMwqUTkPU1hb6no8v+g0a8xoFX3RnK9tGfCnfK39
	bGD3bT91ZnAlvxdeUgviOsbe8sH1SZoSlaax2Iv8GOwzE0J3EdejTTL1NTyoF+z0P8P
	wP+N8WaEBGwsbNDp0oTqjdjrUbdoanjEKL9u9ZP8=
Content-Type: multipart/mixed; boundary="===============3851671671305423007=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.9 FAILED
Message-ID: <01010186e5fbc2da-7b492d60-b699-45d8-b6fa-013e1877f0b0-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178622

--===============3851671671305423007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.13.9* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:10:37.029304)
Loading cache...done.
Loaded 1791 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-dffef1adb5bba73495403abfb5dc012f467f0091"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dffef1adb5bba73495403abfb5dc012f467f0091"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1791 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (895 cached, 2 parsed). 1792 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-dffef1adb5bba73495403abfb5dc012f467f0091"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dffef1adb5bba73495403abfb5dc012f467f0091"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Cloning into bare repository '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 21443, done.        
remote: Counting objects:   0% (1/21443)        
remote: Counting objects:   1% (215/21443)        
remote: Counting objects:   2% (429/21443)        
remote: Counting objects:   3% (644/21443)        
remote: Counting objects:   4% (858/21443)        
remote: Counting objects:   5% (1073/21443)        
remote: Counting objects:   6% (1287/21443)        
remote: Counting objects:   7% (1502/21443)        
remote: Counting objects:   8% (1716/21443)        
remote: Counting objects:   9% (1930/21443)        
remote: Counting objects:  10% (2145/21443)        
remote: Counting objects:  11% (2359/21443)        
remote: Counting objects:  12% (2574/21443)        
remote: Counting objects:  13% (2788/21443)        
remote: Counting objects:  14% (3003/21443)        
remote: Counting objects:  15% (3217/21443)        
remote: Counting objects:  16% (3431/21443)        
remote: Counting objects:  17% (3646/21443)        
remote: Counting objects:  18% (3860/21443)        
remote: Counting objects:  19% (4075/21443)        
remote: Counting objects:  20% (4289/21443)        
remote: Counting objects:  21% (4504/21443)        
remote: Counting objects:  22% (4718/21443)        
remote: Counting objects:  23% (4932/21443)        
remote: Counting objects:  24% (5147/21443)        
remote: Counting objects:  25% (5361/21443)        
remote: Counting objects:  26% (5576/21443)        
remote: Counting objects:  27% (5790/21443)        
remote: Counting objects:  28% (6005/21443)        
remote: Counting objects:  29% (6219/21443)        
remote: Counting objects:  30% (6433/21443)        
remote: Counting objects:  31% (6648/21443)        
remote: Counting objects:  32% (6862/21443)        
remote: Counting objects:  33% (7077/21443)        
remote: Counting objects:  34% (7291/21443)        
remote: Counting objects:  35% (7506/21443)        
remote: Counting objects:  36% (7720/21443)        
remote: Counting objects:  37% (7934/21443)        
remote: Counting objects:  38% (8149/21443)        
remote: Counting objects:  39% (8363/21443)        
remote: Counting objects:  40% (8578/21443)        
remote: Counting objects:  41% (8792/21443)        
remote: Counting objects:  42% (9007/21443)        
remote: Counting objects:  43% (9221/21443)        
remote: Counting objects:  44% (9435/21443)        
remote: Counting objects:  45% (9650/21443)        
remote: Counting objects:  46% (9864/21443)        
remote: Counting objects:  47% (10079/21443)        
remote: Counting objects:  48% (10293/21443)        
remote: Counting objects:  49% (10508/21443)        
remote: Counting objects:  50% (10722/21443)        
remote: Counting objects:  51% (10936/21443)        
remote: Counting objects:  52% (11151/21443)        
remote: Counting objects:  53% (11365/21443)        
remote: Counting objects:  54% (11580/21443)        
remote: Counting objects:  55% (11794/21443)        
remote: Counting objects:  56% (12009/21443)        
remote: Counting objects:  57% (12223/21443)        
remote: Counting objects:  58% (12437/21443)        
remote: Counting objects:  59% (12652/21443)        
remote: Counting objects:  60% (12866/21443)        
remote: Counting objects:  61% (13081/21443)        
remote: Counting objects:  62% (13295/21443)        
remote: Counting objects:  63% (13510/21443)        
remote: Counting objects:  64% (13724/21443)        
remote: Counting objects:  65% (13938/21443)        
remote: Counting objects:  66% (14153/21443)        
remote: Counting objects:  67% (14367/21443)        
remote: Counting objects:  68% (14582/21443)        
remote: Counting objects:  69% (14796/21443)        
remote: Counting objects:  70% (15011/21443)        
remote: Counting objects:  71% (15225/21443)        
remote: Counting objects:  72% (15439/21443)        
remote: Counting objects:  73% (15654/21443)        
remote: Counting objects:  74% (15868/21443)        
remote: Counting objects:  75% (16083/21443)        
remote: Counting objects:  76% (16297/21443)        
remote: Counting objects:  77% (16512/21443)        
remote: Counting objects:  78% (16726/21443)        
remote: Counting objects:  79% (16940/21443)        
remote: Counting objects:  80% (17155/21443)        
remote: Counting objects:  81% (17369/21443)        
remote: Counting objects:  82% (17584/21443)        
remote: Counting objects:  83% (17798/21443)        
remote: Counting objects:  84% (18013/21443)        
remote: Counting objects:  85% (18227/21443)        
remote: Counting objects:  86% (18441/21443)        
remote: Counting objects:  87% (18656/21443)        
remote: Counting objects:  88% (18870/21443)        
remote: Counting objects:  89% (19085/21443)        
remote: Counting objects: 100% (21443/21443), done.        
remote: Compressing objects:   0% (1/9892)        
remote: Compressing objects:   1% (99/9892)        
remote: Compressing objects:   2% (198/9892)        
remote: Compressing objects:   3% (297/9892)        
remote: Compressing objects:   4% (396/9892)        
remote: Compressing objects:   5% (495/9892)        
remote: Compressing objects:   6% (594/9892)        
remote: Compressing objects:   7% (693/9892)        
remote: Compressing objects:   8% (792/9892)        
remote: Compressing objects:   9% (891/9892)        
remote: Compressing objects:  10% (990/9892)        
remote: Compressing objects:  11% (1089/9892)        
remote: Compressing objects:  12% (1188/9892)        
remote: Compressing objects:  13% (1286/9892)        
remote: Compressing objects:  14% (1385/9892)        
remote: Compressing objects:  15% (1484/9892)        
remote: Compressing objects:  16% (1583/9892)        
remote: Compressing objects:  17% (1682/9892)        
remote: Compressing objects:  18% (1781/9892)        
remote: Compressing objects:  19% (1880/9892)        
remote: Compressing objects:  20% (1979/9892)        
remote: Compressing objects:  21% (2078/9892)        
remote: Compressing objects:  22% (2177/9892)        
remote: Compressing objects:  23% (2276/9892)        
remote: Compressing objects:  24% (2375/9892)        
remote: Compressing objects:  25% (2473/9892)        
remote: Compressing objects:  26% (2572/9892)        
remote: Compressing objects:  27% (2671/9892)        
remote: Compressing objects:  28% (2770/9892)        
remote: Compressing objects:  29% (2869/9892)        
remote: Compressing objects:  30% (2968/9892)        
remote: Compressing objects:  31% (3067/9892)        
remote: Compressing objects:  32% (3166/9892)        
remote: Compressing objects:  33% (3265/9892)        
remote: Compressing objects:  34% (3364/9892)        
remote: Compressing objects:  35% (3463/9892)        
remote: Compressing objects:  36% (3562/9892)        
remote: Compressing objects:  37% (3661/9892)        
remote: Compressing objects:  38% (3759/9892)        
remote: Compressing objects:  39% (3858/9892)        
remote: Compressing objects:  40% (3957/9892)        
remote: Compressing objects:  41% (4056/9892)        
remote: Compressing objects:  42% (4155/9892)        
remote: Compressing objects:  43% (4254/9892)        
remote: Compressing objects:  44% (4353/9892)        
remote: Compressing objects:  45% (4452/9892)        
remote: Compressing objects:  46% (4551/9892)        
remote: Compressing objects:  47% (4650/9892)        
remote: Compressing objects:  48% (4749/9892)        
remote: Compressing objects:  49% (4848/9892)        
remote: Compressing objects:  50% (4946/9892)        
remote: Compressing objects:  51% (5045/9892)        
remote: Compressing objects:  52% (5144/9892)        
remote: Compressing objects:  53% (5243/9892)        
remote: Compressing objects:  54% (5342/9892)        
remote: Compressing objects:  55% (5441/9892)        
remote: Compressing objects:  56% (5540/9892)        
remote: Compressing objects:  57% (5639/9892)        
remote: Compressing objects:  58% (5738/9892)        
remote: Compressing objects:  59% (5837/9892)        
remote: Compressing objects:  60% (5936/9892)        
remote: Compressing objects:  61% (6035/9892)        
remote: Compressing objects:  62% (6134/9892)        
remote: Compressing objects:  63% (6232/9892)        
remote: Compressing objects:  64% (6331/9892)        
remote: Compressing objects:  65% (6430/9892)        
remote: Compressing objects:  66% (6529/9892)        
remote: Compressing objects:  67% (6628/9892)        
remote: Compressing objects:  68% (6727/9892)        
remote: Compressing objects:  69% (6826/9892)        
remote: Compressing objects:  70% (6925/9892)        
remote: Compressing objects:  71% (7024/9892)        
remote: Compressing objects:  72% (7123/9892)        
remote: Compressing objects:  73% (7222/9892)        
remote: Compressing objects:  74% (7321/9892)        
remote: Compressing objects:  75% (7419/9892)        
remote: Compressing objects:  76% (7518/9892)        
remote: Compressing objects:  77% (7617/9892)        
remote: Compressing objects:  78% (7716/9892)        
remote: Compressing objects:  79% (7815/9892)        
remote: Compressing objects:  80% (7914/9892)        
remote: Compressing objects:  81% (8013/9892)        
remote: Compressing objects:  82% (8112/9892)        
remote: Compressing objects:  83% (8211/9892)        
remote: Compressing objects:  84% (8310/9892)        
remote: Compressing objects:  85% (8409/9892)        
remote: Compressing objects:  86% (8508/9892)        
remote: Compressing objects:  87% (8607/9892)        
remote: Compressing objects:  88% (8705/9892)        
remote: Compressing objects:  89% (8804/9892)        
remote: Compressing objects:  90% (8903/9892)        
remote: Compressing objects:  91% (9002/9892)        
remote: Compressing objects: 100% (9892/9892), done.        
Receiving objects:   0% (1/21443)
Receiving objects:   1% (215/21443)
Receiving objects:   2% (429/21443)
Receiving objects:   3% (644/21443)
Receiving objects:   4% (858/21443)
Receiving objects:   5% (1073/21443)
Receiving objects:   6% (1287/21443)
Receiving objects:   7% (1502/21443)
Receiving objects:   8% (1716/21443)
Receiving objects:   9% (1930/21443)
Receiving objects:  10% (2145/21443)
Receiving objects:  11% (2359/21443)
Receiving objects:  12% (2574/21443)
Receiving objects:  13% (2788/21443)
Receiving objects:  14% (3003/21443)
Receiving objects:  15% (3217/21443)
Receiving objects:  16% (3431/21443)
Receiving objects:  17% (3646/21443)
Receiving objects:  18% (3860/21443)
Receiving objects:  19% (4075/21443)
Receiving objects:  20% (4289/21443)
Receiving objects:  21% (4504/21443)
Receiving objects:  22% (4718/21443)
Receiving objects:  23% (4932/21443)
Receiving objects:  24% (5147/21443)
Receiving objects:  25% (5361/21443)
Receiving objects:  26% (5576/21443)
Receiving objects:  27% (5790/21443)
Receiving objects:  28% (6005/21443)
Receiving objects:  29% (6219/21443)
Receiving objects:  30% (6433/21443)
Receiving objects:  31% (6648/21443)
Receiving objects:  32% (6862/21443)
Receiving objects:  33% (7077/21443)
Receiving objects:  34% (7291/21443)
Receiving objects:  35% (7506/21443)
Receiving objects:  36% (7720/21443)
Receiving objects:  37% (7934/21443)
Receiving objects:  38% (8149/21443)
Receiving objects:  39% (8363/21443)
Receiving objects:  40% (8578/21443)
Receiving objects:  41% (8792/21443)
Receiving objects:  42% (9007/21443)
Receiving objects:  43% (9221/21443)
Receiving objects:  44% (9435/21443)
Receiving objects:  45% (9650/21443)
Receiving objects:  46% (9864/21443)
Receiving objects:  47% (10079/21443)
Receiving objects:  48% (10293/21443)
Receiving objects:  49% (10508/21443)
Receiving objects:  50% (10722/21443)
Receiving objects:  51% (10936/21443)
Receiving objects:  52% (11151/21443)
Receiving objects:  53% (11365/21443)
Receiving objects:  54% (11580/21443)
Receiving objects:  55% (11794/21443)
Receiving objects:  56% (12009/21443)
Receiving objects:  57% (12223/21443)
Receiving objects:  58% (12437/21443)
Receiving objects:  59% (12652/21443)
Receiving objects:  60% (12866/21443)
Receiving objects:  61% (13081/21443)
Receiving objects:  62% (13295/21443)
Receiving objects:  63% (13510/21443)
Receiving objects:  64% (13724/21443)
Receiving objects:  65% (13938/21443)
Receiving objects:  66% (14153/21443)
Receiving objects:  67% (14367/21443)
Receiving objects:  68% (14582/21443)
Receiving objects:  69% (14796/21443)
Receiving objects:  70% (15011/21443)
Receiving objects:  71% (15225/21443)
Receiving objects:  72% (15439/21443)
Receiving objects:  73% (15654/21443)
Receiving objects:  74% (15868/21443)
Receiving objects:  75% (16083/21443)
Receiving objects:  76% (16297/21443)
Receiving objects:  77% (16512/21443)
Receiving objects:  78% (16726/21443)
Receiving objects:  79% (16940/21443)
Receiving objects:  80% (17155/21443)
Receiving objects:  81% (17369/21443)
Receiving objects:  82% (17584/21443)
Receiving objects:  83% (17798/21443)
Receiving objects:  84% (18013/21443)
Receiving objects:  85% (18227/21443)
Receiving objects:  86% (18441/21443)
Receiving objects:  87% (18656/21443)
Receiving objects:  88% (18870/21443)
Receiving objects:  89% (19085/21443)
Receiving objects:  90% (19299/21443)
Receiving objects:  91% (19514/21443)
Receiving objects:  92% (19728/21443)
Receiving objects:  93% (19942/21443)
Receiving objects:  94% (20157/21443)
Receiving objects:  95% (20371/21443)
Receiving objects:  96% (20586/21443)
Receiving objects:  97% (20800/21443)
remote: Total 21443 (delta 16430), reused 15421 (delta 11345), pack-reused 0        
Receiving objects:  98% (21015/21443)
Receiving objects:  99% (21229/21443)
Receiving objects: 100% (21443/21443), 3.84 MiB | 8.07 MiB/s, done.
Resolving deltas:   0% (0/16430)
Resolving deltas:   1% (165/16430)
Resolving deltas:   2% (329/16430)
Resolving deltas:   3% (493/16430)
Resolving deltas:   4% (660/16430)
Resolving deltas:   5% (822/16430)
Resolving deltas:   6% (986/16430)
Resolving deltas:   7% (1152/16430)
Resolving deltas:   8% (1315/16430)
Resolving deltas:   9% (1479/16430)
Resolving deltas:  10% (1643/16430)
Resolving deltas:  11% (1808/16430)
Resolving deltas:  12% (1972/16430)
Resolving deltas:  13% (2137/16430)
Resolving deltas:  14% (2301/16430)
Resolving deltas:  15% (2466/16430)
Resolving deltas:  16% (2629/16430)
Resolving deltas:  17% (2794/16430)
Resolving deltas:  18% (2958/16430)
Resolving deltas:  19% (3122/16430)
Resolving deltas:  20% (3286/16430)
Resolving deltas:  21% (3451/16430)
Resolving deltas:  22% (3615/16430)
Resolving deltas:  23% (3779/16430)
Resolving deltas:  24% (3944/16430)
Resolving deltas:  25% (4108/16430)
Resolving deltas:  26% (4272/16430)
Resolving deltas:  27% (4438/16430)
Resolving deltas:  28% (4601/16430)
Resolving deltas:  29% (4765/16430)
Resolving deltas:  30% (4929/16430)
Resolving deltas:  31% (5094/16430)
Resolving deltas:  32% (5258/16430)
Resolving deltas:  33% (5422/16430)
Resolving deltas:  34% (5587/16430)
Resolving deltas:  35% (5751/16430)
Resolving deltas:  36% (5915/16430)
Resolving deltas:  37% (6080/16430)
Resolving deltas:  38% (6244/16430)
Resolving deltas:  39% (6408/16430)
Resolving deltas:  40% (6572/16430)
Resolving deltas:  41% (6737/16430)
Resolving deltas:  42% (6901/16430)
Resolving deltas:  43% (7065/16430)
Resolving deltas:  44% (7230/16430)
Resolving deltas:  45% (7394/16430)
Resolving deltas:  46% (7558/16430)
Resolving deltas:  47% (7723/16430)
Resolving deltas:  48% (7887/16430)
Resolving deltas:  49% (8051/16430)
Resolving deltas:  50% (8215/16430)
Resolving deltas:  51% (8380/16430)
Resolving deltas:  52% (8544/16430)
Resolving deltas:  53% (8708/16430)
Resolving deltas:  54% (8873/16430)
Resolving deltas:  55% (9038/16430)
Resolving deltas:  56% (9201/16430)
Resolving deltas:  57% (9366/16430)
Resolving deltas:  58% (9530/16430)
Resolving deltas:  59% (9695/16430)
Resolving deltas:  60% (9858/16430)
Resolving deltas:  61% (10023/16430)
Resolving deltas:  62% (10190/16430)
Resolving deltas:  63% (10353/16430)
Resolving deltas:  64% (10516/16430)
Resolving deltas:  65% (10680/16430)
Resolving deltas:  66% (10845/16430)
Resolving deltas:  67% (11011/16430)
Resolving deltas:  68% (11175/16430)
Resolving deltas:  69% (11337/16430)
Resolving deltas:  70% (11501/16430)
Resolving deltas:  71% (11669/16430)
Resolving deltas:  72% (11830/16430)
Resolving deltas:  73% (11995/16430)
Resolving deltas:  74% (12159/16430)
Resolving deltas:  75% (12323/16430)
Resolving deltas:  76% (12487/16430)
Resolving deltas:  77% (12652/16430)
Resolving deltas:  78% (12816/16430)
Resolving deltas:  79% (12980/16430)
Resolving deltas:  80% (13144/16430)
Resolving deltas:  81% (13310/16430)
Resolving deltas:  82% (13473/16430)
Resolving deltas:  83% (13637/16430)
Resolving deltas:  84% (13802/16430)
Resolving deltas:  85% (13966/16430)
Resolving deltas:  86% (14132/16430)
Resolving deltas:  87% (14295/16430)
Resolving deltas:  88% (14459/16430)
Resolving deltas:  89% (14624/16430)
Resolving deltas:  90% (14787/16430)
Resolving deltas:  91% (14961/16430)
Resolving deltas:  92% (15116/16430)
Resolving deltas:  93% (15280/16430)
Resolving deltas:  94% (15446/16430)
Resolving deltas:  95% (15609/16430)
Resolving deltas:  96% (15773/16430)
Resolving deltas:  97% (15938/16430)
Resolving deltas:  98% (16105/16430)
Resolving deltas:  99% (16266/16430)
Resolving deltas: 100% (16430/16430)
Resolving deltas: 100% (16430/16430), done.
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.9.tar.bz2...
INFO: Rebasing devtool onto 3433a7ff5388189fa927ad01e93e7d2fd7bf2595
WARNING: Command 'git rebase 3433a7ff5388189fa927ad01e93e7d2fd7bf2595' failed:
Auto-merging include/instrumentation/events/jbd2.h
CONFLICT (content): Merge conflict in include/instrumentation/events/jbd2.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lttng-modules
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lttng-modules/lttng-modules_2.13.9.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3851671671305423007==--

