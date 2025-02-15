Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D94FC282C1
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8047.1739623326940396493
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eecCRvd5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0zNh79bQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019509a19f3e-090574cf-1130-4f47-a11e-90478dc75cdc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=glJTUljTRQvCb4joKnzYWf2qFtHkj4kL1xdF6G+U4C8=;
	b=eecCRvd5R9leqyuHOZtjDXIWLxyk7BEavB6ZnDL6gCn0zoBu5jRCiG9n5gwWaIsM
	TFSp3fxwFFzcvyFwA1o3yJAkBHq30jb6/I0J93ZItI35aUhfswgygQoLASc5Z2wRR4V
	C4Wf2jpi9dmhFkmklMjVyOugiD+RAjC0nOUGlqyI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=glJTUljTRQvCb4joKnzYWf2qFtHkj4kL1xdF6G+U4C8=;
	b=0zNh79bQ9Z6KU+wvVy3O6ynKXzmrWEB9PTTBFCgJ+qQ8btZI9lSyvpsp/2hKhV/l
	6wbSWJ0+uyEMmc/hpr3V8cRMEo7PB6m5JjWc1bZDOFWtEY4L6JSF3GrYOjqtMrslYLS
	91RIYCwVVuEca1kXougSvesFz7r7CGmgsEzUyMbY=
Content-Type: multipart/mixed; boundary="===============1826081437693355812=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.17.2 FAILED
Message-ID: <0101019509a19f3e-090574cf-1130-4f47-a11e-90478dc75cdc-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211440

--===============1826081437693355812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.17.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe shadow failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:b1aa31678bc2e40c02bfbcde2bc46cb3498dcbe3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1870 targets, 38 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:b1aa31678bc2e40c02bfbcde2bc46cb3498dcbe3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-vy4gm28q: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-yi0aab3u/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-yi0aab3u/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  25% |#########                           | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/shadow-maint/shadow/releases/download/4.17.2/shadow-4.17.2.tar.gz...
INFO: Rebasing devtool onto 2806e08c3b5ac857db3fbdf9561af8bdefbedf2e
WARNING: Command 'git rebase 2806e08c3b5ac857db3fbdf9561af8bdefbedf2e' failed:
Auto-merging lib/attr.h
CONFLICT (content): Merge conflict in lib/attr.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 2806e08c3b5ac857db3fbdf9561af8bdefbedf2e
WARNING: Command 'git rebase 2806e08c3b5ac857db3fbdf9561af8bdefbedf2e' failed:
Auto-merging lib/attr.h
CONFLICT (content): Merge conflict in lib/attr.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 2806e08c3b5ac857db3fbdf9561af8bdefbedf2e
WARNING: Command 'git rebase 2806e08c3b5ac857db3fbdf9561af8bdefbedf2e' failed:
Auto-merging lib/attr.h
CONFLICT (content): Merge conflict in lib/attr.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/shadow
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/shadow/shadow_4.17.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1826081437693355812==--

