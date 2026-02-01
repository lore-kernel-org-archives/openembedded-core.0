Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1EEE65275
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:59 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29190.1769951567290234621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=c5RJries;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JWhCBEK0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c1955bceb-6f134a9d-a924-4d62-a30c-1cb2b2a97f0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JB3WTp4P8FeuKWPMzXRWQho/kFf3HW8ptYwlz1bx/0Y=;
	b=c5RJriesEiu0eoLWMpbjcE5HRwMDdSZoT83lXG/iGN+YWuZB1LjnRE/4CTGWeG6x
	LfDMcRGrbEZJfXO46N1s1oKS2pHjCjLiFSIc9F1+DBjnzLxrb3cDFpQL8bGOzbisqhz
	8OwFB5q02+sJuV3HDQfYFcaljgOa1dPmk/NQoTog=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JB3WTp4P8FeuKWPMzXRWQho/kFf3HW8ptYwlz1bx/0Y=;
	b=JWhCBEK0XvJOxCnEM5mOvNSDpTfGDI54viNYfANBye8p+DZFBIcTdc7TJY558twL
	xM3o7CC/6FUU3IXqo3ZjN7zbAewozyBfjbLWaIJgJRqbO7GNKyyz1/fW5cbUMjWWxqm
	u/w21DcuO7YIF0htMx1GQ0BJuk0oQmcnjabBaAf4=
Content-Type: multipart/mixed; boundary="===============8066531870178742171=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] procps: upgrading to 4.0.6 FAILED
Message-ID: <0101019c1955bceb-6f134a9d-a924-4d62-a30c-1cb2b2a97f0a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230303

--===============8066531870178742171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *procps* to *4.0.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe procps failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-d2ce655ec8f92c8c79c330542bfcc1a02d5db1eb"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:d2ce655ec8f92c8c79c330542bfcc1a02d5db1eb"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4dafddf4c3f4646caa517f039a2307e92657ec93
WARNING: Command 'git rebase 4dafddf4c3f4646caa517f039a2307e92657ec93' failed:
Auto-merging library/readproc.c
CONFLICT (content): Merge conflict in library/readproc.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/procps
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/procps/procps_4.0.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8066531870178742171==--

