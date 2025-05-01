Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1893BC3ABCC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:34:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1801.1746113610926977850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iezP0Q0i;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qGBwZo/t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101968c7bb7dd-f60b2491-a393-471c-869f-068ebef210c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113640;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7WONn4F2CGhH4GWMKV/p634CMk2ZBVKD7wQzX7UDx1I=;
	b=iezP0Q0ior38uq3TcrG3yqckOyil2PxAyTr9VuQYWzPghN0FLCA/0rHySIJ042c9
	Ad3QfO6duAfZUst2nFaPUEZzetmFW0C3ykapNjuIEx7IdH4bQ485O/znsWXq8HEYfw3
	wCMdnlu3UOFWWG4ecrLx3SQaZ18dC/7bmbHEGV04=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113640;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7WONn4F2CGhH4GWMKV/p634CMk2ZBVKD7wQzX7UDx1I=;
	b=qGBwZo/t/Ar6b2eakzfwTnQPXPKO38I1gbFTyX0SzPChBmvo1azIY6cyTF9IrbuY
	JbjQ+ZEdr3O7mp6ufRrhhnaxrYQZN3aiUyRWKu8moi1MVWfJI2OjDYgYpuy70hbXzX+
	Sk8O7PHx+zePkqkMDgxz/nztxhfL3P/bCgN9+waM=
Content-Type: multipart/mixed; boundary="===============1857265058805753011=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.76 FAILED
Message-ID: <010101968c7bb7dd-f60b2491-a393-471c-869f-068ebef210c4-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215894

--===============1857265058805753011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap* to *2.76* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libcap failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
Removing 1 recipes from the x86_64_linux sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:55bd74aa7c4914eb89f3484d1b7ee385fa2dbd56"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 929 .bb files complete (0 cached, 929 parsed). 1898 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:55bd74aa7c4914eb89f3484d1b7ee385fa2dbd56"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-fhyen49c: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-njuq5wog/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-njuq5wog/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.76.tar.xz...
INFO: Rebasing devtool onto 193c8683d313659014c9c3a094ff37c301b3d329
INFO: Rebasing devtool-override-class-nativesdk onto 193c8683d313659014c9c3a094ff37c301b3d329
WARNING: Command 'git rebase 193c8683d313659014c9c3a094ff37c301b3d329' failed:
Auto-merging libcap/execable.h
CONFLICT (content): Merge conflict in libcap/execable.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libcap
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libcap/libcap_2.76.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1857265058805753011==--

