Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6429DF013F5
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28986.1773582126202032402
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=a6WpcuJp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bgPwwZp2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019cf1bb8a5c-db0bf33d-c4f8-4b96-815a-f37fd2b22467-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gSE+tUDN1kFbF/ZZMmdJnsj/BugQbmZtWFgtGvKthWU=;
	b=a6WpcuJpBEbsPQWDUS68QSIrFdJWjYhMf+HYSNV8xFd43cSFuiwUt0mErbZmvwCm
	sT+pKi7bF3De4BOSqJFYVfkskpwh5K5lHo7j6iK0IROs5rz0FxgjzE7ppoIl8LFmrdr
	lWw4arCAbxs2/tpyskhSQh1Q5D/WLEWVkCLHBn9s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582125;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gSE+tUDN1kFbF/ZZMmdJnsj/BugQbmZtWFgtGvKthWU=;
	b=bgPwwZp2i+DhBEmL8gvl/7wE0JmejAu6EzJocZFLI8NiuKgkIeI+uilT+mpfHeS5
	gkor1TE1kVQpWTWXXEDKiokC4547xAQ7YElkkHHpsy7OaDpiY8qB0DEKy4etmtw/n6c
	4tGvTuXYx/K6aYy6LxcAqmfUpLiI01PFTd72Iia0=
Content-Type: multipart/mixed; boundary="===============8389355365236598890=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.1.2 FAILED
Message-ID: <0101019cf1bb8a5c-db0bf33d-c4f8-4b96-815a-f37fd2b22467-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233182

--===============8389355365236598890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.1.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe appstream failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-d3c4205c1159410a73640b2bd99b1bafd29e860a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:d3c4205c1159410a73640b2bd99b1bafd29e860a"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

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
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1972 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-d3c4205c1159410a73640b2bd99b1bafd29e860a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:d3c4205c1159410a73640b2bd99b1bafd29e860a"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.freedesktop.org/software/appstream/releases/AppStream-1.1.2.tar.xz...
INFO: Rebasing devtool onto 73b8ab2439318417bf8a07aff4c7e62eb6bf460b
WARNING: Command 'git rebase 73b8ab2439318417bf8a07aff4c7e62eb6bf460b' failed:
Auto-merging qt/meson.build
CONFLICT (content): Merge conflict in qt/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/appstream
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/appstream/appstream_1.1.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8389355365236598890==--

