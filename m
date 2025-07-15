Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D06C88CB9
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.12183.1752594945313212933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rus01l77;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JEsbHqgp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101980ecca506-391c0037-516b-4d2e-b957-9ed4c1e1f5d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594949;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L1nZA93E4xxKNruxpurHS1MPs8krIiKrKKH1Q6o5uRY=;
	b=rus01l77GaYSU1CmiV29XWWu1BEeUys8S2gVuXdGMNRBJAO1JunyBhz4FgdHM6Ky
	B+Eq9az0ItXX8FDNDoiHI9ldU8LMsYxz7yRFRyBdV/KUTBzLz2CYF0tOjUdqtooXijH
	PipNQLWaNu7BBa1nvpCy0cffFEUaPJmCctjMfmT8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594949;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L1nZA93E4xxKNruxpurHS1MPs8krIiKrKKH1Q6o5uRY=;
	b=JEsbHqgpCpaETU3RnXDJKSyx98vJSu9BKjtilfHLKlYRvRjeUkA5UZwfAuRRwA4b
	DY4zVtwjes6Ux8x38S33+Vs9xyllYnP80gbh4VUYJYWS/GfRR9Mz4+AS1KmPOZ0cwnx
	aTo31tpTO7ZtqKMenJlWkS+ELRe+fPqEJxF3DmQU=
Content-Type: multipart/mixed; boundary="===============3393698981276263378=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.60.0 FAILED
Message-ID: <010101980ecca506-391c0037-516b-4d2e-b957-9ed4c1e1f5d4-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220373

--===============3393698981276263378==
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
Loaded 1928 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-3071aaedf49699e90b99979cd9bde9246819cf27"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3071aaedf49699e90b99979cd9bde9246819cf27"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 5 Local 5 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1929 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-3071aaedf49699e90b99979cd9bde9246819cf27"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3071aaedf49699e90b99979cd9bde9246819cf27"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 5 Mirrors 0 Missed 1 Current 22 (83% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Removing 1 recipes from the core2-64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-3071aaedf49699e90b99979cd9bde9246819cf27"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3071aaedf49699e90b99979cd9bde9246819cf27"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 21 Local 21 Mirrors 0 Missed 0 Current 66 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 292 tasks of which 291 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//librsvg/2.60/librsvg-2.60.0.tar.xz;name=archive...
INFO: Rebasing devtool onto c27a6f8cbd3196bd465e1474bbeb34017ecee88e
WARNING: Command 'git rebase c27a6f8cbd3196bd465e1474bbeb34017ecee88e' failed:
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
--===============3393698981276263378==--

