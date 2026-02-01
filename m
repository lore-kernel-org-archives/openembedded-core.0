Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1F3E6526B
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29193.1769951570445539798
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=S2kuYpI3;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AVI5iULU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955beb8-6904659d-47c7-483e-87ed-2835a5d44690-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dkEkfgNNGsg5T0feJtP7TjwpxtyUXG0bDzE02/xaLOc=;
	b=S2kuYpI3xGpXLbWJfJHAVfoJqq83tf17SuPYL9HPKwQhE08faGqw+cQ6TXn4amuX
	BsdZ6VlOioawG4GYx+ZQQvcxetVrhDMhIuc/v5W/zb0XOkWIFydiGsP1gMQP5HT7feC
	Mb/Vg3odGKVh5IyvJa5i5pLdFL4Qo3ctfMGRIWxQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dkEkfgNNGsg5T0feJtP7TjwpxtyUXG0bDzE02/xaLOc=;
	b=AVI5iULUlrKvC1bvBPwiztSB1MWJwoGlRfo93ZOkR3pyxY7Jly5sHG1UEPcSyNqq
	HmqwDc2AV9XYzEn2P41hF6qPt1XjVJso2uRaErtM4FI+dXrVQx7Uw5WuDjsBlYA+MH1
	6XoX1EBY4VOwn4P9EnBm5o2XznBJoQLGioE3P34s=
Content-Type: multipart/mixed; boundary="===============1996612702933176014=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.44.5 FAILED
Message-ID: <0101019c1955beb8-6904659d-47c7-483e-87ed-2835a5d44690-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230305

--===============1996612702933176014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdk-pixbuf* to *2.44.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gdk-pixbuf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-8fc2dd24743d52d7332cd0cdbcde8073419ea8bd"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:8fc2dd24743d52d7332cd0cdbcde8073419ea8bd"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1958 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-8fc2dd24743d52d7332cd0cdbcde8073419ea8bd"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:8fc2dd24743d52d7332cd0cdbcde8073419ea8bd"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
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
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.5.tar.xz;name=archive...
INFO: Rebasing devtool onto 1fedd0963555d555d53aa76dc2638e71938898bf
WARNING: Command 'git rebase 1fedd0963555d555d53aa76dc2638e71938898bf' failed:
Auto-merging meson.build
Auto-merging tests/meson.build
CONFLICT (content): Merge conflict in tests/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gdk-pixbuf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gdk-pixbuf/gdk-pixbuf_2.44.5.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1996612702933176014==--

