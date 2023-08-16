Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4734CC2FC1C
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.174042.1692224350391776861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TWf+43X+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SooiQ0lM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a006e655a-bbdbdcd4-b8c2-4871-91f9-af04649b4269-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CXxHTJj5HuDS9l+87PJoQt1Tko3CcqCGPHutvkLmpN8=;
	b=TWf+43X+InUuS1cAdKfDskz8ihtC8uxdlBiJn1lpo6ljRAy+5PDqPCFPgKovxzaq
	/Uwf0h9ncLD+FUuF8Kovgz9YECTtVRTzTjmKO5Juby6rO1hu+pGNI1kDgu/SRDUbcpR
	RplDCHNqyYowd6thsWJ+GFSN0CgKqG3Kz75n49PU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CXxHTJj5HuDS9l+87PJoQt1Tko3CcqCGPHutvkLmpN8=;
	b=SooiQ0lMAWqilUt7B4YX5Nb6ygjjpZGL9Nh3Uc7xC5G3gugqBohSPP2R7jBN2+4z
	oVKh/qir11Grqzvpyx6y+WtnirrguOzZISVreKvndDJwqkhqqpjQFtWcTZM4liwHESz
	TGrfTcgyTU8inqTZ/RGCZlfTqMPLrciq1tjtAt+E=
Content-Type: multipart/mixed; boundary="===============7955149618510592811=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.14.0 FAILED
Message-ID: <0101018a006e655a-bbdbdcd4-b8c2-4871-91f9-af04649b4269-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186212

--===============7955149618510592811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.14.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe shadow failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:40:39.815890)
Loading cache...done.
Loaded 1805 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:92fac3acd6ed634877def47c660ee23f14dec5fb"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:92fac3acd6ed634877def47c660ee23f14dec5fb"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  14% |#####                               | ETA:  0:00:00
Adding changed files:  29% |##########                          | ETA:  0:00:00
Adding changed files:  44% |################                    | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/shadow-maint/shadow/releases/download/4.14.0/shadow-4.14.0.tar.gz...
INFO: Rebasing devtool onto f8b2d05daf114061e881766ba4216db68326b886
WARNING: Command 'git rebase f8b2d05daf114061e881766ba4216db68326b886' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto f8b2d05daf114061e881766ba4216db68326b886
WARNING: Command 'git rebase f8b2d05daf114061e881766ba4216db68326b886' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto f8b2d05daf114061e881766ba4216db68326b886
WARNING: Command 'git rebase f8b2d05daf114061e881766ba4216db68326b886' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto f8b2d05daf114061e881766ba4216db68326b886
WARNING: Command 'git rebase f8b2d05daf114061e881766ba4216db68326b886' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/shadow
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/shadow/shadow_4.14.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7955149618510592811==--

