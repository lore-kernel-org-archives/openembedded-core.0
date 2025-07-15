Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D418CC87FCF
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.12489.1752594939382042907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZK+HkPhy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FkEN2d2S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101980eccb910-e5e33a01-5aef-4cab-a819-ddbb5ee3fb6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594955;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ETO8PqoES10hNqbWbxI6ZhF7+DNjh3Vt6BiFmGUEnno=;
	b=ZK+HkPhyVsEwoI/kfhRp3/o4wfz8KMFhI+bOffU4bS2NhxyHckQr2BbJvMiNoJ5N
	iM53crMXjZ+ll+wu1aaYkQvlH8dqoPJXubSkhVOYeMRahRJwkCJcyuBZ/hN1pG43NHh
	vbYmPh8jOc5b7GynD7QDQio2RBlhnAGS//PjQ7Ho=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594955;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ETO8PqoES10hNqbWbxI6ZhF7+DNjh3Vt6BiFmGUEnno=;
	b=FkEN2d2SfTb2VyENSgxTbrd2kj7TI/JKSnUKFEelC0mWal8lBB0b1dH1qOLlpxNj
	cbr8tADnXnlWlDe+8xArMlR41npun/7cV5IqS/WvaisHQl6K1mnwUqyZ94qNo3FiEfD
	6/R1kudKp+407KLdfrfUgXcg8pdNL6RXqiB14SZU=
Content-Type: multipart/mixed; boundary="===============0813293520687892793=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gdbm: upgrading to 1.25 FAILED
Message-ID: <010101980eccb910-e5e33a01-5aef-4cab-a819-ddbb5ee3fb6e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220394

--===============0813293520687892793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdbm* to *1.25* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gdbm failed.
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
DISTRO_VERSION       = "5.2.99+snapshot-3ce5978975e55ee8d83f25afd46d4512c1de4072"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3ce5978975e55ee8d83f25afd46d4512c1de4072"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
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
DISTRO_VERSION       = "5.2.99+snapshot-3ce5978975e55ee8d83f25afd46d4512c1de4072"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3ce5978975e55ee8d83f25afd46d4512c1de4072"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/gdbm/gdbm-1.25.tar.gz...
INFO: Rebasing devtool onto bfab5c10246e5e5074c6a242aaa9aaf8d7f6bc5c
WARNING: Command 'git rebase bfab5c10246e5e5074c6a242aaa9aaf8d7f6bc5c' failed:
Auto-merging Makefile.am
Auto-merging tests/Makefile.am
CONFLICT (content): Merge conflict in tests/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gdbm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gdbm/gdbm_1.25.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0813293520687892793==--

