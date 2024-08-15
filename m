Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37669C5AE5A
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.131098.1723748334324080335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NKl7abBR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GdI/8Dro;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191576837fe-05afe9e8-eab7-4297-b5d2-f1a2a32c7b02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zx0dVD1QJmdhjJp2plkSeAM/bOtj56oW09Tm2srSMmE=;
	b=NKl7abBR3ZO0JAbDgD2qoQrVh4neLCN4qQNF7Mv9nR7GdOoryNbRrfmyupTgn9z7
	PAXWHXqqP9VpEvhUa+hmXuQsX74J9fr0+CV0HYKoJtgfMIyfHBb03+7WVVpdWS3Pnci
	gW+vJbj3IUuCvSxq2cThAg9n9sgTSP9K4Swu6fRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zx0dVD1QJmdhjJp2plkSeAM/bOtj56oW09Tm2srSMmE=;
	b=GdI/8DroIF1XH+MUQT4ozkuEnmpEl5O2jsuRuLf0FQhYPWHbSS57aw6J/Fv0QttT
	pI2vhunWr3PI+YgeB7EgO310WYnB3M4bcwysiRIk1usEGIX7HoDDhc/NGlREhOGHZwo
	GT5ZBDSjroP054OCn5d4l3PJgWDi35+3B/lU7S4I=
Content-Type: multipart/mixed; boundary="===============0657093278657137785=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.46.0 FAILED
Message-ID: <01010191576837fe-05afe9e8-eab7-4297-b5d2-f1a2a32c7b02-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203371

--===============0657093278657137785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *git* to *2.46.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe git failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-87eefc81a82bbb3edf89e9e3051f136372062e00"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:87eefc81a82bbb3edf89e9e3051f136372062e00"

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
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-87eefc81a82bbb3edf89e9e3051f136372062e00"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:87eefc81a82bbb3edf89e9e3051f136372062e00"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-t4levasa: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-8xhi8kvf/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-8xhi8kvf/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  10% |###                                 | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  32% |###########                         | ETA:  0:00:01
Adding changed files:  43% |###############                     | ETA:  0:00:00
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/software/scm/git/git-2.46.0.tar.gz;name=tarball...
INFO: Rebasing devtool onto 88eb087eb4a80d00e0d5c3e8abce369c2c34ebcd
WARNING: Command 'git rebase 88eb087eb4a80d00e0d5c3e8abce369c2c34ebcd' failed:
Auto-merging config.mak.uname
CONFLICT (content): Merge conflict in config.mak.uname

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/git
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/git/git_2.46.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0657093278657137785==--

