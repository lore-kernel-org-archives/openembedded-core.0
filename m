Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B489FCFD346
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.53367.1728588951632949875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LJingZQW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xJwv6/Fk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277ee7597-a2dd63ae-f80c-4a0b-9da5-1096fbf648e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588969;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vInQkFVK3HySANuzYTdNWHh0esw1CeISpDXxT6NEmVs=;
	b=LJingZQWNsfZAOp/0n1kKZGY1c+F6tkDGLrTZ7X9EtQrHWv4PmZBarXpv37CF0xN
	8aV4otM2+fhj1FbQx+m6VG+9zVcAfFfCqYckiowkcHS+tWe6Cu6SlqU7ieksAYJZUKF
	kW5zxihDikWa2eXspdlRqIoC63s8hY7s7nhQqmcU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588969;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vInQkFVK3HySANuzYTdNWHh0esw1CeISpDXxT6NEmVs=;
	b=xJwv6/FkYwxkgJzGY0fWXeElO5vDz8sjnhfI6t/uUWkEA23azCjM4JhIrMzG20wS
	mmS6s6XFZSYRVCuaqbqrR86Jc0RKNBTfo5YsNoU5pOh76dVMOWQKrrSFs74Y3wu1a1+
	0COzdWR1eW6ORGR9SHTkYXTf1ewew28492t+rX4g=
Content-Type: multipart/mixed; boundary="===============6251171650794585327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] screen: upgrading to 5.0.0 FAILED
Message-ID: <0101019277ee7597-a2dd63ae-f80c-4a0b-9da5-1096fbf648e9-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205521

--===============6251171650794585327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *screen* to *5.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe screen failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:a7ecc4e0432712da50d820973939de967b94c4cb"

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
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:a7ecc4e0432712da50d820973939de967b94c4cb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-exk4gisl: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-g_8t6gwf/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-g_8t6gwf/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/screen/screen-5.0.0.tar.gz...
INFO: Rebasing devtool onto 34866e93b50a9208a76991038e43439ec8b69dd2
WARNING: Command 'git rebase 34866e93b50a9208a76991038e43439ec8b69dd2' failed:
Auto-merging Makefile.in
CONFLICT (content): Merge conflict in Makefile.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/screen
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/screen/screen_5.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6251171650794585327==--

