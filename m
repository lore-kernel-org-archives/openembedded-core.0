Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB84C25B7E
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1112.1714579216266863046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gUs/0LY/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wJlVwqwW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f34e298d5-bd74069a-9f34-490d-b6a1-c39198cceca2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=LwCM/NZfeVAtjCMGWUUcLvuQIP7VbfXY5bHOdZizOKM=;
	b=gUs/0LY/IGWlUwIlK+I4GC/e15pxaMvBhwAlpCPaHNLIgmFYHmxr0l/0A4FCLYVW
	x1sqC3vrlrCSG7SVTeBCN3jUx/2Cr7Cq2LNA7IYXUpfv6cDLGmPoP2b/p3iQ4gKne7v
	FeZnJ+pQbWlP6lHG2kz3vK+Gy6dw9CEpi7PE+WJo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=LwCM/NZfeVAtjCMGWUUcLvuQIP7VbfXY5bHOdZizOKM=;
	b=wJlVwqwWGQ+Ylo/TAYMavEP8HIHndlJCmKUfM8HR44oXtuFYfavZnYF3yZ0RA+Dq
	H7gUNvmA2XGhDRDA3vuMAebUHjoCySAFLEoR8gqa6RnyPnKX+/pyxVx6L3vWyucSfFn
	dmbXrAvJ1slPvnXTYbzDAop3EYYQZ9JWOoj0e+MI=
Content-Type: multipart/mixed; boundary="===============1606635607774965475=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.8.0 FAILED
Message-ID: <0101018f34e298d5-bd74069a-9f34-490d-b6a1-c39198cceca2-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198865

--===============1606635607774965475==
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
Loaded 1876 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-e2caf1bac843a7515d86fa289c6405c6c654779c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e2caf1bac843a7515d86fa289c6405c6c654779c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
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
--===============1606635607774965475==--

