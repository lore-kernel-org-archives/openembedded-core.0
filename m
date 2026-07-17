Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8D8C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:31:47 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7366.1784266302592125322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Zc+Imsz7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rIWjZ0Rn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f6e8f206e-43e7de24-b858-4354-aac5-bf5df097cc0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784266301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fjkDNOnhOf6sICh3Ee15CxF+qUsNIityN5QRSFwKpr8=;
	b=Zc+Imsz7XsjAZnRJ3sSgtY2BpdzJDrYbEzuNXHe9ur01NCebt5HPlhFuDZLZJadq
	B1Ea7kML6t+hhsMsQFfoPY3bvygSdxMHN7fl2hzG3ugg1tVxWtqtpIakRY+l+miiLm0
	F0/wuJ0J4oeQ9CCuhvJ4KGPrugNdnfSfKh7NI12I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784266301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fjkDNOnhOf6sICh3Ee15CxF+qUsNIityN5QRSFwKpr8=;
	b=rIWjZ0RnUIQiMvSSw/eVOitOy7lRQGafad9Oc+sGkdXjllWzcI1HD2YcWCzUrN6m
	ZboMeHujtHmpxjiOceIrj9CeeZlmve220JXYfjaXFcJsBgEcYA4QadkmlmzypPiMXHE
	3Vci9MqhcyVq2wBH70J6t97lpRsz71HKeweFP/gs=
Content-Type: multipart/mixed; boundary="===============9005812739879374346=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtool: upgrading to 2.6.2 FAILED
Message-ID: <0101019f6e8f206e-43e7de24-b858-4354-aac5-bf5df097cc0d-000000@us-west-2.amazonses.com>
Date: Fri, 17 Jul 2026 05:31:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.17-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241123

--===============9005812739879374346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtool* to *2.6.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libtool failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-171af3b2915dd076c8d1b205ff75eac1ebd5a586"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:171af3b2915dd076c8d1b205ff75eac1ebd5a586"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-171af3b2915dd076c8d1b205ff75eac1ebd5a586"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:171af3b2915dd076c8d1b205ff75eac1ebd5a586"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
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
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/libtool/libtool-2.6.2.tar.gz...
INFO: Rebasing devtool onto 2c1cc36dc4dccc3ee977ae0e1b8669810aa08a8e
WARNING: Command 'git rebase 2c1cc36dc4dccc3ee977ae0e1b8669810aa08a8e' failed:
Auto-merging Makefile.am
CONFLICT (content): Merge conflict in Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libtool
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libtool/libtool_2.6.2.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libtool.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9005812739879374346==--

