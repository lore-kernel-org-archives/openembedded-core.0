Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8656C48BD1
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.11835.1650052689339361717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=O9HgSmHT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101802ecdeb06-28f2bc7e-3a4c-4c80-aa6b-e5a84ef23a1e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BL2tfr19Ku4vf/2n4cL2lDOuCUmUh+23nvPA9xdfEEI=;
	b=O9HgSmHTSeku98b7iaQufqZxujIrUVM5xqEYK5ZdrotjOYW4IbFdXVH7CrmLR7eo
	Godo9ZOvhjLLX58MPzffOYvy3ggHjAZNgoFBO4fgAPOV7xb5CLcl9QkGRInZgwQcCdP
	n8dvhgiHTTwvtoBPjtvhHrI83XYGSbdcqvWKMaHc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BL2tfr19Ku4vf/2n4cL2lDOuCUmUh+23nvPA9xdfEEI=;
	b=OEb5tJ1rpDkDYHClHJvTC+eiReufJrEEIJ6WckVyibf3WBs7JPLBip5GgtyrcB4u
	VnQF+kO8wVap49jkUnvUHs4vQJ8wIZpOhdz+scox0xOA7JNNzVz/hI982O/DdGI2m/F
	3DGnv/DAlb9DluL908W4LBH9Z2vsJqiWHoaBfVto=
Content-Type: multipart/mixed; boundary="===============4309961879062210378=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to c833f0729e9832eb4c5ad167742c43a96be867d8
 FAILED
Message-ID: 
 <010101802ecdeb06-28f2bc7e-3a4c-4c80-aa6b-e5a84ef23a1e-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164501

--===============4309961879062210378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *c833f0729e9832eb4c5ad167742c43a96be867d8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe piglit failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1640 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e1960061d026aac9e414d0858b7c4a785cf8bd15"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c833f0729e9832eb4c5ad167742c43a96be867d8
WARNING: Command 'git rebase c833f0729e9832eb4c5ad167742c43a96be867d8' failed:
Auto-merging tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
CONFLICT (content): Merge conflict in tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/piglit
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/piglit/piglit_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4309961879062210378==--

