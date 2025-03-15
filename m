Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A14CC369C4
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:44 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.10360.1742048293526563129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FkqAP7rd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rpUPC3ty;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101959a2bbb83-d8ea8967-7b74-4a05-a7fc-c8b4833ba6e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048312;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b2yvuJ9CkRIZkY9u32aULjhCB+FiPtIvoHh2IsT+uzg=;
	b=FkqAP7rdMWojivgnmRp1lgZcD9h1qXc/MOZDR3Wo+mH2ze7jAdvp/uFxn3F92km4
	xO6soYsZfRnwXCAXm0TvVcd9XmpbJdCWFP0bOCXl4nTOIWDDfXBAtWw4DqsbQFiKpOF
	8dCVwcwXeDkCZLmg+M9IbYsGt31iFRFsDr72f87k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048312;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b2yvuJ9CkRIZkY9u32aULjhCB+FiPtIvoHh2IsT+uzg=;
	b=rpUPC3tyD2IQlI6aGRt7DGYUfDqbdQurKkYhaHDlgg9lfa5l7pzxf5Gs0w3t5Igo
	K9n0aXV+7XcTfQ16O7Z3lkkCLuZVSuPnzivXmHPgGC2+u0wH4tCYXyPxu+0ZBttoTVe
	RA3ZYuaJZl8XJLqiTOJ9wpEUnW/m9ywkYf2HzIZk=
Content-Type: multipart/mixed; boundary="===============1289403884378162505=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 bbb427f09147f811b1bab16fedb028517da9ed48 FAILED
Message-ID: <010101959a2bbb83-d8ea8967-7b74-4a05-a7fc-c8b4833ba6e0-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212955

--===============1289403884378162505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *bbb427f09147f811b1bab16fedb028517da9ed48* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S bbb427f09147f811b1bab16fedb028517da9ed48
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:9164dbdcd47f9c4ea7183b9c4b89072e5718a3ea"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto bbb427f09147f811b1bab16fedb028517da9ed48
ERROR: Execution of 'git rev-list devtool-base..8db8ce9c528330f0b1261b07531b009732b08731' failed with exit code 128:
fatal: Invalid revision range devtool-base..8db8ce9c528330f0b1261b07531b009732b08731



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1289403884378162505==--

