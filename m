Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51422D6204F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4852.1731964656837425216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=La8q41Y6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=aK90Z4Zq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010193412366c8-d295b78b-7d6d-44d0-a6fe-91128ed57950-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964659;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VE4gU2R+tHMZ+EpobcVoZi/0BfUPMyuAx5CIKChcTyY=;
	b=La8q41Y6KTu93mMVHEqRjqwj6nwiVU6r5olMywx+6Z1I9dTBBaaseEtyY9mw+X2M
	ULdyWcT9vao4M4IVPYndzOwjC5whbIia0E2m4AlHl5uMuGpx1lR5CjZbye+q8k1Z7Xu
	k33MsD4KaTc97U1OY6I/Vn43n4lL8VJIgOIHnEu0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964659;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VE4gU2R+tHMZ+EpobcVoZi/0BfUPMyuAx5CIKChcTyY=;
	b=aK90Z4Zqkv/1paMPj3ngWKJ7clytY6RLtGkRqv6KnCXtVznKQOduqhQuAG247R/O
	uR+Ykky4WxdGzPSU+yV7/RBmqHjbyfayEyTU3KouIeNhitIo6dKUuiKnoIoOhMojvYA
	cPBOKf0onLsv/vVdQnuWD6aLWTDfH3gJQ/Y3dR0c=
Content-Type: multipart/mixed; boundary="===============9011913285529588367=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.59.2 FAILED
Message-ID: <01010193412366c8-d295b78b-7d6d-44d0-a6fe-91128ed57950-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207321

--===============9011913285529588367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librsvg* to *2.59.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade librsvg -V 2.59.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:dc52bc5716c0e836d37ee281efcc20a06c7901b2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 13 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:dc52bc5716c0e836d37ee281efcc20a06c7901b2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-piyken8r: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-f1q_ixnh/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-f1q_ixnh/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 13 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  25% |#########                           | ETA:  0:00:03
Adding changed files:  50% |##################                  | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//librsvg/2.59/librsvg-2.59.2.tar.xz;name=archive...
INFO: Rebasing devtool onto 973587ab35a8b75cc0b6a6a5e0dd7f3615ebc3e2
WARNING: Command 'git rebase 973587ab35a8b75cc0b6a6a5e0dd7f3615ebc3e2' failed:
CONFLICT (modify/delete): Makefile.am deleted in HEAD and modified in 0c0ff8e (Makefile.am: pass rust target to cargo also when not cross compiling).  Version 0c0ff8e (Makefile.am: pass rust target to cargo also when not cross compiling) of Makefile.am left in tree.
CONFLICT (modify/delete): configure.ac deleted in HEAD and modified in 0c0ff8e (Makefile.am: pass rust target to cargo also when not cross compiling).  Version 0c0ff8e (Makefile.am: pass rust target to cargo also when not cross compiling) of configure.ac left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
Makefile.am: needs merge
configure.ac: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9011913285529588367==--

