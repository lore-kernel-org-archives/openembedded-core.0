Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D7CD4977D
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.149814.1733047570362454604
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=U8aZTxOZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DhHR2UnC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019381af4de7-90cbebbd-0de5-4bc6-9e37-5603e71a831f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rXDkeHd3vy6eTtGmt1IlU+WhByMe2E1R88ISsvmrDjA=;
	b=U8aZTxOZ2mpFF88+Qyv6Xt07XAEa9eDBi4cu28noo9Nj2+PCkMlB4C4813Y8EpQc
	kEKelezZjdHO4HPm253+0tcb4S0axJSeViVfFOl+UIRLoQFSk7Lnfx0TSD0H0E0Udbj
	AJJlZEQVF98JxI11i6/HUdHS/xU0G8gOvJvsRk+o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rXDkeHd3vy6eTtGmt1IlU+WhByMe2E1R88ISsvmrDjA=;
	b=DhHR2UnCWEIHIjoMhSWCs7n7kf2HpXxvbkbEWQ/rlkfprQf0Xv3BQzYIlctx12Zn
	qn7pnhJwjPVcsQIc6AuqV/TmAj7M/JL9qHy8jVT9RTjRI+sGhRspfuzTZQ5+2cBOB4m
	TZEVOCBNgmWW4rfCjpkAYVKRB3iUiX2wmS6/5ZaA=
Content-Type: multipart/mixed; boundary="===============0631072791372360024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] utfcpp: upgrading to 4.0.6 FAILED
Message-ID: <0101019381af4de7-90cbebbd-0de5-4bc6-9e37-5603e71a831f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208106

--===============0631072791372360024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.0.6* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade utfcpp -V 4.0.6 -S b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0
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
workspace            = "tmp-auh-upgrades:441c49d9f5c25af8b33f1cdbda6b619d324e855e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0
ERROR: Execution of 'git rev-list devtool-base..c4ad4af0946b73ce1a40cbc72205d15d196c7e06' failed with exit code 128:
fatal: Invalid revision range devtool-base..c4ad4af0946b73ce1a40cbc72205d15d196c7e06



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0631072791372360024==--

