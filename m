Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72021C5474B
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.131092.1723748333768126910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Dhng2kQs;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JLWB2i4s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191576835dd-24331cb1-4cbc-4e4a-9c10-ee1d8b1e5c90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x1KaZ29HW+oKkMMOmmAHjE+s2PcuZpEdfZfaGmX4gX0=;
	b=Dhng2kQsythpdf5/PJT5wILfyuwPDHxxd712IoBL48mykKUUVzoNoKqqinaWzgAZ
	Bo5NRHzmiX51UMOIr/Xrh9p1E8r28nQBnd5uV9OhiFBHFLbD8vR6WKJwdkWaYg/KPP7
	a+31J0AC5drd708Sj/iaLbGxQICLajcOln8Ix9QA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x1KaZ29HW+oKkMMOmmAHjE+s2PcuZpEdfZfaGmX4gX0=;
	b=JLWB2i4sHeNyXucp27JyCCzttocUCxXPtLLcOwhSfIqem68oE+WKiePDvyw/5uli
	S4VG/PxMRohU3gLnDYyB+GuBBEvC+/vmMZjHxn0166VEIZiVGLbLTu4wbyekG/Yqr/7
	WfJunUCEcZhMFP3xf7fXcDCJ70RO7dgd78UO21QI=
Content-Type: multipart/mixed; boundary="===============8991847797870158688=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.14 FAILED
Message-ID: <01010191576835dd-24331cb1-4cbc-4e4a-9c10-ee1d8b1e5c90-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203347

