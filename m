Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22759C10DC1
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.8666.1698848705631895714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NtPJAs3Y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GnYMWO48;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b8b460a2b-2a951ec2-af9f-414d-b925-58b651eeb823-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M+ahZK94vkICjN75pzayQ0UG1N06ZcBqGuhQPu/qzEU=;
	b=NtPJAs3Yoccl4/qsh7cwn0JgxGJOJhL5SQCilF9mI4tXFWZxacWN+oh6A5u/P5KE
	WT7XuT6YbSUTQ7bHNzM9X8Sp137ptzJtugnzGUeunmxQ0wCxmeZep6UaUD+TH3uDuzU
	j+2YVEJHaoY0jc3/86fLvi9pzCyL70IhaRYvKQN8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M+ahZK94vkICjN75pzayQ0UG1N06ZcBqGuhQPu/qzEU=;
	b=GnYMWO48NaMvn/T00Am6JtrFu0lD9Oopd6dTRm/jQCMb+P96NPhX1PwO7YE2OfXO
	u+r6VMHFLWbFDUtdviBOMeRLPF6Pul/Np9eENlXTTzC8mZEyXYd5ZDXAUbeKuiI/gje
	H4CwtIM75Tinzrp6r4rKblC6577T2MIMfPrCtbTk=
Content-Type: multipart/mixed; boundary="===============7105214923497880504=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.14.2 FAILED
Message-ID: <0101018b8b460a2b-2a951ec2-af9f-414d-b925-58b651eeb823-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189984

--===============7105214923497880504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.14.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe shadow failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (11:39:39.053343)
Loading cache...done.
Loaded 1842 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-8795064872a157a7d497372a40d7629cdff5e2d3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8795064872a157a7d497372a40d7629cdff5e2d3"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1842 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-8795064872a157a7d497372a40d7629cdff5e2d3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8795064872a157a7d497372a40d7629cdff5e2d3"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  13% |####                                | ETA:  0:00:00
Adding changed files:  26% |#########                           | ETA:  0:00:00
Adding changed files:  39% |##############                      | ETA:  0:00:00
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/shadow-maint/shadow/releases/download/4.14.2/shadow-4.14.2.tar.gz...
INFO: Rebasing devtool onto 9554fe2adccdb268285ed93d0a563fca68877095
WARNING: Command 'git rebase 9554fe2adccdb268285ed93d0a563fca68877095' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 9554fe2adccdb268285ed93d0a563fca68877095
WARNING: Command 'git rebase 9554fe2adccdb268285ed93d0a563fca68877095' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 9554fe2adccdb268285ed93d0a563fca68877095
WARNING: Command 'git rebase 9554fe2adccdb268285ed93d0a563fca68877095' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 9554fe2adccdb268285ed93d0a563fca68877095
WARNING: Command 'git rebase 9554fe2adccdb268285ed93d0a563fca68877095' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/shadow
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/shadow/shadow_4.14.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7105214923497880504==--

