Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA017C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18076.1743511397481772925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=isVaTmfs;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FUUmuV+Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010195f160b713-5ec27402-d429-4180-83af-41f7ee2a428e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fBJS5GxJYAxRC9N09d3e7sfW5xUs7ic3qaqplbnslQ8=;
	b=isVaTmfsy2EVV+JLSdpYOTApNH8/1JP34YxXwfRNT4w1FL/qilUVz6sWlbL/0KzU
	1xf2ENCmzjG/WVKoE/Ztv5ShuufDeiCQA5zxPwAJ26TAYel6hItCmSeENo1kgxcdT1a
	hoy5eJw8HfYKga8r+5W+j3VBmEiY9Pmdp5zjl0zs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fBJS5GxJYAxRC9N09d3e7sfW5xUs7ic3qaqplbnslQ8=;
	b=FUUmuV+YiXeRL8FDe/u7n7MjFZMJnORu5KF+T9GiUDqKX+dm7/Iw6F4gfRPVFI8w
	1Dw5TxT/4dwcCINdvQO9oaNplz6KB98PUl1mIJ5vPzw/xK7xDZgSLzuq/NC1G0/KKv1
	oYmOMOXsn0gvO7EWCp2cCrNq1J5/SEqfPx4JCjZc=
Content-Type: multipart/mixed; boundary="===============7314852208939510526=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 6.14 FAILED
Message-ID: <01010195f160b713-5ec27402-d429-4180-83af-41f7ee2a428e-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214079

--===============7314852208939510526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *strace* to *6.14* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe strace failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:f63b6fbfe1ba3df3eae9d012a208cd87547f577e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 925 .bb files complete (0 cached, 925 parsed). 1887 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:f63b6fbfe1ba3df3eae9d012a208cd87547f577e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-mylwxom6: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-kf3hzq3j/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-kf3hzq3j/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  19% |#######                             | ETA:  0:00:00
Adding changed files:  39% |##############                      | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/strace/strace/releases//download/v6.14/strace-6.14.tar.xz...
INFO: Rebasing devtool onto f3fef80b139c1db241ea6a7ea8ac3895ae23a013
WARNING: Command 'git rebase f3fef80b139c1db241ea6a7ea8ac3895ae23a013' failed:
Auto-merging tests/Makefile.am
CONFLICT (content): Merge conflict in tests/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/strace
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/strace/strace_6.14.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7314852208939510526==--

