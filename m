Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D12CA1006
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11337.1755263228079062198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PV/c0Usi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PK9BgkCq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010198add773af-e47aa99d-c866-4b68-8c84-ada75108820f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263235;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9IuebzhwFqhQZKIBwIUH1Uc6kdgyJBhM1ViTWvEQCF4=;
	b=PV/c0Usi83MEBJVKkXuIe6swxhRib+OMYgNi5/xd1onTAYZQ7jUQoiJgKmV1ZyYy
	FWCt5cGPgvfU83l7g+Kgvcz6LyQMgdssBGela92OvygHKENa1djwZZj2A2t1UF3aN2M
	ekDW1SPI57xX9hdoVlvhCBJaC6H+FTSuB4xq5oow=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263235;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9IuebzhwFqhQZKIBwIUH1Uc6kdgyJBhM1ViTWvEQCF4=;
	b=PK9BgkCqJPTPVrtwzn3SMbqj2wn4ezGz1rQNNMiGxRxhUP/SqkHhqLiKFaHhSRo5
	x9Bhtv3M23g20MuodFWrNrw3mKCApdHQ9Kaj0MQdtDeQLNIVq44BQm7n+BUBSpEk5G1
	AWGWx5DNLkI2ohBS6tFlT+lBlzv5I/xi9hejuDlA=
Content-Type: multipart/mixed; boundary="===============4937800750636980098=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 10ac9658bc3b8f958f861aae3205787d33b98537 FAILED
Message-ID: <01010198add773af-e47aa99d-c866-4b68-8c84-ada75108820f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221941

--===============4937800750636980098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *10ac9658bc3b8f958f861aae3205787d33b98537* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 10ac9658bc3b8f958f861aae3205787d33b98537
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8eb5cc04864db12874eb394c86d4285347fa9e0f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8eb5cc04864db12874eb394c86d4285347fa9e0f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 10ac9658bc3b8f958f861aae3205787d33b98537
WARNING: Command 'git rebase 10ac9658bc3b8f958f861aae3205787d33b98537' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in ef4c8f0 (Add changes from do_patch).  Version ef4c8f0 (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4937800750636980098==--

