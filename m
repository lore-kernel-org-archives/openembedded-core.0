Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F79D1D871
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:15:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11862.1728994550369274025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ix1FgHwe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vIyKD1ss;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010192901b1f82-9565f57c-f4be-4b19-b8bc-8e38517593d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OaSAIBDZGRdYuGWmzJhO/wy+yWdAwRdLMQv7gy6aV6U=;
	b=ix1FgHweFGeR1fkGhQgWztWxYEfx+QnNCfz781v9+qXrpppu4XqDSIvWFl4DHhtD
	SkoOfsFnBkuyUYHGvkCLG/CJGPPwFgzPUlkglAclFFpAZ0l8rAIwvOH5nI/md6W5Xwa
	9pTaCPgdSoHFwyp0MoMfI5OYWj7SE7T8XacRzM5A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OaSAIBDZGRdYuGWmzJhO/wy+yWdAwRdLMQv7gy6aV6U=;
	b=vIyKD1ssOV93GSp6OG3qUDy5TCz/AAJGmUi0lqpJJb2j2GQeNgfMIe9yqdvXuyJO
	8RLMqlkMDCMs6o5fLgMdbZyLBLL23BiQeJm0Y/tbKgbHvi2r46qbtFIlBg0VevRB48M
	+ttskpC4/qrKyTnu2ycNGZbOsNhyqvxKAywIdr1E=
Content-Type: multipart/mixed; boundary="===============5861629593501006192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.15 FAILED
Message-ID: <01010192901b1f82-9565f57c-f4be-4b19-b8bc-8e38517593d8-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205822

