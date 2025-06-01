Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D23C71136
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.27787.1748786147045108400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W4k6czLL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Edwg8uLj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101972bc6eca7-2c5a1a98-6f2d-475d-bac6-cc598f092d82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5I9DNK8bBGZ5TkD9uOLw4MUm74WHZ1vRQOnV2NDgj6I=;
	b=W4k6czLLc4GQNg3xAN4NEQI2/UhIgoFM9y0WUv9BNt77htMo/ZDqyBk1K+lXYNbI
	WHIdAV5oNcUvJjrDquBzTDc8o6VOmBbtYfe3tW7UhiNarYC3T3wV+kXFMPSBiEgYwCm
	LTmRdslSOxmv4QIvDm9+DqErRjukQq8bM/TUtGbQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5I9DNK8bBGZ5TkD9uOLw4MUm74WHZ1vRQOnV2NDgj6I=;
	b=Edwg8uLjDEiRbqzIPS1vE866134kc2DVGJBPL5i0Jt9zizYOvn7IszkSDXAHYOGj
	ZePJGQ7eKzns9ygnkBHLcpyyLA8TNKhv8uT+S6DUGrbBFDsHoMBlQ3RwbAIQ0+fD5Ju
	uea+UkrZ8qUYhMXovw0kKd8EN+KV9A+i/kCYtP5Q=
Content-Type: multipart/mixed; boundary="===============0518867854117045719=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.60.0 FAILED
Message-ID: <010101972bc6eca7-2c5a1a98-6f2d-475d-bac6-cc598f092d82-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217642

--===============0518867854117045719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librsvg* to *2.60.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe librsvg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d2b2b4b8c25964aa7c1bfa9e184da671eaa41832"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 8 Local 8 Mirrors 0 Missed 0 Current 25 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d2b2b4b8c25964aa7c1bfa9e184da671eaa41832"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 8 Mirrors 0 Missed 1 Current 19 (88% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-j0d8k3bf: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-e55kjc2u/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-e55kjc2u/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Removing 1 recipes from the core2-64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d2b2b4b8c25964aa7c1bfa9e184da671eaa41832"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 30 Local 30 Mirrors 0 Missed 0 Current 63 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 312 tasks of which 311 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//librsvg/2.60/librsvg-2.60.0.tar.xz;name=archive...
INFO: Rebasing devtool onto 4c1915c71e5b7418ddf0f9f9ec9cbb8897a2d381
WARNING: Command 'git rebase 4c1915c71e5b7418ddf0f9f9ec9cbb8897a2d381' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Running extra recipe upgrade task: do_update_crates
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/librsvg
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/librsvg/librsvg_2.60.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0518867854117045719==--

