Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075A9D4977C
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.148770.1733047569894061979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OTYSXn/N;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EZJjgR4X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019381af4b39-c055eec9-d8f2-4f69-bff9-59e67a8a546d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yqRNCJBuUqzkP9uDxr0k28IBdNJbQKA0SnmcByPWRZ8=;
	b=OTYSXn/Npo/RUvEyYh0luJfxalrdOzfB8jfLylgiHepfQDZBJfImwqLKK6u/9UVP
	hqEXZ1+8wl4EW7uYqvILu1g1j9UWaqZSO3dLUUYKPK8UQm9GgAqCG+C468JJWJTi80M
	DaEzdYJyfkROJfJto3FUfthM+f/ZMuG0X3gFVjUs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yqRNCJBuUqzkP9uDxr0k28IBdNJbQKA0SnmcByPWRZ8=;
	b=EZJjgR4XzjNTUKa2SCP06O1c2v1rHA6uPLGYAevk/5m/TDqGlS21IsovCQV9zfS1
	YkcUIC9HN/hpTz+VorSDS7Mr+QNQN3//KazePDq5h80yYWHSFXTb/U0dVPWRcmsYyOJ
	I9dC5ry6VA8kIe0rVySy9nZrcVq8pO8H/YFmOoRY=
Content-Type: multipart/mixed; boundary="===============1907332394020838855=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libgit2: upgrading to 1.8.4 FAILED
Message-ID: <0101019381af4b39-c055eec9-d8f2-4f69-bff9-59e67a8a546d-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208104

--===============1907332394020838855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgit2* to *1.8.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libgit2 -V 1.8.4 -S 3f4182d15eab74a302718f2de454ffadb1995626
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
workspace            = "tmp-auh-upgrades:73da7d752d2cde0dc9a47264865d4852fe98ad3b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 3f4182d15eab74a302718f2de454ffadb1995626 was found on multiple branches: 
  cmn/backport-diff-header
  maint/v1.8
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1907332394020838855==--

