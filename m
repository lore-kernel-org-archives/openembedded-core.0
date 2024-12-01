Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B83FD4976C
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.149809.1733047564211556502
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L0YPuwVb;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=yPafmkcG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019381af3520-4b92de44-82ca-49d6-b7dd-51b2fbd76acf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ym8LJ1e/TUPMJmgVXiDLzdX+/oovxfi0gd+UD63XN6I=;
	b=L0YPuwVbXJyBEuMFMlX3TOmhAhwAzdpBi7XSoRSlr8K5Bk9vWzJ9OgtPFJrfBhdS
	VhiXIFju/30wV50RqN3HOQSv+VXejKrPxrU7BBD+CCrqWcMe54kfsD4Mx/XNXaBP0Ff
	baCFxdj9+RdVII4QPeTCTeujCe46xDXW/CwhysWM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ym8LJ1e/TUPMJmgVXiDLzdX+/oovxfi0gd+UD63XN6I=;
	b=yPafmkcGIc7ZxG4HfMVNYgvUSSm5vuO9Z49WhFOAlq7MeNnYw2pO4U3EfpcxN5yH
	39EoZjtGNrXDgD76D4nORu8FcXnUkudvuQ4U4qD/4nJcnp+yAQSMZOGyTK3Wk66+vpO
	wDFeSw2DeJCW3jy5z4+at8uG4AMZf/GNnWw89Ap8=
Content-Type: multipart/mixed; boundary="===============9117383087758151841=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.59.2 FAILED
Message-ID: <0101019381af3520-4b92de44-82ca-49d6-b7dd-51b2fbd76acf-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208088

--===============9117383087758151841==
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
Loaded 1877 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:f284b4b968c255af67369bdc4d3b1dbf264e432a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1878 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:f284b4b968c255af67369bdc4d3b1dbf264e432a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-8b1tpc01: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-zj9j3d32/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-zj9j3d32/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  25% |#########                           | ETA:  0:00:00
Adding changed files:  50% |##################                  | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//librsvg/2.59/librsvg-2.59.2.tar.xz;name=archive...
INFO: Rebasing devtool onto c68d4c84a7af4eb3b874293aa51ebd9239e278a8
WARNING: Command 'git rebase c68d4c84a7af4eb3b874293aa51ebd9239e278a8' failed:
CONFLICT (modify/delete): Makefile.am deleted in HEAD and modified in 623809f (Makefile.am: pass rust target to cargo also when not cross compiling).  Version 623809f (Makefile.am: pass rust target to cargo also when not cross compiling) of Makefile.am left in tree.
CONFLICT (modify/delete): configure.ac deleted in HEAD and modified in 623809f (Makefile.am: pass rust target to cargo also when not cross compiling).  Version 623809f (Makefile.am: pass rust target to cargo also when not cross compiling) of configure.ac left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
Makefile.am: needs merge
configure.ac: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9117383087758151841==--

