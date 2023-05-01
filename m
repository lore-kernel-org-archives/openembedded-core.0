Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8919C87FDD
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.107418.1682976349473379046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bjeCM7W2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010187d93519f3-2e66a41b-80d6-494c-a56d-4fab9b66b9e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U7hnuipVcNqMMQn+mF0XRksB2DBPQNvdZm4Kky8YUUI=;
	b=bjeCM7W2EwR6E4D2XW5nlkhKnU7kLEnVm2jRhXHRM8JubJeJ/nM0gL6FLVczXhQ3
	w0btb3D4/hJ29pIQoEtR3N/YyWjbUjT52Nvgg5P3LpGjzNa2Y2wVXY+AYjSCQ0y/daj
	Jp0dweLIsnPTowlxzS3oVuCiAGEv3SqHtHc59jHM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U7hnuipVcNqMMQn+mF0XRksB2DBPQNvdZm4Kky8YUUI=;
	b=iFR8fd0maqvb8BLCRtUgZhLCsQ5vyKCPw1HIO5wtwxE0evtPrQbXkv13GrDLAcYw
	zlk2II3DsqWQ7RIndImGcvgadsQ2vaGjyvGfEhlFEmBx4JuXtdtNfU7jzPs15MxArkf
	vEU6TuevbJQM90jBHacM4yzfg1b12V+mlHN35xoM=
Content-Type: multipart/mixed; boundary="===============0633303532656636558=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202302 FAILED
Message-ID: <01010187d93519f3-2e66a41b-80d6-494c-a56d-4fab9b66b9e1-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180596

--===============0633303532656636558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202302* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ovmf failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:06:28.694682)
Loading cache...done.
Loaded 1799 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:07fd493ed806833359268c6cac4fcf64e730f8cb"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto f80f052277c88a67c55e107b550f504eeea947d3
WARNING: Command 'git rebase f80f052277c88a67c55e107b550f504eeea947d3' failed:
Auto-merging BaseTools/Conf/tools_def.template
CONFLICT (content): Merge conflict in BaseTools/Conf/tools_def.template

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/ovmf
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/ovmf/ovmf_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0633303532656636558==--

