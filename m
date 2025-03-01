Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB41DC282E5
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:27 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.7164.1740828318892089703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=N6PT88z6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=umoLUlnI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101955174177b-d23b9c9b-328e-4d4e-a82a-41c2da304d61-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G3bJATh06y0/XUT5O6FQiDS5uWA6TOFHGu2TTE16zMg=;
	b=N6PT88z6pBQDpd7SNVlnlWshI4Xdv5Ysvnp9Vp1pnB1cAiIr/g60ih6HAx1CzK0R
	hExOdTEI7D1fjGd4TD30kiuBfO0hSEDS5o0cg/jIcmNZCsziPZuiQ92XYgy9K6x+SJe
	yh63HcMvnI7X6HYDGDGTLvIDdh7rVe84Ceuf0XBw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G3bJATh06y0/XUT5O6FQiDS5uWA6TOFHGu2TTE16zMg=;
	b=umoLUlnIn9s7CcDLd6/0+0Yu6tjXWEtlnP2mI19oRVODYtvNRk/lawDk55gHKGh0
	UqU5vpzJ2sFtRpHKFDCok09A8RaU+qQjOIUksZRkz3yJmx3gQPlWaAOt7DHeUxbuomY
	eALVUS/PXGimcJqhTEiFe8gbsxLr7TznZtzLPQnI=
Content-Type: multipart/mixed; boundary="===============7638750541751405437=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.17 FAILED
Message-ID: <010101955174177b-d23b9c9b-328e-4d4e-a82a-41c2da304d61-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212103

