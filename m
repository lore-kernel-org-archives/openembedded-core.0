Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442F4C4829B
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.88854.1705340029803583171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Kk7p6VRG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MeHUV44U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d0e2fcc13-32969801-e599-4601-aef3-22c92c656faa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=za1vTWc+1+ibDJgckkQW13Yp+D4T4zg7Sh5BiHsi674=;
	b=Kk7p6VRG+nKcWEWZgsuZbD4KnILIyFZr/NO4qws7bGxKBq1TK+e2TUHyRd4w2c2g
	M6CldPufDVLHV1gxgMy3VAnIgMlDKO1eAquVQypC0eMWjhpb+GvU6xd13QRpJ8/CmN7
	3uar7yzALRQpB3WfIGoC2MjP+Nw1t7oTl0rXIzY4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=za1vTWc+1+ibDJgckkQW13Yp+D4T4zg7Sh5BiHsi674=;
	b=MeHUV44UNMoyLhoYlzfEjG/5FL2VhoVJXHGuzzHI+8uhFq+E4VF7FWllLYJh7pE9
	NDh7dS9FuS06VUwu6oO/avIMVxlV0HYv2kESwtJ2XE60AqYpEgTEyC9ys/H8nfOdmte
	AuJwqp0MoVdxLIMpVFcyvOAvphudeQt2FB+1xDjI=
Content-Type: multipart/mixed; boundary="===============5606948979607146670=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.19.1 FAILED
Message-ID: <0101018d0e2fcc13-32969801-e599-4601-aef3-22c92c656faa-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193743

--===============5606948979607146670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.19.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1852 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6af811472204f3938ee808ff624734a88e7158c2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6af811472204f3938ee808ff624734a88e7158c2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 98b301ebb44fb5cabb56fc24bc3aaa437c47c038
WARNING: Command 'git rebase 98b301ebb44fb5cabb56fc24bc3aaa437c47c038' failed:
Auto-merging python/header-py.c
CONFLICT (content): Merge conflict in python/header-py.c
Auto-merging python/rpmds-py.c
CONFLICT (content): Merge conflict in python/rpmds-py.c
CONFLICT (modify/delete): python/rpmfi-py.c deleted in HEAD and modified in 84cda9af2 (Add bunch of deprecation/obsoletion warnings to python bindings).  Version 84cda9af2 (Add bunch of deprecation/obsoletion warnings to python bindings) of python/rpmfi-py.c left in tree.
Auto-merging python/rpmmodule.c
CONFLICT (content): Merge conflict in python/rpmmodule.c
Auto-merging python/rpmts-py.c
CONFLICT (content): Merge conflict in python/rpmts-py.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_4.19.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5606948979607146670==--

