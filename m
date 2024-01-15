Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4562C47DDA
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.88285.1705340030280705559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DrJIVsoJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XwBmaLwa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d0e2fcf86-bf14de63-204a-4e98-b599-762155114bbd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L1sykxSkqQgZ0iQ0s1ms8Y3bH+1XPtl7BWzHATRoeHc=;
	b=DrJIVsoJzsjXsl+nXApy9ulpxHBpo1eFOeKrfc7Ii3YbDtFrhDSRQX7tn1upghYQ
	UcQOyZz5HOiqmQ3Dpm1GtKNgibd6Vm76epbhoNF4g4wi+S7+nuhIldRSC43pAyfSfWo
	sr5LzjdKvBka2fwnsT3M4XEBFvLuYq2RsN97v1oI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L1sykxSkqQgZ0iQ0s1ms8Y3bH+1XPtl7BWzHATRoeHc=;
	b=XwBmaLwaOOOJULJBmlz99Id+o4I8/j1sHdtwcxugfQ5S+/YFwgNbVnz5ZnPN/oTq
	oIF2fJgFPY+o3MDIVwKm6fFbv5E3CLBRFRuu2j95l9hIr5JidHvxgNFMVEce/qDTl5q
	G9UnWOPujJLJNcMjCgROBuncb7brZlUeNjAxUrvE=
Content-Type: multipart/mixed; boundary="===============0249412672301509649=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.11 FAILED
Message-ID: <0101018d0e2fcf86-bf14de63-204a-4e98-b599-762155114bbd-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193774

