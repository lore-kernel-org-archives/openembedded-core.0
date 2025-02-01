Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C51AC0219D
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.42621.1738416044724946212
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KBxrcO+M;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mht0zp5K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194c1abbb04-22478ac1-8d55-427e-8be3-3188387d8c26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416045;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kEXOQKEy/kpvHzDzy65Qm+Dnn7ljGl6ogVSHn4ZbJ1U=;
	b=KBxrcO+M8zZK11pJCBYcPNMMePejJgWOzpUUtpK8gBK8A4y+Vxv3kbv4yip9BxNk
	ZTN7HW+wbLpIMB2bUlx8Z2hc7xNVhTddjiWA04m7lJF+fesBrUyhGhMTB8kq1umL7uk
	jV1zb3/4RLn5f4qHEHn1W4jEDxc5G6/o4RpbB04A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416045;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kEXOQKEy/kpvHzDzy65Qm+Dnn7ljGl6ogVSHn4ZbJ1U=;
	b=mht0zp5KCjdZennT5cy2A/ggndRaX9QAVJlOOEKUmllu3f7Q/+Vsy6xSybqap49m
	jr9/RYtrNaMbCr3SA1RId3u5gmufSadrpcgZgCrXUp0jGH0ruNK6G5d2wzeyqMFR0CT
	4htWx5yB6bSE5aXcKe8huiedvYCN70x6xiES2dVU=
Content-Type: multipart/mixed; boundary="===============3616103798770010345=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.17 FAILED
Message-ID: <01010194c1abbb04-22478ac1-8d55-427e-8be3-3188387d8c26-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210514

