Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9330CA0ED0
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.88624.1754057267642143515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PK+c0K4F;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=g9IZplb7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019865f5d702-fa337f70-917a-4996-b120-f0c12ec454a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UkoGY2pHEbXHBmUxdn1aFPV/dUgyDPGTSw3MEDAm23k=;
	b=PK+c0K4F02o078fvh9BwXktYeV8a+1JzlNb5WFTFcGGL80WMTtDDrtYChb+ZKQa6
	lsWBAncC0I5p0XA18l4KhEX6QTbVToKTBwCgL8/nGrnItaj199gIiY4Wos5jDz+FrYl
	0KQ+kgeUCDPTiirk6XZx2u7Hbh7KxBpF20xPQ464=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UkoGY2pHEbXHBmUxdn1aFPV/dUgyDPGTSw3MEDAm23k=;
	b=g9IZplb7aBYHgrmxf2h9KFHhaXbuhTGfQYmTYUui8fHJbqXSaI/OIkomTlK8zeO0
	vtCwHJ3JJxa4qvHUOCqjoJuqJph1+X1pie1CLkQw5IEjG7uFU8mmYWsxH0BVJW9VvlN
	kMS522qdLbiqAQgpd4CL/+76rZZAyNBdhs2CI4wI=
Content-Type: multipart/mixed; boundary="===============2307126276542993654=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-efi: upgrading to 4.0.2 FAILED
Message-ID: <0101019865f5d702-fa337f70-917a-4996-b120-f0c12ec454a6-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221254

--===============2307126276542993654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnu-efi* to *4.0.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gnu-efi failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-f06c08d80093e2df59d26c757449bb2b0592acb2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f06c08d80093e2df59d26c757449bb2b0592acb2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 1fee8ab566ce91b9cbab9f2c85db96566d79063b
WARNING: Command 'git rebase 1fee8ab566ce91b9cbab9f2c85db96566d79063b' failed:
Auto-merging Make.defaults
CONFLICT (content): Merge conflict in Make.defaults

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gnu-efi
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gnu-efi/gnu-efi_4.0.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2307126276542993654==--

