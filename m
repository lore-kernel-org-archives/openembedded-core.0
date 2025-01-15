Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A645CC021A8
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.17799.1736936769402549075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QZWUe0fK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VKX7uuJk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194697feb50-c6042b71-aaf4-4851-8dcc-5c26ba85c4db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936778;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4YceSnS64To56zdaOpgcXZ3lLZ6E7fcWINxm47icskA=;
	b=QZWUe0fK0ew2ZtwhVahUwpfYur5GdnPkvxe8k6EDuZLwGTItfQcp5rO6eyPA7pU6
	zUpj56JBqeRDf5x7elJZVaTe7+0RsPCp+NKI8ROJP09NN3TuHIJcq1SZ4QOR8wpT9of
	5APxehHEFX5t48QE+HAht0USSiV7PRbBR7r4zYWk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936778;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4YceSnS64To56zdaOpgcXZ3lLZ6E7fcWINxm47icskA=;
	b=VKX7uuJkNwm+UlXhjkAueA9iC73mpC9jQBes1n9gS2h9uxVU/KW3XJ3YNuYUYL6s
	PTEMFZ8KoUdtzWnzXivrNu87Ywp2OeDq08tfM9RFOjtq4gnUFJGed5Qghl8THIn7KoK
	+xOPiMvhwpgHdSerW89RHQbGAEoShGVkbH5TxHwM=
Content-Type: multipart/mixed; boundary="===============1222768254386897415=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 271b1e91e2b3027488303717b3aef9cf45367e1e FAILED
Message-ID: <01010194697feb50-c6042b71-aaf4-4851-8dcc-5c26ba85c4db-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209875

--===============1222768254386897415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *271b1e91e2b3027488303717b3aef9cf45367e1e* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 271b1e91e2b3027488303717b3aef9cf45367e1e
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
workspace            = "tmp-auh-upgrades:59986e60ecfb5aa0a49b45b253d20beb13f50e2f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 271b1e91e2b3027488303717b3aef9cf45367e1e
ERROR: Execution of 'git rev-list devtool-base..8db8ce9c528330f0b1261b07531b009732b08731' failed with exit code 128:
fatal: Invalid revision range devtool-base..8db8ce9c528330f0b1261b07531b009732b08731



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1222768254386897415==--