--===============5861629593501006192==
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
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:81a322fee24fea0288b1dd5e94deb87c253271f6"

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
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:81a322fee24fea0288b1dd5e94deb87c253271f6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-7s6dqxv8: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-282e02jn/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-282e02jn/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
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
Receiving objects:  57% (13220/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  58% (13452/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  59% (13684/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  60% (13916/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  61% (14148/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  62% (14380/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  63% (14611/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  64% (14843/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  65% (15075/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  66% (15307/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  67% (15539/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  68% (15771/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  69% (16003/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  70% (16235/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  71% (16467/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  72% (16699/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  73% (16931/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  74% (17163/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  75% (17394/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  76% (17626/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  77% (17858/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  78% (18090/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  79% (18322/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  80% (18554/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  81% (18786/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  82% (19018/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  83% (19250/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  84% (19482/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  85% (19714/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  86% (19946/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  87% (20178/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  88% (20409/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  89% (20641/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  90% (20873/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  91% (21105/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  92% (21337/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  93% (21569/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  94% (21801/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  95% (22033/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  96% (22265/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  97% (22497/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects:  98% (22729/23192), 2.51 MiB | 4.32 MiB/s
remote: Total 23192 (delta 17858), reused 15950 (delta 11796), pack-reused 0        
Receiving objects:  99% (22961/23192), 2.51 MiB | 4.32 MiB/s
Receiving objects: 100% (23192/23192), 4.19 MiB | 6.89 MiB/s, done.
Resolving deltas:   0% (0/17858)
Resolving deltas:   1% (179/17858)
Resolving deltas:   2% (358/17858)
Resolving deltas:   3% (536/17858)
Resolving deltas:   4% (716/17858)
Resolving deltas:   5% (893/17858)
Resolving deltas:   6% (1072/17858)
Resolving deltas:   7% (1252/17858)
Resolving deltas:   8% (1429/17858)
Resolving deltas:   9% (1608/17858)
Resolving deltas:  10% (1786/17858)
Resolving deltas:  11% (1965/17858)
Resolving deltas:  12% (2143/17858)
Resolving deltas:  13% (2322/17858)
Resolving deltas:  14% (2501/17858)
Resolving deltas:  15% (2679/17858)
Resolving deltas:  16% (2858/17858)
Resolving deltas:  17% (3036/17858)
Resolving deltas:  18% (3215/17858)
Resolving deltas:  19% (3394/17858)
Resolving deltas:  20% (3572/17858)
Resolving deltas:  21% (3751/17858)
Resolving deltas:  22% (3929/17858)
Resolving deltas:  23% (4108/17858)
Resolving deltas:  24% (4286/17858)
Resolving deltas:  25% (4465/17858)
Resolving deltas:  26% (4644/17858)
Resolving deltas:  27% (4822/17858)
Resolving deltas:  28% (5001/17858)
Resolving deltas:  29% (5179/17858)
Resolving deltas:  30% (5358/17858)
Resolving deltas:  31% (5536/17858)
Resolving deltas:  32% (5715/17858)
Resolving deltas:  33% (5895/17858)
Resolving deltas:  34% (6072/17858)
Resolving deltas:  35% (6251/17858)
Resolving deltas:  36% (6429/17858)
Resolving deltas:  37% (6608/17858)
Resolving deltas:  38% (6787/17858)
Resolving deltas:  39% (6965/17858)
Resolving deltas:  40% (7144/17858)
Resolving deltas:  41% (7322/17858)
Resolving deltas:  42% (7501/17858)
Resolving deltas:  43% (7679/17858)
Resolving deltas:  44% (7858/17858)
Resolving deltas:  45% (8037/17858)
Resolving deltas:  46% (8215/17858)
Resolving deltas:  47% (8394/17858)
Resolving deltas:  48% (8573/17858)
Resolving deltas:  49% (8751/17858)
Resolving deltas:  50% (8929/17858)
Resolving deltas:  51% (9108/17858)
Resolving deltas:  52% (9287/17858)
Resolving deltas:  53% (9466/17858)
Resolving deltas:  54% (9647/17858)
Resolving deltas:  55% (9822/17858)
Resolving deltas:  56% (10003/17858)
Resolving deltas:  57% (10180/17858)
Resolving deltas:  58% (10359/17858)
Resolving deltas:  59% (10537/17858)
Resolving deltas:  60% (10715/17858)
Resolving deltas:  61% (10896/17858)
Resolving deltas:  62% (11073/17858)
Resolving deltas:  63% (11253/17858)
Resolving deltas:  64% (11430/17858)
Resolving deltas:  65% (11608/17858)
Resolving deltas:  66% (11788/17858)
Resolving deltas:  67% (11966/17858)
Resolving deltas:  68% (12144/17858)
Resolving deltas:  69% (12325/17858)
Resolving deltas:  70% (12502/17858)
Resolving deltas:  71% (12682/17858)
Resolving deltas:  72% (12858/17858)
Resolving deltas:  73% (13038/17858)
Resolving deltas:  74% (13216/17858)
Resolving deltas:  75% (13395/17858)
Resolving deltas:  76% (13573/17858)
Resolving deltas:  77% (13753/17858)
Resolving deltas:  78% (13930/17858)
Resolving deltas:  79% (14108/17858)
Resolving deltas:  80% (14289/17858)
Resolving deltas:  81% (14465/17858)
Resolving deltas:  82% (14645/17858)
Resolving deltas:  83% (14824/17858)
Resolving deltas:  84% (15002/17858)
Resolving deltas:  85% (15182/17858)
Resolving deltas:  86% (15358/17858)
Resolving deltas:  87% (15537/17858)
Resolving deltas:  88% (15716/17858)
Resolving deltas:  89% (15898/17858)
Resolving deltas:  90% (16074/17858)
Resolving deltas:  91% (16254/17858)
Resolving deltas:  92% (16430/17858)
Resolving deltas:  93% (16608/17858)
Resolving deltas:  94% (16787/17858)
Resolving deltas:  95% (16966/17858)
Resolving deltas:  96% (17144/17858)
Resolving deltas:  97% (17323/17858)
Resolving deltas:  98% (17502/17858)
Resolving deltas:  99% (17680/17858)
Resolving deltas: 100% (17858/17858)
Resolving deltas: 100% (17858/17858), done.
NOTE: Creating tarball of git repository
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.15.tar.bz2...
INFO: Rebasing devtool onto 4ef77a0eec7794317f158fc9ef4a0eec4a8eda59
WARNING: Command 'git rebase 4ef77a0eec7794317f158fc9ef4a0eec4a8eda59' failed:
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
--===============5861629593501006192==--

