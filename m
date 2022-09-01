Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7922C6FA8D
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.12463.1662040787544729538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CuYdlI81;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182f959c842-01fb607a-0df5-4650-995d-5c44e379a286-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zzEgTphqfLeRUrpK5barCt19W2N/zrwkLTg8uFaj7RA=;
	b=CuYdlI81JeelUTJ4BGnnxe0RRlmkWwJmx9rS84N8uFgIWcCzgHKp2JLoUVZtrpGb
	SH6FHeup2woyxLEXhX/r/5P4U7AS9JGY8DmWaWy7txhHZXVi42wLuxzQVxHZgwueFhq
	55sx7zNoE8ZwzvHoiloBcWLKejkR13RoLV5eH9DI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zzEgTphqfLeRUrpK5barCt19W2N/zrwkLTg8uFaj7RA=;
	b=G1okr5M2UHleFd9dAHtKZFYyD89j0iLVLIq7V7ENHJtD0hhf4e2OFJVssd8uz4jj
	RBllTsrQ968P44poqHp1m7xUEk4/lVSzlQ0e5mP1ApwhOkbTdQGiCCwOsPkL2QH+UED
	RyifBoFzfr9vxGgCsefm2lXNm5V/84HqajfwrvKs=
Content-Type: multipart/mixed; boundary="===============2226267706626716146=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 7.85.0 FAILED
Message-ID: 
 <01010182f959c842-01fb607a-0df5-4650-995d-5c44e379a286-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170202

--===============2226267706626716146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *curl* to *7.85.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe curl failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-536f053ce62c620b4cf2a0569aafd224ec58af2f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:536f053ce62c620b4cf2a0569aafd224ec58af2f"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-536f053ce62c620b4cf2a0569aafd224ec58af2f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:536f053ce62c620b4cf2a0569aafd224ec58af2f"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  13% |####                                | ETA:  0:00:00
Adding changed files:  27% |#########                           | ETA:  0:00:00
Adding changed files:  41% |##############                      | ETA:  0:00:00
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  69% |########################            | ETA:  0:00:00
Adding changed files:  83% |#############################       | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://curl.se/download/curl-7.85.0.tar.xz...
INFO: Rebasing devtool onto 8c1e12aefb455d904c3993cd24f54c3dc1b9d3b2
WARNING: Command 'git rebase 8c1e12aefb455d904c3993cd24f54c3dc1b9d3b2' failed:
Auto-merging lib/easy_lock.h
CONFLICT (content): Merge conflict in lib/easy_lock.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/curl
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/curl/curl_7.85.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2226267706626716146==--

