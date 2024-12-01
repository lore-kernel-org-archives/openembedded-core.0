Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA4AD10DA3
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.149805.1733047559132749057
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=U0/HA3VT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DDGHWaqv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019381af20c0-0750d901-27f4-440e-8ec9-a8e8c0da1b05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047558;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lyaalXPMZiLSOQ6vmcVyRvyYTjBisYfwSRJauoUrOmU=;
	b=U0/HA3VTiPvbHVdrRkKDoN4hAqp4/8+asb8qDFko2y1ghsm0KCGnj9L2xL6OuJN+
	M/IbOfBy629WdWX7xAKzVxaroS4ucNYeiFnm3GUeQeUe1LzPBLBqezlA7vmFAGYi/4t
	0JmNOv6l3r9FGj7E4GOM/stKgqYu4Ia7uvgEB1AE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047558;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lyaalXPMZiLSOQ6vmcVyRvyYTjBisYfwSRJauoUrOmU=;
	b=DDGHWaqv5GYmICoaayx/sO2NiiGGH/akO+lz6cXfMMN108W+tJUv+yBqW6Hu80Ba
	czrrQ5i5nYPSfGimTlpIKAFLDINC/T/XWGCpsNr9qyRh5X8X3C+Stm36IQ69UkbrNQT
	wCM+495xgQfv5ExDz9Yaxttkljs/tc8YWtfFuRww=
Content-Type: multipart/mixed; boundary="===============6778674768397407518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtc: upgrading to 1.7.2 FAILED
Message-ID: <0101019381af20c0-0750d901-27f4-440e-8ec9-a8e8c0da1b05-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208070

--===============6778674768397407518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtc* to *1.7.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-dtc failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:87d44a6dbcde87ccd4cc70d723ee3ead9e2148f8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2d10aa2afe35527728db30b35ec491ecb6959e5c
WARNING: Command 'git rebase 2d10aa2afe35527728db30b35ec491ecb6959e5c' failed:
Auto-merging libfdt/fdt_overlay.c
Auto-merging libfdt/libfdt.h
Auto-merging libfdt/version.lds
CONFLICT (content): Merge conflict in libfdt/version.lds

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-dtc
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-dtc/python3-dtc_1.7.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6778674768397407518==--

