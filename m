Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86688CDB495
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.102715.1697399115228380183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AGNNzjw+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=biN9jljO;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b34df0eef-a2d09b9c-bcda-4b5e-934c-bdacc1ec222a-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4D2/dQ1SpM9Dcexj86oHSD6dgAxEyKmAA2G8njrVhDQ=;
	b=AGNNzjw+XwW6Q6FHMqVvGO8AYm50XPj+bL0rNCFWdUL6w4iFL8AdmCiFBP7x3osI
	GQ+eBLOqLK8Xi1YqqI7Qkxz5xggkckYjiroksPMhfAJzsiZYLpitFfHYEOBPmJ5CokD
	Nw5lOFWnGfXtxUsYSS+rbQ/Sc3o/gNNQHY9uVTEQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4D2/dQ1SpM9Dcexj86oHSD6dgAxEyKmAA2G8njrVhDQ=;
	b=biN9jljOQhkj84D9IcLWLhlpu5ED8x0hjcUMuIgDY+2ViF3CjhchfwnNrRxrVLzC
	hS07F9NqS9su3pgi2skO5KOKhdSsZsdYSif4PcJzos6pGko/SLsxY/dRiL9QtZ4Ovsi
	blDH46rk/s2l9YNuYo8R9ndY37RehKe2W/Xc/40g=
Content-Type: multipart/mixed; boundary="===============4840155775357488833=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] waffle: upgrading to 1.8.0 FAILED
Message-ID: <0101018b34df0eef-a2d09b9c-bcda-4b5e-934c-bdacc1ec222a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189228

--===============4840155775357488833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *waffle* to *1.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe waffle failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (17:48:54.421200)
Loading cache...done.
Loaded 1845 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-ea20a5cc268938f9d47f5cf47371010bed59cadb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ea20a5cc268938f9d47f5cf47371010bed59cadb"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 580b912a30085528886603942c100c7b309b3bdb
WARNING: Command 'git rebase 580b912a30085528886603942c100c7b309b3bdb' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
Auto-merging src/waffle/meson.build
CONFLICT (content): Merge conflict in src/waffle/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/waffle
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/waffle/waffle_1.8.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4840155775357488833==--

