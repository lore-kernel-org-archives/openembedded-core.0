Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255FDC63718
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web12.24546.1665871395873929848
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TcT18DRK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010183ddac3969-e361e49d-1f81-4fc5-9aff-1f67058a1606-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=32/tZYkFRh4G4T1NYILsJDy5pfCh4E2ClM3Q4BskgAs=;
	b=TcT18DRKNNc0nugJUy+Uonp6ggD+0uu5NvRzvQYIA4Ni05HrWRY7mQmspdl/M4V/
	xQJmWLh0s3f+glmuN2ivwyHoce6I7Gcb4vWIk1M5ivBieh5ToWE0WLL7FxjBhvVoFzh
	/PMh0CQImm7WhLA9zVhq0LgSU+Gw8CU39HXFg7MA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=32/tZYkFRh4G4T1NYILsJDy5pfCh4E2ClM3Q4BskgAs=;
	b=NnxiXfLcDKAeW84FmhCgXdvZgfGfQlrYqOymCQUDgpnge4XJqmVyAMDxTtME2GRf
	R/NKR28YwIvHDdYimJymFD2xLhoPoGOsGWPMBmOk7eF49xiEaqF2bQ7pvctM+V1YxR4
	ox7Vo9WclCio+3sTqTXMaM9q8tHI9iubXiozujH0=
Content-Type: multipart/mixed; boundary="===============3987194578119318039=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.224.1 FAILED
Message-ID: <01010183ddac3969-e361e49d-1f81-4fc5-9aff-1f67058a1606-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171805

--===============3987194578119318039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.224.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glslang failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:14fc8f944897b1aff10916bbd2905911c904415e"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 10423ec659d301a0ff2daac8bbf38980abf27590
WARNING: Command 'git rebase 10423ec659d301a0ff2daac8bbf38980abf27590' failed:
Auto-merging glslang/CMakeLists.txt
CONFLICT (content): Merge conflict in glslang/CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/glslang
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/glslang/glslang_1.3.224.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3987194578119318039==--

