Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621FACFC610
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.53367.1728588951632949875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PCC/OTGg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=u3bs/uSO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277ee573f-00e21075-a109-462f-8a4a-f0673e3d3f57-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588961;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gfOJS4XsLB2uWHzAKfkmBDp4bWRNi4KYf6Tt2Htx9rU=;
	b=PCC/OTGguhhR7vwS8kvu20gZGCsrdZN5EBtZ2P/aL02HOaZ4C9p2ZihYDOCCiKi2
	uE3jRslfHlzZvqdCCUcOZey+HNlZ7Fa8QVtoxI/3UGJegKl/3sKA1MzHtNp0JOf785h
	0BOPABK09gVOqq3jkTGFiUi1yY8ZQDEAT4HVl/f8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588961;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gfOJS4XsLB2uWHzAKfkmBDp4bWRNi4KYf6Tt2Htx9rU=;
	b=u3bs/uSONR3vPmG+J1AECymatWqV2tTUfIC4zGQEGmeElkhSrAEq3bTCrQ+id4gg
	X/d3ub13PQFMiLCQDWPqFP2W3Y6QApNo6auCooo8ETZIg4D5SK3qigydMssal/K9BH2
	P6C4Es4dG9ikWzhNp72KLroOU1FQwxJIs0kTGn/s=
Content-Type: multipart/mixed; boundary="===============8379865667860867697=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.15 FAILED
Message-ID: <0101019277ee573f-00e21075-a109-462f-8a4a-f0673e3d3f57-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205501

