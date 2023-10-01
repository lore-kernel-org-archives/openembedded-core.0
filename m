Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B14E776CE
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.64742.1696183991856872738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fTMzv3fO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mtZFo2bk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018aec71bbb3-29b3dd7f-29ce-4428-9f7f-adf6fd230e0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vPIIlhsWfH4lB5Iv/E/4ARj9dTMyjycFsUU6rbvF4Q0=;
	b=fTMzv3fOYT64LHp5nQ5eztA+BbkNTkcu0l3Z+d5JCnAeRKkwiDvX6Q6UNXsHao5h
	GOzbA+3a9eTO+kBIjHo0vhVIHm4swWCdPNk6ll7tHeGluG5nOzNXBlE8W9SRpGB2sr+
	R1MF2Cg2tcj3k3d5wvSKV6eeyATP2KoAk4FXlo1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vPIIlhsWfH4lB5Iv/E/4ARj9dTMyjycFsUU6rbvF4Q0=;
	b=mtZFo2bkVAqDNP0CbD6Ldrg/ImwrJsh+dWmmq0x3+0KviAqOR+0Z+u9hA88jZXiU
	SV7EwnXulVxURdthEAwOBjv7YmdX+e93LC7sGWwuZ0mEmBFeXLJ1N30RlWorO2lKPaO
	/LV1pWaSpks67d8Glgpt/XqRrSw6gGs5zbVqdZBw=
Content-Type: multipart/mixed; boundary="===============2053602917417388389=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cairo: upgrading to 1.18.0 FAILED
Message-ID: <0101018aec71bbb3-29b3dd7f-29ce-4428-9f7f-adf6fd230e0f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188558

--===============2053602917417388389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cairo* to *1.18.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe cairo failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (14:50:53.536943)
Loading cache...done.
Loaded 1844 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-c4fd7e061ac8a8ae72cc476f0c19c728080fa787"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c4fd7e061ac8a8ae72cc476f0c19c728080fa787"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 31 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1845 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-c4fd7e061ac8a8ae72cc476f0c19c728080fa787"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c4fd7e061ac8a8ae72cc476f0c19c728080fa787"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 2 Mirrors 0 Missed 1 Current 25 (66% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   6% |##                                  | ETA:  0:00:02
Adding changed files:  13% |####                                | ETA:  0:00:01
Adding changed files:  20% |#######                             | ETA:  0:00:01
Adding changed files:  26% |#########                           | ETA:  0:00:01
Adding changed files:  33% |############                        | ETA:  0:00:00
Adding changed files:  40% |##############                      | ETA:  0:00:00
Adding changed files:  46% |################                    | ETA:  0:00:00
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  66% |########################            | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://cairographics.org/releases/cairo-1.18.0.tar.xz...
INFO: Rebasing devtool onto 1e8513ab7a9dcbc6679a0727fe6be812db6b96a6
WARNING: Command 'git rebase 1e8513ab7a9dcbc6679a0727fe6be812db6b96a6' failed:
Auto-merging src/cairo-arc.c
CONFLICT (content): Merge conflict in src/cairo-arc.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/cairo
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/cairo/cairo_1.18.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2053602917417388389==--

