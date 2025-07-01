Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B9EC83F03
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1427.1751386807842766615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jlKwEZLH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UXPiawgj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010197c6c9e892-b58f68f9-9473-420e-b6f6-3ac67384654c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qMODKVLWgd+BK2Lj7ra2igBWehp1rSBBzszQ0ln1Aow=;
	b=jlKwEZLHE0rdEtHai7bGvxskChG8g955+KkWwYKOmoS9HTfeIPwsJn9RBrrciyEg
	pK0TtJnEvRYHrlPJc3v0/a9lseqWyjSsKOrm7GTeXBO7RzrH3vev2QiTTEB3ht13GuQ
	v/vEcjwCuvPZENOzuE41G5CxI57pYlpWlErjr8sg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qMODKVLWgd+BK2Lj7ra2igBWehp1rSBBzszQ0ln1Aow=;
	b=UXPiawgjWI/V9oOJ2h3sO52YuMGAaTWadI4v5sYjQukZrDRQk9AdaeMOQ+CX3bFX
	AFQFjPnJ5jsisCkRdOBD2XBcKJ3OZckYoGXMfLTO0NiHtYuh5IN6rWYFGKrLkCFc4ga
	Oj4BoC0EuHJiRba7shnyyXloqGSxxqxOVp0LazXI=
Content-Type: multipart/mixed; boundary="===============5412172988135208161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.20.0 FAILED
Message-ID: <01010197c6c9e892-b58f68f9-9473-420e-b6f6-3ac67384654c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219621

--===============5412172988135208161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librepo* to *1.20.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe librepo failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b53cc657a14db5848c74277533bcf37df26a7fde"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b53cc657a14db5848c74277533bcf37df26a7fde"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 363cb70c6548be900832bc9b18ced3e7569da15a
WARNING: Command 'git rebase 363cb70c6548be900832bc9b18ced3e7569da15a' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/librepo
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/librepo/librepo_1.20.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5412172988135208161==--

