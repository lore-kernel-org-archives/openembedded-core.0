Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457FDC4321E
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.13917.1646329344377704977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WYBONNeE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101017f50e02f41-9ef4718e-4a5a-49c3-8527-48f33c589cd8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kcHcnUUopIWfeoaIH90wvYRqbVyiTriKKw38Vhzm+9k=;
	b=WYBONNeEdK0Anh4G1l+JDT9ExJFFdxPJQP9jdLFBd72vx15jzl7g/dAUNvK0gwPp
	44S1cq6cBMiYbJLTsmWOP1TrU/1AGb7ZGhMqBz7RUIkrLcjke3/lEA6eVRab5ai+Sn+
	6LjjsWxhfuegolW2MufM65gfy/C1LUWND+uyd5h4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kcHcnUUopIWfeoaIH90wvYRqbVyiTriKKw38Vhzm+9k=;
	b=fA2z1qlEZY7ZFXulUcQzjVeYEeqVM7yPNNnVwZ7vJcPHCKVnhDf62XxFts1/tbDe
	AxTpJkSSzBP7waTKijYvUulnBxZEkgDPhfYVvL3RxHNYjixLIqcDq1CTU2uaOxk95WR
	GWReQjCiaXcQKqX7ugz28ioWuGpRBPUiz3MgmeMM=
Content-Type: multipart/mixed; boundary="===============4852154808487558773=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 c179db1b6f2ae484bfca1e9f8bae273e3319fa7d FAILED
Message-ID: 
 <0101017f50e02f41-9ef4718e-4a5a-49c3-8527-48f33c589cd8-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:23 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162675

--===============4852154808487558773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *c179db1b6f2ae484bfca1e9f8bae273e3319fa7d* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S c179db1b6f2ae484bfca1e9f8bae273e3319fa7d
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry...
NOTE: Retrying server connection (#2)...
Loading cache...done.
Loaded 1521 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-32b93c61f7b993af40e3ca6c82bb82e732a7b460"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:32b93c61f7b993af40e3ca6c82bb82e732a7b460"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 0 Mirrors 0 Missed 8 Current 12 (0% match, 60% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 56 tasks of which 51 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
ERROR: Bitbake Fetcher Error: FetchError('Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-mme_brej/workdir/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-mme_brej/workdir/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-mme_brej/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/
 gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-mme_brej/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-mme_brej/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-mme_brej/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c core.fsyncobjectfiles=0 -c gc.autoDetach=false checkout -B master 191bcb948f7191c36eefe634336f5fc5c0c4c2be failed with exit code 128, output:\nfatal: not a git repository (or any of the parent directories): .git\n', None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-mme_brej/temp/log.do_unpack.2279225
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4852154808487558773==--

