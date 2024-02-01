Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9491FC5478B
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2089.1706810404424879645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q8ztVRFj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PzQZH5y4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65d3f768-0f2b3905-82e8-453a-bc98-729709e2f174-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lHvPXb9u5KeMADYY+WeGgDRN0VKRK5fqiCJtzkHjtT4=;
	b=Q8ztVRFjKJUQMoa7AHVAGbgsyMzQA+OLBBISe3j+7bmyKYNzvnwNst+Olt1MCHAW
	INYSEiPnFIRKf4PGcK0XhU6PIHzQ3ZXIIByFT3tRoLkRMwDuNU36PkFvkRPqEmRHQdR
	Xm6jrEdN9I+5PwE7ixq8iZczbBrgqqCzhiDs8WZM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lHvPXb9u5KeMADYY+WeGgDRN0VKRK5fqiCJtzkHjtT4=;
	b=PzQZH5y4xGh8Yyju+tekPCN1yZ5/+vbCcGadraM1mRY8wlVPyiD2C25GbSdOwi/R
	hXgRb/ThPi40NKapyaRmP73aiuc0Fb23ucq0iGffmYiaj2jmuJ8xf0FdW8BogtwDcv1
	oCYpiL/5j6VRQHpEjyQC4AUzZ0lnkZqEaHWKtIBQ=
Content-Type: multipart/mixed; boundary="===============7918179748369118517=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.0.0 FAILED
Message-ID: <0101018d65d3f768-0f2b3905-82e8-453a-bc98-729709e2f174-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194670

--===============7918179748369118517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *24.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mesa failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-0307248d60fd59eda95c788aa823717727bdda82"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0307248d60fd59eda95c788aa823717727bdda82"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 5 Local 5 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1849 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (911 cached, 2 parsed). 1850 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-0307248d60fd59eda95c788aa823717727bdda82"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0307248d60fd59eda95c788aa823717727bdda82"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 5 Mirrors 0 Missed 1 Current 22 (83% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   4% |#                                   | ETA:  0:00:04
Adding changed files:   8% |##                                  | ETA:  0:00:03
Adding changed files:  12% |####                                | ETA:  0:00:03
Adding changed files:  16% |#####                               | ETA:  0:00:02
Adding changed files:  20% |#######                             | ETA:  0:00:02
Adding changed files:  24% |########                            | ETA:  0:00:02
Adding changed files:  29% |##########                          | ETA:  0:00:02
Adding changed files:  33% |###########                         | ETA:  0:00:02
Adding changed files:  37% |#############                       | ETA:  0:00:02
Adding changed files:  41% |##############                      | ETA:  0:00:02
Adding changed files:  45% |################                    | ETA:  0:00:01
Adding changed files:  49% |#################                   | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:01
Adding changed files:  58% |####################                | ETA:  0:00:01
Adding changed files:  62% |######################              | ETA:  0:00:01
Adding changed files:  66% |#######################             | ETA:  0:00:01
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:03
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://mesa.freedesktop.org/archive/mesa-24.0.0.tar.xz...
INFO: Rebasing devtool onto d3608ce1b63c08455165c4fd90d7c6698e946446
WARNING: Command 'git rebase d3608ce1b63c08455165c4fd90d7c6698e946446' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/mesa
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mesa/mesa_24.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7918179748369118517==--

