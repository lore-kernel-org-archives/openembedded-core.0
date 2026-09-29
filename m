Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586AACA5FBB
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1853.1790662724730591626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SmR+kw32;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dX44O8HH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0ebd0c914-120f006b-f5c1-4828-b6f7-139a10e76028-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PSW9HirzPjaZisfORZ4tmCw53uPdHD7+INcUBwtgm3c=;
	b=SmR+kw32IO2wBmTq/cH9SNEBiQjzIzxeawHIjAL1v+r/5XudNrfHbbxsh5y2IbCF
	0S6878b1mDsI4DKLkJfOlRq8WgY3xqs0wbj4pvACrMhFbEOP+K6U3nYr76Qmu6tSq4o
	/HIQxzZNiTl73Rrp13wuLw4Y5Eq9gQKMDUY40bF4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PSW9HirzPjaZisfORZ4tmCw53uPdHD7+INcUBwtgm3c=;
	b=dX44O8HH8T+G7aVp25bCiL18ekfpPkLg6wQp0HZspQApvWu8BH9okQlwMQ1R98Wr
	YEi4RTXY7c9FSKqRlb9EU3ERCRJ8Ce5qq8a05T1KlVQiHO+rYvV4cp4cBWmZLGkoSTW
	+pu+1Djqf2f7sXSABLrt90C936nvLgyNDBBSyxoE=
Content-Type: multipart/mixed; boundary="===============8592313758188285852=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.2.1 FAILED
Message-ID: <010101a0ebd0c914-120f006b-f5c1-4828-b6f7-139a10e76028-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246834

--===============8592313758188285852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.2.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe appstream failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-eb8906285e182317e8c30f56732ef1aa5116a70d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:eb8906285e182317e8c30f56732ef1aa5116a70d"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
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
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1992 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-eb8906285e182317e8c30f56732ef1aa5116a70d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:eb8906285e182317e8c30f56732ef1aa5116a70d"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
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
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.freedesktop.org/software/appstream/releases/AppStream-1.2.1.tar.xz...
INFO: Rebasing devtool onto e8d182c5df491f7c3666678de4aa58d2a8ecf398
WARNING: Command 'git rebase e8d182c5df491f7c3666678de4aa58d2a8ecf398' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/appstream
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/appstream/appstream_1.2.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/appstream.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/appstream.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8592313758188285852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="appstream-changelog.txt"

VmVyc2lvbiAxLjIuMQp+fn5+fn5+fn5+fn5+ClJlbGVhc2VkOiAyMDI2LTA5LTI4CgpGZWF0dXJl
czoKQnVnZml4ZXM6Ck1pc2NlbGxhbmVvdXM6CgpDb250cmlidXRvcnM6CiBGZWxpeCBIw6Rja2Vy
LCBNYXR0aGlhcyBLbHVtcHAsIE1heGltIENvdXJub3llcgo=

--===============8592313758188285852==--

