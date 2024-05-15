Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC8AC3DA61
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1256.1715794339356695323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ObZJ6ght;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MX9+deJr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f7d4fe36b-324b4db0-68d4-4516-a4ef-35a56a14e987-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MpfWe9LTClXfvccd7NDlu8TvK0Uq7hgcFvqkCPooib0=;
	b=ObZJ6ghtm8JfqCQsz/xfljeTG/RJCsFOsMpJBwsdQHJKXWvNKaaW1tOu9Efu2moo
	PtGfz9tGE0g5ZQJS1hm1MO0N0XI00QA2HYo5ONqLHD8o8a5TvAiGq+LBGkULcYtX1jZ
	0Dc1IMO+t+cqM71aQkVMYJXY4VKW+QTuHJDuHw+4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MpfWe9LTClXfvccd7NDlu8TvK0Uq7hgcFvqkCPooib0=;
	b=MX9+deJrb14zp0iGGCfbl/eNS81HVhJtoqB0GIEemYo1VUbxXevNMhAlY6EzNNSI
	ObynqP+vwQBO4xkxsOHfa5XxxHHrUmTzx9+5UfnJ+6eFXgZcvx3HLXK3kMOwA4BcDEy
	gN4EhF/BUUWU2YUqs/8UEbz+2obDhJseoGkctkeo=
Content-Type: multipart/mixed; boundary="===============4466356346435984120=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.21.0 FAILED
Message-ID: <0101018f7d4fe36b-324b4db0-68d4-4516-a4ef-35a56a14e987-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199383

--===============4466356346435984120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-utils* to *2.21.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva-utils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-d4dccbb50d0e208784f4c96282441bb210c147fd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d4dccbb50d0e208784f4c96282441bb210c147fd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 9 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto cbb91aeae935f60eed69880b29ee684391038780
WARNING: Command 'git rebase cbb91aeae935f60eed69880b29ee684391038780' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libva-utils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libva-utils/libva-utils_2.21.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4466356346435984120==--

