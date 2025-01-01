Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F8DC02195
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.11485.1735723933835655776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TAYVxQo6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Dk1bp/ym;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101942135b2c6-06c88b40-0daa-447c-801a-ee2a956991ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MYTg9vT3x/9SNJ4ZXZbtr5q6XkSxhqrTweupARt9Eto=;
	b=TAYVxQo6WM2paM+nzMow20StlYMtgHns/VdfnEj5lou4TqNj1fU+hiyk3tKXKrte
	U1gEaCmmVM4OnNNSK/OaTUtlj1RVVkbbJd0LKZ5kmLq8Y5n/bnp5g8THKqihkhrd/jT
	9LgZa1FyE0ov9j4jceQMCfBGAu/SVYTn3osWG+vE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MYTg9vT3x/9SNJ4ZXZbtr5q6XkSxhqrTweupARt9Eto=;
	b=Dk1bp/ymjN9t5f2zqjtgETPfTwQdklgPIbjKUW/MRBFfXAQINlLnPgVoQFzs/BVf
	A+li/Mpj3BhiPlDG3l/qiPuIrzsEuGu9HttX6emV/CAcT+7R7bzwv6xp14vDdWMufJL
	jpQ7WrmDahIIN6ya+aDj3pM+J2/lVhf+/2hBYUJc=
Content-Type: multipart/mixed; boundary="===============6831646658864991397=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libgit2: upgrading to 1.9.0 FAILED
Message-ID: <010101942135b2c6-06c88b40-0daa-447c-801a-ee2a956991ed-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209242

--===============6831646658864991397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgit2* to *1.9.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgit2 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:0f4f2563c491f46811daadf3bc2fe8d9aac1772c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 338e6fb681369ff0537719095e22ce9dc602dbf0
WARNING: Command 'git rebase 338e6fb681369ff0537719095e22ce9dc602dbf0' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt
Auto-merging docs/changelog.md
CONFLICT (content): Merge conflict in docs/changelog.md
Auto-merging include/git2/version.h
CONFLICT (content): Merge conflict in include/git2/version.h
Auto-merging package.json
CONFLICT (content): Merge conflict in package.json

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libgit2
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libgit2/libgit2_1.9.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6831646658864991397==--

