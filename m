Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FB5C35280
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10639.1647349734978107054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=yANO0dSN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101017f8db21e9e-0c97bfa4-8284-4576-8607-79c5330cb093-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h5Fk/UCRqpB8LNll6mWjgV0Abch/O4oLdGV9H0ukDjU=;
	b=yANO0dSNbgqTyDbxE06H0rOxnFAJd9RiAhOrgp2345a7yrws7YryBLSSVrOsywMz
	Qy4Udruv35UWEp01I4Xer1m8Lee8yB/IZuZukLz3E/kV1vXthUA1EZYXykW1GfqizAL
	P0UY8tjpsfIt9013O2K+vJMQQU2oyASyUPvJus/Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h5Fk/UCRqpB8LNll6mWjgV0Abch/O4oLdGV9H0ukDjU=;
	b=GTLPDAExqU4R5mEe35ghYXS5gy6FfZBHJyt9m/5ERP5FVgyhSlvvgKrUiBc8W17y
	pSaYjHjxb7NlEjFdRmrymPyxzPmEbA0rIyfMn4AvPpghJ5tEYEO0DdAg7xfWefghUF6
	EiaxM3seeZueZILClitH9rxRWY7Elcx+zv6T3iRc=
Content-Type: multipart/mixed; boundary="===============3207725984943178453=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.2 FAILED
Message-ID: 
 <0101017f8db21e9e-0c97bfa4-8284-4576-8607-79c5330cb093-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:55 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163266

--===============3207725984943178453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.13.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1521 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-fa3eb2977d54f28453d33f87fd14c66669c953aa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fa3eb2977d54f28453d33f87fd14c66669c953aa"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1521 entries from dependency cache.
Parsing recipes...done.
Parsing of 844 .bb files complete (842 cached, 2 parsed). 1522 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-fa3eb2977d54f28453d33f87fd14c66669c953aa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fa3eb2977d54f28453d33f87fd14c66669c953aa"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

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
--2022-03-15 10:45:39--  https://downloads.yoctoproject.org/mirror/sources/git2_git.lttng.org.lttng-modules.tar.gz
Resolving downloads.yoctoproject.org (downloads.yoctoproject.org)... 172.29.10.208
Connecting to downloads.yoctoproject.org (downloads.yoctoproject.org)|172.29.10.208|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2022-03-15 10:45:39 ERROR 404: Not Found.

