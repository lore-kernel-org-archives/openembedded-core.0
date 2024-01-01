Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D121CC531B7
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4577.1704114718934477994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cpcZ1Qjw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=efGePAxZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018cc52705a9-ac338dad-183a-4944-9699-8b7639feb631-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W+XwSaIdc+4nmNPGgjQ+gQ4gnXyJV4GXTGuMg1NK/GA=;
	b=cpcZ1Qjwqt7ueEi8TlLNVRqQhSvebkxsDXFFjwz1k9KRr9bjmzD7/+8pNT07GelY
	rLkFWATgqxz16WAVKvz1xczu2hAzCXxAPY407SfAch94HiP9FcByLeRv1WQtQVOTjPw
	+hwEd47xkGLCojQO7T2dR9S3peuEG2s2QS0C4K/s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W+XwSaIdc+4nmNPGgjQ+gQ4gnXyJV4GXTGuMg1NK/GA=;
	b=efGePAxZNvJeESUyfHw/+rsJrviR2DaTVY9CuXEaiM3M8DdM7so0PpaLMP03ejrI
	D4voFk4pzApY5WAZQwIz3OJCcEVi2ywhtvftRBQtYHMkpo2/YvXn1QKsKg90ncleAGo
	9zU2HEZ3N1S6qvDX0+OkV6+EGKy3QllTf0tvoqRI=
Content-Type: multipart/mixed; boundary="===============7932753054297614075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] inetutils: upgrading to 2.5 FAILED
Message-ID: <0101018cc52705a9-ac338dad-183a-4944-9699-8b7639feb631-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193099

--===============7932753054297614075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *inetutils* to *2.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe inetutils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b45f94ef9588bb9bf6608432185ce32eb8bfd27b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b45f94ef9588bb9bf6608432185ce32eb8bfd27b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (912 cached, 2 parsed). 1848 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b45f94ef9588bb9bf6608432185ce32eb8bfd27b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b45f94ef9588bb9bf6608432185ce32eb8bfd27b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   9% |###                                 | ETA:  0:00:01
Adding changed files:  19% |#######                             | ETA:  0:00:01
Adding changed files:  29% |##########                          | ETA:  0:00:00
Adding changed files:  39% |##############                      | ETA:  0:00:00
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  58% |#####################               | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/inetutils/inetutils-2.5.tar.xz...
INFO: Rebasing devtool onto 2d63b28092a9a6ce709c0e613d63ce61e18fd259
WARNING: Command 'git rebase 2d63b28092a9a6ce709c0e613d63ce61e18fd259' failed:
Auto-merging ftpd/ftpd.c
Auto-merging src/rcp.c
CONFLICT (content): Merge conflict in src/rcp.c
Auto-merging src/rlogin.c
CONFLICT (content): Merge conflict in src/rlogin.c
Auto-merging src/rsh.c
CONFLICT (content): Merge conflict in src/rsh.c
Auto-merging src/rshd.c
CONFLICT (content): Merge conflict in src/rshd.c
Auto-merging src/uucpd.c
CONFLICT (content): Merge conflict in src/uucpd.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/inetutils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/inetutils/inetutils_2.5.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7932753054297614075==--

