Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14E1C021AA
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.42628.1738416048431017767
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cFqFRCVf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mbgESzWr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abeb0a-12dbe59d-82dc-4c7b-90db-02e3ff49504b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z7huc4JdBZvnp93hjC15+H6tFxI/sN3gwX0V441Q1gk=;
	b=cFqFRCVfUD2+8rUIxujBuRy5Jy7mPrifJBL3CKwjS4cz46PXvWvvoBI2jFKHMI21
	4P05FSlbN7mPl35OzB9qZ+/hJy8VP7jpfZn7VTm/mW6D1EuL1jM3UphEYSH+9CEfsHS
	VWXMBg1X2Dn3rceQoMkDyQhf1Uc0w0U67KKrvijY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z7huc4JdBZvnp93hjC15+H6tFxI/sN3gwX0V441Q1gk=;
	b=mbgESzWrJqFB8JXDzPvwHd3A4iWh6SDUksuSl+MJxdt2haqogt626uwqM0f0/dAj
	lHu9eu98kEWXkgNANYRB/ackHQ7bVPwvjN2HU5SndGpdlHxrNF5T0QKcpaLPNI58QBf
	PohEw+HTPL9FImofsTcUE0mttxXjSF/NznAnHYCQ=
Content-Type: multipart/mixed; boundary="===============2395110207681613892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] valgrind: upgrading to 3.24.0 FAILED
Message-ID: <01010194c1abeb0a-12dbe59d-82dc-4c7b-90db-02e3ff49504b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210549

--===============2395110207681613892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.24.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe valgrind failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b20d3f57bc8e21d9ad0b30006f8f0382add20625"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b20d3f57bc8e21d9ad0b30006f8f0382add20625"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-5pkr9n58: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-9yykbq43/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-9yykbq43/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  23% |########                            | ETA:  0:00:00
Adding changed files:  47% |#################                   | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/pub/valgrind/valgrind-3.24.0.tar.bz2...
INFO: Rebasing devtool onto 5ac2515a67c44ae13ee4b1dbb93c251895c58afe
WARNING: Command 'git rebase 5ac2515a67c44ae13ee4b1dbb93c251895c58afe' failed:
Auto-merging tests/vg_regtest.in
CONFLICT (content): Merge conflict in tests/vg_regtest.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/valgrind
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/valgrind/valgrind_3.24.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2395110207681613892==--

