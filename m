Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A3DF013FD
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28966.1773582114513410546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CXK/k95X;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hnd5riHI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019cf1bb75e5-138106d2-2afb-4fc3-9ce3-468ccc919431-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xsoRePk3cEQ4hMNU/GSBkxwFm2L6ojtuuE5gHi9ISco=;
	b=CXK/k95XgYRy70sxRFqHV4zGWC8MSlAL+6X4f+7BBWRzYWnxIghakIL3YL+erVZ7
	Cr2Fljr31di+b5FJyhIXf30lh4eKORrUA2jMhtcfTEVIFdzyddwEE1zQpADxErUda2x
	PHjrEFRv4dwF/ROIhpMYFmQ+4CZfeWmmLaprSxyA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xsoRePk3cEQ4hMNU/GSBkxwFm2L6ojtuuE5gHi9ISco=;
	b=Hnd5riHIMO52o4ikNWiW2tYZIQ8+d36p9ow6f/qq8d8p4KOinTGelMacPuodYQ9h
	GvdjsJNerqgo3CGTEuU2DAA78bHQVAo8Mqnq1H1oqyM3eXPa4v7Bf9TjbUSse0wdPZ+
	JZywqswX2aa5OmeUe6cR5pXJI5d8UbxuE5rG3fZA=
Content-Type: multipart/mixed; boundary="===============2667734530181591224=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libsolv: upgrading to 0.7.36 FAILED
Message-ID: <0101019cf1bb75e5-138106d2-2afb-4fc3-9ce3-468ccc919431-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233159

--===============2667734530181591224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.36* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libsolv failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1971 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-e8fe7a81ff18ef84a418805dbe7fee0b5212187b"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:e8fe7a81ff18ef84a418805dbe7fee0b5212187b"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 1e377699be108ec82bb798ec9c223d45d84a733c
WARNING: Command 'git rebase 1e377699be108ec82bb798ec9c223d45d84a733c' failed:
Auto-merging src/util.c
CONFLICT (content): Merge conflict in src/util.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libsolv
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libsolv/libsolv_0.7.36.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2667734530181591224==--

