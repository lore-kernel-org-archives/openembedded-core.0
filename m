Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F122CA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5424.1790836300712896956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=C4pUTbqT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ICkVXGIt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0f6297068-021a4790-1a15-4779-8e21-48051350780f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836306;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=T9qQER8QZ1HHbvqAmRzZK9XLHJBOi09wzOIbAFDFtuE=;
	b=C4pUTbqTfTfqZ8VgpgQukd3odDyQJMJ8JZ0LGZqM0LsxlFA8zTAGh5BHnyYmPmpb
	jmyomgx90zweTa3+Z9jE8bR+Yf7VXKLXPA7Fuh63aOGMdpvrLXp26LV8yEbL8QEOL+x
	NHzOLtJJcAfwvgT5QEZFjnloLGmom72MowTbHCuE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836306;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=T9qQER8QZ1HHbvqAmRzZK9XLHJBOi09wzOIbAFDFtuE=;
	b=ICkVXGIt38SmUwFdb0IgXCdhzvnJu1YblvOPKUsEOvSttZZ0wCF90lf4BsogRahM
	mAbWC+bCeqo+hWCqzX1go+JKVuAAb+hDRA+VbEevqE/UsRk5OwxMHu65d5pRzvYr2lN
	ElA37nbcQtnlDv83R2eS72HnwziYhqDu161N2tks=
Content-Type: multipart/mixed; boundary="===============3208145632809882644=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.8.0 FAILED
Message-ID: <010101a0f6297068-021a4790-1a15-4779-8e21-48051350780f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247010

--===============3208145632809882644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsoup* to *3.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libsoup failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-f98b050058a98e20125588a9df3accb3d99630e3"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f98b050058a98e20125588a9df3accb3d99630e3"
meta-yocto-bsp       
meta-poky            = "master:01f504740bcfa42ff53f4b3341a0dcee275fa6bd"
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
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1992 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-f98b050058a98e20125588a9df3accb3d99630e3"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f98b050058a98e20125588a9df3accb3d99630e3"
meta-yocto-bsp       
meta-poky            = "master:01f504740bcfa42ff53f4b3341a0dcee275fa6bd"
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
Adding changed files:  72% |##########################          | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//libsoup/3.8/libsoup-3.8.0.tar.xz;name=archive...
INFO: Rebasing devtool onto 81314243531348867135a83dc28c6bcf3c2d037a
WARNING: Command 'git rebase 81314243531348867135a83dc28c6bcf3c2d037a' failed:
Auto-merging libsoup/websocket/soup-websocket-connection.c
CONFLICT (content): Merge conflict in libsoup/websocket/soup-websocket-connection.c
Auto-merging libsoup/websocket/soup-websocket-connection.h
CONFLICT (content): Merge conflict in libsoup/websocket/soup-websocket-connection.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libsoup
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libsoup/libsoup_3.8.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libsoup.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libsoup.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3208145632809882644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libsoup-changelog.txt"

Changes in libsoup from 3.7.3 to 3.8.0:
Changes in libsoup from 3.7.2 to 3.7.3:
Changes in libsoup from 3.7.1 to 3.7.2:
Changes in libsoup from 3.6.6 to 3.7.1:

--===============3208145632809882644==--

