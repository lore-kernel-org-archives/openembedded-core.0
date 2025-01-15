Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7C3C0219A
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.17804.1736936774252292817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=feZB2jXQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=AKyOu/ZF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194697fd85a-2e7247bd-b4b6-42c9-8fd6-0ec666b0ab71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6iiG1MIP9P2/2yiIBERIwIVKY06u2lJle7NRqd6PpaE=;
	b=feZB2jXQF+om8K6fE75Kz9fgx305zXoq1WreBVriiyx7OG0yjC6uVokPc+yO8khz
	/LxkDuSYjiDYjYjqqkT6u3J4Zcp6/LLBpL4v+GoY/ENzFYdOcvJtFtj62TX/Z61bpmk
	vICc/a7QJF4aLeuYR+CSMpEkNYwNQ1tArOEZIeVk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6iiG1MIP9P2/2yiIBERIwIVKY06u2lJle7NRqd6PpaE=;
	b=AKyOu/ZF4/H/ud10qDwddlBJ142DI0izG1+3ovN54dvzFweYsRKzYxNoiYSY9rmy
	MoHQCX7a8yU3z+EAMkPgg5COInP2/pCGqOtKzuzSF86qEpW1iphZmbgxy4ZA+dzLF2F
	oyHogonlbsDXM2ACFtvWT4XmKo2vM2Dgj3vPuwhs=
Content-Type: multipart/mixed; boundary="===============3264915601997748258=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.17.2 FAILED
Message-ID: <01010194697fd85a-2e7247bd-b4b6-42c9-8fd6-0ec666b0ab71-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209859

--===============3264915601997748258==
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
Loaded 1874 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:f89904de6bd0576ad164bf547d6945b153ed2603"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:f89904de6bd0576ad164bf547d6945b153ed2603"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ifa6tceh: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-mn_lz573/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-mn_lz573/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
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
INFO: Rebasing devtool onto 9f23f23231c655c48a7ee1a7d13125b74616835f
WARNING: Command 'git rebase 9f23f23231c655c48a7ee1a7d13125b74616835f' failed:
Auto-merging lib/attr.h
CONFLICT (content): Merge conflict in lib/attr.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 9f23f23231c655c48a7ee1a7d13125b74616835f
WARNING: Command 'git rebase 9f23f23231c655c48a7ee1a7d13125b74616835f' failed:
Auto-merging lib/attr.h
CONFLICT (content): Merge conflict in lib/attr.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 9f23f23231c655c48a7ee1a7d13125b74616835f
WARNING: Command 'git rebase 9f23f23231c655c48a7ee1a7d13125b74616835f' failed:
Auto-merging lib/attr.h
CONFLICT (content): Merge conflict in lib/attr.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/shadow
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/shadow/shadow_4.17.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3264915601997748258==--

