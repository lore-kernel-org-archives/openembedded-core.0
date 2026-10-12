Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5DACA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 05:27:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7282.1791782835913166103
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 22:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OhDOxMvA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oNK42YhL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a12e945350-a7b9ef56-0f47-4738-9bf2-571ec8ca6996-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791782835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+btw0F5f1hshVIB6NjpGxgItLBESj3x+rcFY2SvSqE8=;
	b=OhDOxMvAjXTXohhbLOGyDY12OqaYlRkv2C+ZqaenDGt+q5edLsSYdzKNmAR98vre
	2udKEuT/LH+lWX86KFImROfYW8tyt6fsDZXn4Szj84agHGi/7I0KXyk5LWDyhL9yHDc
	M5dqBGYtYWw5BC3maBFzpaFXsSq7S6k5Vc/UdZLM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791782835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+btw0F5f1hshVIB6NjpGxgItLBESj3x+rcFY2SvSqE8=;
	b=oNK42YhLejYNTitqxoLHkSZQtx3LfO2h8s2/OUCLUCgFWj6+jQnUJhsWrWoZiROc
	P9E8QGtjgpDJCGv+GIXZAPAchXqJ4ghzRhvB6Pw6TB61yqsEaVDBwMELGecdQ0MU1ez
	H8jG/aysU+b+whAblUDRDHYLfO7EGEl6RwmYVkX8=
Content-Type: multipart/mixed; boundary="===============2587777653115141609=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] blueprint-compiler: upgrading to 0.22.2 FAILED
Message-ID: <010101a12e945350-a7b9ef56-0f47-4738-9bf2-571ec8ca6996-000000@us-west-2.amazonses.com>
Date: Mon, 12 Oct 2026 05:27:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.12-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 05:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247608

--===============2587777653115141609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *blueprint-compiler* to *0.22.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade blueprint-compiler -V 0.22.2 -S ed35ac74de0c1bb1f5e852410b97edd1f08904c9
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1992 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-d44567001d6caad6b6676b634dd54bac363f79cd"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d44567001d6caad6b6676b634dd54bac363f79cd"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout ed35ac74de0c1bb1f5e852410b97edd1f08904c9' failed with exit code 128:
fatal: unable to read tree (ed35ac74de0c1bb1f5e852410b97edd1f08904c9)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2587777653115141609==--

