Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A71C7113E
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.27804.1748786147994251828
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gyk7CowG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=aj4Rdt09;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101972bc703d0-8c8356ec-e51b-4e0f-a9ee-0ef87efab36a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0+18ZjHch5iEMV6ZxylZjzIjaGCAeZVvdxuhhpD2wOY=;
	b=gyk7CowGVbMurc5mrfcrIjiW7Sm9JAO5sPGkTml9v2636GV4I3BqW4T3dglZLkAq
	Vf6nkESOh32zl0uGBOEuclS7Kkd3EXhVIL7y3JGf7UwYaB8wU0e3eWKbWKaFVF+uR+y
	tT0xx+X4oUYdrIuOLnxRKXJiuLszE/VEj8Nn6mp8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0+18ZjHch5iEMV6ZxylZjzIjaGCAeZVvdxuhhpD2wOY=;
	b=aj4Rdt0943bHFhUWy5oZwlOjyYCVLiSprLNI8L/9XELLBi+A6Q7lXS0WH82wmI9u
	mmeIhn9MvSoTh2C7wlS/Dtn9WTGSIC9Ld/AaG0ciaWhLnics5Nj8T0Y9BHat0QaxSGN
	I+GlPiJsAqYv9pkSAXQRFzCEqC6wbWRiY4rWCBLM=
Content-Type: multipart/mixed; boundary="===============8728441863421701540=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gdbm: upgrading to 1.25 FAILED
Message-ID: <010101972bc703d0-8c8356ec-e51b-4e0f-a9ee-0ef87efab36a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217663

--===============8728441863421701540==
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
Loaded 1915 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:9bfa7fb210ab2853acbca3cf1cfd884110d2a53b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:9bfa7fb210ab2853acbca3cf1cfd884110d2a53b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-1cbxy2qq: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-1jri85_s/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-1jri85_s/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
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
INFO: Fetching https://ftpmirror.gnu.org/gnu/gdbm/gdbm-1.25.tar.gz...
INFO: Rebasing devtool onto 6a621e1732a743c069f10071ecc26e588533542a
WARNING: Command 'git rebase 6a621e1732a743c069f10071ecc26e588533542a' failed:
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
--===============8728441863421701540==--

