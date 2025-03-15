Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A871CC35FF6
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.10354.1742048290572165679
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YPtyfuLF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FjadOGQN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101959a2b61e7-e41fdc4e-0e33-46ba-992c-23d257a9bc7f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048289;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=959EzxnN3xqtUp9TRZOlwxFPVpqiDg97uqBOpZbbXHY=;
	b=YPtyfuLF9lSvALx0MD51KPBBippdgQCUm2ejVDMzhyO6Db68UKCn03lbLA2n5+8q
	56yup7EXNAODZE/x9oMuCyiGZ7twQHnUVTM8wTTjyELyvjSUGKjViIrOOyZ+3DZH7YI
	4n0YEVDbB3pLch0rl36Z7yBuAaTHkK4a5VCUN4f0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048289;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=959EzxnN3xqtUp9TRZOlwxFPVpqiDg97uqBOpZbbXHY=;
	b=FjadOGQNpZsWWd22nKJtkIxmzW3vOvGIYNr35YcPLWdb6WUC2lmxjTzp4ncdnLZn
	BN7tocAuyH2gSxkQrdYErPWm7wyFzKRbgZ5MjG1XXQumHTVLXJaLfjuK38TBG8nrkCc
	RVCPLc9L6MSa66m9COEcSvJFT9sGchCBsOgGzI6w=
Content-Type: multipart/mixed; boundary="===============7457745548554959333=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.17 FAILED
Message-ID: <010101959a2b61e7-e41fdc4e-0e33-46ba-992c-23d257a9bc7f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212882

