Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C8DCD98FF
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50408.1781195498601468821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Koz6q4dU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A1RJ8yuT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb78699ef-9c17a9a9-4472-4e37-8680-ce2ec5d9f0ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lj/FDP0u4kyoNdunU4znvQ+9wvm+UwEBjI0JLXKg5Ig=;
	b=Koz6q4dUtC3li6s7CesdnSFdo8fzEwJg0MCX+d2yzp2uQUIZbKtRgQUWQkOyOZA7
	BGDzQChyHiPdU2kp6xbuxGkqkcVwkOetVnvZhZSaxhd6J0t3yOVUggVuRaFFhb1wJOL
	RunkEaTbopb6b3KoSy3Q8k/g44ZFVkk5GUEM5/Kc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lj/FDP0u4kyoNdunU4znvQ+9wvm+UwEBjI0JLXKg5Ig=;
	b=A1RJ8yuTxuNgp5jC7VC0x8PUDTZfWzwybDGEqSyM4VpIabXPf+cum+bh6S++2piW
	AK/wrHkZ7MER+mbSPzeyombk92pQJ41mgpDjXr4W+cPXpwQDNIekL3RY7VE2UNURqpi
	nZ8DRuOA8olr+PcLmQP6XZY80SWaukRFadvnVLLE=
Content-Type: multipart/mixed; boundary="===============1928328331664061924=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libsolv: upgrading to 0.7.39 FAILED
Message-ID: <0101019eb78699ef-9c17a9a9-4472-4e37-8680-ce2ec5d9f0ef-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238517

--===============1928328331664061924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.39* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libsolv failed.
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
DISTRO_VERSION       = "6.0.99+snapshot-e71d0383a6791459a36008f2ac620d7e04c9347a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e71d0383a6791459a36008f2ac620d7e04c9347a"
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
INFO: Rebasing devtool onto 2f58c6f86edd978d6bdbd87dce9c85388e9b9dcc
WARNING: Command 'git rebase 2f58c6f86edd978d6bdbd87dce9c85388e9b9dcc' failed:
Auto-merging src/repopage.c
CONFLICT (content): Merge conflict in src/repopage.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libsolv
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libsolv/libsolv_0.7.39.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libsolv.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1928328331664061924==--

