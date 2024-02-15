Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C24C54E89
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20324.1708018344476467899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MeEwX4Sl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P/a9l6qv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd39f75-148398c0-843c-4c0a-b0ad-ba398416b5df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BuxeT+7/RO/Zatb2f6n0XGrfFswK6BaPm27aKkPaQIE=;
	b=MeEwX4SlY1cyFSmr8iRYq9ZDCtmtEAN62NSnFt4+HQcdWrIw3MddPQmCGxBLyyxH
	VDO5H7nluD/4rOcpKg3akpJIQprgfGJwMMBxu28LS1dF/PyFiefeFr9+Chqzm3BxfAO
	Hc9twO9nHM/Q/2zQelusBzqlS7VfynSuPK+QuVMk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BuxeT+7/RO/Zatb2f6n0XGrfFswK6BaPm27aKkPaQIE=;
	b=P/a9l6qv075qxXRW4y8ZMy8EGOu9FryL6vGw9F7Y3YjzNlPhc3UGH4GFMTyAW/hP
	N3tQmESuruOi7aGZBo0pcOdtDTOorXksltIymj6e0Fh3BRQxWlcbnF/tN50Ki14divR
	rgl59HMXOUEP3G4a5OFh1w/sM7S8EC2gPwkwnp9Y=
Content-Type: multipart/mixed; boundary="===============8798781074593385008=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zlib: upgrading to 1.3.1 FAILED
Message-ID: <0101018dadd39f75-148398c0-843c-4c0a-b0ad-ba398416b5df-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195568

--===============8798781074593385008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zlib* to *1.3.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe zlib failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1857 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-843fab59ebf53e9208cb7fb666aa374d0b819e9b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:843fab59ebf53e9208cb7fb666aa374d0b819e9b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1857 entries from dependency cache.
Parsing recipes...done.
Parsing of 915 .bb files complete (913 cached, 2 parsed). 1858 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-843fab59ebf53e9208cb7fb666aa374d0b819e9b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:843fab59ebf53e9208cb7fb666aa374d0b819e9b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://zlib.net/zlib-1.3.1.tar.gz...
INFO: Rebasing devtool onto 9307d19df4aee56788834f142fcdeaee74c9262e
WARNING: Command 'git rebase 9307d19df4aee56788834f142fcdeaee74c9262e' failed:
Auto-merging configure
CONFLICT (content): Merge conflict in configure

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/zlib
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/zlib/zlib_1.3.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8798781074593385008==--

