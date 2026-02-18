Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F3FE9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1413.1771440096559575007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Xg8EdVlC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=d8mcv6Yw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c720ec1dc-36606aa9-7316-46f7-8bad-04f9cb4c76ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440095;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=02onWMrOXNMCbWXo7jVenmTnZqT6nt1kHbe4Ps7DWVo=;
	b=Xg8EdVlCzRrQPDlL1DjeTHxDwIMTB/RQJZ03Sp0xC3LfG6IzYdShgRJkBBnlErq9
	qYWrGGrD7YXBjKilDjmupOBU2e+isJV5X9q5BsGlXKmoJR6WSbAy3ELkT0fsQSYOsX2
	8QTKSRrygU5vGYuTu8wlg6exLerck3QQU93TfFuc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440095;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=02onWMrOXNMCbWXo7jVenmTnZqT6nt1kHbe4Ps7DWVo=;
	b=d8mcv6YwhJZD9d2kJUOdrYeCZQOlgayYR7NYNVl/EVUjVJApj+6d64WS67A1Z/8J
	TDD4nfgWPvify8Ss6l2g7o2l1VnEyVsbUIAoFLf1vUZnHLXdSSLyFI0Ho/qrohgZpf0
	UIEfUUQzKSjLSnoAqoymsx0501CRRt2ynlnUVrA4=
Content-Type: multipart/mixed; boundary="===============5635787359418075185=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] m4,m4-native: upgrading to 1.4.21,1.4.21 FAILED
Message-ID: <0101019c720ec1dc-36606aa9-7316-46f7-8bad-04f9cb4c76ff-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231324

--===============5635787359418075185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *m4,m4-native* to *1.4.21,1.4.21* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe m4 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1952 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-0dbc300ff37660960f604b020bd9afe190dab7a3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0dbc300ff37660960f604b020bd9afe190dab7a3"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1953 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-0dbc300ff37660960f604b020bd9afe190dab7a3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0dbc300ff37660960f604b020bd9afe190dab7a3"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   5% |#                                   | ETA:  0:00:01
Adding changed files:  11% |###                                 | ETA:  0:00:01
Adding changed files:  16% |#####                               | ETA:  0:00:01
Adding changed files:  22% |#######                             | ETA:  0:00:01
Adding changed files:  27% |#########                           | ETA:  0:00:00
Adding changed files:  33% |###########                         | ETA:  0:00:00
Adding changed files:  38% |#############                       | ETA:  0:00:00
Adding changed files:  44% |###############                     | ETA:  0:00:00
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/m4/m4-1.4.21.tar.gz...
INFO: Rebasing devtool onto 5751aeffd8c4b5fb231c669e1717f70d8b8848bd
WARNING: Command 'git rebase 5751aeffd8c4b5fb231c669e1717f70d8b8848bd' failed:
Auto-merging lib/gettext.h
CONFLICT (content): Merge conflict in lib/gettext.h
Auto-merging lib/openat-die.c
Auto-merging lib/xprintf.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 5751aeffd8c4b5fb231c669e1717f70d8b8848bd
WARNING: Command 'git rebase 5751aeffd8c4b5fb231c669e1717f70d8b8848bd' failed:
Auto-merging lib/gettext.h
CONFLICT (content): Merge conflict in lib/gettext.h
Auto-merging lib/openat-die.c
Auto-merging lib/xprintf.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/m4
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/m4/m4_1.4.21.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5635787359418075185==--

