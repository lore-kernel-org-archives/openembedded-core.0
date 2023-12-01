Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1021C18E16
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:57 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.22209.1701436492756974357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ADdLiAz4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OBykxfqv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018c2584899d-54728b92-ce3c-49ad-83f1-7fea30304a9c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iFQSVLtjCRzs9nLj3stOFfiYzja3CQMtBh1QRZqh3ZM=;
	b=ADdLiAz4gzVh2VUPJdFzP1bDgJvckWM3/P5hJg8s8DFYAuVoypj51ki83TiMG7kl
	gG2Gwo4S1I18jrZgYnPrY9zsgnmfgDDqPd2Ip3KxLRzJqC55BNUHVEAJQfja6nx+wsM
	IfXphj/a95IIaNpcF7FF6NyqSYnOl52QUt2uFbcM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iFQSVLtjCRzs9nLj3stOFfiYzja3CQMtBh1QRZqh3ZM=;
	b=OBykxfqvafaUbpIXlaCBCEHZucjQ0KZ6O+QVgIztcU3lX7S5uWjD4hunJNnXhkL7
	hxFewgtlmI2IyicFfQ6FW/GA1QBriKtl3eSEDjqyGvirp5ozxt1TR5Y1nr04pdUY5i9
	e6itI8OPL1kpysZz4OReNafNcepEx/jNeWV1MY2I=
Content-Type: multipart/mixed; boundary="===============3806562376162487900=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.14.2 FAILED
Message-ID: <0101018c2584899d-54728b92-ce3c-49ad-83f1-7fea30304a9c-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191643

--===============3806562376162487900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.14.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe shadow failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7abfca03368ffc1bdb95aeed4719808c907fc5a4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7abfca03368ffc1bdb95aeed4719808c907fc5a4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (911 cached, 2 parsed). 1845 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7abfca03368ffc1bdb95aeed4719808c907fc5a4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7abfca03368ffc1bdb95aeed4719808c907fc5a4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
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
INFO: Rebasing devtool onto 27f74e0c750e7b96e0e6f81dcf369f5ff331e4a1
WARNING: Command 'git rebase 27f74e0c750e7b96e0e6f81dcf369f5ff331e4a1' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 27f74e0c750e7b96e0e6f81dcf369f5ff331e4a1
WARNING: Command 'git rebase 27f74e0c750e7b96e0e6f81dcf369f5ff331e4a1' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 27f74e0c750e7b96e0e6f81dcf369f5ff331e4a1
WARNING: Command 'git rebase 27f74e0c750e7b96e0e6f81dcf369f5ff331e4a1' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 27f74e0c750e7b96e0e6f81dcf369f5ff331e4a1
WARNING: Command 'git rebase 27f74e0c750e7b96e0e6f81dcf369f5ff331e4a1' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/shadow
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/shadow/shadow_4.14.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3806562376162487900==--

