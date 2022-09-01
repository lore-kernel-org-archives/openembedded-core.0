Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACC0C6FD19
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.12625.1662040786688070560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JRlQ9AhK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182f959c49f-7e7e6e4f-a571-4f4a-a950-b9999b671f2b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AroA7g/cUalVh8K4shzHnpo7YmLpj6fSa/jtunPSb0g=;
	b=JRlQ9AhK4lxjvlDQFhs5Bif33GaVNo7r8VTNk2eESLspRkvKG8eVWz+dXc5Jsp3O
	RviIuQkq4mTNlI+RgbhnwQ+r0FlitbKgfkwjGWPVM/iJDQcarZ/00g+A+Ufqt4h0WYB
	F50bvy9PF1vL2gsxo/miXq91buFnTuEmNbtw3pVE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AroA7g/cUalVh8K4shzHnpo7YmLpj6fSa/jtunPSb0g=;
	b=TbmrzUB8BdBmFl2Y6Dfd0ag9zCi/G4L45P514h31co3pEcyxL5eEJHhHMOPB5iis
	FqZDAbvl+IbgoV3O4Iz1TMigx2cRr/eYlMwpnGlAVlOutnhJLKkFnelKN6xtBmw561k
	4B5Ae7IfOaOgspBcgkRbv+E36xChhedh7jI0VGkM=
Content-Type: multipart/mixed; boundary="===============8750273388155474983=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.224.1 FAILED
Message-ID: 
 <01010182f959c49f-7e7e6e4f-a571-4f4a-a950-b9999b671f2b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170181

--===============8750273388155474983==
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
Loaded 1658 entries from dependency cache.

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
DISTRO_VERSION       = "4.1+snapshot-9259bdac703a871da6a72f2dd6b21aad869766aa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9259bdac703a871da6a72f2dd6b21aad869766aa"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
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
--===============8750273388155474983==--

