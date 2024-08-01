Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D38C5320F
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.75744.1722536825139670507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ccNw+eIT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=L6wgtBLb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101910f320c36-41efc53a-2c29-4f05-9264-b63b1936653c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536824;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U0qmBTOavFD5qVdbggUNSWHysfmJI5vYbkXbKWNjbb8=;
	b=ccNw+eITMQaSqtFhbYuJOCOT0ExmZyBYiskC0YP50qauqTQwCrI65+8FLFuctLxN
	54dve8PE8iEzpReb59hV2vfqnjf2jOx5UisE7NR4xXM9+58IbXpgk5N8Q0Fh/o9Ng2I
	wM4k8Y2MtgqqFDZGfHkvY9eK9Q+jOScu7vn/AAEk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536824;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U0qmBTOavFD5qVdbggUNSWHysfmJI5vYbkXbKWNjbb8=;
	b=L6wgtBLbyG2f2mp4gJmtEACeqGe8nKSD0CAyp36wFTyQO1LZ3bulVcF+PvLMUIpa
	tKVdduIOXx8abvu23N5lRNXo9RtkPIVvTul9C2MwJxguI64ijAE+oCk+uv2YyZ/CMdp
	dXk8r7vp/wZQpeoFnQjmlaUVo9MvRUo0ZRZLfQjA=
Content-Type: multipart/mixed; boundary="===============6808931289185000725=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 11.0.2 FAILED
Message-ID: <010101910f320c36-41efc53a-2c29-4f05-9264-b63b1936653c-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202791

--===============6808931289185000725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fmt* to *11.0.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe fmt failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-768d6412082d8046587c77835e89ab0349b936dd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:768d6412082d8046587c77835e89ab0349b936dd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0c9fce2ffefecfdce794e1859584e25877b7b592
WARNING: Command 'git rebase 0c9fce2ffefecfdce794e1859584e25877b7b592' failed:
Auto-merging ChangeLog.md
CONFLICT (content): Merge conflict in ChangeLog.md
Auto-merging include/fmt/core.h
CONFLICT (content): Merge conflict in include/fmt/core.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/fmt
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/fmt/fmt_11.0.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6808931289185000725==--

