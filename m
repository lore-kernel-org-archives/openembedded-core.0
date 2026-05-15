Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6390DCD5BA4
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34813.1778851223005675442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mCg8W39b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AkGuhR/u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e2bcba9fd-19846010-299f-4b4f-8ec4-4e8ecf0bf713-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MesgCz+NkMDL8bKIxw6vsi0b7TnQgFVK5onFbfHNoT4=;
	b=mCg8W39bdZfyfDU9nzjvyaos7OixMDq8wQZHQKW7mRqjoCPgMKC5suLVBLSC9jxh
	P9GiXOA7cmo4CCDVdkTyAXvxFGZtEWryf+Kdy2KJcC3AsjsVOFB6XrSA9Ji71Wf7LCY
	oimkV3EtmX6oBLQirk+zCEvRFjBH4e4OEC/3UYgk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MesgCz+NkMDL8bKIxw6vsi0b7TnQgFVK5onFbfHNoT4=;
	b=AkGuhR/uGAxl1wR/YQrJSrQBUIN69UuT3sfY5T2CU7qnnFN4XcfzLPYdamxvrPJM
	6BfMfzTAsPqeXh2gbn9INdhiGofozgz2+7SXSQnK9qF8lpLEwzhQ/FyXZ7f51e7go8e
	teiTv3YIaeJDJf1+CxGpKivXLOvpA3Vn0E7GHQ7c=
Content-Type: multipart/mixed; boundary="===============2631735620630004916=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffstat: upgrading to 1.69 FAILED
Message-ID: <0101019e2bcba9fd-19846010-299f-4b4f-8ec4-4e8ecf0bf713-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237103

--===============2631735620630004916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffstat* to *1.69* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe diffstat failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1974 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4fb5a5f4004ef56097aee45767bfd36d1fe374a2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4fb5a5f4004ef56097aee45767bfd36d1fe374a2"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

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
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4fb5a5f4004ef56097aee45767bfd36d1fe374a2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4fb5a5f4004ef56097aee45767bfd36d1fe374a2"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://invisible-mirror.net/archives/diffstat/diffstat-1.69.tgz...
INFO: Rebasing devtool onto 33a45baa692a885a826d0a1de8a61583ccc0df63
WARNING: Command 'git rebase 33a45baa692a885a826d0a1de8a61583ccc0df63' failed:
Auto-merging configure.in
CONFLICT (content): Merge conflict in configure.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/diffstat
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/diffstat/diffstat_1.69.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2631735620630004916==--

