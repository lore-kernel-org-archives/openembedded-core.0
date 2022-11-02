Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AE5C6371B
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.860.1667349632738145364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=a6DGSMxB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018435c85e76-0908054e-cb73-4e31-9098-9961d6a71063-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nXP0P1HNUC0bpUuTo4qmAQA/+X35S5qJnjjBzNdYKyM=;
	b=a6DGSMxBHJpALvplTiNRwFvyncChtsqLEMHLeLlpGMfw78HY0wGFB5pO+YL5khTm
	r3Qp63xCzfp4nKrr4kVGKpPlOjPJQJqVhBf/vRJzkAnDIALX+bdZAiWoPnVBPTSO1Ma
	ZlSfxokhTyZIGnd7PoltZFN6RsXhdb8ArV35eCmg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nXP0P1HNUC0bpUuTo4qmAQA/+X35S5qJnjjBzNdYKyM=;
	b=BOLKhtnK9Q/BmI1UFl5fjIjq5pkNPNgQiiZdtFts63DI5HbU7QPv7jJm9UtsK9Nl
	7aSKisiFqGcGj2dr58I85MnCVfTm0DR9oQgaVlnACWLCrSEmVDnyQ4Em/lexB72kX6m
	oSyeTgfWqhmWOsNzh9vHFW1wSh+qvdPLYAeKC8cA=
Content-Type: multipart/mixed; boundary="===============4591710452420382146=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.231.1 FAILED
Message-ID: <0101018435c85e76-0908054e-cb73-4e31-9098-9961d6a71063-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172460

--===============4591710452420382146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.231.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glslang failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.

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
meta-yocto-bsp       = "tmp-auh-upgrades:1af2da4c1505ca8198786c141676afffce02d0b8"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5755de46b07e4374c05fb1081f65f7ae1f8cca81
WARNING: Command 'git rebase 5755de46b07e4374c05fb1081f65f7ae1f8cca81' failed:
Auto-merging glslang/CMakeLists.txt
CONFLICT (content): Merge conflict in glslang/CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/glslang
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/glslang/glslang_1.3.231.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4591710452420382146==--