--===============3616103798770010345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-modules* to *2.13.17* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:950bebb4f31de4cec8364e81925eb9dd8794860f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:950bebb4f31de4cec8364e81925eb9dd8794860f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-tsk1bs06: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-hqm4d7xi/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-hqm4d7xi/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Cloning into bare repository '/srv/pokybuild/yocto-worker/auh/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 23438, done.        
remote: Counting objects:   0% (1/23438)        
remote: Counting objects:   1% (235/23438)        
remote: Counting objects:   2% (469/23438)        
remote: Counting objects:   3% (704/23438)        
remote: Counting objects:   4% (938/23438)        
remote: Counting objects:   5% (1172/23438)        
remote: Counting objects:   6% (1407/23438)        
remote: Counting objects:   7% (1641/23438)        
remote: Counting objects:   8% (1876/23438)        
remote: Counting objects:   9% (2110/23438)        
remote: Counting objects:  10% (2344/23438)        
remote: Counting objects:  11% (2579/23438)        
remote: Counting objects:  12% (2813/23438)        
remote: Counting objects:  13% (3047/23438)        
remote: Counting objects:  14% (3282/23438)        
remote: Counting objects:  15% (3516/23438)        
remote: Counting objects:  16% (3751/23438)        
remote: Counting objects:  17% (3985/23438)        
remote: Counting objects:  18% (4219/23438)        
remote: Counting objects:  19% (4454/23438)        
remote: Counting objects:  20% (4688/23438)        
remote: Counting objects:  21% (4922/23438)        
remote: Counting objects:  22% (5157/23438)        
remote: Counting objects:  23% (5391/23438)        
remote: Counting objects:  24% (5626/23438)        
remote: Counting objects:  25% (5860/23438)        
remote: Counting objects:  26% (6094/23438)        
remote: Counting objects:  27% (6329/23438)        
remote: Counting objects:  28% (6563/23438)        
remote: Counting objects:  29% (6798/23438)        
remote: Counting objects:  30% (7032/23438)        
remote: Counting objects:  31% (7266/23438)        
remote: Counting objects:  32% (7501/23438)        
remote: Counting objects:  33% (7735/23438)        
remote: Counting objects:  34% (7969/23438)        
remote: Counting objects:  35% (8204/23438)        
remote: Counting objects:  36% (8438/23438)        
remote: Counting objects:  37% (8673/23438)        
remote: Counting objects:  38% (8907/23438)        
remote: Counting objects:  39% (9141/23438)        
remote: Counting objects:  40% (9376/23438)        
remote: Counting objects:  41% (9610/23438)        
remote: Counting objects:  42% (9844/23438)        
remote: Counting objects:  43% (10079/23438)        
remote: Counting objects:  44% (10313/23438)        
remote: Counting objects:  45% (10548/23438)        
remote: Counting objects:  46% (10782/23438)        
remote: Counting objects:  47% (11016/23438)        
remote: Counting objects:  48% (11251/23438)        
remote: Counting objects:  49% (11485/23438)        
remote: Counting objects:  50% (11719/23438)        
remote: Counting objects:  51% (11954/23438)        
remote: Counting objects:  52% (12188/23438)        
remote: Counting objects:  53% (12423/23438)        
remote: Counting objects:  54% (12657/23438)        
remote: Counting objects:  55% (12891/23438)        
remote: Counting objects:  56% (13126/23438)        
remote: Counting objects:  57% (13360/23438)        
remote: Counting objects:  58% (13595/23438)        
remote: Counting objects:  59% (13829/23438)        
remote: Counting objects:  60% (14063/23438)        
remote: Counting objects:  61% (14298/23438)        
remote: Counting objects:  62% (14532/23438)        
remote: Counting objects:  63% (14766/23438)        
remote: Counting objects:  64% (15001/23438)        
remote: Counting objects:  65% (15235/23438)        
remote: Counting objects:  66% (15470/23438)        
remote: Counting objects:  67% (15704/23438)        
remote: Counting objects:  68% (15938/23438)        
remote: Counting objects:  69% (16173/23438)        
remote: Counting objects:  70% (16407/23438)        
remote: Counting objects:  71% (16641/23438)        
remote: Counting objects:  72% (16876/23438)        
remote: Counting objects:  73% (17110/23438)        
remote: Counting objects:  74% (17345/23438)        
remote: Counting objects:  75% (17579/23438)        
remote: Counting objects:  76% (17813/23438)        
remote: Counting objects:  77% (18048/23438)        
remote: Counting objects:  78% (18282/23438)        
remote: Counting objects:  79% (18517/23438)        
remote: Counting objects:  80% (18751/23438)        
remote: Counting objects:  81% (18985/23438)        
remote: Counting objects:  82% (19220/23438)        
remote: Counting objects:  83% (19454/23438)        
remote: Counting objects:  84% (19688/23438)        
remote: Counting objects:  85% (19923/23438)        
remote: Counting objects: 100% (23438/23438), done.        
remote: Compressing objects:   0% (1/11420)        
remote: Compressing objects:   1% (115/11420)        
remote: Compressing objects:   2% (229/11420)        
remote: Compressing objects:   3% (343/11420)        
remote: Compressing objects:   4% (457/11420)        
remote: Compressing objects:   5% (571/11420)        
remote: Compressing objects:   6% (686/11420)        
remote: Compressing objects:   7% (800/11420)        
remote: Compressing objects:   8% (914/11420)        
remote: Compressing objects:   9% (1028/11420)        
remote: Compressing objects:  10% (1142/11420)        
remote: Compressing objects:  11% (1257/11420)        
remote: Compressing objects:  12% (1371/11420)        
remote: Compressing objects:  13% (1485/11420)        
remote: Compressing objects:  14% (1599/11420)        
remote: Compressing objects:  15% (1713/11420)        
remote: Compressing objects:  16% (1828/11420)        
remote: Compressing objects:  17% (1942/11420)        
remote: Compressing objects:  18% (2056/11420)        
remote: Compressing objects:  19% (2170/11420)        
remote: Compressing objects:  20% (2284/11420)        
remote: Compressing objects:  21% (2399/11420)        
remote: Compressing objects:  22% (2513/11420)        
remote: Compressing objects:  23% (2627/11420)        
remote: Compressing objects:  24% (2741/11420)        
remote: Compressing objects:  25% (2855/11420)        
remote: Compressing objects:  26% (2970/11420)        
remote: Compressing objects:  27% (3084/11420)        
remote: Compressing objects:  28% (3198/11420)        
remote: Compressing objects:  29% (3312/11420)        
remote: Compressing objects:  30% (3426/11420)        
remote: Compressing objects:  31% (3541/11420)        
remote: Compressing objects:  32% (3655/11420)        
remote: Compressing objects:  33% (3769/11420)        
remote: Compressing objects:  34% (3883/11420)        
remote: Compressing objects:  35% (3997/11420)        
remote: Compressing objects:  36% (4112/11420)        
remote: Compressing objects:  37% (4226/11420)        
remote: Compressing objects:  38% (4340/11420)        
remote: Compressing objects:  39% (4454/11420)        
remote: Compressing objects:  40% (4568/11420)        
remote: Compressing objects:  41% (4683/11420)        
remote: Compressing objects:  42% (4797/11420)        
remote: Compressing objects:  43% (4911/11420)        
remote: Compressing objects:  44% (5025/11420)        
remote: Compressing objects:  45% (5139/11420)        
remote: Compressing objects:  46% (5254/11420)        
remote: Compressing objects:  47% (5368/11420)        
remote: Compressing objects:  48% (5482/11420)        
remote: Compressing objects:  49% (5596/11420)        
remote: Compressing objects:  50% (5710/11420)        
remote: Compressing objects:  51% (5825/11420)        
remote: Compressing objects:  52% (5939/11420)        
remote: Compressing objects:  53% (6053/11420)        
remote: Compressing objects:  54% (6167/11420)        
remote: Compressing objects:  55% (6281/11420)        
remote: Compressing objects:  56% (6396/11420)        
remote: Compressing objects:  57% (6510/11420)        
remote: Compressing objects:  58% (6624/11420)        
remote: Compressing objects:  59% (6738/11420)        
remote: Compressing objects:  60% (6852/11420)        
remote: Compressing objects:  61% (6967/11420)        
remote: Compressing objects:  62% (7081/11420)        
remote: Compressing objects:  63% (7195/11420)        
remote: Compressing objects:  64% (7309/11420)        
remote: Compressing objects:  65% (7423/11420)        
remote: Compressing objects:  66% (7538/11420)        
remote: Compressing objects:  67% (7652/11420)        
remote: Compressing objects:  68% (7766/11420)        
remote: Compressing objects:  69% (7880/11420)        
remote: Compressing objects:  70% (7994/11420)        
remote: Compressing objects:  71% (8109/11420)        
remote: Compressing objects:  72% (8223/11420)        
remote: Compressing objects:  73% (8337/11420)        
remote: Compressing objects:  74% (8451/11420)        
remote: Compressing objects:  75% (8565/11420)        
remote: Compressing objects:  76% (8680/11420)        
remote: Compressing objects:  77% (8794/11420)        
remote: Compressing objects:  78% (8908/11420)        
remote: Compressing objects:  79% (9022/11420)        
remote: Compressing objects:  80% (9136/11420)        
remote: Compressing objects:  81% (9251/11420)        
remote: Compressing objects:  82% (9365/11420)        
remote: Compressing objects:  83% (9479/11420)        
remote: Compressing objects:  84% (9593/11420)        
remote: Compressing objects:  85% (9707/11420)        
remote: Compressing objects:  86% (9822/11420)        
remote: Compressing objects:  87% (9936/11420)        
remote: Compressing objects:  88% (10050/11420)        
remote: Compressing objects:  89% (10164/11420)        
remote: Compressing objects:  90% (10278/11420)        
remote: Compressing objects:  91% (10393/11420)        
remote: Compressing objects:  92% (10507/11420)        
remote: Compressing objects:  93% (10621/11420)        
remote: Compressing objects:  94% (10735/11420)        
remote: Compressing objects:  95% (10849/11420)        
remote: Compressing objects:  96% (10964/11420)        
remote: Compressing objects:  97% (11078/11420)        
remote: Compressing objects:  98% (11192/11420)        
remote: Compressing objects:  99% (11306/11420)        
remote: Compressing objects: 100% (11420/11420), done.        
Receiving objects:   0% (1/23438)
Receiving objects:   1% (235/23438)
Receiving objects:   2% (469/23438)
Receiving objects:   3% (704/23438)
Receiving objects:   4% (938/23438)
Receiving objects:   5% (1172/23438)
Receiving objects:   6% (1407/23438)
Receiving objects:   7% (1641/23438)
Receiving objects:   8% (1876/23438)
Receiving objects:   9% (2110/23438)
Receiving objects:  10% (2344/23438)
Receiving objects:  11% (2579/23438)
Receiving objects:  12% (2813/23438)
Receiving objects:  13% (3047/23438)
Receiving objects:  14% (3282/23438)
Receiving objects:  15% (3516/23438)
Receiving objects:  16% (3751/23438)
Receiving objects:  17% (3985/23438)
Receiving objects:  18% (4219/23438)
Receiving objects:  19% (4454/23438)
Receiving objects:  20% (4688/23438)
Receiving objects:  21% (4922/23438)
Receiving objects:  22% (5157/23438)
Receiving objects:  23% (5391/23438)
Receiving objects:  24% (5626/23438)
Receiving objects:  25% (5860/23438)
Receiving objects:  26% (6094/23438)
Receiving objects:  27% (6329/23438)
Receiving objects:  28% (6563/23438)
Receiving objects:  29% (6798/23438)
Receiving objects:  30% (7032/23438)
Receiving objects:  31% (7266/23438)
Receiving objects:  32% (7501/23438)
Receiving objects:  33% (7735/23438)
Receiving objects:  34% (7969/23438)
Receiving objects:  35% (8204/23438)
Receiving objects:  36% (8438/23438)
Receiving objects:  37% (8673/23438)
Receiving objects:  38% (8907/23438)
Receiving objects:  39% (9141/23438)
Receiving objects:  40% (9376/23438)
Receiving objects:  41% (9610/23438)
Receiving objects:  42% (9844/23438)
Receiving objects:  43% (10079/23438)
Receiving objects:  44% (10313/23438)
Receiving objects:  45% (10548/23438)
Receiving objects:  46% (10782/23438)
Receiving objects:  47% (11016/23438)
Receiving objects:  48% (11251/23438)
Receiving objects:  49% (11485/23438)
Receiving objects:  50% (11719/23438)
Receiving objects:  51% (11954/23438)
Receiving objects:  52% (12188/23438)
Receiving objects:  53% (12423/23438)
Receiving objects:  54% (12657/23438)
Receiving objects:  55% (12891/23438)
Receiving objects:  56% (13126/23438)
Receiving objects:  57% (13360/23438)
Receiving objects:  58% (13595/23438)
Receiving objects:  59% (13829/23438)
Receiving objects:  60% (14063/23438)
Receiving objects:  61% (14298/23438)
Receiving objects:  62% (14532/23438)
Receiving objects:  63% (14766/23438)
Receiving objects:  64% (15001/23438)
Receiving objects:  65% (15235/23438)
Receiving objects:  66% (15470/23438)
Receiving objects:  67% (15704/23438)
Receiving objects:  68% (15938/23438)
Receiving objects:  69% (16173/23438)
Receiving objects:  70% (16407/23438)
Receiving objects:  71% (16641/23438)
Receiving objects:  72% (16876/23438)
Receiving objects:  73% (17110/23438)
Receiving objects:  74% (17345/23438)
Receiving objects:  75% (17579/23438)
Receiving objects:  76% (17813/23438)
Receiving objects:  77% (18048/23438)
Receiving objects:  78% (18282/23438)
Receiving objects:  79% (18517/23438)
Receiving objects:  80% (18751/23438)
Receiving objects:  81% (18985/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  82% (19220/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  83% (19454/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  84% (19688/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  85% (19923/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  86% (20157/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  87% (20392/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  88% (20626/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  89% (20860/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  90% (21095/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  91% (21329/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  92% (21563/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  93% (21798/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  94% (22032/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  95% (22267/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  96% (22501/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  97% (22735/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects:  98% (22970/23438), 3.61 MiB | 6.43 MiB/s
remote: Total 23438 (delta 18053), reused 15954 (delta 11796), pack-reused 0        
Receiving objects:  99% (23204/23438), 3.61 MiB | 6.43 MiB/s
Receiving objects: 100% (23438/23438), 4.21 MiB | 7.34 MiB/s, done.
Resolving deltas:   0% (0/18053)
Resolving deltas:   1% (182/18053)
Resolving deltas:   2% (363/18053)
Resolving deltas:   3% (542/18053)
Resolving deltas:   4% (723/18053)
Resolving deltas:   5% (903/18053)
Resolving deltas:   6% (1084/18053)
Resolving deltas:   7% (1264/18053)
Resolving deltas:   8% (1445/18053)
Resolving deltas:   9% (1625/18053)
Resolving deltas:  10% (1806/18053)
Resolving deltas:  11% (1986/18053)
Resolving deltas:  12% (2167/18053)
Resolving deltas:  13% (2347/18053)
Resolving deltas:  14% (2528/18053)
Resolving deltas:  15% (2708/18053)
Resolving deltas:  16% (2889/18053)
Resolving deltas:  17% (3070/18053)
Resolving deltas:  18% (3250/18053)
Resolving deltas:  19% (3431/18053)
Resolving deltas:  20% (3611/18053)
Resolving deltas:  21% (3792/18053)
Resolving deltas:  22% (3972/18053)
Resolving deltas:  23% (4153/18053)
Resolving deltas:  24% (4333/18053)
Resolving deltas:  25% (4514/18053)
Resolving deltas:  26% (4694/18053)
Resolving deltas:  27% (4875/18053)
Resolving deltas:  28% (5055/18053)
Resolving deltas:  29% (5236/18053)
Resolving deltas:  30% (5416/18053)
Resolving deltas:  31% (5597/18053)
Resolving deltas:  32% (5777/18053)
Resolving deltas:  33% (5958/18053)
Resolving deltas:  34% (6139/18053)
Resolving deltas:  35% (6319/18053)
Resolving deltas:  36% (6500/18053)
Resolving deltas:  37% (6680/18053)
Resolving deltas:  38% (6861/18053)
Resolving deltas:  39% (7041/18053)
Resolving deltas:  40% (7222/18053)
Resolving deltas:  41% (7402/18053)
Resolving deltas:  42% (7583/18053)
Resolving deltas:  43% (7763/18053)
Resolving deltas:  44% (7944/18053)
Resolving deltas:  45% (8124/18053)
Resolving deltas:  46% (8305/18053)
Resolving deltas:  47% (8485/18053)
Resolving deltas:  48% (8667/18053)
Resolving deltas:  49% (8846/18053)
Resolving deltas:  50% (9027/18053)
Resolving deltas:  51% (9208/18053)
Resolving deltas:  52% (9388/18053)
Resolving deltas:  53% (9570/18053)
Resolving deltas:  54% (9749/18053)
Resolving deltas:  55% (9930/18053)
Resolving deltas:  56% (10110/18053)
Resolving deltas:  57% (10291/18053)
Resolving deltas:  58% (10472/18053)
Resolving deltas:  59% (10652/18053)
Resolving deltas:  60% (10832/18053)
Resolving deltas:  61% (11013/18053)
Resolving deltas:  62% (11193/18053)
Resolving deltas:  63% (11375/18053)
Resolving deltas:  64% (11556/18053)
Resolving deltas:  65% (11740/18053)
Resolving deltas:  66% (11915/18053)
Resolving deltas:  67% (12097/18053)
Resolving deltas:  68% (12277/18053)
Resolving deltas:  69% (12457/18053)
Resolving deltas:  70% (12638/18053)
Resolving deltas:  71% (12818/18053)
Resolving deltas:  72% (12999/18053)
Resolving deltas:  73% (13179/18053)
Resolving deltas:  74% (13360/18053)
Resolving deltas:  75% (13540/18053)
Resolving deltas:  76% (13721/18053)
Resolving deltas:  77% (13901/18053)
Resolving deltas:  78% (14082/18053)
Resolving deltas:  79% (14263/18053)
Resolving deltas:  80% (14444/18053)
Resolving deltas:  81% (14623/18053)
Resolving deltas:  82% (14804/18053)
Resolving deltas:  83% (14984/18053)
Resolving deltas:  84% (15171/18053)
Resolving deltas:  85% (15348/18053)
Resolving deltas:  86% (15526/18053)
Resolving deltas:  87% (15707/18053)
Resolving deltas:  88% (15887/18053)
Resolving deltas:  89% (16069/18053)
Resolving deltas:  90% (16249/18053)
Resolving deltas:  91% (16430/18053)
Resolving deltas:  92% (16609/18053)
Resolving deltas:  93% (16791/18053)
Resolving deltas:  94% (16972/18053)
Resolving deltas:  95% (17152/18053)
Resolving deltas:  96% (17331/18053)
Resolving deltas:  97% (17512/18053)
Resolving deltas:  98% (17692/18053)
Resolving deltas:  99% (17876/18053)
Resolving deltas: 100% (18053/18053)
Resolving deltas: 100% (18053/18053), done.
NOTE: Creating tarball of git repository
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.17.tar.bz2...
INFO: Rebasing devtool onto bd5ab6e17305359b570d06e18ab0183847e034f0
WARNING: Command 'git rebase bd5ab6e17305359b570d06e18ab0183847e034f0' failed:
Auto-merging include/instrumentation/events/sched.h
CONFLICT (content): Merge conflict in include/instrumentation/events/sched.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/lttng-modules
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/lttng-modules/lttng-modules_2.13.17.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3616103798770010345==--

