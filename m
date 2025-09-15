Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837DDCAC59D
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.30897.1757937285701477369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3wB64nm2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sxDLDkQa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101994d3a4ded-633038f0-ae94-4736-a790-d3ea2e4d629e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LSc9ffq3so5coJ/fOJlP6J18EYJiB207LtsZJfWMqI8=;
	b=3wB64nm2Y2DRFdo6T0/HIASen1KZjVlVlShYtXKYToQ3cF4/GGII9Lffly3tOt1q
	m3CqyOZdruA0zsDGE3y1WOISzLEy/MJ+93hLFuD6Ll3uJz0SEtZ7QH7XnQKCECb1fHM
	0N0e06gWem3AKgnHo2cuCbtgFskf10Zg/QhgmtpA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LSc9ffq3so5coJ/fOJlP6J18EYJiB207LtsZJfWMqI8=;
	b=sxDLDkQaV+mlHrB8gH9JTapl0W+wi2lXCU6whbBUpOBZT6mMVs3oafDi0GHvWiwh
	kbNKKVvNz3d7XI0rasui24CwwRBujiwlMVw+aI535XIBbjQ/r7wZN4+O930xBN+3c9P
	ohFSJZJwGjhCC4LUv44pawL0nDwOgHdvXqCsm058=
Content-Type: multipart/mixed; boundary="===============8664131935782819842=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] igt-gpu-tools: upgrading to 2.1 FAILED
Message-ID: <010101994d3a4ded-633038f0-ae94-4736-a790-d3ea2e4d629e-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223456

--===============8664131935782819842==
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
Loaded 1939 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-fee49d883b404d4e678ad4627704c45ce27be895"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fee49d883b404d4e678ad4627704c45ce27be895"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
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
--===============8664131935782819842==--

