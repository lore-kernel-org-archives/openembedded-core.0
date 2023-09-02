Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC85DEE49B2
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5664.1693650552114500609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L/4+wFhp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FY07RAd/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a55708c70-98a0f6fa-6555-4d83-8d71-e9211dadf360-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CcESwOc3lB0el/5c1UGvz96REs0YDf2z3jQj2MCwjqY=;
	b=L/4+wFhprJFdcPDwtp/2UiXiIKsG4rtxIZl0xlmIDp5TltSeyjD9QSSsirIFiaQb
	P+CeBtnqptgn5GysS2nfwgVnSPSfoWyz2vhCQS3cuelX4RipPodzpaNRdhXOddLhdr4
	tN0sHH5GMyzghQ3sFfPB4vbQgkmb7EIZWFJzyWLI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CcESwOc3lB0el/5c1UGvz96REs0YDf2z3jQj2MCwjqY=;
	b=FY07RAd/AyIFhi1EkVCIPoh3QLxTnEwEu4MH7Gdb603gbNqPBIvAbgm+DU5qNL+4
	6lqpuwz2kaqjBQlxxZ4mU4xQ4vZA1mNjmr7fpNO4yI6yWje5tPVZF/S4nSlGdl0GvHs
	63XUH3ldYHE70tzgld58T6AGnmnOwprqWio6gC2o=
Content-Type: multipart/mixed; boundary="===============5011021959926032895=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gzip: upgrading to 1.13 FAILED
Message-ID: <0101018a55708c70-98a0f6fa-6555-4d83-8d71-e9211dadf360-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187088

--===============5011021959926032895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gzip* to *1.13* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gzip failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (20:08:46.018216)
Loading cache...done.
Loaded 1808 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-e936b7e09bb7b1dfbfa6d6782e41955de9eb0f1b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e936b7e09bb7b1dfbfa6d6782e41955de9eb0f1b"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1808 entries from dependency cache.
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
DISTRO_VERSION       = "4.2+snapshot-e936b7e09bb7b1dfbfa6d6782e41955de9eb0f1b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e936b7e09bb7b1dfbfa6d6782e41955de9eb0f1b"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  19% |#######                             | ETA:  0:00:00
Adding changed files:  39% |##############                      | ETA:  0:00:00
Adding changed files:  58% |#####################               | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/gzip/gzip-1.13.tar.gz...
INFO: Rebasing devtool onto 163ff703d107f172b8af04fecfbb18b19b1eb9b5
WARNING: Command 'git rebase 163ff703d107f172b8af04fecfbb18b19b1eb9b5' failed:
Auto-merging m4/largefile.m4
CONFLICT (content): Merge conflict in m4/largefile.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 163ff703d107f172b8af04fecfbb18b19b1eb9b5
WARNING: Command 'git rebase 163ff703d107f172b8af04fecfbb18b19b1eb9b5' failed:
Auto-merging m4/largefile.m4
CONFLICT (content): Merge conflict in m4/largefile.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gzip
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gzip/gzip_1.13.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5011021959926032895==--

