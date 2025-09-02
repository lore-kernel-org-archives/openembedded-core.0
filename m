Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD80CA1013
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.89811.1756850199764922137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P9eOA0dy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YvqY31GR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101990c6e992d-b7317eeb-e2be-4030-93e0-536e22e165e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850199;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KcR/nW036Uo8eHbMqBPkoFCEarrjIb2T1Y2GH/wF/GQ=;
	b=P9eOA0dyz0FcOMDoni+kfe3UFwaaQuiW0r/A1zk+Hzh7mysRRgfycYW7dqltQpbK
	PFWy5eWuhFqAwMxx+AhzyL7oTJugUp8gJCKs+Mzh1elfTlwfkZGb1KO+9FBOmAdFz7Y
	03S2Oy7iaBRHW9vf1Z/PnPCjSVzzCOp5R55PgpKM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850199;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KcR/nW036Uo8eHbMqBPkoFCEarrjIb2T1Y2GH/wF/GQ=;
	b=YvqY31GRfSNgpXWUkF6EPGQuiHsTfenEse7GAzbDKcZ0+05qANKQ7fvCehgDr8ce
	h0rsve7VoEKmCyTmYp7VQm2cfMT0iMlL4kmNWvzOEdzBJITE/Xd4WzUEd98xVaVjG5l
	OzZOSomYHFVaL2fyjA2npcEf1QGKqcTKT6SaAcXE=
Content-Type: multipart/mixed; boundary="===============3269880443263477010=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] igt-gpu-tools: upgrading to 2.1 FAILED
Message-ID: <010101990c6e992d-b7317eeb-e2be-4030-93e0-536e22e165e0-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222808

--===============3269880443263477010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe igt-gpu-tools failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1940 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-825d7ceb764bf1a2b98181be1b0f2242ab521c3f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:825d7ceb764bf1a2b98181be1b0f2242ab521c3f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4871829d8b7117553eb2dc1bdb9a0d18de428a98
WARNING: Command 'git rebase 4871829d8b7117553eb2dc1bdb9a0d18de428a98' failed:
Auto-merging lib/igt_aux.c
CONFLICT (content): Merge conflict in lib/igt_aux.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/igt-gpu-tools
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/igt-gpu-tools/igt-gpu-tools_2.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3269880443263477010==--

