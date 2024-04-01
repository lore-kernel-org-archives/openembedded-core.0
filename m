Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5E4CD12AA
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:27 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2022.1711994603352353659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YFLGYDtN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WIiE0hCP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9ad4856e-39c72efc-bf97-460c-9abb-cb9d4c55e65d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bF+tc0V9zc6RoK8WrmidI24e15FHihYo0HMUUVg+eqk=;
	b=YFLGYDtNwnDQWoACTGXdd0S4KLvqTQAJA+IibrHE9VbX5pt2U9MlKNsSVk6DaNxw
	GZX1Hsdcri6ndVJF7DMmkc5hMN2rpD8LmBY1/Ppd4MdgBA3tQmrb7vjEKEFlo+oZCOT
	rHWKg3LhLeLAWnQV2efPwvHata5D4QX8YF7zK8Uk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bF+tc0V9zc6RoK8WrmidI24e15FHihYo0HMUUVg+eqk=;
	b=WIiE0hCPqXXIODphgWGj/ti7JWExGmKpkw/svAw10Tja0B//qHKaPTn428YhgIMo
	dROgdTf1/XSPDVgEq4fNCJKovAXYmYETkhgit74ayfToJySJ/QeEZvnoFxaJRd4ETgd
	6gmEPxgzvzX8B0TNLHubuc8osnRXP/GJFDLo1D7I=
Content-Type: multipart/mixed; boundary="===============7546086573267212658=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] waffle: upgrading to 1.8.0 FAILED
Message-ID: <0101018e9ad4856e-39c72efc-bf97-460c-9abb-cb9d4c55e65d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197797

--===============7546086573267212658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *waffle* to *1.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe waffle failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4e252aabdd39b32e2f2e5ba8620b0f29d88e28c2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4e252aabdd39b32e2f2e5ba8620b0f29d88e28c2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 580b912a30085528886603942c100c7b309b3bdb
WARNING: Command 'git rebase 580b912a30085528886603942c100c7b309b3bdb' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
Auto-merging src/waffle/meson.build
CONFLICT (content): Merge conflict in src/waffle/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/waffle
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/waffle/waffle_1.8.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7546086573267212658==--

