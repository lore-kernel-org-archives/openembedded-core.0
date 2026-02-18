Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B45C531E4
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1396.1771440107889927490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EZI+FMqj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oFSdK6lj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c720eee49-068ff36f-3cd0-43ff-abbd-59897d5e67cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440107;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i28LkuwZX67CFprP0O9zqUZyp6lCVr2NcJfE4bhNgWs=;
	b=EZI+FMqjPMcLJeGiZwIdMNMNWuUXbGZajUqNUescL7DeMTpENa/U8yjVHE+usjwH
	vS7bhsPRQNQFE25UjDbd9oYDa40nLTED5JXkqmrFtXSv/pUJgtstkJEnX1jrNAKXJXC
	+mdW0bMoDp3L6YuIfPYETNZ98NJd7bTNiaIaOVN0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440107;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i28LkuwZX67CFprP0O9zqUZyp6lCVr2NcJfE4bhNgWs=;
	b=oFSdK6ljIWNpQhhTFErTE9iumQX10cZgU4Qq8VyiXRBH+4Z1miOjdyOBDF4uKqUe
	j24qZZvU2oGilvLVi3S7N720Z6ACyS00YD4TOBQBJzk9bdxKDnRqbQ4N8dZGUNXseDH
	6uGVw/+1nefyRfKLDPcC2C92mS+i8pyi4h+wfo3U=
Content-Type: multipart/mixed; boundary="===============6282758094650391017=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 6.0.1 FAILED
Message-ID: <0101019c720eee49-068ff36f-3cd0-43ff-abbd-59897d5e67cf-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231372

--===============6282758094650391017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm* to *6.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-4f497b60212d58952735b83f2c6f2f6d7a6c621e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:4f497b60212d58952735b83f2c6f2f6d7a6c621e"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 58a917a6c5e24e9e8a01976c17d2eee06249b9b6
WARNING: Command 'git rebase 58a917a6c5e24e9e8a01976c17d2eee06249b9b6' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt
Auto-merging tests/pinned/rpmlibver.txt
CONFLICT (content): Merge conflict in tests/pinned/rpmlibver.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_6.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6282758094650391017==--

