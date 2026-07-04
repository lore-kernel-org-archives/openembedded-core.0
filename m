Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF45C43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 05:19:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.106541.1783142386662852865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 22:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uzh+DjRy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uDecKk+1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f2b91882c-846e76b2-e983-4e25-aeae-e33323112d87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783142385;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=blakGX8bwSBHCkdlTWr5CJDb7flakDioGI8loHKJB4w=;
	b=uzh+DjRycSVuuwKlzB8jzHfGW4SSgwzJQzxxygIZqcHRgFBJ0ZSwrmi0NpElen6T
	6P1ldWzTsoK9TqLuorTOsTRWqLb71cMRx441djtHYpeQNwfchHxj3UPx8HMl5kX4rHQ
	HlA6kMsKf17+X+96loavWDX8RRtr4PVOa7ZF9WSA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783142385;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=blakGX8bwSBHCkdlTWr5CJDb7flakDioGI8loHKJB4w=;
	b=uDecKk+1YjxTZumxP3MpAIej2xry0PN4gR/6kqf4C6+6ZXIgxV3JlgGPB/0aYOsn
	7M6a14id6RUJCzAwt95Hu1hwzUtH0x1+mQnwnVXoGjF2q0abP2iSEMyOU+r9oEkSg/O
	mKYMxyt5jRT8L6GtLzqUGjattkxFMeqvyuMldt4s=
Content-Type: multipart/mixed; boundary="===============6180358740957796218=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tiff: upgrading to 4.7.2 FAILED
Message-ID: <0101019f2b91882c-846e76b2-e983-4e25-aeae-e33323112d87-000000@us-west-2.amazonses.com>
Date: Sat, 4 Jul 2026 05:19:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.04-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 05:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240128

--===============6180358740957796218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tiff* to *4.7.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe tiff failed.
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
DISTRO_VERSION       = "6.0.99+snapshot-27a4bf051490562e56c9cb48987a0fbf837b7ece"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:27a4bf051490562e56c9cb48987a0fbf837b7ece"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
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
DISTRO_VERSION       = "6.0.99+snapshot-27a4bf051490562e56c9cb48987a0fbf837b7ece"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:27a4bf051490562e56c9cb48987a0fbf837b7ece"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
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
Adding changed files:  22% |#######                             | ETA:  0:00:00
Adding changed files:  44% |###############                     | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://download.osgeo.org/libtiff/tiff-4.7.2.tar.gz...
INFO: Rebasing devtool onto 4b067ce0fb47b726c77bdc6841642c982c1682fa
WARNING: Command 'git rebase 4b067ce0fb47b726c77bdc6841642c982c1682fa' failed:
Auto-merging libtiff/tif_getimage.c
CONFLICT (content): Merge conflict in libtiff/tif_getimage.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/tiff
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/tiff/tiff_4.7.2.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/tiff.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6180358740957796218==--

