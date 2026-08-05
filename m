Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A0DC56201
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:47:42 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34094.1785908851364841734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lvEJcPsC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kStLBrNn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019fd0766e9b-7ce51c58-a638-4805-bf2b-c1b79a448343-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785908850;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=XqmWAj9Occm80XlSqCbrIItUvPF643XKMj1m0CCKNzE=;
	b=lvEJcPsC/Mj6CCy1Afwv4z2W8aczEYTvnCKM1WcXXMYaw9cwpRyKOV14QW/GqxgS
	+mAztbtLNjjK2ScW8XchLf+6lnexr/yBKiVwEXxHdM+lNHB3Dp9MRpQkQcwg/LhJsAm
	BXufQR0nf9WdZT5y0eLsZAJQ5cOAvK0jr1cKkqCQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785908850;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=XqmWAj9Occm80XlSqCbrIItUvPF643XKMj1m0CCKNzE=;
	b=kStLBrNnheATsSF5KKmRj0aVx1ZLx/+UFKuGZPknW0vfznip2BEWHOIMaLQ1hhpp
	C6D0LUJYnSL2JZjBcFFxJxJYoD+/MFicgbej/F6quI2n6Q1EVNTiPyEy76aWZZd/O7I
	5/ZG6fuX927rTXJUggDbibbMo2c0lOWnsRrldK0k=
Content-Type: multipart/mixed; boundary="===============2282680202348355643=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.9.3 FAILED
Message-ID: <0101019fd0766e9b-7ce51c58-a638-4805-bf2b-c1b79a448343-000000@us-west-2.amazonses.com>
Date: Wed, 5 Aug 2026 05:47:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242812

--===============2282680202348355643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.9.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade erofs-utils -V 1.9.3 -S 7db78788b000999e2de88decd2ba90654f26171c
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-c95cee811dc0b1c66cdcbb7d956e313be2509220"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:c95cee811dc0b1c66cdcbb7d956e313be2509220"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https;tag=v1.9.2, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git fetch' failed with exit code 128:
fatal: unable to access 'https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/': TLS connect error: error:00000000:lib(0)::reason(0)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2282680202348355643==--

