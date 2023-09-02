Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E4DCA0FF7
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.5718.1693650551528939319
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SxmWcCQH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gdg8mPhg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a55707fa0-3561038b-420c-4933-86a0-3fbc42d7047b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gMP3z3zQcAprm+WNv8lblizlNItVJhtbHlgqFmloSmk=;
	b=SxmWcCQHWfhjOmlC2DzREXvR2cGIcqyVvGW1VFjogsl1o8uKMP6BAIb17xptaGb6
	TFmK+4Vtt5LevCLV4a0Sff7f27zoQZ9RToW62Mh8aRaBHkngiCHhrlemQtJhc0jRYyb
	WBnRCaAmQeP99xgKoxFp1OUbjVifYnayAha0zwOU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gMP3z3zQcAprm+WNv8lblizlNItVJhtbHlgqFmloSmk=;
	b=gdg8mPhgfiNibFvO66e8en5NVVFDxSGhwC0gxj6LjbsKHtPGMgvWe4Mzatr2IkjV
	PRnNRCrzHyy2+ILTFfrrCbGgw7SIY3gu2jvEdbpXjAIc7OGpSoNf/V3WiAyuL+LTuss
	qcbwlXoj6bHP1usFxHZQoNZ2B8H1fkNKhz4v8kaA=
Content-Type: multipart/mixed; boundary="===============8307342085389560835=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] connman: upgrading to 1.42 FAILED
Message-ID: <0101018a55707fa0-3561038b-420c-4933-86a0-3fbc42d7047b-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187028

--===============8307342085389560835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *connman* to *1.42* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe connman failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/main.py", line 487, in setup_bitbake
    server_connection = bb.server.process.connectProcessServer(sockname, featureset)
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/server/process.py", line 686, in connectProcessServer
    sock.connect(os.path.basename(sockname))
FileNotFoundError: [Errno 2] No such file or directory
, 07:42:33.090937)
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (07:42:33.091352)
NOTE: Directory listing: ['tmp', 'cache', 'bitbake-cookerdaemon.log', 'downloads', 'buildhistory', 'workspace', 'conf', 'sstate-cache', 'upgrade-helper']
NOTE: Retrying server connection (#2)... (07:42:33.333906)
Loading cache...done.
Loaded 1807 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78ebd60556f221ca88f7d8941ce1a67663b9eec2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78ebd60556f221ca88f7d8941ce1a67663b9eec2"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 33 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1807 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1808 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78ebd60556f221ca88f7d8941ce1a67663b9eec2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78ebd60556f221ca88f7d8941ce1a67663b9eec2"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 27 (0% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/network/connman/connman-1.42.tar.xz...
INFO: Rebasing devtool onto 4aec2d79732ba72552daa09d1ed4322d95737b85
WARNING: Command 'git rebase 4aec2d79732ba72552daa09d1ed4322d95737b85' failed:
Auto-merging src/wispr.c
CONFLICT (content): Merge conflict in src/wispr.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 4aec2d79732ba72552daa09d1ed4322d95737b85
WARNING: Command 'git rebase 4aec2d79732ba72552daa09d1ed4322d95737b85' failed:
Auto-merging src/wispr.c
CONFLICT (content): Merge conflict in src/wispr.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/connman
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/connman/connman_1.42.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8307342085389560835==--

