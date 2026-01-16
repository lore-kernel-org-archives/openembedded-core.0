Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED04D48981
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1431.1768526746413650279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2SFFM3dS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=awWLgolE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019bc4689048-fee2297a-c740-4491-bf80-f55215365664-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qBSqvxg7CQhQVNU3VV3r1bTTvrAhmnP8Be/o/E7XmZA=;
	b=2SFFM3dSq2EAuHE7Wn7dHgTTanZaT9765M9o/decK9qeRy/KRuwNeqDUjhE97T9V
	bILmK1suFFdWqBw0gbvMHWQL0/DLbDqyI//tN0zA10DSZ+BvRSigTmgvA0lka2unOU3
	eMOM2bZOkHB2PlR6jmbh2n6VEFZBU4p5yZ9OGKc4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qBSqvxg7CQhQVNU3VV3r1bTTvrAhmnP8Be/o/E7XmZA=;
	b=awWLgolE+nv4bUM8Wt2TVpED1RMFj00BJcyGf1Z02gzUfHJHF5pGnIXEWGnoftRw
	hzu4/SFRpXfKG2LaBP2f2+iJn+cSWSf/7Rmv8v0jamh+0sWhcdq3XVAlErj4eYXXgfm
	DKleIS6S2Ju4u5uXgDk9P7rdWdi5AwzVcufhUbS8=
Content-Type: multipart/mixed; boundary="===============3838275910633397374=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.23.3 FAILED
Message-ID: <0101019bc4689048-fee2297a-c740-4491-bf80-f55215365664-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229458

--===============3838275910633397374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dpkg* to *1.23.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe dpkg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-a20668971d8cd897ce6fda913b6337c3983a9c2b"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:a20668971d8cd897ce6fda913b6337c3983a9c2b"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto f3ad53337eaee92cbeb1a7c73e98d552c3a8186f
WARNING: Command 'git rebase f3ad53337eaee92cbeb1a7c73e98d552c3a8186f' failed:
Auto-merging debian/changelog
CONFLICT (content): Merge conflict in debian/changelog

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto f3ad53337eaee92cbeb1a7c73e98d552c3a8186f
WARNING: Command 'git rebase f3ad53337eaee92cbeb1a7c73e98d552c3a8186f' failed:
Auto-merging debian/changelog
CONFLICT (content): Merge conflict in debian/changelog

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/dpkg
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/dpkg/dpkg_1.23.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3838275910633397374==--

