Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24040C54FC6
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:07 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.131412.1723748333004023832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Pjn5bS5A;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=076JTL4a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101915768395f-b97e8211-ae67-4237-96e6-be88586883d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XsiMKc9kcuToeoZM3LGzYYrhsqTdU2JoB7JzqDeYosM=;
	b=Pjn5bS5AHDs060wR8IQdXXFrIBzfl+lg6zq5dDRrJU08h2dcc4aP6IDqE8JmAmTk
	urin/9veGhmu3PeOFWyFa9JQz2aEOeILYqgzzjdPQ+cYYRRNko19yIi92MUPLwXDGBD
	RXdeA3E+HflzwS0YNj5zfeHEV6WQ9PtZwAhBVgz4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XsiMKc9kcuToeoZM3LGzYYrhsqTdU2JoB7JzqDeYosM=;
	b=076JTL4aPRIYdSzmmh1mxbJYlXOyaaedc9ly1G+3VoBfAdm7I2lyegcMT7tpnnhq
	2ckvZ9A4JOGqUHK/R46m3XvnD3FJDVlJGt4T9TSkJcpcoZmcKV64/P9PnKsX/7NrfSv
	S+wgAJEswwB7tJntvR8shxPe3B5ivXXPWj/ujzck=
Content-Type: multipart/mixed; boundary="===============6326390782784340574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 24.2.0 FAILED
Message-ID: <010101915768395f-b97e8211-ae67-4237-96e6-be88586883d6-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203368

--===============6326390782784340574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-attrs* to *24.2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-attrs failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-00b5ea95dc1b72f6790372c4db2f806dd3a257a2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:00b5ea95dc1b72f6790372c4db2f806dd3a257a2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-00b5ea95dc1b72f6790372c4db2f806dd3a257a2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:00b5ea95dc1b72f6790372c4db2f806dd3a257a2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ujta9r2z: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-mqhggk1c/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-mqhggk1c/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/a/attrs/attrs-24.2.0.tar.gz;downloadfilename=attrs-24.2.0.tar.gz...
INFO: Rebasing devtool onto f25086b518a38aaf49d1eaec2487f528291eee94
WARNING: Command 'git rebase f25086b518a38aaf49d1eaec2487f528291eee94' failed:
Auto-merging conftest.py
CONFLICT (content): Merge conflict in conftest.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-attrs
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-attrs/python3-attrs_24.2.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6326390782784340574==--

