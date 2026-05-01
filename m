Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65379CD37B0
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15720.1777645546674237616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nLAsQntg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GQovmKyG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019de3ee75c7-f6bbc699-d1ae-43fe-9b20-0545eef37aa1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DBNc1KuS0I9YadPudkTOQ10fZECJ87L8FPdo5rkueFE=;
	b=nLAsQntgItLf7xwTa+BeL0no99nsxy5NQdftUc8bnfdYa/YDc5x2Noi6odYT198U
	0azPN+D8RCHQZ4blDastInBrDlfCupM3vqTyARbjUFfMI1sUxIZb25wOMfI4tr8HjwP
	wVc9PjC9JyFzPfdBHefYw3Pk9ejlOGjFqLz+6ZAI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DBNc1KuS0I9YadPudkTOQ10fZECJ87L8FPdo5rkueFE=;
	b=GQovmKyG+ofz0L/htfGi2PazfEM4yeXKyNTqUvvo026u9OPcn+9Lv9W7qVCAQjQJ
	WZC8qdXz5pTAiiblFJvhzrgD8EwVEaNhgdvQqBYy/AZ4n8LT4juqAQq1qgL24BuHohk
	WFVvYqUjQIDEENPQ35G4jWcWek7dloUykjo749WY=
Content-Type: multipart/mixed; boundary="===============8211240335239668347=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] librsvg: upgrading to 2.62.1 FAILED
Message-ID: <0101019de3ee75c7-f6bbc699-d1ae-43fe-9b20-0545eef37aa1-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236266

--===============8211240335239668347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librsvg* to *2.62.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe librsvg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1976 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-36b706643db1c8ad33caed89f57013f2a16757a2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:36b706643db1c8ad33caed89f57013f2a16757a2"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1977 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-36b706643db1c8ad33caed89f57013f2a16757a2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:36b706643db1c8ad33caed89f57013f2a16757a2"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  69% |#########################           | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-36b706643db1c8ad33caed89f57013f2a16757a2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:36b706643db1c8ad33caed89f57013f2a16757a2"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 21 Local 21 Mirrors 0 Missed 0 Current 66 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 292 tasks of which 291 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//librsvg/2.62/librsvg-2.62.1.tar.xz;name=archive...
INFO: Rebasing devtool onto 2664d542661d4b0ff04e26ef7e2bac1acb52605f
WARNING: Command 'git rebase 2664d542661d4b0ff04e26ef7e2bac1acb52605f' failed:
Auto-merging gdk-pixbuf-loader/meson.build
CONFLICT (content): Merge conflict in gdk-pixbuf-loader/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Running extra recipe upgrade task: do_update_crates
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/librsvg
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/librsvg/librsvg_2.62.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8211240335239668347==--

