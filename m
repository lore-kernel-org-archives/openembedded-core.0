Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55346CD12A9
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2296.1711995071312831032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZOgJndYN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DNjWNpCM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9adba8d8-7f06c81a-07f9-49c1-8306-82a57bf9a944-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995070;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=F7w5LIK8o0v3aBQfGPt76bORPSZOx3G1Ey7mTuWpg58=;
	b=ZOgJndYNF/NxG9j5Of3pUfXBwcjTFDcDpBEmmHgnyEXL+CbxBFqBrdofgIk7tj4w
	z8t77Tzbv7xfILA4Xqu6CgEHvrOgE6ltRn7AXfz1Hg5aYTjE5FaX4fVKIRkyCIBr/ZS
	7UOR3ZtaufkVqyLwy09zAQ0fVWqp/E080n/6Ot8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995070;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=F7w5LIK8o0v3aBQfGPt76bORPSZOx3G1Ey7mTuWpg58=;
	b=DNjWNpCMA9iJfWyFjeqEKW4lSeYhcPMfor+uqG0+F5xbaXTZgQwdeGex1zOdDhzy
	7VnkpPrOV0xdSLnyeMsTWdOZPQ1miz4PLFPuJCLTPYgfHo+QKbkJQSXY0tTyJjg8mH5
	c36y1wCM98L5Jo1ZbvlxWttRyYGr8370B53XYS7w=
Content-Type: multipart/mixed; boundary="===============6568693922747856654=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.8.0 FAILED
Message-ID: <0101018e9adba8d8-7f06c81a-07f9-49c1-8306-82a57bf9a944-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197827

--===============6568693922747856654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgit2 failed.
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
DISTRO_VERSION       = "4.3+snapshot-d48ce5db783681a99974745c58ec74e9159be88a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d48ce5db783681a99974745c58ec74e9159be88a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 9 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto d74d491481831ddcd23575d376e56d2197e95910
WARNING: Command 'git rebase d74d491481831ddcd23575d376e56d2197e95910' failed:
Auto-merging docs/changelog.md
CONFLICT (content): Merge conflict in docs/changelog.md

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libgit2
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libgit2/libgit2_1.8.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6568693922747856654==--

