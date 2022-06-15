Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC45CCA491
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.4405.1655298221389346796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MXK2DabY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101018167766607-8cfb04e4-354f-43a7-aab1-62ec9019e4fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dS49lYRlyL+1sDzAs8nB20Bw89fayFodlIswFyeXPqM=;
	b=MXK2DabYRwYyILUI3Nd1fFxRmTgVY/My9r032HrCdngZzjKKfarjpCcbjymMWuNk
	gP36mguk4KipIp1h7xYrK9U9/9t1QVtsIErsebJFrZgZUJvfNKqz87HGBh2JJv2wUxZ
	QTCT4wyyLFCShuWvJy8K8JxPO+c7sM20uYRvYXOY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dS49lYRlyL+1sDzAs8nB20Bw89fayFodlIswFyeXPqM=;
	b=gaguSeCUN9oqb+e+9nwIe4/Akir5okvzFkANg3Do8MA8Kd6l+CfbACZv2CEJdwqw
	6KlnDDu5EKapNG3o4YZppximR1CRU1dgVEGvT1Q3uHLl8plAZgYczFhwzjW7qHu11Fp
	0eFVU6oWxr8p5W2El5N3KyR7b5OZCU1H1UeuXaH0=
Content-Type: multipart/mixed; boundary="===============7404647226612794096=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.216.0 FAILED
Message-ID: 
 <0101018167766607-8cfb04e4-354f-43a7-aab1-62ec9019e4fc-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166961

--===============7404647226612794096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.216.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vulkan-loader failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-489827791480da050e839cfdaf4c761467a154bb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:489827791480da050e839cfdaf4c761467a154bb"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 322f7e3212b4fd9d70d7f48972963c83d24d06e4
WARNING: Command 'git rebase 322f7e3212b4fd9d70d7f48972963c83d24d06e4' failed:
Auto-merging tests/framework/test_environment.h
CONFLICT (content): Merge conflict in tests/framework/test_environment.h
Auto-merging tests/framework/shim/windows_shim.cpp
Auto-merging tests/framework/layer/test_layer.h
Auto-merging tests/framework/layer/test_layer.cpp
Auto-merging scripts/loader_extension_generator.py
Auto-merging loader/trampoline.c
Auto-merging loader/loader_windows.c
CONFLICT (content): Merge conflict in loader/loader_windows.c
Auto-merging loader/loader.c
CONFLICT (content): Merge conflict in loader/loader.c
Auto-merging loader/generated/vk_loader_extensions.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/vulkan-loader
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/vulkan-loader/vulkan-loader_1.3.216.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7404647226612794096==--

