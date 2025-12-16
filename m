Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACA5D5C0D9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17398.1765872136614573548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m9lGXb0e;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=is1hIRkF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ecd53-5cd92a54-349b-45a1-a3a9-af603ad18872-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872160;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JYvUiRJ5hY7t7UI6oPASpor4XFchF5+KHXipz2yLn5o=;
	b=m9lGXb0e0p45t99wDKuq2wM9yyK8BLI1PfzPpfMggdYqYc5lImrTIhhzIY9R7RF3
	dGXRnLF44HbKZ2nWl34/ZCHHnNZz12DU2HeX2ZqG3fY+bzqqp00B8I16oZUcz1sazxL
	IZV+deKTrjeiKKbZlK6vxWn6GTk55l6Z1UP7wUDk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872160;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JYvUiRJ5hY7t7UI6oPASpor4XFchF5+KHXipz2yLn5o=;
	b=is1hIRkFKeQizf9jgYdD3DFfe8R3i8fa+S6UgUdoZYOPZfl9OIsFghwhi6HH3Hos
	ZzHdhHV0J6BvP+NZWgIv3rOasCbvde6FqHBbrVc7Svq83tw4E7b0d1wr4qzFMCJkf+M
	CPZnvtfozxScrNa1A/UTe3fj0E6hSKlZnnXv6ljA=
Content-Type: multipart/mixed; boundary="===============6800468498726643819=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 97fcdeecf2db26a78b432b285af3869a65bb00bd FAILED
Message-ID: <0101019b262ecd53-5cd92a54-349b-45a1-a3a9-af603ad18872-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227870

--===============6800468498726643819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *97fcdeecf2db26a78b432b285af3869a65bb00bd* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 97fcdeecf2db26a78b432b285af3869a65bb00bd
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-41c477604e5f93074e055d9f9b0dfce36e02984a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:41c477604e5f93074e055d9f9b0dfce36e02984a"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
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
INFO: Rebasing devtool onto 97fcdeecf2db26a78b432b285af3869a65bb00bd
WARNING: Command 'git rebase 97fcdeecf2db26a78b432b285af3869a65bb00bd' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in 54846b75 (Add changes from do_patch).  Version 54846b75 (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6800468498726643819==--

