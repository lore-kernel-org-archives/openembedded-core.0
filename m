Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5A9C83F24
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1425.1751386807795013058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=T0YUhcWn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rqe55giR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010197c6ca3d39-a8c888c0-8e13-44d4-97f7-17d7fee4ea19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aHeqwZPJKnmQfjzg/sCbKOcSECTQz8NjVKlpWFQ3qCg=;
	b=T0YUhcWnqlmR1O8+i6aG5pJGyg/qdJ+R3ud31oEYmz4avUgnVHIInGgqPrtk0ltK
	LF6IRLmWwiNYBtVR+xnLMJ4jXSuUBr2+Tedde6sv7KN+ShnEXPTURntKaSMRtPt73ol
	5MZ1jjJFSYXcMhI8EYPmWgihO/XifdGV7GaLvMEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aHeqwZPJKnmQfjzg/sCbKOcSECTQz8NjVKlpWFQ3qCg=;
	b=rqe55giRGRYLjX45838ehFHfN7T7hmZLo4EISNNgIaqcQ45FYvYutC5PEFlV8Gpi
	SlzNjGOKWLM1YY1Nk1MLhsyu3F8H5COrwJ8PV/qU1anqZpqB8UwUsfoN+AbIVWz0/hd
	TtBB/FTyrPEROW/O6LbdPGqnvvhIQJ7yEE3398ZQ=
Content-Type: multipart/mixed; boundary="===============4100241008388971574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gdbm: upgrading to 1.25 FAILED
Message-ID: <01010197c6ca3d39-a8c888c0-8e13-44d4-97f7-17d7fee4ea19-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219700

--===============4100241008388971574==
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
Loaded 1917 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-fa280d94f209030dbfdfd32e4cf466b16d965942"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fa280d94f209030dbfdfd32e4cf466b16d965942"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 938 .bb files complete (0 cached, 938 parsed). 1918 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-fa280d94f209030dbfdfd32e4cf466b16d965942"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fa280d94f209030dbfdfd32e4cf466b16d965942"

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
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/gdbm/gdbm-1.25.tar.gz...
INFO: Rebasing devtool onto c084dd89fb9f9e18d11fe70b7f4d9f4666b4623c
WARNING: Command 'git rebase c084dd89fb9f9e18d11fe70b7f4d9f4666b4623c' failed:
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
--===============4100241008388971574==--