--===============8379865667860867697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-modules* to *2.13.15* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:898a5089c01cf5c58f31fdfc9ea769436147b53d"

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
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:898a5089c01cf5c58f31fdfc9ea769436147b53d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-kj4g5tui: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-xnk8s4o5/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-xnk8s4o5/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Cloning into bare repository '/srv/pokybuild/yocto-worker/auh/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 23192, done.        
remote: Counting objects:   0% (1/23192)        
remote: Counting objects:   1% (232/23192)        
remote: Counting objects:   2% (464/23192)        
remote: Counting objects:   3% (696/23192)        
remote: Counting objects:   4% (928/23192)        
remote: Counting objects:   5% (1160/23192)        
remote: Counting objects:   6% (1392/23192)        
remote: Counting objects:   7% (1624/23192)        
remote: Counting objects:   8% (1856/23192)        
remote: Counting objects:   9% (2088/23192)        
remote: Counting objects:  10% (2320/23192)        
remote: Counting objects:  11% (2552/23192)        
remote: Counting objects:  12% (2784/23192)        
remote: Counting objects:  13% (3015/23192)        
remote: Counting objects:  14% (3247/23192)        
remote: Counting objects:  15% (3479/23192)        
remote: Counting objects:  16% (3711/23192)        
remote: Counting objects:  17% (3943/23192)        
remote: Counting objects:  18% (4175/23192)        
remote: Counting objects:  19% (4407/23192)        
remote: Counting objects:  20% (4639/23192)        
remote: Counting objects:  21% (4871/23192)        
remote: Counting objects:  22% (5103/23192)        
remote: Counting objects:  23% (5335/23192)        
remote: Counting objects:  24% (5567/23192)        
remote: Counting objects:  25% (5798/23192)        
remote: Counting objects:  26% (6030/23192)        
remote: Counting objects:  27% (6262/23192)        
remote: Counting objects:  28% (6494/23192)        
remote: Counting objects:  29% (6726/23192)        
remote: Counting objects:  30% (6958/23192)        
remote: Counting objects:  31% (7190/23192)        
remote: Counting objects:  32% (7422/23192)        
remote: Counting objects:  33% (7654/23192)        
remote: Counting objects:  34% (7886/23192)        
remote: Counting objects:  35% (8118/23192)        
remote: Counting objects:  36% (8350/23192)        
remote: Counting objects:  37% (8582/23192)        
remote: Counting objects:  38% (8813/23192)        
remote: Counting objects:  39% (9045/23192)        
remote: Counting objects:  40% (9277/23192)        
remote: Counting objects:  41% (9509/23192)        
remote: Counting objects:  42% (9741/23192)        
remote: Counting objects:  43% (9973/23192)        
remote: Counting objects:  44% (10205/23192)        
remote: Counting objects:  45% (10437/23192)        
remote: Counting objects:  46% (10669/23192)        
remote: Counting objects:  47% (10901/23192)        
remote: Counting objects:  48% (11133/23192)        
remote: Counting objects:  49% (11365/23192)        
remote: Counting objects:  50% (11596/23192)        
remote: Counting objects:  51% (11828/23192)        
remote: Counting objects:  52% (12060/23192)        
remote: Counting objects:  53% (12292/23192)        
remote: Counting objects:  54% (12524/23192)        
remote: Counting objects:  55% (12756/23192)        
remote: Counting objects:  56% (12988/23192)        
remote: Counting objects:  57% (13220/23192)        
remote: Counting objects:  58% (13452/23192)        
remote: Counting objects:  59% (13684/23192)        
remote: Counting objects:  60% (13916/23192)        
remote: Counting objects:  61% (14148/23192)        
remote: Counting objects:  62% (14380/23192)        
remote: Counting objects:  63% (14611/23192)        
remote: Counting objects:  64% (14843/23192)        
remote: Counting objects:  65% (15075/23192)        
remote: Counting objects:  66% (15307/23192)        
remote: Counting objects:  67% (15539/23192)        
remote: Counting objects:  68% (15771/23192)        
remote: Counting objects:  69% (16003/23192)        
remote: Counting objects:  70% (16235/23192)        
remote: Counting objects:  71% (16467/23192)        
remote: Counting objects:  72% (16699/23192)        
remote: Counting objects:  73% (16931/23192)        
remote: Counting objects:  74% (17163/23192)        
remote: Counting objects:  75% (17394/23192)        
remote: Counting objects:  76% (17626/23192)        
remote: Counting objects:  77% (17858/23192)        
remote: Counting objects:  78% (18090/23192)        
remote: Counting objects:  79% (18322/23192)        
remote: Counting objects:  80% (18554/23192)        
remote: Counting objects:  81% (18786/23192)        
remote: Counting objects:  82% (19018/23192)        
remote: Counting objects:  83% (19250/23192)        
remote: Counting objects:  84% (19482/23192)        
remote: Counting objects:  85% (19714/23192)        
remote: Counting objects:  86% (19946/23192)        
remote: Counting objects:  87% (20178/23192)        
remote: Counting objects:  88% (20409/23192)        
remote: Counting objects:  89% (20641/23192)        
remote: Counting objects:  90% (20873/23192)        
remote: Counting objects:  91% (21105/23192)        
remote: Counting objects:  92% (21337/23192)        
remote: Counting objects:  93% (21569/23192)        
remote: Counting objects:  94% (21801/23192)        
remote: Counting objects:  95% (22033/23192)        
remote: Counting objects:  96% (22265/23192)        
remote: Counting objects:  97% (22497/23192)        
remote: Counting objects:  98% (22729/23192)        
remote: Counting objects:  99% (22961/23192)        
remote: Counting objects: 100% (23192/23192), done.        
remote: Compressing objects:   0% (1/11174)        
remote: Compressing objects:   1% (112/11174)        
remote: Compressing objects:   2% (224/11174)        
remote: Compressing objects:   3% (336/11174)        
remote: Compressing objects:   4% (447/11174)        
remote: Compressing objects:   5% (559/11174)        
remote: Compressing objects:   6% (671/11174)        
remote: Compressing objects:   7% (783/11174)        
remote: Compressing objects:   8% (894/11174)        
remote: Compressing objects:   9% (1006/11174)        
remote: Compressing objects:  10% (1118/11174)        
remote: Compressing objects:  11% (1230/11174)        
remote: Compressing objects:  12% (1341/11174)        
remote: Compressing objects:  13% (1453/11174)        
remote: Compressing objects:  14% (1565/11174)        
remote: Compressing objects:  15% (1677/11174)        
remote: Compressing objects:  16% (1788/11174)        
remote: Compressing objects:  17% (1900/11174)        
remote: Compressing objects:  18% (2012/11174)        
remote: Compressing objects:  19% (2124/11174)        
remote: Compressing objects:  20% (2235/11174)        
remote: Compressing objects:  21% (2347/11174)        
remote: Compressing objects:  22% (2459/11174)        
remote: Compressing objects:  23% (2571/11174)        
remote: Compressing objects:  24% (2682/11174)        
remote: Compressing objects:  25% (2794/11174)        
remote: Compressing objects:  26% (2906/11174)        
remote: Compressing objects:  27% (3017/11174)        
remote: Compressing objects:  28% (3129/11174)        
remote: Compressing objects:  29% (3241/11174)        
remote: Compressing objects:  30% (3353/11174)        
remote: Compressing objects:  31% (3464/11174)        
remote: Compressing objects:  32% (3576/11174)        
remote: Compressing objects:  33% (3688/11174)        
remote: Compressing objects:  34% (3800/11174)        
remote: Compressing objects:  35% (3911/11174)        
remote: Compressing objects:  36% (4023/11174)        
remote: Compressing objects:  37% (4135/11174)        
remote: Compressing objects:  38% (4247/11174)        
remote: Compressing objects:  39% (4358/11174)        
remote: Compressing objects:  40% (4470/11174)        
remote: Compressing objects:  41% (4582/11174)        
remote: Compressing objects:  42% (4694/11174)        
remote: Compressing objects:  43% (4805/11174)        
remote: Compressing objects:  44% (4917/11174)        
remote: Compressing objects:  45% (5029/11174)        
remote: Compressing objects:  46% (5141/11174)        
remote: Compressing objects:  47% (5252/11174)        
remote: Compressing objects:  48% (5364/11174)        
remote: Compressing objects:  49% (5476/11174)        
remote: Compressing objects:  50% (5587/11174)        
remote: Compressing objects:  51% (5699/11174)        
remote: Compressing objects:  52% (5811/11174)        
remote: Compressing objects:  53% (5923/11174)        
remote: Compressing objects:  54% (6034/11174)        
remote: Compressing objects:  55% (6146/11174)        
remote: Compressing objects:  56% (6258/11174)        
remote: Compressing objects:  57% (6370/11174)        
remote: Compressing objects:  58% (6481/11174)        
remote: Compressing objects:  59% (6593/11174)        
remote: Compressing objects:  60% (6705/11174)        
remote: Compressing objects:  61% (6817/11174)        
remote: Compressing objects:  62% (6928/11174)        
remote: Compressing objects:  63% (7040/11174)        
remote: Compressing objects:  64% (7152/11174)        
remote: Compressing objects:  65% (7264/11174)        
remote: Compressing objects:  66% (7375/11174)        
remote: Compressing objects:  67% (7487/11174)        
remote: Compressing objects:  68% (7599/11174)        
remote: Compressing objects:  69% (7711/11174)        
remote: Compressing objects:  70% (7822/11174)        
remote: Compressing objects:  71% (7934/11174)        
remote: Compressing objects:  72% (8046/11174)        
remote: Compressing objects:  73% (8158/11174)        
remote: Compressing objects:  74% (8269/11174)        
remote: Compressing objects:  75% (8381/11174)        
remote: Compressing objects:  76% (8493/11174)        
remote: Compressing objects:  77% (8604/11174)        
remote: Compressing objects:  78% (8716/11174)        
remote: Compressing objects:  79% (8828/11174)        
remote: Compressing objects:  80% (8940/11174)        
remote: Compressing objects:  81% (9051/11174)        
remote: Compressing objects:  82% (9163/11174)        
remote: Compressing objects:  83% (9275/11174)        
remote: Compressing objects:  84% (9387/11174)        
remote: Compressing objects:  85% (9498/11174)        
remote: Compressing objects:  86% (9610/11174)        
remote: Compressing objects:  87% (9722/11174)        
remote: Compressing objects:  88% (9834/11174)        
remote: Compressing objects:  89% (9945/11174)        
remote: Compressing objects:  90% (10057/11174)        
remote: Compressing objects:  91% (10169/11174)        
remote: Compressing objects:  92% (10281/11174)        
remote: Compressing objects:  93% (10392/11174)        
remote: Compressing objects:  94% (10504/11174)        
remote: Compressing objects:  95% (10616/11174)        
remote: Compressing objects:  96% (10728/11174)        
remote: Compressing objects:  97% (10839/11174)        
remote: Compressing objects:  98% (10951/11174)        
remote: Compressing objects:  99% (11063/11174)        
remote: Compressing objects: 100% (11174/11174)        
remote: Compressing objects: 100% (11174/11174), done.        
Receiving objects:   0% (1/23192)
Receiving objects:   1% (232/23192)
Receiving objects:   2% (464/23192)
Receiving objects:   3% (696/23192)
Receiving objects:   4% (928/23192)
Receiving objects:   5% (1160/23192)
Receiving objects:   6% (1392/23192)
Receiving objects:   7% (1624/23192)
Receiving objects:   8% (1856/23192)
Receiving objects:   9% (2088/23192)
Receiving objects:  10% (2320/23192)
Receiving objects:  11% (2552/23192)
Receiving objects:  12% (2784/23192)
Receiving objects:  13% (3015/23192)
Receiving objects:  14% (3247/23192)
Receiving objects:  15% (3479/23192)
Receiving objects:  16% (3711/23192)
Receiving objects:  17% (3943/23192)
Receiving objects:  18% (4175/23192)
Receiving objects:  19% (4407/23192)
Receiving objects:  20% (4639/23192)
Receiving objects:  21% (4871/23192)
Receiving objects:  22% (5103/23192)
Receiving objects:  23% (5335/23192)
Receiving objects:  24% (5567/23192)
Receiving objects:  25% (5798/23192)
Receiving objects:  26% (6030/23192)
Receiving objects:  27% (6262/23192)
Receiving objects:  28% (6494/23192)
Receiving objects:  29% (6726/23192)
Receiving objects:  30% (6958/23192)
Receiving objects:  31% (7190/23192)
Receiving objects:  32% (7422/23192)
Receiving objects:  33% (7654/23192)
Receiving objects:  34% (7886/23192)
Receiving objects:  35% (8118/23192)
Receiving objects:  36% (8350/23192)
Receiving objects:  37% (8582/23192)
Receiving objects:  38% (8813/23192)
Receiving objects:  39% (9045/23192)
Receiving objects:  40% (9277/23192)
Receiving objects:  41% (9509/23192)
Receiving objects:  42% (9741/23192)
Receiving objects:  43% (9973/23192)
Receiving objects:  44% (10205/23192)
Receiving objects:  45% (10437/23192)
Receiving objects:  46% (10669/23192)
Receiving objects:  47% (10901/23192)
Receiving objects:  48% (11133/23192)
Receiving objects:  49% (11365/23192)
Receiving objects:  50% (11596/23192)
Receiving objects:  51% (11828/23192)
Receiving objects:  52% (12060/23192)
Receiving objects:  53% (12292/23192)
Receiving objects:  54% (12524/23192)
Receiving objects:  55% (12756/23192)
Receiving objects:  56% (12988/23192)
Receiving objects:  57% (13220/23192)
Receiving objects:  58% (13452/23192)
Receiving objects:  59% (13684/23192)
Receiving objects:  60% (13916/23192)
Receiving objects:  61% (14148/23192)
Receiving objects:  62% (14380/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  63% (14611/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  64% (14843/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  65% (15075/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  66% (15307/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  67% (15539/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  68% (15771/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  69% (16003/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  70% (16235/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  71% (16467/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  72% (16699/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  73% (16931/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  74% (17163/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  75% (17394/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  76% (17626/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  77% (17858/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  78% (18090/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  79% (18322/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  80% (18554/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  81% (18786/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  82% (19018/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  83% (19250/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  84% (19482/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  85% (19714/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  86% (19946/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  87% (20178/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  88% (20409/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  89% (20641/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  90% (20873/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  91% (21105/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  92% (21337/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  93% (21569/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  94% (21801/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  95% (22033/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  96% (22265/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  97% (22497/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects:  98% (22729/23192), 2.78 MiB | 5.05 MiB/s
remote: Total 23192 (delta 17854), reused 15954 (delta 11796), pack-reused 0        
Receiving objects:  99% (22961/23192), 2.78 MiB | 5.05 MiB/s
Receiving objects: 100% (23192/23192), 4.18 MiB | 7.30 MiB/s, done.
Resolving deltas:   0% (0/17854)
Resolving deltas:   1% (179/17854)
Resolving deltas:   2% (359/17854)
Resolving deltas:   3% (537/17854)
Resolving deltas:   4% (717/17854)
Resolving deltas:   5% (893/17854)
Resolving deltas:   6% (1072/17854)
Resolving deltas:   7% (1251/17854)
Resolving deltas:   8% (1429/17854)
Resolving deltas:   9% (1607/17854)
Resolving deltas:  10% (1786/17854)
Resolving deltas:  11% (1964/17854)
Resolving deltas:  12% (2143/17854)
Resolving deltas:  13% (2322/17854)
Resolving deltas:  14% (2500/17854)
Resolving deltas:  15% (2679/17854)
Resolving deltas:  16% (2857/17854)
Resolving deltas:  17% (3039/17854)
Resolving deltas:  18% (3214/17854)
Resolving deltas:  19% (3393/17854)
Resolving deltas:  20% (3571/17854)
Resolving deltas:  21% (3750/17854)
Resolving deltas:  22% (3928/17854)
Resolving deltas:  23% (4107/17854)
Resolving deltas:  24% (4285/17854)
Resolving deltas:  25% (4464/17854)
Resolving deltas:  26% (4643/17854)
Resolving deltas:  27% (4821/17854)
Resolving deltas:  28% (5000/17854)
Resolving deltas:  29% (5178/17854)
Resolving deltas:  30% (5357/17854)
Resolving deltas:  31% (5535/17854)
Resolving deltas:  32% (5714/17854)
Resolving deltas:  33% (5892/17854)
Resolving deltas:  34% (6071/17854)
Resolving deltas:  35% (6249/17854)
Resolving deltas:  36% (6428/17854)
Resolving deltas:  37% (6607/17854)
Resolving deltas:  38% (6785/17854)
Resolving deltas:  39% (6964/17854)
Resolving deltas:  40% (7142/17854)
Resolving deltas:  41% (7321/17854)
Resolving deltas:  42% (7499/17854)
Resolving deltas:  43% (7678/17854)
Resolving deltas:  44% (7856/17854)
Resolving deltas:  45% (8035/17854)
Resolving deltas:  46% (8213/17854)
Resolving deltas:  47% (8392/17854)
Resolving deltas:  48% (8570/17854)
Resolving deltas:  49% (8749/17854)
Resolving deltas:  50% (8927/17854)
Resolving deltas:  51% (9106/17854)
Resolving deltas:  52% (9285/17854)
Resolving deltas:  53% (9463/17854)
Resolving deltas:  54% (9643/17854)
Resolving deltas:  55% (9820/17854)
Resolving deltas:  56% (9999/17854)
Resolving deltas:  57% (10177/17854)
Resolving deltas:  58% (10356/17854)
Resolving deltas:  59% (10535/17854)
Resolving deltas:  60% (10714/17854)
Resolving deltas:  61% (10893/17854)
Resolving deltas:  62% (11073/17854)
Resolving deltas:  63% (11249/17854)
Resolving deltas:  64% (11428/17854)
Resolving deltas:  65% (11606/17854)
Resolving deltas:  66% (11785/17854)
Resolving deltas:  67% (11963/17854)
Resolving deltas:  68% (12143/17854)
Resolving deltas:  69% (12320/17854)
Resolving deltas:  70% (12498/17854)
Resolving deltas:  71% (12682/17854)
Resolving deltas:  72% (12855/17854)
Resolving deltas:  73% (13034/17854)
Resolving deltas:  74% (13213/17854)
Resolving deltas:  75% (13391/17854)
Resolving deltas:  76% (13570/17854)
Resolving deltas:  77% (13748/17854)
Resolving deltas:  78% (13927/17854)
Resolving deltas:  79% (14105/17854)
Resolving deltas:  80% (14284/17854)
Resolving deltas:  81% (14462/17854)
Resolving deltas:  82% (14641/17854)
Resolving deltas:  83% (14819/17854)
Resolving deltas:  84% (14998/17854)
Resolving deltas:  85% (15177/17854)
Resolving deltas:  86% (15356/17854)
Resolving deltas:  87% (15533/17854)
Resolving deltas:  88% (15713/17854)
Resolving deltas:  89% (15892/17854)
Resolving deltas:  90% (16069/17854)
Resolving deltas:  91% (16248/17854)
Resolving deltas:  92% (16426/17854)
Resolving deltas:  93% (16605/17854)
Resolving deltas:  94% (16783/17854)
Resolving deltas:  95% (16963/17854)
Resolving deltas:  96% (17141/17854)
Resolving deltas:  97% (17320/17854)
Resolving deltas:  98% (17497/17854)
Resolving deltas:  99% (17676/17854)
Resolving deltas: 100% (17854/17854)
Resolving deltas: 100% (17854/17854), done.
NOTE: Creating tarball of git repository
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.15.tar.bz2...
INFO: Rebasing devtool onto c972ec84cf2ae55488d84363d7c3d1e368cd8c90
WARNING: Command 'git rebase c972ec84cf2ae55488d84363d7c3d1e368cd8c90' failed:
Auto-merging include/instrumentation/events/btrfs.h
CONFLICT (content): Merge conflict in include/instrumentation/events/btrfs.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/lttng-modules
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/lttng-modules/lttng-modules_2.13.15.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8379865667860867697==--

