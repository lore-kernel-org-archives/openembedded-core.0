Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D223D1F9CB
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.11880.1728994570147280696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=C7qNil3s;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oVdDVlOW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010192901b6d6f-0d39f919-9acc-4f13-ac8b-580b9062c134-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DzpoFaQSuHlrx5GUU8xid1PRnR5do++5wGaJ0SopCzI=;
	b=C7qNil3slxJypR5UCg/dPbhCYbnDK91KFhAAYB9SIF/creklDvv7r6te7xfSGtVu
	Ea//0sKXDSxx76F3nU7p/WyOH/te8e8UyeC1xe9AM9mnOw4r6FQ8nP6XYae+Wo31XhR
	wnm3GP81Sgcr2dRRbnFcJvW21Q8FPtekM0QNfpOs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DzpoFaQSuHlrx5GUU8xid1PRnR5do++5wGaJ0SopCzI=;
	b=oVdDVlOWbotqIVnqJ2wRfR1oXMf/7dNZAbo4nU+foKOcoAXcSZDOvXrZM/Shl/6m
	FnzrtTDoSw0Q0L63HTySAY+RyC9RuIdox5Mft7n+QzxhnNOtvqOa4yTpcdP+L1N2nBr
	CPsm10kcOOBfV639r9F223K/pNK/9woR7d0s0tsk=
Content-Type: multipart/mixed; boundary="===============8462548902681012948=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.296.0 FAILED
Message-ID: <01010192901b6d6f-0d39f919-9acc-4f13-ac8b-580b9062c134-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205883

--===============8462548902681012948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-loader* to *1.3.296.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-loader -V 1.3.296.0 -S 7aeb5e4324957b6f60dac5c8cedb955df4fecbfb
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
workspace            = "tmp-auh-upgrades:3fe9aa8dc7eeacff6b7a6e760f61fec78ccb23ec"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 7aeb5e4324957b6f60dac5c8cedb955df4fecbfb was found on multiple branches: 
  stabilized_release_2024_09
  vulkan-sdk-1.3.296
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8462548902681012948==--

