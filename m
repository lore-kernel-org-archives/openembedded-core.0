Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7B8C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.88630.1754057268498571489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nDe/rD5w;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jYgHOHrQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019865f5da45-c7609e89-9438-4d6a-86fb-4268434d8db5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aAhEJi0NOtwvVYDRTGS4957AfkFACRTXZvO5EQetBzU=;
	b=nDe/rD5wcQruzk0ClZ1FXhXoujl1KAiOhq+m+JgL/QOBUbX/f3qxX326NQUF7upK
	HXxjJQpKSA0HlCTmT3YUXZQLHnjq8MpyLCNPFNzWPP2rC/jRUhTc0fsxMjbAKNNdEuH
	KShCiaP7czd7QSRzdLshFRHj3ESPpOcYAIv1uuF8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aAhEJi0NOtwvVYDRTGS4957AfkFACRTXZvO5EQetBzU=;
	b=jYgHOHrQiHrR91zQV9QdUysKDfAc4S/2J8GODL+8jkCwcnWLVF5FrPV12Uq1YcaU
	ctXpBYL50sJ8DHnx47kTwpxjkdGp/COwidygg4ouoDyNJ7MnuECLQTnH811aLOeBY/K
	bMkc/zuXntHKzPHWDW7bBteF3lxnSOAfeCTF0PB8=
Content-Type: multipart/mixed; boundary="===============0776341948631747188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.80.1 FAILED
Message-ID: <0101019865f5da45-c7609e89-9438-4d6a-86fb-4268434d8db5-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221264

--===============0776341948631747188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-networking* to *2.80.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-networking failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-3299752b36ab29ff3237c8e85e2c8a234ab775f6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3299752b36ab29ff3237c8e85e2c8a234ab775f6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 943 .bb files complete (0 cached, 943 parsed). 1934 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-3299752b36ab29ff3237c8e85e2c8a234ab775f6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3299752b36ab29ff3237c8e85e2c8a234ab775f6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib-networking/2.80/glib-networking-2.80.1.tar.xz;name=archive...
INFO: Rebasing devtool onto 278f46a2a8d07109bdf102e5bca6139f8f10838a
WARNING: Command 'git rebase 278f46a2a8d07109bdf102e5bca6139f8f10838a' failed:
Auto-merging tls/tests/connection.c
CONFLICT (content): Merge conflict in tls/tests/connection.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-networking
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-networking/glib-networking_2.80.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0776341948631747188==--

