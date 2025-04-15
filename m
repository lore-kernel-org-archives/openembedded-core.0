Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C15C369C0
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:32:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20151.1744723973839716250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QKGr0DHh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=P0OmEAUd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019639a7147e-3e11c3cc-3edb-46f7-b24a-bc07763b9aaf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723973;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1biWmy1wWQnctonWdnatYMLX2h0ZPspCXzNQGb6SLUM=;
	b=QKGr0DHhi8DWktW/C159yZba0KXSxE6YXYbS3SB3KgKR69gcvRg3u27rkEK0jWyh
	Jo1UzEU1/FAPlnmnpFFuMmHbJ2IjSyO7HZQsaFxtdKnGXiDiRraxjd2YFMisquvrFMY
	LYqI/nsXK8f4JQDqHauRz83d7QzOCm60IP0MohiU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723973;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1biWmy1wWQnctonWdnatYMLX2h0ZPspCXzNQGb6SLUM=;
	b=P0OmEAUd61IL3yFAt+q40xxzKJlYFofC5YJKrKeU6zHvzmW+VBIsue60CxOue2cY
	fS9TOiYXgp8Xob65nIKTVd6TtZQ1dXhtHgb8wKm2TfKCZYkrNQS1ERKlhpKiwG7bKgN
	yp6JDGunMouZNNsuIMkM+Lms2qTh82cyfbDs/fZ8=
Content-Type: multipart/mixed; boundary="===============5511571570112394759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] coreutils: upgrading to 9.7 FAILED
Message-ID: <0101019639a7147e-3e11c3cc-3edb-46f7-b24a-bc07763b9aaf-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214863

--===============5511571570112394759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *coreutils* to *9.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe coreutils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:814dde9a66b22f29adde62a3eaad5c5090245629"

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
workspace            = "tmp-auh-upgrades:814dde9a66b22f29adde62a3eaad5c5090245629"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-qjvlq5xw: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-vgbqhm21/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-vgbqhm21/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  24% |########                            | ETA:  0:00:00
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/coreutils/coreutils-9.7.tar.xz...
INFO: Rebasing devtool onto 76267dc591e873d1e58ce7bfeef68c1983a33eef
WARNING: Command 'git rebase 76267dc591e873d1e58ce7bfeef68c1983a33eef' failed:
Auto-merging NEWS
Auto-merging src/ls.c
CONFLICT (content): Merge conflict in src/ls.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/coreutils
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/coreutils/coreutils_9.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5511571570112394759==--

