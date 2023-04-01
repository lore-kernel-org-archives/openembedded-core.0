Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8627DC7EE37
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.32126.1680384533158973336
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TqwssCKd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101873eb92d0a-57824fc0-4d9c-41b4-8c5a-603ef9d1e0ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FBP2BiFHxPlVzcmvFSib0pq9hzEhqgMG2mF3mnZipqk=;
	b=TqwssCKd1B+s2N8rJMfLQPZqp9iAf93MVMQYp1ncBkwUc6mo/xjZm7xoiNQsLuzh
	YRCe2EXE53qFv4U//1nVgJEHRIwl4iW6I8msgj+MKXsviy8gEufdGNM9DCYfom3T+wt
	8QY0I+WWCfKGDlUAoOzB+OWo19IovT2LP3rJhm08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FBP2BiFHxPlVzcmvFSib0pq9hzEhqgMG2mF3mnZipqk=;
	b=SAO3gIq1RO1QtYukiXb5MXU2/rloRNl/d0RKSkGmT6RDhnr6G/V5tLBQoVY7z/71
	UcmQTX4I/U31yq7TX8Ex/ADfXQs68K1R6iUjkpkzJdBeEFhivLGmYstdzxt5nW0lH7f
	uWr/+wNF3VOLAIjr5FopZfWZuP9T2xEdUevp6P00=
Content-Type: multipart/mixed; boundary="===============8810335039006046170=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.23.0 FAILED
Message-ID: <010101873eb92d0a-57824fc0-4d9c-41b4-8c5a-603ef9d1e0ea-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179536

--===============8810335039006046170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.23.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libinput failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (17:52:18.337966)
Loading cache...done.
Loaded 1797 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0895c5fa379371d6b80035610a0907d81f843871"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0895c5fa379371d6b80035610a0907d81f843871"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0b005eb64b12603e65a620a77c67ec62fd03f413
WARNING: Command 'git rebase 0b005eb64b12603e65a620a77c67ec62fd03f413' failed:
Auto-merging quirks/50-system-dell.quirks
CONFLICT (content): Merge conflict in quirks/50-system-dell.quirks

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libinput
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libinput/libinput_1.23.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8810335039006046170==--

