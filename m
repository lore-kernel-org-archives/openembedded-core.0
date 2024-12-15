Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2F9E7719D
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.33381.1734254982021076794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JiwuAJgu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vWXqsR3P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010193c9a6effa-153f9f79-cff1-4a9c-be4c-2e7608369494-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XzvIO+xsEPUDUJNZkvIoLqlBs58XjxB5yCAjdxjaxG0=;
	b=JiwuAJgurc9TtnggqgUvkbMwFmmcedbQ/rziInxx++bnLKAbo4IIk/dY93zMCm0O
	kAU/lF+6q/TZhQToMNz+HWeCIb+sFieF/wl+7/Quwhmo93+r1yUZkadpcUPv4otReGM
	RQ3uxZDiPUG2GXdKoYpcs5hz60wtFkpwAnCAYCKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XzvIO+xsEPUDUJNZkvIoLqlBs58XjxB5yCAjdxjaxG0=;
	b=vWXqsR3Pcsyud+qz5hPiI9ga3XubPeEwzLaz94NdQO6CodQiGnUUrMcgDK/x3AV+
	87LfszCI3te29yLkxO0+6hCTKTxfNU3eAQnAMceGRQecMcohcNncFYXuLdut0W1mwmL
	wOMfL7B40SZI10pF3UjLBY6CiUcWD5JE0LcCM1H4=
Content-Type: multipart/mixed; boundary="===============6217623417965477369=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] rt-tests,hwlatdetect: upgrading to 2.8,2.8 FAILED
Message-ID: <01010193c9a6effa-153f9f79-cff1-4a9c-be4c-2e7608369494-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208711

--===============6217623417965477369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rt-tests,hwlatdetect* to *2.8,2.8* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rt-tests -V 2.8 -S c8b918c53cd57fdcbb6df153064d1b2e5cc329e8
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:6368619d82569c327da14a5dcab75c2c304794eb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision c8b918c53cd57fdcbb6df153064d1b2e5cc329e8 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6217623417965477369==--

