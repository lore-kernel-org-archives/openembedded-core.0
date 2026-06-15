Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14593CD98E1
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 05:18:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123079.1781500726492177939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BdfElGph;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=V1vi/XWV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ec9b7c95b-948d8b84-8485-4623-95c9-e0b82b8b2df8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781500725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s2JZ7s0zZquzR1tgjYkyNsPk06mbbaEluObJFdDY+v8=;
	b=BdfElGphO+OUK9uYJfqAZG+G/U838N/ZE0PziDvxyx/yuMIAvppM55x3vj3AdD4e
	tK3zWhHdJLnrxsroWGdOv95TmeL14I0P1hQuWz6FNd9CjsDCMzn5moMHcxcyyquxqRc
	WrnBZaNxuEUwwI7KNAM5WHFTuoOXtfeM01scikqU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781500725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s2JZ7s0zZquzR1tgjYkyNsPk06mbbaEluObJFdDY+v8=;
	b=V1vi/XWVfGot4sReScA1rTv7KDZuKXrDgoEJIQdQkFxovyLYZtYva+F/gPeGx2Bf
	/Wf2pOZz0B9zMW2GUAPR1hmDxbFjqACRph7URb4+AfSznkgbSwsX4z54UXdF6irTJqv
	zu+FXr4ZaZLlZZloc1vC0BizeNwR1oKmgiNDcncU=
Content-Type: multipart/mixed; boundary="===============4229942372114774974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.16.1 FAILED
Message-ID: <0101019ec9b7c95b-948d8b84-8485-4623-95c9-e0b82b8b2df8-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jun 2026 05:18:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 05:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238806

--===============4229942372114774974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-ucm-conf* to *1.2.16.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe alsa-ucm-conf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a1213a50cc43f9e8470bf85708deaf9fc564183e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a1213a50cc43f9e8470bf85708deaf9fc564183e"
meta-yocto-bsp       
meta-poky            = "master:f49de2f33e37ca971d64215cc1a3669312e1e7c3"
workspace            = "<unknown>:<unknown>"

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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a1213a50cc43f9e8470bf85708deaf9fc564183e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a1213a50cc43f9e8470bf85708deaf9fc564183e"
meta-yocto-bsp       
meta-poky            = "master:f49de2f33e37ca971d64215cc1a3669312e1e7c3"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.16.1.tar.bz2...
INFO: Rebasing devtool onto d3df2ecaa8d0e2bac57527a16380274578697209
WARNING: Command 'git rebase d3df2ecaa8d0e2bac57527a16380274578697209' failed:
Auto-merging ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
CONFLICT (content): Merge conflict in ucm2/codecs/da7213/HeadphoneMic2DisableSeq.conf
Auto-merging ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf
CONFLICT (content): Merge conflict in ucm2/codecs/da7213/HeadphoneMic2EnableSeq.conf

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/alsa-ucm-conf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/alsa-ucm-conf/alsa-ucm-conf_1.2.16.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4229942372114774974==--

