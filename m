Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23E7C36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.18072.1743511413229149944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XFJv9Bzu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LxxXJyJe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010195f160e00e-9a86155b-1355-4590-990a-1fd0d80f6dc5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511412;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aNHYzfNfyDTpqUpFluxm3tdrF5fkRKmC72ojSHQSRr8=;
	b=XFJv9BzuugHKc7ZM2RmBrGRgNBBKCutSkb/yyE+i7q1OMJb9IlDLHrWp9WYycoTI
	F6DqkUjNaOi8+32e31agGxMPMyXdVV9tmZi89ffn4X2h0Mghg+4OV1BkHt1aUKC8YGR
	+1Ws8NXSpwfE+2WFyOqLP9FBWLNMSHq9ntqlylFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511412;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aNHYzfNfyDTpqUpFluxm3tdrF5fkRKmC72ojSHQSRr8=;
	b=LxxXJyJeGOSw9qtrxhCezC2pOIDwwgZeCT8+upZQ90mbHFHiLjxPQgy2aBFa0Xe1
	JBeLzYkNQngDQftM1CHIv0hKFDs4i03UrbHnSM5RdvFdIaQ140uxUwYyEmgseLbC77V
	8RCDU4MJ3+Y/42voA+7KLZu7YquvFL70ZolVHxGY=
Content-Type: multipart/mixed; boundary="===============0990717114331003343=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gdbm: upgrading to 1.25 FAILED
Message-ID: <01010195f160e00e-9a86155b-1355-4590-990a-1fd0d80f6dc5-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214119

--===============0990717114331003343==
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
Loaded 1886 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5d5fb6d9c7f4c4d27bb3afd99a2017701ae7df98"

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
Parsing of 925 .bb files complete (0 cached, 925 parsed). 1887 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5d5fb6d9c7f4c4d27bb3afd99a2017701ae7df98"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-zxbtdj90: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-0_37qdlk/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-0_37qdlk/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/gdbm/gdbm-1.25.tar.gz...
INFO: Rebasing devtool onto f442e506c817110d9b74cdd50eed8fdff62f545f
WARNING: Command 'git rebase f442e506c817110d9b74cdd50eed8fdff62f545f' failed:
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
--===============0990717114331003343==--