Cloning into bare repository '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 19993, done.        
remote: Counting objects:   0% (1/19993)        
remote: Counting objects:   1% (200/19993)        
remote: Counting objects:   2% (400/19993)        
remote: Counting objects:   3% (600/19993)        
remote: Counting objects:   4% (800/19993)        
remote: Counting objects:   5% (1000/19993)        
remote: Counting objects:   6% (1200/19993)        
remote: Counting objects:   7% (1400/19993)        
remote: Counting objects:   8% (1600/19993)        
remote: Counting objects:   9% (1800/19993)        
remote: Counting objects:  10% (2000/19993)        
remote: Counting objects:  11% (2200/19993)        
remote: Counting objects:  12% (2400/19993)        
remote: Counting objects:  13% (2600/19993)        
remote: Counting objects:  14% (2800/19993)        
remote: Counting objects:  15% (2999/19993)        
remote: Counting objects:  16% (3199/19993)        
remote: Counting objects:  17% (3399/19993)        
remote: Counting objects:  18% (3599/19993)        
remote: Counting objects:  19% (3799/19993)        
remote: Counting objects:  20% (3999/19993)        
remote: Counting objects:  21% (4199/19993)        
remote: Counting objects:  22% (4399/19993)        
remote: Counting objects:  23% (4599/19993)        
remote: Counting objects:  24% (4799/19993)        
remote: Counting objects:  25% (4999/19993)        
remote: Counting objects:  26% (5199/19993)        
remote: Counting objects:  27% (5399/19993)        
remote: Counting objects:  28% (5599/19993)        
remote: Counting objects:  29% (5798/19993)        
remote: Counting objects:  30% (5998/19993)        
remote: Counting objects:  31% (6198/19993)        
remote: Counting objects:  32% (6398/19993)        
remote: Counting objects:  33% (6598/19993)        
remote: Counting objects:  34% (6798/19993)        
remote: Counting objects:  35% (6998/19993)        
remote: Counting objects:  36% (7198/19993)        
remote: Counting objects:  37% (7398/19993)        
remote: Counting objects:  38% (7598/19993)        
remote: Counting objects:  39% (7798/19993)        
remote: Counting objects:  40% (7998/19993)        
remote: Counting objects:  41% (8198/19993)        
remote: Counting objects:  42% (8398/19993)        
remote: Counting objects:  43% (8597/19993)        
remote: Counting objects:  44% (8797/19993)        
remote: Counting objects:  45% (8997/19993)        
remote: Counting objects:  46% (9197/19993)        
remote: Counting objects:  47% (9397/19993)        
remote: Counting objects:  48% (9597/19993)        
remote: Counting objects:  49% (9797/19993)        
remote: Counting objects:  50% (9997/19993)        
remote: Counting objects:  51% (10197/19993)        
remote: Counting objects:  52% (10397/19993)        
remote: Counting objects:  53% (10597/19993)        
remote: Counting objects:  54% (10797/19993)        
remote: Counting objects:  55% (10997/19993)        
remote: Counting objects:  56% (11197/19993)        
remote: Counting objects:  57% (11397/19993)        
remote: Counting objects:  58% (11596/19993)        
remote: Counting objects:  59% (11796/19993)        
remote: Counting objects:  60% (11996/19993)        
remote: Counting objects:  61% (12196/19993)        
remote: Counting objects:  62% (12396/19993)        
remote: Counting objects:  63% (12596/19993)        
remote: Counting objects:  64% (12796/19993)        
remote: Counting objects:  65% (12996/19993)        
remote: Counting objects:  66% (13196/19993)        
remote: Counting objects:  67% (13396/19993)        
remote: Counting objects:  68% (13596/19993)        
remote: Counting objects:  69% (13796/19993)        
remote: Counting objects:  70% (13996/19993)        
remote: Counting objects:  71% (14196/19993)        
remote: Counting objects:  72% (14395/19993)        
remote: Counting objects:  73% (14595/19993)        
remote: Counting objects:  74% (14795/19993)        
remote: Counting objects:  75% (14995/19993)        
remote: Counting objects:  76% (15195/19993)        
remote: Counting objects:  77% (15395/19993)        
remote: Counting objects:  78% (15595/19993)        
remote: Counting objects:  79% (15795/19993)        
remote: Counting objects:  80% (15995/19993)        
remote: Counting objects:  81% (16195/19993)        
remote: Counting objects:  82% (16395/19993)        
remote: Counting objects:  83% (16595/19993)        
remote: Counting objects:  84% (16795/19993)        
remote: Counting objects:  85% (16995/19993)        
remote: Counting objects:  86% (17194/19993)        
remote: Counting objects:  87% (17394/19993)        
remote: Counting objects:  88% (17594/19993)        
remote: Counting objects:  89% (17794/19993)        
remote: Counting objects:  90% (17994/19993)        
remote: Counting objects:  91% (18194/19993)        
remote: Counting objects:  92% (18394/19993)        
remote: Counting objects:  93% (18594/19993)        
remote: Counting objects:  94% (18794/19993)        
remote: Counting objects:  95% (18994/19993)        
remote: Counting objects:  96% (19194/19993)        
remote: Counting objects:  97% (19394/19993)        
remote: Counting objects:  98% (19594/19993)        
remote: Counting objects:  99% (19794/19993)        
remote: Counting objects: 100% (19993/19993)        
remote: Counting objects: 100% (19993/19993), done.        
remote: Compressing objects:   0% (1/8737)        
remote: Compressing objects:   1% (88/8737)        
remote: Compressing objects:   2% (175/8737)        
remote: Compressing objects:   3% (263/8737)        
remote: Compressing objects:   4% (350/8737)        
remote: Compressing objects:   5% (437/8737)        
remote: Compressing objects:   6% (525/8737)        
remote: Compressing objects:   7% (612/8737)        
remote: Compressing objects:   8% (699/8737)        
remote: Compressing objects:   9% (787/8737)        
remote: Compressing objects:  10% (874/8737)        
remote: Compressing objects:  11% (962/8737)        
remote: Compressing objects:  12% (1049/8737)        
remote: Compressing objects:  13% (1136/8737)        
remote: Compressing objects:  14% (1224/8737)        
remote: Compressing objects:  15% (1311/8737)        
remote: Compressing objects:  16% (1398/8737)        
remote: Compressing objects:  17% (1486/8737)        
remote: Compressing objects:  18% (1573/8737)        
remote: Compressing objects:  19% (1661/8737)        
remote: Compressing objects:  20% (1748/8737)        
remote: Compressing objects:  21% (1835/8737)        
remote: Compressing objects:  22% (1923/8737)        
remote: Compressing objects:  23% (2010/8737)        
remote: Compressing objects:  24% (2097/8737)        
remote: Compressing objects:  25% (2185/8737)        
remote: Compressing objects:  26% (2272/8737)        
remote: Compressing objects:  27% (2359/8737)        
remote: Compressing objects:  28% (2447/8737)        
remote: Compressing objects:  29% (2534/8737)        
remote: Compressing objects:  30% (2622/8737)        
remote: Compressing objects:  31% (2709/8737)        
remote: Compressing objects:  32% (2796/8737)        
remote: Compressing objects:  33% (2884/8737)        
remote: Compressing objects:  34% (2971/8737)        
remote: Compressing objects:  35% (3058/8737)        
remote: Compressing objects:  36% (3146/8737)        
remote: Compressing objects:  37% (3233/8737)        
remote: Compressing objects:  38% (3321/8737)        
remote: Compressing objects:  39% (3408/8737)        
remote: Compressing objects:  40% (3495/8737)        
remote: Compressing objects:  41% (3583/8737)        
remote: Compressing objects:  42% (3670/8737)        
remote: Compressing objects:  43% (3757/8737)        
remote: Compressing objects:  44% (3845/8737)        
remote: Compressing objects:  45% (3932/8737)        
remote: Compressing objects:  46% (4020/8737)        
remote: Compressing objects:  47% (4107/8737)        
remote: Compressing objects:  48% (4194/8737)        
remote: Compressing objects:  49% (4282/8737)        
remote: Compressing objects:  50% (4369/8737)        
remote: Compressing objects:  51% (4456/8737)        
remote: Compressing objects:  52% (4544/8737)        
remote: Compressing objects:  53% (4631/8737)        
remote: Compressing objects:  54% (4718/8737)        
remote: Compressing objects:  55% (4806/8737)        
remote: Compressing objects:  56% (4893/8737)        
remote: Compressing objects:  57% (4981/8737)        
remote: Compressing objects:  58% (5068/8737)        
remote: Compressing objects:  59% (5155/8737)        
remote: Compressing objects:  60% (5243/8737)        
remote: Compressing objects:  61% (5330/8737)        
remote: Compressing objects:  62% (5417/8737)        
remote: Compressing objects:  63% (5505/8737)        
remote: Compressing objects:  64% (5592/8737)        
remote: Compressing objects:  65% (5680/8737)        
remote: Compressing objects:  66% (5767/8737)        
remote: Compressing objects:  67% (5854/8737)        
remote: Compressing objects:  68% (5942/8737)        
remote: Compressing objects:  69% (6029/8737)        
remote: Compressing objects:  70% (6116/8737)        
remote: Compressing objects:  71% (6204/8737)        
remote: Compressing objects:  72% (6291/8737)        
remote: Compressing objects:  73% (6379/8737)        
remote: Compressing objects:  74% (6466/8737)        
remote: Compressing objects:  75% (6553/8737)        
remote: Compressing objects:  76% (6641/8737)        
remote: Compressing objects:  77% (6728/8737)        
remote: Compressing objects:  78% (6815/8737)        
remote: Compressing objects:  79% (6903/8737)        
remote: Compressing objects:  80% (6990/8737)        
remote: Compressing objects:  81% (7077/8737)        
remote: Compressing objects:  82% (7165/8737)        
remote: Compressing objects:  83% (7252/8737)        
remote: Compressing objects:  84% (7340/8737)        
remote: Compressing objects:  85% (7427/8737)        
remote: Compressing objects:  86% (7514/8737)        
remote: Compressing objects:  87% (7602/8737)        
remote: Compressing objects:  88% (7689/8737)        
remote: Compressing objects:  89% (7776/8737)        
remote: Compressing objects: 100% (8737/8737), done.        
Receiving objects:   0% (1/19993)
Receiving objects:   1% (200/19993)
Receiving objects:   2% (400/19993)
Receiving objects:   3% (600/19993)
Receiving objects:   4% (800/19993)
Receiving objects:   5% (1000/19993)
Receiving objects:   6% (1200/19993)
Receiving objects:   7% (1400/19993)
Receiving objects:   8% (1600/19993)
Receiving objects:   9% (1800/19993)
Receiving objects:  10% (2000/19993)
Receiving objects:  11% (2200/19993)
Receiving objects:  12% (2400/19993)
Receiving objects:  13% (2600/19993)
Receiving objects:  14% (2800/19993)
Receiving objects:  15% (2999/19993)
Receiving objects:  16% (3199/19993)
Receiving objects:  17% (3399/19993)
Receiving objects:  18% (3599/19993)
Receiving objects:  19% (3799/19993)
Receiving objects:  20% (3999/19993)
Receiving objects:  21% (4199/19993)
Receiving objects:  22% (4399/19993)
Receiving objects:  23% (4599/19993)
Receiving objects:  24% (4799/19993)
Receiving objects:  25% (4999/19993)
Receiving objects:  26% (5199/19993)
Receiving objects:  27% (5399/19993)
Receiving objects:  28% (5599/19993)
Receiving objects:  29% (5798/19993)
Receiving objects:  30% (5998/19993)
Receiving objects:  31% (6198/19993)
Receiving objects:  32% (6398/19993)
Receiving objects:  33% (6598/19993)
Receiving objects:  34% (6798/19993)
Receiving objects:  35% (6998/19993)
Receiving objects:  36% (7198/19993)
Receiving objects:  37% (7398/19993)
Receiving objects:  38% (7598/19993)
Receiving objects:  39% (7798/19993)
Receiving objects:  40% (7998/19993)
Receiving objects:  41% (8198/19993)
Receiving objects:  42% (8398/19993)
Receiving objects:  43% (8597/19993)
Receiving objects:  44% (8797/19993)
Receiving objects:  45% (8997/19993)
Receiving objects:  46% (9197/19993)
Receiving objects:  47% (9397/19993)
Receiving objects:  48% (9597/19993)
Receiving objects:  49% (9797/19993)
Receiving objects:  50% (9997/19993)
Receiving objects:  51% (10197/19993)
Receiving objects:  52% (10397/19993)
Receiving objects:  53% (10597/19993)
Receiving objects:  54% (10797/19993)
Receiving objects:  55% (10997/19993)
Receiving objects:  56% (11197/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  57% (11397/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  58% (11596/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  59% (11796/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  60% (11996/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  61% (12196/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  62% (12396/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  63% (12596/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  64% (12796/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  65% (12996/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  66% (13196/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  67% (13396/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  68% (13596/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  69% (13796/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  70% (13996/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  71% (14196/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  72% (14395/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  73% (14595/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  74% (14795/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  75% (14995/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  76% (15195/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  77% (15395/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  78% (15595/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  79% (15795/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  80% (15995/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  81% (16195/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  82% (16395/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  83% (16595/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  84% (16795/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  85% (16995/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  86% (17194/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  87% (17394/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  88% (17594/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  89% (17794/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  90% (17994/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  91% (18194/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  92% (18394/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  93% (18594/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  94% (18794/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  95% (18994/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  96% (19194/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  97% (19394/19993), 2.32 MiB | 4.34 MiB/s
remote: Total 19993 (delta 15265), reused 15067 (delta 11062)        
Receiving objects:  98% (19594/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects:  99% (19794/19993), 2.32 MiB | 4.34 MiB/s
Receiving objects: 100% (19993/19993), 3.60 MiB | 6.16 MiB/s, done.
Resolving deltas:   0% (0/15265)
Resolving deltas:   1% (153/15265)
Resolving deltas:   2% (306/15265)
Resolving deltas:   3% (460/15265)
Resolving deltas:   4% (611/15265)
Resolving deltas:   5% (764/15265)
Resolving deltas:   6% (916/15265)
Resolving deltas:   7% (1070/15265)
Resolving deltas:   8% (1222/15265)
Resolving deltas:   9% (1374/15265)
Resolving deltas:  10% (1600/15265)
Resolving deltas:  11% (1714/15265)
Resolving deltas:  12% (1855/15265)
Resolving deltas:  13% (2005/15265)
Resolving deltas:  14% (2220/15265)
Resolving deltas:  16% (2537/15265)
Resolving deltas:  17% (2640/15265)
Resolving deltas:  18% (2758/15265)
Resolving deltas:  19% (2904/15265)
Resolving deltas:  20% (3190/15265)
Resolving deltas:  21% (3207/15265)
Resolving deltas:  22% (3448/15265)
Resolving deltas:  23% (3598/15265)
Resolving deltas:  24% (3671/15265)
Resolving deltas:  25% (3957/15265)
Resolving deltas:  26% (4037/15265)
Resolving deltas:  27% (4196/15265)
Resolving deltas:  28% (4285/15265)
Resolving deltas:  29% (4484/15265)
Resolving deltas:  30% (4637/15265)
Resolving deltas:  31% (4818/15265)
Resolving deltas:  32% (4895/15265)
Resolving deltas:  33% (5124/15265)
Resolving deltas:  34% (5287/15265)
Resolving deltas:  36% (5499/15265)
Resolving deltas:  37% (5706/15265)
Resolving deltas:  38% (5846/15265)
Resolving deltas:  39% (6010/15265)
Resolving deltas:  40% (6158/15265)
Resolving deltas:  41% (6344/15265)
Resolving deltas:  42% (6463/15265)
Resolving deltas:  43% (6615/15265)
Resolving deltas:  44% (6865/15265)
Resolving deltas:  45% (6881/15265)
Resolving deltas:  46% (7025/15265)
Resolving deltas:  47% (7264/15265)
Resolving deltas:  48% (7378/15265)
Resolving deltas:  49% (7514/15265)
Resolving deltas:  50% (7664/15265)
Resolving deltas:  51% (7799/15265)
Resolving deltas:  52% (7956/15265)
Resolving deltas:  53% (8132/15265)
Resolving deltas:  54% (8340/15265)
Resolving deltas:  55% (8448/15265)
Resolving deltas:  56% (8552/15265)
Resolving deltas:  57% (8708/15265)
Resolving deltas:  58% (8907/15265)
Resolving deltas:  59% (9008/15265)
Resolving deltas:  60% (9171/15265)
Resolving deltas:  61% (9327/15265)
Resolving deltas:  62% (9466/15265)
Resolving deltas:  63% (9634/15265)
Resolving deltas:  64% (9798/15265)
Resolving deltas:  65% (9944/15265)
Resolving deltas:  66% (10108/15265)
Resolving deltas:  67% (10238/15265)
Resolving deltas:  68% (10429/15265)
Resolving deltas:  69% (10570/15265)
Resolving deltas:  70% (10723/15265)
Resolving deltas:  71% (10843/15265)
Resolving deltas:  72% (11038/15265)
Resolving deltas:  73% (11154/15265)
Resolving deltas:  74% (11346/15265)
Resolving deltas:  75% (11550/15265)
Resolving deltas:  76% (11611/15265)
Resolving deltas:  77% (11757/15265)
Resolving deltas:  78% (11916/15265)
Resolving deltas:  79% (12065/15265)
Resolving deltas:  80% (12344/15265)
Resolving deltas:  81% (12368/15265)
Resolving deltas:  82% (12642/15265)
Resolving deltas:  83% (12707/15265)
Resolving deltas:  84% (12896/15265)
Resolving deltas:  85% (13028/15265)
Resolving deltas:  86% (13134/15265)
Resolving deltas:  88% (13456/15265)
Resolving deltas:  89% (13588/15265)
Resolving deltas:  90% (13766/15265)
Resolving deltas:  91% (13894/15265)
Resolving deltas:  92% (14080/15265)
Resolving deltas:  93% (14197/15265)
Resolving deltas:  94% (14350/15265)
Resolving deltas:  95% (14511/15265)
Resolving deltas:  96% (14664/15265)
Resolving deltas:  97% (14808/15265)
Resolving deltas:  98% (14981/15265)
Resolving deltas:  99% (15117/15265)
Resolving deltas: 100% (15265/15265)
Resolving deltas: 100% (15265/15265), done.
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.2.tar.bz2...
INFO: Rebasing devtool onto c80ff3fdc1fb16bd3278e69209cfcd6b7b41c71a
WARNING: Command 'git rebase c80ff3fdc1fb16bd3278e69209cfcd6b7b41c71a' failed:
Auto-merging include/instrumentation/events/skb.h
CONFLICT (content): Merge conflict in include/instrumentation/events/skb.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lttng-modules
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lttng-modules/lttng-modules_2.13.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3207725984943178453==--