--===============0249412672301509649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.13.11* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-631ab3919f97c8e807219d9c3136f7135c51d555"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:631ab3919f97c8e807219d9c3136f7135c51d555"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1850 entries from dependency cache.
Parsing recipes...done.
Parsing of 915 .bb files complete (913 cached, 2 parsed). 1851 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-631ab3919f97c8e807219d9c3136f7135c51d555"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:631ab3919f97c8e807219d9c3136f7135c51d555"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Cloning into bare repository '/srv/autobuilder/autobuilder.yocto.io/current_sources/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 21786, done.        
remote: Counting objects:   0% (1/21786)        
remote: Counting objects:   1% (218/21786)        
remote: Counting objects:   2% (436/21786)        
remote: Counting objects:   3% (654/21786)        
remote: Counting objects:   4% (872/21786)        
remote: Counting objects:   5% (1090/21786)        
remote: Counting objects:   6% (1308/21786)        
remote: Counting objects:   7% (1526/21786)        
remote: Counting objects:   8% (1743/21786)        
remote: Counting objects:   9% (1961/21786)        
remote: Counting objects:  10% (2179/21786)        
remote: Counting objects:  11% (2397/21786)        
remote: Counting objects:  12% (2615/21786)        
remote: Counting objects:  13% (2833/21786)        
remote: Counting objects:  14% (3051/21786)        
remote: Counting objects:  15% (3268/21786)        
remote: Counting objects:  16% (3486/21786)        
remote: Counting objects:  17% (3704/21786)        
remote: Counting objects:  18% (3922/21786)        
remote: Counting objects:  19% (4140/21786)        
remote: Counting objects:  20% (4358/21786)        
remote: Counting objects:  21% (4576/21786)        
remote: Counting objects:  22% (4793/21786)        
remote: Counting objects:  23% (5011/21786)        
remote: Counting objects:  24% (5229/21786)        
remote: Counting objects:  25% (5447/21786)        
remote: Counting objects:  26% (5665/21786)        
remote: Counting objects:  27% (5883/21786)        
remote: Counting objects:  28% (6101/21786)        
remote: Counting objects:  29% (6318/21786)        
remote: Counting objects:  30% (6536/21786)        
remote: Counting objects:  31% (6754/21786)        
remote: Counting objects:  32% (6972/21786)        
remote: Counting objects:  33% (7190/21786)        
remote: Counting objects:  34% (7408/21786)        
remote: Counting objects:  35% (7626/21786)        
remote: Counting objects:  36% (7843/21786)        
remote: Counting objects:  37% (8061/21786)        
remote: Counting objects:  38% (8279/21786)        
remote: Counting objects:  39% (8497/21786)        
remote: Counting objects:  40% (8715/21786)        
remote: Counting objects:  41% (8933/21786)        
remote: Counting objects:  42% (9151/21786)        
remote: Counting objects:  43% (9368/21786)        
remote: Counting objects:  44% (9586/21786)        
remote: Counting objects:  45% (9804/21786)        
remote: Counting objects:  46% (10022/21786)        
remote: Counting objects:  47% (10240/21786)        
remote: Counting objects:  48% (10458/21786)        
remote: Counting objects:  49% (10676/21786)        
remote: Counting objects:  50% (10893/21786)        
remote: Counting objects:  51% (11111/21786)        
remote: Counting objects:  52% (11329/21786)        
remote: Counting objects:  53% (11547/21786)        
remote: Counting objects:  54% (11765/21786)        
remote: Counting objects:  55% (11983/21786)        
remote: Counting objects:  56% (12201/21786)        
remote: Counting objects:  57% (12419/21786)        
remote: Counting objects:  58% (12636/21786)        
remote: Counting objects:  59% (12854/21786)        
remote: Counting objects:  60% (13072/21786)        
remote: Counting objects:  61% (13290/21786)        
remote: Counting objects:  62% (13508/21786)        
remote: Counting objects:  63% (13726/21786)        
remote: Counting objects:  64% (13944/21786)        
remote: Counting objects:  65% (14161/21786)        
remote: Counting objects:  66% (14379/21786)        
remote: Counting objects:  67% (14597/21786)        
remote: Counting objects:  68% (14815/21786)        
remote: Counting objects:  69% (15033/21786)        
remote: Counting objects:  70% (15251/21786)        
remote: Counting objects:  71% (15469/21786)        
remote: Counting objects:  72% (15686/21786)        
remote: Counting objects:  73% (15904/21786)        
remote: Counting objects:  74% (16122/21786)        
remote: Counting objects:  75% (16340/21786)        
remote: Counting objects:  76% (16558/21786)        
remote: Counting objects:  77% (16776/21786)        
remote: Counting objects:  78% (16994/21786)        
remote: Counting objects:  79% (17211/21786)        
remote: Counting objects:  80% (17429/21786)        
remote: Counting objects:  81% (17647/21786)        
remote: Counting objects:  82% (17865/21786)        
remote: Counting objects:  83% (18083/21786)        
remote: Counting objects:  84% (18301/21786)        
remote: Counting objects: 100% (21786/21786), done.        
remote: Compressing objects:   0% (1/10238)        
remote: Compressing objects:   1% (103/10238)        
remote: Compressing objects:   2% (205/10238)        
remote: Compressing objects:   3% (308/10238)        
remote: Compressing objects:   4% (410/10238)        
remote: Compressing objects:   5% (512/10238)        
remote: Compressing objects:   6% (615/10238)        
remote: Compressing objects:   7% (717/10238)        
remote: Compressing objects:   8% (820/10238)        
remote: Compressing objects:   9% (922/10238)        
remote: Compressing objects:  10% (1024/10238)        
remote: Compressing objects:  11% (1127/10238)        
remote: Compressing objects:  12% (1229/10238)        
remote: Compressing objects:  13% (1331/10238)        
remote: Compressing objects:  14% (1434/10238)        
remote: Compressing objects:  15% (1536/10238)        
remote: Compressing objects:  16% (1639/10238)        
remote: Compressing objects:  17% (1741/10238)        
remote: Compressing objects:  18% (1843/10238)        
remote: Compressing objects:  19% (1946/10238)        
remote: Compressing objects:  20% (2048/10238)        
remote: Compressing objects:  21% (2150/10238)        
remote: Compressing objects:  22% (2253/10238)        
remote: Compressing objects:  23% (2355/10238)        
remote: Compressing objects:  24% (2458/10238)        
remote: Compressing objects:  25% (2560/10238)        
remote: Compressing objects:  26% (2662/10238)        
remote: Compressing objects:  27% (2765/10238)        
remote: Compressing objects:  28% (2867/10238)        
remote: Compressing objects:  29% (2970/10238)        
remote: Compressing objects:  30% (3072/10238)        
remote: Compressing objects:  31% (3174/10238)        
remote: Compressing objects:  32% (3277/10238)        
remote: Compressing objects:  33% (3379/10238)        
remote: Compressing objects:  34% (3481/10238)        
remote: Compressing objects:  35% (3584/10238)        
remote: Compressing objects:  36% (3686/10238)        
remote: Compressing objects:  37% (3789/10238)        
remote: Compressing objects:  38% (3891/10238)        
remote: Compressing objects:  39% (3993/10238)        
remote: Compressing objects:  40% (4096/10238)        
remote: Compressing objects:  41% (4198/10238)        
remote: Compressing objects:  42% (4300/10238)        
remote: Compressing objects:  43% (4403/10238)        
remote: Compressing objects:  44% (4505/10238)        
remote: Compressing objects:  45% (4608/10238)        
remote: Compressing objects:  46% (4710/10238)        
remote: Compressing objects:  47% (4812/10238)        
remote: Compressing objects:  48% (4915/10238)        
remote: Compressing objects:  49% (5017/10238)        
remote: Compressing objects:  50% (5119/10238)        
remote: Compressing objects:  51% (5222/10238)        
remote: Compressing objects:  52% (5324/10238)        
remote: Compressing objects:  53% (5427/10238)        
remote: Compressing objects:  54% (5529/10238)        
remote: Compressing objects:  55% (5631/10238)        
remote: Compressing objects:  56% (5734/10238)        
remote: Compressing objects:  57% (5836/10238)        
remote: Compressing objects:  58% (5939/10238)        
remote: Compressing objects:  59% (6041/10238)        
remote: Compressing objects:  60% (6143/10238)        
remote: Compressing objects:  61% (6246/10238)        
remote: Compressing objects:  62% (6348/10238)        
remote: Compressing objects:  63% (6450/10238)        
remote: Compressing objects:  64% (6553/10238)        
remote: Compressing objects:  65% (6655/10238)        
remote: Compressing objects:  66% (6758/10238)        
remote: Compressing objects:  67% (6860/10238)        
remote: Compressing objects:  68% (6962/10238)        
remote: Compressing objects:  69% (7065/10238)        
remote: Compressing objects:  70% (7167/10238)        
remote: Compressing objects:  71% (7269/10238)        
remote: Compressing objects:  72% (7372/10238)        
remote: Compressing objects:  73% (7474/10238)        
remote: Compressing objects:  74% (7577/10238)        
remote: Compressing objects:  75% (7679/10238)        
remote: Compressing objects:  76% (7781/10238)        
remote: Compressing objects:  77% (7884/10238)        
remote: Compressing objects:  78% (7986/10238)        
remote: Compressing objects:  79% (8089/10238)        
remote: Compressing objects:  80% (8191/10238)        
remote: Compressing objects:  81% (8293/10238)        
remote: Compressing objects:  82% (8396/10238)        
remote: Compressing objects:  83% (8498/10238)        
remote: Compressing objects:  84% (8600/10238)        
remote: Compressing objects:  85% (8703/10238)        
remote: Compressing objects:  86% (8805/10238)        
remote: Compressing objects:  87% (8908/10238)        
remote: Compressing objects:  88% (9010/10238)        
remote: Compressing objects:  89% (9112/10238)        
remote: Compressing objects:  90% (9215/10238)        
remote: Compressing objects:  91% (9317/10238)        
remote: Compressing objects:  92% (9419/10238)        
remote: Compressing objects:  93% (9522/10238)        
remote: Compressing objects:  94% (9624/10238)        
remote: Compressing objects:  95% (9727/10238)        
remote: Compressing objects:  96% (9829/10238)        
remote: Compressing objects:  97% (9931/10238)        
remote: Compressing objects:  98% (10034/10238)        
remote: Compressing objects:  99% (10136/10238)        
remote: Compressing objects: 100% (10238/10238), done.        
Receiving objects:   0% (1/21786)
Receiving objects:   1% (218/21786)
Receiving objects:   2% (436/21786)
Receiving objects:   3% (654/21786)
Receiving objects:   4% (872/21786)
Receiving objects:   5% (1090/21786)
Receiving objects:   6% (1308/21786)
Receiving objects:   7% (1526/21786)
Receiving objects:   8% (1743/21786)
Receiving objects:   9% (1961/21786)
Receiving objects:  10% (2179/21786)
Receiving objects:  11% (2397/21786)
Receiving objects:  12% (2615/21786)
Receiving objects:  13% (2833/21786)
Receiving objects:  14% (3051/21786)
Receiving objects:  15% (3268/21786)
Receiving objects:  16% (3486/21786)
Receiving objects:  17% (3704/21786)
Receiving objects:  18% (3922/21786)
Receiving objects:  19% (4140/21786)
Receiving objects:  20% (4358/21786)
Receiving objects:  21% (4576/21786)
Receiving objects:  22% (4793/21786)
Receiving objects:  23% (5011/21786)
Receiving objects:  24% (5229/21786)
Receiving objects:  25% (5447/21786)
Receiving objects:  26% (5665/21786)
Receiving objects:  27% (5883/21786)
Receiving objects:  28% (6101/21786)
Receiving objects:  29% (6318/21786)
Receiving objects:  30% (6536/21786)
Receiving objects:  31% (6754/21786)
Receiving objects:  32% (6972/21786)
Receiving objects:  33% (7190/21786)
Receiving objects:  34% (7408/21786)
Receiving objects:  35% (7626/21786)
Receiving objects:  36% (7843/21786)
Receiving objects:  37% (8061/21786)
Receiving objects:  38% (8279/21786)
Receiving objects:  39% (8497/21786)
Receiving objects:  40% (8715/21786)
Receiving objects:  41% (8933/21786)
Receiving objects:  42% (9151/21786)
Receiving objects:  43% (9368/21786)
Receiving objects:  44% (9586/21786)
Receiving objects:  45% (9804/21786)
Receiving objects:  46% (10022/21786)
Receiving objects:  47% (10240/21786)
Receiving objects:  48% (10458/21786)
Receiving objects:  49% (10676/21786)
Receiving objects:  50% (10893/21786)
Receiving objects:  51% (11111/21786)
Receiving objects:  52% (11329/21786)
Receiving objects:  53% (11547/21786)
Receiving objects:  54% (11765/21786)
Receiving objects:  55% (11983/21786)
Receiving objects:  56% (12201/21786)
Receiving objects:  57% (12419/21786)
Receiving objects:  58% (12636/21786)
Receiving objects:  59% (12854/21786)
Receiving objects:  60% (13072/21786)
Receiving objects:  61% (13290/21786)
Receiving objects:  62% (13508/21786)
Receiving objects:  63% (13726/21786)
Receiving objects:  64% (13944/21786)
Receiving objects:  65% (14161/21786)
Receiving objects:  66% (14379/21786)
Receiving objects:  67% (14597/21786)
Receiving objects:  68% (14815/21786)
Receiving objects:  69% (15033/21786)
Receiving objects:  70% (15251/21786)
Receiving objects:  71% (15469/21786)
Receiving objects:  72% (15686/21786)
Receiving objects:  73% (15904/21786)
Receiving objects:  74% (16122/21786)
Receiving objects:  75% (16340/21786)
Receiving objects:  76% (16558/21786)
Receiving objects:  77% (16776/21786)
Receiving objects:  78% (16994/21786)
Receiving objects:  79% (17211/21786)
Receiving objects:  80% (17429/21786)
Receiving objects:  81% (17647/21786)
Receiving objects:  82% (17865/21786)
Receiving objects:  83% (18083/21786)
Receiving objects:  84% (18301/21786)
Receiving objects:  85% (18519/21786)
Receiving objects:  86% (18736/21786)
Receiving objects:  87% (18954/21786)
Receiving objects:  88% (19172/21786)
Receiving objects:  89% (19390/21786)
Receiving objects:  90% (19608/21786)
Receiving objects:  91% (19826/21786)
Receiving objects:  92% (20044/21786)
Receiving objects:  93% (20261/21786)
Receiving objects:  94% (20479/21786)
Receiving objects:  95% (20697/21786)
Receiving objects:  96% (20915/21786)
Receiving objects:  97% (21133/21786)
remote: Total 21786 (delta 16707), reused 15404 (delta 11342), pack-reused 0        
Receiving objects:  98% (21351/21786)
Receiving objects:  99% (21569/21786)
Receiving objects: 100% (21786/21786), 3.87 MiB | 10.57 MiB/s, done.
Resolving deltas:   0% (0/16707)
Resolving deltas:   1% (168/16707)
Resolving deltas:   2% (337/16707)
Resolving deltas:   3% (502/16707)
Resolving deltas:   4% (670/16707)
Resolving deltas:   5% (841/16707)
Resolving deltas:   6% (1005/16707)
Resolving deltas:   7% (1170/16707)
Resolving deltas:   8% (1337/16707)
Resolving deltas:   9% (1504/16707)
Resolving deltas:  10% (1671/16707)
Resolving deltas:  11% (1838/16707)
Resolving deltas:  12% (2005/16707)
Resolving deltas:  13% (2172/16707)
Resolving deltas:  14% (2341/16707)
Resolving deltas:  15% (2507/16707)
Resolving deltas:  16% (2675/16707)
Resolving deltas:  17% (2841/16707)
Resolving deltas:  18% (3009/16707)
Resolving deltas:  19% (3175/16707)
Resolving deltas:  20% (3342/16707)
Resolving deltas:  21% (3509/16707)
Resolving deltas:  22% (3676/16707)
Resolving deltas:  23% (3843/16707)
Resolving deltas:  24% (4010/16707)
Resolving deltas:  25% (4177/16707)
Resolving deltas:  26% (4344/16707)
Resolving deltas:  27% (4511/16707)
Resolving deltas:  28% (4678/16707)
Resolving deltas:  29% (4846/16707)
Resolving deltas:  30% (5013/16707)
Resolving deltas:  31% (5180/16707)
Resolving deltas:  32% (5347/16707)
Resolving deltas:  33% (5514/16707)
Resolving deltas:  34% (5681/16707)
Resolving deltas:  35% (5848/16707)
Resolving deltas:  36% (6015/16707)
Resolving deltas:  37% (6182/16707)
Resolving deltas:  38% (6349/16707)
Resolving deltas:  39% (6516/16707)
Resolving deltas:  40% (6683/16707)
Resolving deltas:  41% (6850/16707)
Resolving deltas:  42% (7017/16707)
Resolving deltas:  43% (7185/16707)
Resolving deltas:  44% (7352/16707)
Resolving deltas:  45% (7519/16707)
Resolving deltas:  46% (7687/16707)
Resolving deltas:  47% (7853/16707)
Resolving deltas:  48% (8020/16707)
Resolving deltas:  49% (8187/16707)
Resolving deltas:  50% (8354/16707)
Resolving deltas:  51% (8521/16707)
Resolving deltas:  52% (8689/16707)
Resolving deltas:  53% (8856/16707)
Resolving deltas:  54% (9022/16707)
Resolving deltas:  55% (9189/16707)
Resolving deltas:  56% (9357/16707)
Resolving deltas:  57% (9523/16707)
Resolving deltas:  58% (9691/16707)
Resolving deltas:  59% (9860/16707)
Resolving deltas:  60% (10026/16707)
Resolving deltas:  61% (10192/16707)
Resolving deltas:  62% (10359/16707)
Resolving deltas:  63% (10526/16707)
Resolving deltas:  64% (10693/16707)
Resolving deltas:  65% (10860/16707)
Resolving deltas:  66% (11028/16707)
Resolving deltas:  67% (11194/16707)
Resolving deltas:  68% (11362/16707)
Resolving deltas:  69% (11530/16707)
Resolving deltas:  70% (11695/16707)
Resolving deltas:  71% (11863/16707)
Resolving deltas:  72% (12030/16707)
Resolving deltas:  73% (12198/16707)
Resolving deltas:  74% (12364/16707)
Resolving deltas:  75% (12532/16707)
Resolving deltas:  76% (12698/16707)
Resolving deltas:  77% (12866/16707)
Resolving deltas:  78% (13032/16707)
Resolving deltas:  79% (13199/16707)
Resolving deltas:  80% (13366/16707)
Resolving deltas:  81% (13534/16707)
Resolving deltas:  82% (13700/16707)
Resolving deltas:  83% (13868/16707)
Resolving deltas:  84% (14034/16707)
Resolving deltas:  85% (14202/16707)
Resolving deltas:  86% (14369/16707)
Resolving deltas:  87% (14537/16707)
Resolving deltas:  88% (14704/16707)
Resolving deltas:  89% (14870/16707)
Resolving deltas:  90% (15037/16707)
Resolving deltas:  91% (15210/16707)
Resolving deltas:  92% (15373/16707)
Resolving deltas:  93% (15539/16707)
Resolving deltas:  94% (15707/16707)
Resolving deltas:  95% (15883/16707)
Resolving deltas:  96% (16040/16707)
Resolving deltas:  97% (16210/16707)
Resolving deltas:  98% (16373/16707)
Resolving deltas:  99% (16540/16707)
Resolving deltas: 100% (16707/16707)
Resolving deltas: 100% (16707/16707), done.
NOTE: Creating tarball of git repository
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.11.tar.bz2...
INFO: Rebasing devtool onto fe5dbd8a4b92974ff81e21690c26e2b4ad46eda0
WARNING: Command 'git rebase fe5dbd8a4b92974ff81e21690c26e2b4ad46eda0' failed:
Auto-merging include/wrapper/fdtable.h
CONFLICT (content): Merge conflict in include/wrapper/fdtable.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/lttng-modules
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/lttng-modules/lttng-modules_2.13.11.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0249412672301509649==--

