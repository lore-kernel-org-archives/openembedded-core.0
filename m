Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AA0C28B2F
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7160.1740828314893885034
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DI0nVPbG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BLEhQQOs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019551742308-a9e51357-2874-4097-926c-c1db231a8084-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ziWiUnhobPbQwpVmOTcNCKFR8ysoar7tSogVS10yVeI=;
	b=DI0nVPbGOINLZoRRJ5VjtDYS3CQkI6RTCaB+ih4cagNDLweGkDpMjUScesJ4uAxX
	AaFheJB8ZqFsj3NjbMGChzjW0iUZ9sXlqzUaGxLDxx9Kvm01hK+E3kHVTrmHK68PES6
	N3QEd+tYD/RCN1jqDkDO7gqo7klKGx/wUPyoFCwo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828320;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ziWiUnhobPbQwpVmOTcNCKFR8ysoar7tSogVS10yVeI=;
	b=BLEhQQOsf1htksFEq2RWYV5LCELptD2GpD+SWc1ZXNy8Z1KIsg8TosqqBFxcxlJv
	0bPmx4oYF+fnwuLYr/7r8yN+zhhRDgvGsYCYAb4/xCO7FFcXnJWv0p5O7EuVqenh+a5
	GPywluZtAqpPMxHWEGClNHzMOdPH9xRKMZ/F91p8=
Content-Type: multipart/mixed; boundary="===============6132626331039505284=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202502 FAILED
Message-ID: <0101019551742308-a9e51357-2874-4097-926c-c1db231a8084-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212105

--===============6132626331039505284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202502* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202502 -S fbe0805b2091393406952e84724188f8c1941837
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:5111376cc77f5b22d2e3555c9da2e3fe8fed0a68"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto fbe0805b2091393406952e84724188f8c1941837
ERROR: Execution of 'git rev-list devtool-base..f4153a09f87cbb9c826d8fc12c74642bb2d879ea' failed with exit code 128:
fatal: Invalid revision range devtool-base..f4153a09f87cbb9c826d8fc12c74642bb2d879ea



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6132626331039505284==--

