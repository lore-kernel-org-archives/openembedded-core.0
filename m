Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3D6C54EBC
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1267.1710522011054565494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dLy/l2Q4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UUeMaF+r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e430e8ae2-24c4d602-f1a7-4982-aad6-4722bad27d71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522010;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=hyh38ACgrOxw6KmVTt39F8ZeSm5BrMRIl2IFmvEWYY4=;
	b=dLy/l2Q4UDCC0GjxcixViT0VNNzzngb7UewguYncppSUSquiME+Aw6/YvT6OtDit
	Fy1L274l8WZUFiqaahVMoDpS/zDYeJQNqidGOtZ25np23vVSK5IF6MpiCyz3s2Qa5vz
	RhhMqMWcJho9Ef1rLQIzFYWuFOKrIyYRLsUr6ZZk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522010;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=hyh38ACgrOxw6KmVTt39F8ZeSm5BrMRIl2IFmvEWYY4=;
	b=UUeMaF+rCH+ztjSYhKnp9CzQmYkFL+c/9tF3pwEFGgjwUNcDygnwI1x7YJxvZi4D
	8zMRTqCALFZ6GMah28g5TVywXXgK+1btgKdjJ0fo51h92HcG4KYDodmYwt4Z8orQchd
	Ps1t0WLecKRFbg7PXzBfzWDjIJQZay/kW0BUokq0=
Content-Type: multipart/mixed; boundary="===============4395506468167085499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.22.6 FAILED
Message-ID: <0101018e430e8ae2-24c4d602-f1a7-4982-aad6-4722bad27d71-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197152

--===============4395506468167085499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.22.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe dpkg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-9dbee6ddd55b6670c5f86453f1a67736dfeb239e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9dbee6ddd55b6670c5f86453f1a67736dfeb239e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b2f9600ead232a2dd3c27f8b52807a9ca5854d17
WARNING: Command 'git rebase b2f9600ead232a2dd3c27f8b52807a9ca5854d17' failed:
Auto-merging data/ostable
Auto-merging data/tupletable
CONFLICT (content): Merge conflict in data/tupletable

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto b2f9600ead232a2dd3c27f8b52807a9ca5854d17
WARNING: Command 'git rebase b2f9600ead232a2dd3c27f8b52807a9ca5854d17' failed:
Auto-merging data/ostable
Auto-merging data/tupletable
CONFLICT (content): Merge conflict in data/tupletable

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/dpkg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/dpkg/dpkg_1.22.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4395506468167085499==--

