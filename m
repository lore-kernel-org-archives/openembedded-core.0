Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BD0C54722
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:02 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.131089.1723748333419773361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bfU5eIj0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=N4Y/i+kK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019157684020-6e85487d-4835-486a-bfdd-555e6d4ed6bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k1/m8hxAOc9bsSCyWFm4AjEy1dvPPExUCcgByihZ2MQ=;
	b=bfU5eIj04jA69IEP/jml1Y/5EOlNEB5a+xGcXkTihFZ2Mt6KgZ8VCVQM4pONDt0c
	diRgtlQxbTR4qFSqqE5Tv14v9U0krgC/H/hPd2h+p7LdtQurohkIFtn/Ow/ukx8z0Oe
	oW6UVydAwsJvlDwCmReUHj/jbWfPDYrBn38IZzJ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k1/m8hxAOc9bsSCyWFm4AjEy1dvPPExUCcgByihZ2MQ=;
	b=N4Y/i+kKpOKN5CknytFL6gXGb9t4D+sdhqXk1YaXr4vtGPFcW6lo65dNpAWKmugq
	ND6Lav7AKA+Ca+aL0IneUkdwvoHgu/IG9aaoH8y/iOu6GNehtdC5JPoksqjkdWN6Wf6
	hCkx1cnlG3z9cMHCojcwhnhlMznsfqYFxzTDLGB8=
Content-Type: multipart/mixed; boundary="===============4640643325223841800=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libksba: upgrading to 1.6.7 FAILED
Message-ID: <0101019157684020-6e85487d-4835-486a-bfdd-555e6d4ed6bc-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203439

--===============4640643325223841800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libksba* to *1.6.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libksba failed.
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
DISTRO_VERSION       = "5.0+snapshot-1badb458b8d1edd0b7b2dad56e34c85ae0503e95"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1badb458b8d1edd0b7b2dad56e34c85ae0503e95"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
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
DISTRO_VERSION       = "5.0+snapshot-1badb458b8d1edd0b7b2dad56e34c85ae0503e95"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1badb458b8d1edd0b7b2dad56e34c85ae0503e95"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-zhskoiuw: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-aspii6oa/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-aspii6oa/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.7.tar.bz2...
INFO: Rebasing devtool onto 447a8fdd81b702394943c3d664b2ed954176510a
WARNING: Command 'git rebase 447a8fdd81b702394943c3d664b2ed954176510a' failed:
Auto-merging src/ksba.m4
CONFLICT (content): Merge conflict in src/ksba.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libksba
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libksba/libksba_1.6.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4640643325223841800==--