--===============7457745548554959333==
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
Loaded 1884 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:d08db7bd6f784e3908aad3a7c157a9fe0be7fb33"

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
Parsing of 924 .bb files complete (0 cached, 924 parsed). 1885 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:d08db7bd6f784e3908aad3a7c157a9fe0be7fb33"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-wmyz3unm: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-415zk1rh/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-415zk1rh/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Cloning into bare repository '/srv/pokybuild/yocto-worker/auh/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 23480, done.        
remote: Counting objects:   0% (1/23480)        
remote: Counting objects:   1% (235/23480)        
remote: Counting objects:   2% (470/23480)        
remote: Counting objects:   3% (705/23480)        
remote: Counting objects:   4% (940/23480)        
remote: Counting objects:   5% (1174/23480)        
remote: Counting objects:   6% (1409/23480)        
remote: Counting objects:   7% (1644/23480)        
remote: Counting objects:   8% (1879/23480)        
remote: Counting objects:   9% (2114/23480)        
remote: Counting objects:  10% (2348/23480)        
remote: Counting objects:  11% (2583/23480)        
remote: Counting objects:  12% (2818/23480)        
remote: Counting objects:  13% (3053/23480)        
remote: Counting objects:  14% (3288/23480)        
remote: Counting objects:  15% (3522/23480)        
remote: Counting objects:  16% (3757/23480)        
remote: Counting objects:  17% (3992/23480)        
remote: Counting objects:  18% (4227/23480)        
remote: Counting objects:  19% (4462/23480)        
remote: Counting objects:  20% (4696/23480)        
remote: Counting objects:  21% (4931/23480)        
remote: Counting objects:  22% (5166/23480)        
remote: Counting objects:  23% (5401/23480)        
remote: Counting objects:  24% (5636/23480)        
remote: Counting objects:  25% (5870/23480)        
remote: Counting objects:  26% (6105/23480)        
remote: Counting objects:  27% (6340/23480)        
remote: Counting objects:  28% (6575/23480)        
remote: Counting objects:  29% (6810/23480)        
remote: Counting objects:  30% (7044/23480)        
remote: Counting objects:  31% (7279/23480)        
remote: Counting objects:  32% (7514/23480)        
remote: Counting objects:  33% (7749/23480)        
remote: Counting objects:  34% (7984/23480)        
remote: Counting objects:  35% (8218/23480)        
remote: Counting objects:  36% (8453/23480)        
remote: Counting objects:  37% (8688/23480)        
remote: Counting objects:  38% (8923/23480)        
remote: Counting objects:  39% (9158/23480)        
remote: Counting objects:  40% (9392/23480)        
remote: Counting objects:  41% (9627/23480)        
remote: Counting objects:  42% (9862/23480)        
remote: Counting objects:  43% (10097/23480)        
remote: Counting objects:  44% (10332/23480)        
remote: Counting objects:  45% (10566/23480)        
remote: Counting objects:  46% (10801/23480)        
remote: Counting objects:  47% (11036/23480)        
remote: Counting objects:  48% (11271/23480)        
remote: Counting objects:  49% (11506/23480)        
remote: Counting objects:  50% (11740/23480)        
remote: Counting objects:  51% (11975/23480)        
remote: Counting objects:  52% (12210/23480)        
remote: Counting objects:  53% (12445/23480)        
remote: Counting objects:  54% (12680/23480)        
remote: Counting objects:  55% (12914/23480)        
remote: Counting objects:  56% (13149/23480)        
remote: Counting objects:  57% (13384/23480)        
remote: Counting objects:  58% (13619/23480)        
remote: Counting objects:  59% (13854/23480)        
remote: Counting objects:  60% (14088/23480)        
remote: Counting objects:  61% (14323/23480)        
remote: Counting objects:  62% (14558/23480)        
remote: Counting objects:  63% (14793/23480)        
remote: Counting objects:  64% (15028/23480)        
remote: Counting objects:  65% (15262/23480)        
remote: Counting objects:  66% (15497/23480)        
remote: Counting objects:  67% (15732/23480)        
remote: Counting objects:  68% (15967/23480)        
remote: Counting objects:  69% (16202/23480)        
remote: Counting objects:  70% (16436/23480)        
remote: Counting objects:  71% (16671/23480)        
remote: Counting objects:  72% (16906/23480)        
remote: Counting objects:  73% (17141/23480)        
remote: Counting objects:  74% (17376/23480)        
remote: Counting objects:  75% (17610/23480)        
remote: Counting objects:  76% (17845/23480)        
remote: Counting objects:  77% (18080/23480)        
remote: Counting objects:  78% (18315/23480)        
remote: Counting objects:  79% (18550/23480)        
remote: Counting objects:  80% (18784/23480)        
remote: Counting objects:  81% (19019/23480)        
remote: Counting objects:  82% (19254/23480)        
remote: Counting objects:  83% (19489/23480)        
remote: Counting objects:  84% (19724/23480)        
remote: Counting objects:  85% (19958/23480)        
remote: Counting objects: 100% (23480/23480), done.        
remote: Compressing objects:   0% (1/11462)        
remote: Compressing objects:   1% (115/11462)        
remote: Compressing objects:   2% (230/11462)        
remote: Compressing objects:   3% (344/11462)        
remote: Compressing objects:   4% (459/11462)        
remote: Compressing objects:   5% (574/11462)        
remote: Compressing objects:   6% (688/11462)        
remote: Compressing objects:   7% (803/11462)        
remote: Compressing objects:   8% (917/11462)        
remote: Compressing objects:   9% (1032/11462)        
remote: Compressing objects:  10% (1147/11462)        
remote: Compressing objects:  11% (1261/11462)        
remote: Compressing objects:  12% (1376/11462)        
remote: Compressing objects:  13% (1491/11462)        
remote: Compressing objects:  14% (1605/11462)        
remote: Compressing objects:  15% (1720/11462)        
remote: Compressing objects:  16% (1834/11462)        
remote: Compressing objects:  17% (1949/11462)        
remote: Compressing objects:  18% (2064/11462)        
remote: Compressing objects:  19% (2178/11462)        
remote: Compressing objects:  20% (2293/11462)        
remote: Compressing objects:  21% (2408/11462)        
remote: Compressing objects:  22% (2522/11462)        
remote: Compressing objects:  23% (2637/11462)        
remote: Compressing objects:  24% (2751/11462)        
remote: Compressing objects:  25% (2866/11462)        
remote: Compressing objects:  26% (2981/11462)        
remote: Compressing objects:  27% (3095/11462)        
remote: Compressing objects:  28% (3210/11462)        
remote: Compressing objects:  29% (3324/11462)        
remote: Compressing objects:  30% (3439/11462)        
remote: Compressing objects:  31% (3554/11462)        
remote: Compressing objects:  32% (3668/11462)        
remote: Compressing objects:  33% (3783/11462)        
remote: Compressing objects:  34% (3898/11462)        
remote: Compressing objects:  35% (4012/11462)        
remote: Compressing objects:  36% (4127/11462)        
remote: Compressing objects:  37% (4241/11462)        
remote: Compressing objects:  38% (4356/11462)        
remote: Compressing objects:  39% (4471/11462)        
remote: Compressing objects:  40% (4585/11462)        
remote: Compressing objects:  41% (4700/11462)        
remote: Compressing objects:  42% (4815/11462)        
remote: Compressing objects:  43% (4929/11462)        
remote: Compressing objects:  44% (5044/11462)        
remote: Compressing objects:  45% (5158/11462)        
remote: Compressing objects:  46% (5273/11462)        
remote: Compressing objects:  47% (5388/11462)        
remote: Compressing objects:  48% (5502/11462)        
remote: Compressing objects:  49% (5617/11462)        
remote: Compressing objects:  50% (5731/11462)        
remote: Compressing objects:  51% (5846/11462)        
remote: Compressing objects:  52% (5961/11462)        
remote: Compressing objects:  53% (6075/11462)        
remote: Compressing objects:  54% (6190/11462)        
remote: Compressing objects:  55% (6305/11462)        
remote: Compressing objects:  56% (6419/11462)        
remote: Compressing objects:  57% (6534/11462)        
remote: Compressing objects:  58% (6648/11462)        
remote: Compressing objects:  59% (6763/11462)        
remote: Compressing objects:  60% (6878/11462)        
remote: Compressing objects:  61% (6992/11462)        
remote: Compressing objects:  62% (7107/11462)        
remote: Compressing objects:  63% (7222/11462)        
remote: Compressing objects:  64% (7336/11462)        
remote: Compressing objects:  65% (7451/11462)        
remote: Compressing objects:  66% (7565/11462)        
remote: Compressing objects:  67% (7680/11462)        
remote: Compressing objects:  68% (7795/11462)        
remote: Compressing objects:  69% (7909/11462)        
remote: Compressing objects:  70% (8024/11462)        
remote: Compressing objects:  71% (8139/11462)        
remote: Compressing objects:  72% (8253/11462)        
remote: Compressing objects:  73% (8368/11462)        
remote: Compressing objects:  74% (8482/11462)        
remote: Compressing objects:  75% (8597/11462)        
remote: Compressing objects:  76% (8712/11462)        
remote: Compressing objects:  77% (8826/11462)        
remote: Compressing objects:  78% (8941/11462)        
remote: Compressing objects:  79% (9055/11462)        
remote: Compressing objects:  80% (9170/11462)        
remote: Compressing objects:  81% (9285/11462)        
remote: Compressing objects:  82% (9399/11462)        
remote: Compressing objects:  83% (9514/11462)        
remote: Compressing objects:  84% (9629/11462)        
remote: Compressing objects:  85% (9743/11462)        
remote: Compressing objects:  86% (9858/11462)        
remote: Compressing objects:  87% (9972/11462)        
remote: Compressing objects:  88% (10087/11462)        
remote: Compressing objects:  89% (10202/11462)        
remote: Compressing objects:  90% (10316/11462)        
remote: Compressing objects:  91% (10431/11462)        
remote: Compressing objects:  92% (10546/11462)        
remote: Compressing objects:  93% (10660/11462)        
remote: Compressing objects:  94% (10775/11462)        
remote: Compressing objects:  95% (10889/11462)        
remote: Compressing objects:  96% (11004/11462)        
remote: Compressing objects:  97% (11119/11462)        
remote: Compressing objects:  98% (11233/11462)        
remote: Compressing objects:  99% (11348/11462)        
remote: Compressing objects: 100% (11462/11462)        
remote: Compressing objects: 100% (11462/11462), done.        
Receiving objects:   0% (1/23480)
Receiving objects:   1% (235/23480)
Receiving objects:   2% (470/23480)
Receiving objects:   3% (705/23480)
Receiving objects:   4% (940/23480)
Receiving objects:   5% (1174/23480)
Receiving objects:   6% (1409/23480)
Receiving objects:   7% (1644/23480)
Receiving objects:   8% (1879/23480)
Receiving objects:   9% (2114/23480)
Receiving objects:  10% (2348/23480)
Receiving objects:  11% (2583/23480)
Receiving objects:  12% (2818/23480)
Receiving objects:  13% (3053/23480)
Receiving objects:  14% (3288/23480)
Receiving objects:  15% (3522/23480)
Receiving objects:  16% (3757/23480)
Receiving objects:  17% (3992/23480)
Receiving objects:  18% (4227/23480)
Receiving objects:  19% (4462/23480)
Receiving objects:  20% (4696/23480)
Receiving objects:  21% (4931/23480)
Receiving objects:  22% (5166/23480)
Receiving objects:  23% (5401/23480)
Receiving objects:  24% (5636/23480)
Receiving objects:  25% (5870/23480)
Receiving objects:  26% (6105/23480)
Receiving objects:  27% (6340/23480)
Receiving objects:  28% (6575/23480)
Receiving objects:  29% (6810/23480)
Receiving objects:  30% (7044/23480)
Receiving objects:  31% (7279/23480)
Receiving objects:  32% (7514/23480)
Receiving objects:  33% (7749/23480)
Receiving objects:  34% (7984/23480)
Receiving objects:  35% (8218/23480)
Receiving objects:  36% (8453/23480)
Receiving objects:  37% (8688/23480)
Receiving objects:  38% (8923/23480)
Receiving objects:  39% (9158/23480)
Receiving objects:  40% (9392/23480)
Receiving objects:  41% (9627/23480)
Receiving objects:  42% (9862/23480)
Receiving objects:  43% (10097/23480)
Receiving objects:  44% (10332/23480)
Receiving objects:  45% (10566/23480)
Receiving objects:  46% (10801/23480)
Receiving objects:  47% (11036/23480)
Receiving objects:  48% (11271/23480)
Receiving objects:  49% (11506/23480)
Receiving objects:  50% (11740/23480)
Receiving objects:  51% (11975/23480)
Receiving objects:  52% (12210/23480)
Receiving objects:  53% (12445/23480)
Receiving objects:  54% (12680/23480)
Receiving objects:  55% (12914/23480)
Receiving objects:  56% (13149/23480)
Receiving objects:  57% (13384/23480)
Receiving objects:  58% (13619/23480)
Receiving objects:  59% (13854/23480)
Receiving objects:  60% (14088/23480)
Receiving objects:  61% (14323/23480)
Receiving objects:  62% (14558/23480)
Receiving objects:  63% (14793/23480)
Receiving objects:  64% (15028/23480)
Receiving objects:  65% (15262/23480)
Receiving objects:  66% (15497/23480)
Receiving objects:  67% (15732/23480)
Receiving objects:  68% (15967/23480)
Receiving objects:  69% (16202/23480)
Receiving objects:  70% (16436/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  71% (16671/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  72% (16906/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  73% (17141/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  74% (17376/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  75% (17610/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  76% (17845/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  77% (18080/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  78% (18315/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  79% (18550/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  80% (18784/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  81% (19019/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  82% (19254/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  83% (19489/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  84% (19724/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  85% (19958/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  86% (20193/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  87% (20428/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  88% (20663/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  89% (20898/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  90% (21132/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  91% (21367/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  92% (21602/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  93% (21837/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  94% (22072/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  95% (22306/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  96% (22541/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  97% (22776/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects:  98% (23011/23480), 3.12 MiB | 5.94 MiB/s
remote: Total 23480 (delta 18075), reused 15957 (delta 11796), pack-reused 0        
Receiving objects:  99% (23246/23480), 3.12 MiB | 5.94 MiB/s
Receiving objects: 100% (23480/23480), 4.27 MiB | 7.83 MiB/s, done.
Resolving deltas:   0% (0/18075)
Resolving deltas:   1% (181/18075)
Resolving deltas:   2% (362/18075)
Resolving deltas:   3% (543/18075)
Resolving deltas:   4% (725/18075)
Resolving deltas:   5% (904/18075)
Resolving deltas:   6% (1085/18075)
Resolving deltas:   7% (1267/18075)
Resolving deltas:   8% (1446/18075)
Resolving deltas:   9% (1627/18075)
Resolving deltas:  10% (1808/18075)
Resolving deltas:  11% (1989/18075)
Resolving deltas:  12% (2169/18075)
Resolving deltas:  13% (2350/18075)
Resolving deltas:  14% (2531/18075)
Resolving deltas:  15% (2712/18075)
Resolving deltas:  16% (2892/18075)
Resolving deltas:  17% (3073/18075)
Resolving deltas:  18% (3254/18075)
Resolving deltas:  19% (3435/18075)
Resolving deltas:  20% (3615/18075)
Resolving deltas:  21% (3796/18075)
Resolving deltas:  22% (3977/18075)
Resolving deltas:  23% (4158/18075)
Resolving deltas:  24% (4338/18075)
Resolving deltas:  25% (4519/18075)
Resolving deltas:  26% (4700/18075)
Resolving deltas:  27% (4882/18075)
Resolving deltas:  28% (5061/18075)
Resolving deltas:  29% (5242/18075)
Resolving deltas:  30% (5423/18075)
Resolving deltas:  31% (5604/18075)
Resolving deltas:  32% (5784/18075)
Resolving deltas:  33% (5965/18075)
Resolving deltas:  34% (6146/18075)
Resolving deltas:  35% (6327/18075)
Resolving deltas:  36% (6507/18075)
Resolving deltas:  37% (6688/18075)
Resolving deltas:  38% (6869/18075)
Resolving deltas:  39% (7050/18075)
Resolving deltas:  40% (7230/18075)
Resolving deltas:  41% (7411/18075)
Resolving deltas:  42% (7592/18075)
Resolving deltas:  43% (7773/18075)
Resolving deltas:  44% (7953/18075)
Resolving deltas:  45% (8134/18075)
Resolving deltas:  46% (8315/18075)
Resolving deltas:  47% (8496/18075)
Resolving deltas:  48% (8676/18075)
Resolving deltas:  49% (8857/18075)
Resolving deltas:  50% (9038/18075)
Resolving deltas:  51% (9219/18075)
Resolving deltas:  52% (9399/18075)
Resolving deltas:  53% (9580/18075)
Resolving deltas:  54% (9764/18075)
Resolving deltas:  55% (9944/18075)
Resolving deltas:  56% (10125/18075)
Resolving deltas:  57% (10304/18075)
Resolving deltas:  58% (10484/18075)
Resolving deltas:  59% (10668/18075)
Resolving deltas:  60% (10846/18075)
Resolving deltas:  61% (11027/18075)
Resolving deltas:  62% (11208/18075)
Resolving deltas:  63% (11388/18075)
Resolving deltas:  64% (11569/18075)
Resolving deltas:  65% (11750/18075)
Resolving deltas:  66% (11930/18075)
Resolving deltas:  67% (12111/18075)
Resolving deltas:  68% (12292/18075)
Resolving deltas:  69% (12472/18075)
Resolving deltas:  70% (12654/18075)
Resolving deltas:  71% (12834/18075)
Resolving deltas:  72% (13014/18075)
Resolving deltas:  73% (13196/18075)
Resolving deltas:  74% (13376/18075)
Resolving deltas:  75% (13557/18075)
Resolving deltas:  76% (13737/18075)
Resolving deltas:  77% (13918/18075)
Resolving deltas:  78% (14100/18075)
Resolving deltas:  79% (14281/18075)
Resolving deltas:  80% (14460/18075)
Resolving deltas:  81% (14641/18075)
Resolving deltas:  82% (14823/18075)
Resolving deltas:  83% (15004/18075)
Resolving deltas:  84% (15183/18075)
Resolving deltas:  85% (15367/18075)
Resolving deltas:  86% (15548/18075)
Resolving deltas:  87% (15726/18075)
Resolving deltas:  88% (15907/18075)
Resolving deltas:  89% (16087/18075)
Resolving deltas:  90% (16268/18075)
Resolving deltas:  91% (16449/18075)
Resolving deltas:  92% (16629/18075)
Resolving deltas:  93% (16812/18075)
Resolving deltas:  94% (16991/18075)
Resolving deltas:  95% (17172/18075)
Resolving deltas:  96% (17353/18075)
Resolving deltas:  97% (17534/18075)
Resolving deltas:  98% (17716/18075)
Resolving deltas:  99% (17896/18075)
Resolving deltas: 100% (18075/18075)
Resolving deltas: 100% (18075/18075), done.
NOTE: Creating tarball of git repository
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.13.17.tar.bz2...
INFO: Rebasing devtool onto cbbd5e288c2be867dff9fa4a8dac9028cc39d5d3
WARNING: Command 'git rebase cbbd5e288c2be867dff9fa4a8dac9028cc39d5d3' failed:
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
--===============7457745548554959333==--

