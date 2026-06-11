Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD72CDB480
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50425.1781195507361500303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rzuOQh2x;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bCXIX7f7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019eb786a7d5-ea4bbe4f-76e7-44d7-91d6-b280cccb9b1a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FoQyKQ7HzjG+oxaFfyUgd6Kje8kAjfRyXBIlTNMPykM=;
	b=rzuOQh2xHfLJiVohqszwHeECMI0hOAAYtP3u14LSHXXDbAInFSTWXoxVbnXySOvi
	I2jm3FCup7ThFvIb7ve9i9teqVHKmZLq327fAe7J9EdZY4Pa9sXMIzFFB0iApJFV69G
	oxNn6QiSGDx59zKMMxclompSYu5ZmpnKpM8t/oEU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FoQyKQ7HzjG+oxaFfyUgd6Kje8kAjfRyXBIlTNMPykM=;
	b=bCXIX7f70I/K4ilqu2YPVyAa1Wn7Sc8diMPcEe/0ZhGs5MpLRDzwqp5dTqGLr4tt
	5WgL0sT066EUinwcGwB+YdHrBSiwCHe/w+yRXySexazPHZrc/45lcEuMi1pSVrp4luU
	S6mbkYYjWiYPk6yxCmvZxewO1eoed7HLoKTN7TeY=
Content-Type: multipart/mixed; boundary="===============4421564765232412605=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to ea22807ea068e400496742312eafe276a6c5e069
 FAILED
Message-ID: <0101019eb786a7d5-ea4bbe4f-76e7-44d7-91d6-b280cccb9b1a-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238533

--===============4421564765232412605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *ea22807ea068e400496742312eafe276a6c5e069* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe piglit failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4f5065dfd57b8858a2341ac96824f9b5779c298a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4f5065dfd57b8858a2341ac96824f9b5779c298a"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ea22807ea068e400496742312eafe276a6c5e069
WARNING: Command 'git rebase ea22807ea068e400496742312eafe276a6c5e069' failed:
Auto-merging tests/util/piglit-test-pattern.cpp
CONFLICT (content): Merge conflict in tests/util/piglit-test-pattern.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/piglit
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/piglit/piglit_git.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/piglit.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4421564765232412605==--