--===============7638750541751405437==
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
Loaded 1881 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:798dccb5f4b9cd29a0f32caa07d3c155ab9b5166"

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
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1882 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:798dccb5f4b9cd29a0f32caa07d3c155ab9b5166"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ptl9eb7k: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-znej4uzr/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-znej4uzr/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Cloning into bare repository '/srv/pokybuild/yocto-worker/auh/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 23472, done.        
remote: Counting objects:   0% (1/23472)        
remote: Counting objects:   1% (235/23472)        
remote: Counting objects:   2% (470/23472)        
remote: Counting objects:   3% (705/23472)        
remote: Counting objects:   4% (939/23472)        
remote: Counting objects:   5% (1174/23472)        
remote: Counting objects:   6% (1409/23472)        
remote: Counting objects:   7% (1644/23472)        
remote: Counting objects:   8% (1878/23472)        
remote: Counting objects:   9% (2113/23472)        
remote: Counting objects:  10% (2348/23472)        
remote: Counting objects:  11% (2582/23472)        
remote: Counting objects:  12% (2817/23472)        
remote: Counting objects:  13% (3052/23472)        
remote: Counting objects:  14% (3287/23472)        
remote: Counting objects:  15% (3521/23472)        
remote: Counting objects:  16% (3756/23472)        
remote: Counting objects:  17% (3991/23472)        
remote: Counting objects:  18% (4225/23472)        
remote: Counting objects:  19% (4460/23472)        
remote: Counting objects:  20% (4695/23472)        
remote: Counting objects:  21% (4930/23472)        
remote: Counting objects:  22% (5164/23472)        
remote: Counting objects:  23% (5399/23472)        
remote: Counting objects:  24% (5634/23472)        
remote: Counting objects:  25% (5868/23472)        
remote: Counting objects:  26% (6103/23472)        
remote: Counting objects:  27% (6338/23472)        
remote: Counting objects:  28% (6573/23472)        
remote: Counting objects:  29% (6807/23472)        
remote: Counting objects:  30% (7042/23472)        
remote: Counting objects:  31% (7277/23472)        
remote: Counting objects:  32% (7512/23472)        
remote: Counting objects:  33% (7746/23472)        
remote: Counting objects:  34% (7981/23472)        
remote: Counting objects:  35% (8216/23472)        
remote: Counting objects:  36% (8450/23472)        
remote: Counting objects:  37% (8685/23472)        
remote: Counting objects:  38% (8920/23472)        
remote: Counting objects:  39% (9155/23472)        
remote: Counting objects:  40% (9389/23472)        
remote: Counting objects:  41% (9624/23472)        
remote: Counting objects:  42% (9859/23472)        
remote: Counting objects:  43% (10093/23472)        
remote: Counting objects:  44% (10328/23472)        
remote: Counting objects:  45% (10563/23472)        
remote: Counting objects:  46% (10798/23472)        
remote: Counting objects:  47% (11032/23472)        
remote: Counting objects:  48% (11267/23472)        
remote: Counting objects:  49% (11502/23472)        
remote: Counting objects:  50% (11736/23472)        
remote: Counting objects:  51% (11971/23472)        
remote: Counting objects:  52% (12206/23472)        
remote: Counting objects:  53% (12441/23472)        
remote: Counting objects:  54% (12675/23472)        
remote: Counting objects:  55% (12910/23472)        
remote: Counting objects:  56% (13145/23472)        
remote: Counting objects:  57% (13380/23472)        
remote: Counting objects:  58% (13614/23472)        
remote: Counting objects:  59% (13849/23472)        
remote: Counting objects:  60% (14084/23472)        
remote: Counting objects:  61% (14318/23472)        
remote: Counting objects:  62% (14553/23472)        
remote: Counting objects:  63% (14788/23472)        
remote: Counting objects:  64% (15023/23472)        
remote: Counting objects:  65% (15257/23472)        
remote: Counting objects:  66% (15492/23472)        
remote: Counting objects:  67% (15727/23472)        
remote: Counting objects:  68% (15961/23472)        
remote: Counting objects:  69% (16196/23472)        
remote: Counting objects:  70% (16431/23472)        
remote: Counting objects:  71% (16666/23472)        
remote: Counting objects:  72% (16900/23472)        
remote: Counting objects:  73% (17135/23472)        
remote: Counting objects:  74% (17370/23472)        
remote: Counting objects:  75% (17604/23472)        
remote: Counting objects:  76% (17839/23472)        
remote: Counting objects:  77% (18074/23472)        
remote: Counting objects:  78% (18309/23472)        
remote: Counting objects:  79% (18543/23472)        
remote: Counting objects:  80% (18778/23472)        
remote: Counting objects:  81% (19013/23472)        
remote: Counting objects:  82% (19248/23472)        
remote: Counting objects:  83% (19482/23472)        
remote: Counting objects:  84% (19717/23472)        
remote: Counting objects: 100% (23472/23472), done.        
remote: Compressing objects:   0% (1/11452)        
remote: Compressing objects:   1% (115/11452)        
remote: Compressing objects:   2% (230/11452)        
remote: Compressing objects:   3% (344/11452)        
remote: Compressing objects:   4% (459/11452)        
remote: Compressing objects:   5% (573/11452)        
remote: Compressing objects:   6% (688/11452)        
remote: Compressing objects:   7% (802/11452)        
remote: Compressing objects:   8% (917/11452)        
remote: Compressing objects:   9% (1031/11452)        
remote: Compressing objects:  10% (1146/11452)        
remote: Compressing objects:  11% (1260/11452)        
remote: Compressing objects:  12% (1375/11452)        
remote: Compressing objects:  13% (1489/11452)        
remote: Compressing objects:  14% (1604/11452)        
remote: Compressing objects:  15% (1718/11452)        
remote: Compressing objects:  16% (1833/11452)        
remote: Compressing objects:  17% (1947/11452)        
remote: Compressing objects:  18% (2062/11452)        
remote: Compressing objects:  19% (2176/11452)        
remote: Compressing objects:  20% (2291/11452)        
remote: Compressing objects:  21% (2405/11452)        
remote: Compressing objects:  22% (2520/11452)        
remote: Compressing objects:  23% (2634/11452)        
remote: Compressing objects:  24% (2749/11452)        
remote: Compressing objects:  25% (2863/11452)        
remote: Compressing objects:  26% (2978/11452)        
remote: Compressing objects:  27% (3093/11452)        
remote: Compressing objects:  28% (3207/11452)        
remote: Compressing objects:  29% (3322/11452)        
remote: Compressing objects:  30% (3436/11452)        
remote: Compressing objects:  31% (3551/11452)        
remote: Compressing objects:  32% (3665/11452)        
remote: Compressing objects:  33% (3780/11452)        
remote: Compressing objects:  34% (3894/11452)        
remote: Compressing objects:  35% (4009/11452)        
remote: Compressing objects:  36% (4123/11452)        
remote: Compressing objects:  37% (4238/11452)        
remote: Compressing objects:  38% (4352/11452)        
remote: Compressing objects:  39% (4467/11452)        
remote: Compressing objects:  40% (4581/11452)        
remote: Compressing objects:  41% (4696/11452)        
remote: Compressing objects:  42% (4810/11452)        
remote: Compressing objects:  43% (4925/11452)        
remote: Compressing objects:  44% (5039/11452)        
remote: Compressing objects:  45% (5154/11452)        
remote: Compressing objects:  46% (5268/11452)        
remote: Compressing objects:  47% (5383/11452)        
remote: Compressing objects:  48% (5497/11452)        
remote: Compressing objects:  49% (5612/11452)        
remote: Compressing objects:  50% (5726/11452)        
remote: Compressing objects:  51% (5841/11452)        
remote: Compressing objects:  52% (5956/11452)        
remote: Compressing objects:  53% (6070/11452)        
remote: Compressing objects:  54% (6185/11452)        
remote: Compressing objects:  55% (6299/11452)        
remote: Compressing objects:  56% (6414/11452)        
remote: Compressing objects:  57% (6528/11452)        
remote: Compressing objects:  58% (6643/11452)        
remote: Compressing objects:  59% (6757/11452)        
remote: Compressing objects:  60% (6872/11452)        
remote: Compressing objects:  61% (6986/11452)        
remote: Compressing objects:  62% (7101/11452)        
remote: Compressing objects:  63% (7215/11452)        
remote: Compressing objects:  64% (7330/11452)        
remote: Compressing objects:  65% (7444/11452)        
remote: Compressing objects:  66% (7559/11452)        
remote: Compressing objects:  67% (7673/11452)        
remote: Compressing objects:  68% (7788/11452)        
remote: Compressing objects:  69% (7902/11452)        
remote: Compressing objects:  70% (8017/11452)        
remote: Compressing objects:  71% (8131/11452)        
remote: Compressing objects:  72% (8246/11452)        
remote: Compressing objects:  73% (8360/11452)        
remote: Compressing objects:  74% (8475/11452)        
remote: Compressing objects:  75% (8589/11452)        
remote: Compressing objects:  76% (8704/11452)        
remote: Compressing objects:  77% (8819/11452)        
remote: Compressing objects:  78% (8933/11452)        
remote: Compressing objects:  79% (9048/11452)        
remote: Compressing objects:  80% (9162/11452)        
remote: Compressing objects:  81% (9277/11452)        
remote: Compressing objects:  82% (9391/11452)        
remote: Compressing objects:  83% (9506/11452)        
remote: Compressing objects:  84% (9620/11452)        
remote: Compressing objects:  85% (9735/11452)        
remote: Compressing objects:  86% (9849/11452)        
remote: Compressing objects:  87% (9964/11452)        
remote: Compressing objects:  88% (10078/11452)        
remote: Compressing objects:  89% (10193/11452)        
remote: Compressing objects:  90% (10307/11452)        
remote: Compressing objects:  91% (10422/11452)        
remote: Compressing objects:  92% (10536/11452)        
remote: Compressing objects:  93% (10651/11452)        
remote: Compressing objects:  94% (10765/11452)        
remote: Compressing objects:  95% (10880/11452)        
remote: Compressing objects:  96% (10994/11452)        
remote: Compressing objects:  97% (11109/11452)        
remote: Compressing objects:  98% (11223/11452)        
remote: Compressing objects:  99% (11338/11452)        
remote: Compressing objects: 100% (11452/11452)        
remote: Compressing objects: 100% (11452/11452), done.        
Receiving objects:   0% (1/23472)
Receiving objects:   1% (235/23472)
Receiving objects:   2% (470/23472)
Receiving objects:   3% (705/23472)
Receiving objects:   4% (939/23472)
Receiving objects:   5% (1174/23472)
Receiving objects:   6% (1409/23472)
Receiving objects:   7% (1644/23472)
Receiving objects:   8% (1878/23472)
Receiving objects:   9% (2113/23472)
Receiving objects:  10% (2348/23472)
Receiving objects:  11% (2582/23472)
Receiving objects:  12% (2817/23472)
Receiving objects:  13% (3052/23472)
Receiving objects:  14% (3287/23472)
Receiving objects:  15% (3521/23472)
Receiving objects:  16% (3756/23472)
Receiving objects:  17% (3991/23472)
Receiving objects:  18% (4225/23472)
Receiving objects:  19% (4460/23472)
Receiving objects:  20% (4695/23472)
Receiving objects:  21% (4930/23472)
Receiving objects:  22% (5164/23472)
Receiving objects:  23% (5399/23472)
Receiving objects:  24% (5634/23472)
Receiving objects:  25% (5868/23472)
Receiving objects:  26% (6103/23472)
Receiving objects:  27% (6338/23472)
Receiving objects:  28% (6573/23472)
Receiving objects:  29% (6807/23472)
Receiving objects:  30% (7042/23472)
Receiving objects:  31% (7277/23472)
Receiving objects:  32% (7512/23472)
Receiving objects:  33% (7746/23472)
Receiving objects:  34% (7981/23472)
Receiving objects:  35% (8216/23472)
Receiving objects:  36% (8450/23472)
Receiving objects:  37% (8685/23472)
Receiving objects:  38% (8920/23472)
Receiving objects:  39% (9155/23472)
Receiving objects:  40% (9389/23472)
Receiving objects:  41% (9624/23472)
Receiving objects:  42% (9859/23472)
Receiving objects:  43% (10093/23472)
Receiving objects:  44% (10328/23472)
Receiving objects:  45% (10563/23472)
Receiving objects:  46% (10798/23472)
Receiving objects:  47% (11032/23472)
Receiving objects:  48% (11267/23472)
Receiving objects:  49% (11502/23472)
Receiving objects:  50% (11736/23472)
Receiving objects:  51% (11971/23472)
Receiving objects:  52% (12206/23472)
Receiving objects:  53% (12441/23472)
Receiving objects:  54% (12675/23472)
Receiving objects:  55% (12910/23472)
Receiving objects:  56% (13145/23472)
Receiving objects:  57% (13380/23472)
Receiving objects:  58% (13614/23472)
Receiving objects:  59% (13849/23472)
Receiving objects:  60% (14084/23472)
Receiving objects:  61% (14318/23472)
Receiving objects:  62% (14553/23472)
Receiving objects:  63% (14788/23472)
Receiving objects:  64% (15023/23472)
Receiving objects:  65% (15257/23472)
Receiving objects:  66% (15492/23472)
Receiving objects:  67% (15727/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  68% (15961/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  69% (16196/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  70% (16431/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  71% (16666/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  72% (16900/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  73% (17135/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  74% (17370/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  75% (17604/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  76% (17839/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  77% (18074/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  78% (18309/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  79% (18543/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  80% (18778/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  81% (19013/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  82% (19248/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  83% (19482/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  84% (19717/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  85% (19952/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  86% (20186/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  87% (20421/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  88% (20656/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  89% (20891/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  90% (21125/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  91% (21360/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  92% (21595/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  93% (21829/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  94% (22064/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  95% (22299/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  96% (22534/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  97% (22768/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects:  98% (23003/23472), 3.13 MiB | 5.95 MiB/s
remote: Total 23472 (delta 18078), reused 15954 (delta 11798), pack-reused 0        
Receiving objects:  99% (23238/23472), 3.13 MiB | 5.95 MiB/s
Receiving objects: 100% (23472/23472), 4.22 MiB | 7.76 MiB/s, done.
Resolving deltas:   0% (0/18078)
Resolving deltas:   1% (181/18078)
Resolving deltas:   2% (363/18078)
Resolving deltas:   3% (543/18078)
Resolving deltas:   4% (724/18078)
Resolving deltas:   5% (904/18078)
Resolving deltas:   6% (1085/18078)
Resolving deltas:   7% (1266/18078)
Resolving deltas:   8% (1447/18078)
Resolving deltas:   9% (1628/18078)
Resolving deltas:  10% (1809/18078)
Resolving deltas:  11% (1989/18078)
Resolving deltas:  12% (2170/18078)
Resolving deltas:  13% (2351/18078)
Resolving deltas:  14% (2531/18078)
Resolving deltas:  15% (2712/18078)
Resolving deltas:  16% (2893/18078)
Resolving deltas:  17% (3074/18078)
Resolving deltas:  18% (3255/18078)
Resolving deltas:  19% (3435/18078)
Resolving deltas:  20% (3616/18078)
Resolving deltas:  21% (3797/18078)
Resolving deltas:  22% (3978/18078)
Resolving deltas:  23% (4158/18078)
Resolving deltas:  24% (4339/18078)
Resolving deltas:  25% (4520/18078)
Resolving deltas:  26% (4701/18078)
Resolving deltas:  27% (4884/18078)
Resolving deltas:  28% (5062/18078)
Resolving deltas:  29% (5243/18078)
Resolving deltas:  30% (5424/18078)
Resolving deltas:  31% (5605/18078)
Resolving deltas:  32% (5785/18078)
Resolving deltas:  33% (5966/18078)
Resolving deltas:  34% (6147/18078)
Resolving deltas:  35% (6328/18078)
Resolving deltas:  36% (6509/18078)
Resolving deltas:  37% (6689/18078)
Resolving deltas:  38% (6871/18078)
Resolving deltas:  39% (7051/18078)
Resolving deltas:  40% (7232/18078)
Resolving deltas:  41% (7412/18078)
Resolving deltas:  42% (7593/18078)
Resolving deltas:  43% (7774/18078)
Resolving deltas:  44% (7955/18078)
Resolving deltas:  45% (8136/18078)
Resolving deltas:  46% (8316/18078)
Resolving deltas:  47% (8497/18078)
Resolving deltas:  48% (8678/18078)
Resolving deltas:  49% (8859/18078)
Resolving deltas:  50% (9039/18078)
Resolving deltas:  51% (9220/18078)
Resolving deltas:  52% (9401/18078)
Resolving deltas:  53% (9582/18078)
Resolving deltas:  54% (9763/18078)
Resolving deltas:  55% (9943/18078)
Resolving deltas:  56% (10125/18078)
Resolving deltas:  57% (10305/18078)
Resolving deltas:  58% (10487/18078)
Resolving deltas:  59% (10668/18078)
Resolving deltas:  60% (10848/18078)
Resolving deltas:  61% (11029/18078)
Resolving deltas:  62% (11210/18078)
Resolving deltas:  63% (11390/18078)
Resolving deltas:  64% (11572/18078)
Resolving deltas:  65% (11751/18078)
Resolving deltas:  66% (11933/18078)
Resolving deltas:  67% (12113/18078)
Resolving deltas:  68% (12295/18078)
Resolving deltas:  69% (12474/18078)
Resolving deltas:  70% (12656/18078)
Resolving deltas:  71% (12836/18078)
Resolving deltas:  72% (13017/18078)
Resolving deltas:  73% (13200/18078)
Resolving deltas:  74% (13379/18078)
Resolving deltas:  75% (13560/18078)
Resolving deltas:  76% (13740/18078)
Resolving deltas:  77% (13923/18078)
Resolving deltas:  78% (14103/18078)
Resolving deltas:  79% (14283/18078)
Resolving deltas:  80% (14467/18078)
Resolving deltas:  81% (14645/18078)
Resolving deltas:  82% (14824/18078)
Resolving deltas:  83% (15005/18078)
Resolving deltas:  84% (15186/18078)
Resolving deltas:  85% (15367/18078)
Resolving deltas:  86% (15548/18078)
Resolving deltas:  87% (15728/18078)
Resolving deltas:  88% (15911/18078)
Resolving deltas:  89% (16090/18078)
Resolving deltas:  90% (16272/18078)
Resolving deltas:  91% (16451/18078)
Resolving deltas:  92% (16634/18078)
Resolving deltas:  93% (16815/18078)
Resolving deltas:  94% (16996/18078)
Resolving deltas:  95% (17176/18078)
Resolving deltas:  96% (17356/18078)
Resolving deltas:  97% (17537/18078)
Resolving deltas:  98% (17721/18078)
Resolving deltas:  99% (17898/18078)
Resolving deltas: 100% (18078/18078)
Resolving deltas: 100% (18078/18078), done.
NOTE: Creating tarball of git repository
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.17.tar.bz2...
INFO: Rebasing devtool onto f064f6fb649e3bfbae4da5229ce869ed4a1549aa
WARNING: Command 'git rebase f064f6fb649e3bfbae4da5229ce869ed4a1549aa' failed:
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
--===============7638750541751405437==--

