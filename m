Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCCAC87FC4
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.12169.1752594936216481472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CkMrVCvt;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JU6vq64H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101980ecc6e71-bd0e72f3-e975-449b-ad3a-740964bbcfb3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sIPsB5TCNSK7KLFEV6Lm4HEF3RphbCIX/pabkboJx7o=;
	b=CkMrVCvtqmIjHZ/FQaD25mCd36hyIoCASqZypCb5YYBtlsBG+1eal+a+JYvDSSJa
	hBAIK2fTif5c3Ve5AjulxWrombmp9dYcGDaJm3kenTabcRxXB5xPPNGIG8FJsFQJvbr
	USpVUg02XMQboPZe/CZ+l6ylDnMyof1HpVLJrBBM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sIPsB5TCNSK7KLFEV6Lm4HEF3RphbCIX/pabkboJx7o=;
	b=JU6vq64H5vHPgUp5crV0nSMzVDVWDMWUamT7P8RURAh8eBv6DqyGDxcNlqzT4E30
	3r0WFGxEtX5VHtxhaEsh3xFmGlnscLwdcZTQ9hgXpod5ILn8GkJA+SjFI2WVkZB2l5j
	fLuRTT9urlJo8Ud6sdZY0aTruT1HxW5VrwcpJ1e4=
Content-Type: multipart/mixed; boundary="===============4531769739347056320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] readline: upgrading to 8.3 FAILED
Message-ID: <010101980ecc6e71-bd0e72f3-e975-449b-ad3a-740964bbcfb3-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220327

--===============4531769739347056320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *readline* to *8.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe readline failed.
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
DISTRO_VERSION       = "5.2.99+snapshot-bbed8ac47a8f23c26cecbec9c6732652782166a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bbed8ac47a8f23c26cecbec9c6732652782166a1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
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
DISTRO_VERSION       = "5.2.99+snapshot-bbed8ac47a8f23c26cecbec9c6732652782166a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bbed8ac47a8f23c26cecbec9c6732652782166a1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/readline/readline-8.3.tar.gz;name=archive...
INFO: Rebasing devtool onto 7449666532f263e50d023c4d59db6811381721e0
WARNING: Command 'git rebase 7449666532f263e50d023c4d59db6811381721e0' failed:
Auto-merging rlstdc.h
CONFLICT (content): Merge conflict in rlstdc.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 7449666532f263e50d023c4d59db6811381721e0
WARNING: Command 'git rebase 7449666532f263e50d023c4d59db6811381721e0' failed:
Auto-merging rlstdc.h
CONFLICT (content): Merge conflict in rlstdc.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/readline
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/readline/readline_8.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4531769739347056320==--

