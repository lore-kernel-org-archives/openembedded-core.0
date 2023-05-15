Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D61CA9EAB
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.3773.1684186749027124158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CSsC49sL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a54b2-675f6a29-74a9-4567-ab8f-c2b182f64817-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Bww+zdfZc6qkoQVqpQ+S7PV2+B1MpIkr7ILA98y1Gj0=;
	b=CSsC49sLQJnIBKwud/WPEsltLK7r+rn9W13f98uvOYh517klL3syTI++KutAapPE
	Uiji0oFHKtFUOrpwI+Vg8o5Pha8sGxDsEYWEBMRSEFeGd/0Xq4u9HhVQLqwQ8JDQkO/
	RmHqKXthdbRZ3jSNrytAj2JOyTqrXGRhy6VFPeZ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Bww+zdfZc6qkoQVqpQ+S7PV2+B1MpIkr7ILA98y1Gj0=;
	b=VdPrABX/UbG8ZAc2MDcTsfCI2Mlhvdo1IFyGG6xoasNTkrYrVxfYka/CO2NpopK9
	hzW/9Qz7AVlF8A4tqH5+eeYdQVwxVxJnfvipU0As5rJnlJV0J6QBa++UO+e48GAOgvL
	Nv3sxmCI0aZSezh0ArBrROdQIuB5x3fcRzRlgVT0=
Content-Type: multipart/mixed; boundary="===============7049221762309892632=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.18.1 FAILED
Message-ID: <01010188215a54b2-675f6a29-74a9-4567-ab8f-c2b182f64817-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181329

--===============7049221762309892632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.18.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:16:33.886197)
Loading cache...done.
Loaded 1804 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5ac7117bfb893162e267ca3957c7023d8f80841a"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4588bc3f994338502d2770ad24cbfcdaa6c335ec
WARNING: Command 'git rebase 4588bc3f994338502d2770ad24cbfcdaa6c335ec' failed:
Auto-merging build/rpmfc.c
CONFLICT (content): Merge conflict in build/rpmfc.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rpm/rpm_4.18.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7049221762309892632==--

