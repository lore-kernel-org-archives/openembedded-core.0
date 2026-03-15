Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B81F013DE
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28983.1773582123817218154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ls1vSvy1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MkHijdpL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019cf1bb7eee-077b41c3-476e-49e4-b023-8e7829e2b381-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582123;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KwY8pLjJ8GLnU1KFLnAX8nd70I96tYqnrPbI0OQW1UU=;
	b=ls1vSvy1mA39edqLv8P6b2MgHLOnVxc3usK9uvkYWvd7WUKs9RI7c0talPU8N6Wl
	HjXkdU8+pn/5Tf+3OFoupVnppDp/cqxpApn9DvW4uBLZBSFee8Q1kwiMv43UlZXjd0u
	sw/xRElcUhjNpbIuGsg09hGDgQ5ER/jg4yNn9gSw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582123;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KwY8pLjJ8GLnU1KFLnAX8nd70I96tYqnrPbI0OQW1UU=;
	b=MkHijdpL/bT279+9/nfkC1ItNMD/odS8YgL+PZZhyJ1Uup25228S3Q07kJxFpp5c
	YKWG4FIy6meCYhwz6pVTNLpcCYtdAIRVU8gBHImniiNYd1MM82e8mZwyhdmNggTGKN/
	xk4IxKFoVbn0DkL0UEacv7NfGFfuFNMuw6VwNF8U=
Content-Type: multipart/mixed; boundary="===============4443192052685747997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 040ed91f234abb6a502d3a6910f1b0e54bd239a7
 FAILED
Message-ID: <0101019cf1bb7eee-077b41c3-476e-49e4-b023-8e7829e2b381-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233173

--===============4443192052685747997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *040ed91f234abb6a502d3a6910f1b0e54bd239a7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe piglit failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-baa620fb0dae86f070c7ce431828c69ebc81189a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:baa620fb0dae86f070c7ce431828c69ebc81189a"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
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
INFO: Rebasing devtool onto 040ed91f234abb6a502d3a6910f1b0e54bd239a7
WARNING: Command 'git rebase 040ed91f234abb6a502d3a6910f1b0e54bd239a7' failed:
Auto-merging tests/util/piglit-test-pattern.cpp
CONFLICT (content): Merge conflict in tests/util/piglit-test-pattern.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/piglit
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/piglit/piglit_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4443192052685747997==--

