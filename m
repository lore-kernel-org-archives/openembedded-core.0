Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FABC67800
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.24351.1665871392994675221
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b8T8Beg1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac2d97-11032815-4cc0-41cf-ba9d-1b9bfd93aa68-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=23xPKkrpnjyMZ3Aj5HnPsrddVJq8TJUD16gCnqZvO6A=;
	b=b8T8Beg1fIsJzJpagKyvLMXqSnFjeil7j0NftHCLEmtr76bpWJMqdp36X9XS8ewB
	UV2+Ekl76IOL6KC4XuPbPDRof8mMQHJAhoeGa4363+VZe5DC3gdYlDXHC0H09Y6sgTN
	7pmJUDRbHVRnmISyqH2sYWikIOlFr229Xx1hq95o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=23xPKkrpnjyMZ3Aj5HnPsrddVJq8TJUD16gCnqZvO6A=;
	b=jkekIbahIz6Tup1rgr2F/5KN9K61IRttFNm/Hu0Fbeyu90IaxTNbCEA3ee5Isuue
	2umHpNKvZFfh7h397Zw09mAAH9brkiLzsRr0Oc1PeBVsEsX4tRuQW5UUxH8QQ6xsiBk
	19UhCVjcFFPjYQy1roXj4R9R5ZZGAl6AcsL9HPoc=
Content-Type: multipart/mixed; boundary="===============6837651061369318934=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.74.0 FAILED
Message-ID: <01010183ddac2d97-11032815-4cc0-41cf-ba9d-1b9bfd93aa68-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171751

--===============6837651061369318934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.74.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-2.0 failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2abb405b31635744891bfcebebba76633795e642"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (884 cached, 2 parsed). 1662 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2abb405b31635744891bfcebebba76633795e642"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   7% |##                                  | ETA:  0:00:01
Adding changed files:  15% |#####                               | ETA:  0:00:01
Adding changed files:  23% |########                            | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:00
Adding changed files:  39% |##############                      | ETA:  0:00:00
Adding changed files:  46% |################                    | ETA:  0:00:00
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib/2.74/glib-2.74.0.tar.xz...
INFO: Rebasing devtool onto 4fa96f1eeae23db79593f86b88468c77d3561d6c
WARNING: Command 'git rebase 4fa96f1eeae23db79593f86b88468c77d3561d6c' failed:
Auto-merging gio/tests/meson.build
CONFLICT (content): Merge conflict in gio/tests/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 4fa96f1eeae23db79593f86b88468c77d3561d6c
WARNING: Command 'git rebase 4fa96f1eeae23db79593f86b88468c77d3561d6c' failed:
Auto-merging gio/tests/meson.build
CONFLICT (content): Merge conflict in gio/tests/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/glib-2.0
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/glib-2.0/glib-2.0_2.74.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6837651061369318934==--

