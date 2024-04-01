Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4699DCD13D4
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.44643.1711994601508465196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WDxJkNm7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mBIptTYh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad47d5a-ff4404b1-d40d-441f-b162-d5eadfe3212f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=/MbXvc7R0fE7o1V25xPKyU8Z4sRKCtgY0+35YmaVfV8=;
	b=WDxJkNm74DCeM5VfJ2aCnZurupJG5OmXZ8KDpcxqvdlq+BNJLDDfWQfwKGhCYkVI
	17bmprhq4VTigHDHFCAEDzqdc0QBB/shMhMMsTDe8cYny9rzhMjeLrtLjoBQxz3571N
	jYp8w/nJ4jiR9fDo59+LH6QWECGOJzXGxRGv85Fs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=/MbXvc7R0fE7o1V25xPKyU8Z4sRKCtgY0+35YmaVfV8=;
	b=mBIptTYhCcphOJVqO5ccDxIuYf91SE+IOk8YtUGt8t0jJtaa8IZwLjxIht6jZIsX
	dQlFdh8QmFzDItHoZKMSJPfKgp5f+nZmX82yLoonIESe9qrDZo+RrLKR7TeEApA4kRW
	g2IYnZtwy28WnW3U14w7E7b3nonY7B+nwX+5lRag=
Content-Type: multipart/mixed; boundary="===============7561338354685951458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.22.6 FAILED
Message-ID: <0101018e9ad47d5a-ff4404b1-d40d-441f-b162-d5eadfe3212f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197712

--===============7561338354685951458==
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
Loaded 1874 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d24cf875caea70061d467ae278be54b6249595d5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d24cf875caea70061d467ae278be54b6249595d5"

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
--===============7561338354685951458==--