--===============8991847797870158688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-modules* to *2.13.14* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8b8fb1c22be21b6ea2730f0483dcd2a6641b0542"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8b8fb1c22be21b6ea2730f0483dcd2a6641b0542"

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
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8b8fb1c22be21b6ea2730f0483dcd2a6641b0542"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8b8fb1c22be21b6ea2730f0483dcd2a6641b0542"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-eb3p5reb: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-zxaa36py/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-zxaa36py/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Cloning into bare repository '/home/pokybuild/yocto-worker/auh/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 23149, done.        
remote: Counting objects:   0% (1/23149)        
remote: Counting objects:   1% (232/23149)        
remote: Counting objects:   2% (463/23149)        
remote: Counting objects:   3% (695/23149)        
remote: Counting objects:   4% (926/23149)        
remote: Counting objects:   5% (1158/23149)        
remote: Counting objects:   6% (1389/23149)        
remote: Counting objects:   7% (1621/23149)        
remote: Counting objects:   8% (1852/23149)        
remote: Counting objects:   9% (2084/23149)        
remote: Counting objects:  10% (2315/23149)        
remote: Counting objects:  11% (2547/23149)        
remote: Counting objects:  12% (2778/23149)        
remote: Counting objects:  13% (3010/23149)        
remote: Counting objects:  14% (3241/23149)        
remote: Counting objects:  15% (3473/23149)        
remote: Counting objects:  16% (3704/23149)        
remote: Counting objects:  17% (3936/23149)        
remote: Counting objects:  18% (4167/23149)        
remote: Counting objects:  19% (4399/23149)        
remote: Counting objects:  20% (4630/23149)        
remote: Counting objects:  21% (4862/23149)        
remote: Counting objects:  22% (5093/23149)        
remote: Counting objects:  23% (5325/23149)        
remote: Counting objects:  24% (5556/23149)        
remote: Counting objects:  25% (5788/23149)        
remote: Counting objects:  26% (6019/23149)        
remote: Counting objects:  27% (6251/23149)        
remote: Counting objects:  28% (6482/23149)        
remote: Counting objects:  29% (6714/23149)        
remote: Counting objects:  30% (6945/23149)        
remote: Counting objects:  31% (7177/23149)        
remote: Counting objects:  32% (7408/23149)        
remote: Counting objects:  33% (7640/23149)        
remote: Counting objects:  34% (7871/23149)        
remote: Counting objects:  35% (8103/23149)        
remote: Counting objects:  36% (8334/23149)        
remote: Counting objects:  37% (8566/23149)        
remote: Counting objects:  38% (8797/23149)        
remote: Counting objects:  39% (9029/23149)        
remote: Counting objects:  40% (9260/23149)        
remote: Counting objects:  41% (9492/23149)        
remote: Counting objects:  42% (9723/23149)        
remote: Counting objects:  43% (9955/23149)        
remote: Counting objects:  44% (10186/23149)        
remote: Counting objects:  45% (10418/23149)        
remote: Counting objects:  46% (10649/23149)        
remote: Counting objects:  47% (10881/23149)        
remote: Counting objects:  48% (11112/23149)        
remote: Counting objects:  49% (11344/23149)        
remote: Counting objects:  50% (11575/23149)        
remote: Counting objects:  51% (11806/23149)        
remote: Counting objects:  52% (12038/23149)        
remote: Counting objects:  53% (12269/23149)        
remote: Counting objects:  54% (12501/23149)        
remote: Counting objects:  55% (12732/23149)        
remote: Counting objects:  56% (12964/23149)        
remote: Counting objects:  57% (13195/23149)        
remote: Counting objects:  58% (13427/23149)        
remote: Counting objects:  59% (13658/23149)        
remote: Counting objects:  60% (13890/23149)        
remote: Counting objects:  61% (14121/23149)        
remote: Counting objects:  62% (14353/23149)        
remote: Counting objects:  63% (14584/23149)        
remote: Counting objects:  64% (14816/23149)        
remote: Counting objects:  65% (15047/23149)        
remote: Counting objects:  66% (15279/23149)        
remote: Counting objects:  67% (15510/23149)        
remote: Counting objects:  68% (15742/23149)        
remote: Counting objects:  69% (15973/23149)        
remote: Counting objects:  70% (16205/23149)        
remote: Counting objects:  71% (16436/23149)        
remote: Counting objects:  72% (16668/23149)        
remote: Counting objects:  73% (16899/23149)        
remote: Counting objects:  74% (17131/23149)        
remote: Counting objects:  75% (17362/23149)        
remote: Counting objects:  76% (17594/23149)        
remote: Counting objects:  77% (17825/23149)        
remote: Counting objects:  78% (18057/23149)        
remote: Counting objects:  79% (18288/23149)        
remote: Counting objects:  80% (18520/23149)        
remote: Counting objects:  81% (18751/23149)        
remote: Counting objects:  82% (18983/23149)        
remote: Counting objects:  83% (19214/23149)        
remote: Counting objects: 100% (23149/23149), done.        
remote: Compressing objects:   0% (1/11135)        
remote: Compressing objects:   1% (112/11135)        
remote: Compressing objects:   2% (223/11135)        
remote: Compressing objects:   3% (335/11135)        
remote: Compressing objects:   4% (446/11135)        
remote: Compressing objects:   5% (557/11135)        
remote: Compressing objects:   6% (669/11135)        
remote: Compressing objects:   7% (780/11135)        
remote: Compressing objects:   8% (891/11135)        
remote: Compressing objects:   9% (1003/11135)        
remote: Compressing objects:  10% (1114/11135)        
remote: Compressing objects:  11% (1225/11135)        
remote: Compressing objects:  12% (1337/11135)        
remote: Compressing objects:  13% (1448/11135)        
remote: Compressing objects:  14% (1559/11135)        
remote: Compressing objects:  15% (1671/11135)        
remote: Compressing objects:  16% (1782/11135)        
remote: Compressing objects:  17% (1893/11135)        
remote: Compressing objects:  18% (2005/11135)        
remote: Compressing objects:  19% (2116/11135)        
remote: Compressing objects:  20% (2227/11135)        
remote: Compressing objects:  21% (2339/11135)        
remote: Compressing objects:  22% (2450/11135)        
remote: Compressing objects:  23% (2562/11135)        
remote: Compressing objects:  24% (2673/11135)        
remote: Compressing objects:  25% (2784/11135)        
remote: Compressing objects:  26% (2896/11135)        
remote: Compressing objects:  27% (3007/11135)        
remote: Compressing objects:  28% (3118/11135)        
remote: Compressing objects:  29% (3230/11135)        
remote: Compressing objects:  30% (3341/11135)        
remote: Compressing objects:  31% (3452/11135)        
remote: Compressing objects:  32% (3564/11135)        
remote: Compressing objects:  33% (3675/11135)        
remote: Compressing objects:  34% (3786/11135)        
remote: Compressing objects:  35% (3898/11135)        
remote: Compressing objects:  36% (4009/11135)        
remote: Compressing objects:  37% (4120/11135)        
remote: Compressing objects:  38% (4232/11135)        
remote: Compressing objects:  39% (4343/11135)        
remote: Compressing objects:  40% (4454/11135)        
remote: Compressing objects:  41% (4566/11135)        
remote: Compressing objects:  42% (4677/11135)        
remote: Compressing objects:  43% (4789/11135)        
remote: Compressing objects:  44% (4900/11135)        
remote: Compressing objects:  45% (5011/11135)        
remote: Compressing objects:  46% (5123/11135)        
remote: Compressing objects:  47% (5234/11135)        
remote: Compressing objects:  48% (5345/11135)        
remote: Compressing objects:  49% (5457/11135)        
remote: Compressing objects:  50% (5568/11135)        
remote: Compressing objects:  51% (5679/11135)        
remote: Compressing objects:  52% (5791/11135)        
remote: Compressing objects:  53% (5902/11135)        
remote: Compressing objects:  54% (6013/11135)        
remote: Compressing objects:  55% (6125/11135)        
remote: Compressing objects:  56% (6236/11135)        
remote: Compressing objects:  57% (6347/11135)        
remote: Compressing objects:  58% (6459/11135)        
remote: Compressing objects:  59% (6570/11135)        
remote: Compressing objects:  60% (6681/11135)        
remote: Compressing objects:  61% (6793/11135)        
remote: Compressing objects:  62% (6904/11135)        
remote: Compressing objects:  63% (7016/11135)        
remote: Compressing objects:  64% (7127/11135)        
remote: Compressing objects:  65% (7238/11135)        
remote: Compressing objects:  66% (7350/11135)        
remote: Compressing objects:  67% (7461/11135)        
remote: Compressing objects:  68% (7572/11135)        
remote: Compressing objects:  69% (7684/11135)        
remote: Compressing objects:  70% (7795/11135)        
remote: Compressing objects:  71% (7906/11135)        
remote: Compressing objects:  72% (8018/11135)        
remote: Compressing objects:  73% (8129/11135)        
remote: Compressing objects:  74% (8240/11135)        
remote: Compressing objects:  75% (8352/11135)        
remote: Compressing objects:  76% (8463/11135)        
remote: Compressing objects:  77% (8574/11135)        
remote: Compressing objects:  78% (8686/11135)        
remote: Compressing objects:  79% (8797/11135)        
remote: Compressing objects:  80% (8908/11135)        
remote: Compressing objects:  81% (9020/11135)        
remote: Compressing objects:  82% (9131/11135)        
remote: Compressing objects:  83% (9243/11135)        
remote: Compressing objects:  84% (9354/11135)        
remote: Compressing objects:  85% (9465/11135)        
remote: Compressing objects:  86% (9577/11135)        
remote: Compressing objects:  87% (9688/11135)        
remote: Compressing objects:  88% (9799/11135)        
remote: Compressing objects:  89% (9911/11135)        
remote: Compressing objects:  90% (10022/11135)        
remote: Compressing objects:  91% (10133/11135)        
remote: Compressing objects:  92% (10245/11135)        
remote: Compressing objects:  93% (10356/11135)        
remote: Compressing objects:  94% (10467/11135)        
remote: Compressing objects:  95% (10579/11135)        
remote: Compressing objects:  96% (10690/11135)        
remote: Compressing objects:  97% (10801/11135)        
remote: Compressing objects:  98% (10913/11135)        
remote: Compressing objects:  99% (11024/11135)        
remote: Compressing objects: 100% (11135/11135), done.        
Receiving objects:   0% (1/23149)
Receiving objects:   1% (232/23149)
Receiving objects:   2% (463/23149)
Receiving objects:   3% (695/23149)
Receiving objects:   4% (926/23149)
Receiving objects:   5% (1158/23149)
Receiving objects:   6% (1389/23149)
Receiving objects:   7% (1621/23149)
Receiving objects:   8% (1852/23149)
Receiving objects:   9% (2084/23149)
Receiving objects:  10% (2315/23149)
Receiving objects:  11% (2547/23149)
Receiving objects:  12% (2778/23149)
Receiving objects:  13% (3010/23149)
Receiving objects:  14% (3241/23149)
Receiving objects:  15% (3473/23149)
Receiving objects:  16% (3704/23149)
Receiving objects:  17% (3936/23149)
Receiving objects:  18% (4167/23149)
Receiving objects:  19% (4399/23149)
Receiving objects:  20% (4630/23149)
Receiving objects:  21% (4862/23149)
Receiving objects:  22% (5093/23149)
Receiving objects:  23% (5325/23149)
Receiving objects:  24% (5556/23149)
Receiving objects:  25% (5788/23149)
Receiving objects:  26% (6019/23149)
Receiving objects:  27% (6251/23149)
Receiving objects:  28% (6482/23149)
Receiving objects:  29% (6714/23149)
Receiving objects:  30% (6945/23149)
Receiving objects:  31% (7177/23149)
Receiving objects:  32% (7408/23149)
Receiving objects:  33% (7640/23149)
Receiving objects:  34% (7871/23149)
Receiving objects:  35% (8103/23149)
Receiving objects:  36% (8334/23149)
Receiving objects:  37% (8566/23149)
Receiving objects:  38% (8797/23149)
Receiving objects:  39% (9029/23149)
Receiving objects:  40% (9260/23149)
Receiving objects:  41% (9492/23149)
Receiving objects:  42% (9723/23149)
Receiving objects:  43% (9955/23149)
Receiving objects:  44% (10186/23149)
Receiving objects:  45% (10418/23149)
Receiving objects:  46% (10649/23149)
Receiving objects:  47% (10881/23149)
Receiving objects:  48% (11112/23149)
Receiving objects:  49% (11344/23149)
Receiving objects:  50% (11575/23149)
Receiving objects:  51% (11806/23149)
Receiving objects:  52% (12038/23149)
Receiving objects:  53% (12269/23149)
Receiving objects:  54% (12501/23149)
Receiving objects:  55% (12732/23149)
Receiving objects:  56% (12964/23149)
Receiving objects:  57% (13195/23149)
Receiving objects:  58% (13427/23149)
Receiving objects:  59% (13658/23149)
Receiving objects:  60% (13890/23149)
Receiving objects:  61% (14121/23149)
Receiving objects:  62% (14353/23149)
Receiving objects:  63% (14584/23149)
Receiving objects:  64% (14816/23149)
Receiving objects:  65% (15047/23149)
Receiving objects:  66% (15279/23149)
Receiving objects:  67% (15510/23149)
Receiving objects:  68% (15742/23149)
Receiving objects:  69% (15973/23149)
Receiving objects:  70% (16205/23149)
Receiving objects:  71% (16436/23149)
Receiving objects:  72% (16668/23149)
Receiving objects:  73% (16899/23149)
Receiving objects:  74% (17131/23149)
Receiving objects:  75% (17362/23149)
Receiving objects:  76% (17594/23149)
Receiving objects:  77% (17825/23149)
Receiving objects:  78% (18057/23149)
Receiving objects:  79% (18288/23149)
Receiving objects:  80% (18520/23149)
Receiving objects:  81% (18751/23149)
Receiving objects:  82% (18983/23149)
Receiving objects:  83% (19214/23149)
Receiving objects:  84% (19446/23149)
Receiving objects:  85% (19677/23149)
Receiving objects:  86% (19909/23149)
Receiving objects:  87% (20140/23149)
Receiving objects:  88% (20372/23149)
Receiving objects:  89% (20603/23149)
Receiving objects:  90% (20835/23149)
Receiving objects:  91% (21066/23149)
Receiving objects:  92% (21298/23149)
Receiving objects:  93% (21529/23149)
Receiving objects:  94% (21761/23149)
Receiving objects:  95% (21992/23149)
Receiving objects:  96% (22224/23149)
Receiving objects:  97% (22455/23149)
Receiving objects:  98% (22687/23149)
remote: Total 23149 (delta 17819), reused 15951 (delta 11792), pack-reused 0        
Receiving objects:  99% (22918/23149)
Receiving objects: 100% (23149/23149), 4.17 MiB | 11.31 MiB/s, done.
Resolving deltas:   0% (0/17819)
Resolving deltas:   1% (179/17819)
Resolving deltas:   2% (358/17819)
Resolving deltas:   3% (535/17819)
Resolving deltas:   4% (713/17819)
Resolving deltas:   5% (891/17819)
Resolving deltas:   6% (1070/17819)
Resolving deltas:   7% (1248/17819)
Resolving deltas:   8% (1426/17819)
Resolving deltas:   9% (1606/17819)
Resolving deltas:  10% (1782/17819)
Resolving deltas:  11% (1961/17819)
Resolving deltas:  12% (2139/17819)
Resolving deltas:  13% (2317/17819)
Resolving deltas:  14% (2495/17819)
Resolving deltas:  15% (2673/17819)
Resolving deltas:  16% (2852/17819)
Resolving deltas:  17% (3030/17819)
Resolving deltas:  18% (3208/17819)
Resolving deltas:  19% (3386/17819)
Resolving deltas:  20% (3564/17819)
Resolving deltas:  21% (3742/17819)
Resolving deltas:  22% (3921/17819)
Resolving deltas:  23% (4099/17819)
Resolving deltas:  24% (4277/17819)
Resolving deltas:  25% (4455/17819)
Resolving deltas:  26% (4633/17819)
Resolving deltas:  27% (4812/17819)
Resolving deltas:  28% (4990/17819)
Resolving deltas:  29% (5168/17819)
Resolving deltas:  30% (5346/17819)
Resolving deltas:  31% (5524/17819)
Resolving deltas:  32% (5703/17819)
Resolving deltas:  33% (5881/17819)
Resolving deltas:  34% (6059/17819)
Resolving deltas:  35% (6237/17819)
Resolving deltas:  36% (6415/17819)
Resolving deltas:  37% (6594/17819)
Resolving deltas:  38% (6772/17819)
Resolving deltas:  39% (6950/17819)
Resolving deltas:  40% (7128/17819)
Resolving deltas:  41% (7306/17819)
Resolving deltas:  42% (7484/17819)
Resolving deltas:  43% (7663/17819)
Resolving deltas:  44% (7841/17819)
Resolving deltas:  45% (8019/17819)
Resolving deltas:  46% (8197/17819)
Resolving deltas:  47% (8375/17819)
Resolving deltas:  48% (8554/17819)
Resolving deltas:  49% (8732/17819)
Resolving deltas:  50% (8910/17819)
Resolving deltas:  51% (9088/17819)
Resolving deltas:  52% (9266/17819)
Resolving deltas:  53% (9445/17819)
Resolving deltas:  54% (9623/17819)
Resolving deltas:  55% (9801/17819)
Resolving deltas:  56% (9980/17819)
Resolving deltas:  57% (10160/17819)
Resolving deltas:  58% (10336/17819)
Resolving deltas:  59% (10514/17819)
Resolving deltas:  60% (10695/17819)
Resolving deltas:  61% (10876/17819)
Resolving deltas:  62% (11049/17819)
Resolving deltas:  63% (11226/17819)
Resolving deltas:  64% (11410/17819)
Resolving deltas:  65% (11583/17819)
Resolving deltas:  66% (11762/17819)
Resolving deltas:  67% (11939/17819)
Resolving deltas:  68% (12119/17819)
Resolving deltas:  69% (12296/17819)
Resolving deltas:  70% (12483/17819)
Resolving deltas:  71% (12652/17819)
Resolving deltas:  72% (12831/17819)
Resolving deltas:  73% (13009/17819)
Resolving deltas:  74% (13190/17819)
Resolving deltas:  75% (13367/17819)
Resolving deltas:  76% (13543/17819)
Resolving deltas:  77% (13727/17819)
Resolving deltas:  78% (13900/17819)
Resolving deltas:  79% (14082/17819)
Resolving deltas:  80% (14258/17819)
Resolving deltas:  81% (14440/17819)
Resolving deltas:  82% (14612/17819)
Resolving deltas:  83% (14790/17819)
Resolving deltas:  84% (14971/17819)
Resolving deltas:  85% (15147/17819)
Resolving deltas:  86% (15325/17819)
Resolving deltas:  87% (15503/17819)
Resolving deltas:  88% (15681/17819)
Resolving deltas:  89% (15859/17819)
Resolving deltas:  90% (16038/17819)
Resolving deltas:  91% (16222/17819)
Resolving deltas:  92% (16400/17819)
Resolving deltas:  93% (16572/17819)
Resolving deltas:  94% (16754/17819)
Resolving deltas:  95% (16930/17819)
Resolving deltas:  96% (17107/17819)
Resolving deltas:  97% (17285/17819)
Resolving deltas:  98% (17463/17819)
Resolving deltas:  99% (17643/17819)
Resolving deltas: 100% (17819/17819)
Resolving deltas: 100% (17819/17819), done.
NOTE: Creating tarball of git repository
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.14.tar.bz2...
INFO: Rebasing devtool onto 419d2b7831c679e8a092f7064112c69f3aa20cca
WARNING: Command 'git rebase 419d2b7831c679e8a092f7064112c69f3aa20cca' failed:
Auto-merging include/instrumentation/events/btrfs.h
CONFLICT (content): Merge conflict in include/instrumentation/events/btrfs.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/lttng-modules
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/lttng-modules/lttng-modules_2.13.14.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8991847797870158688==--

