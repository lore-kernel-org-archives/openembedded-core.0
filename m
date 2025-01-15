Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B7CC0219D
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:19 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.17799.1736936769402549075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X6fNImml;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ebsRQBUB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194697fd47e-90146193-2776-4b5a-bba2-704b41c54a8d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936772;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a8nqjvIKTY6kABfUy/VQfmV3pU04B3/3yPNnhRVwn+Q=;
	b=X6fNImmleZIhf54pMDbrUWT0X1RAZUPOsltYWdUt4R9llV+TSvhWf1PjBfwphb3G
	Z5DUd4yVobCnN7PquE/xdHAyuQwlASMdn5Z+ZFR5BOYfUwOmHrMOsMTs+maKmzJlDTL
	+XYz+PjPtxBoDjVYblVWfOqnDgVEhbrLhDmx63JE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936772;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a8nqjvIKTY6kABfUy/VQfmV3pU04B3/3yPNnhRVwn+Q=;
	b=ebsRQBUB2aQlpEle+9pFKe3RjTo9u/AbEYeuY826BUpJfHDL+NCN+K3BS85SdL7z
	2rAQzpLQpoFT2ePUDsIhjVvM5rU5OaJN+KTDa9Pq6Z2CE0rpry5VPeTxL+/Rx3keXSe
	1rAj8QagOybp/q33SPa0aeGM9h66F03Bmi81Yzbo=
Content-Type: multipart/mixed; boundary="===============4042814204767810878=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 40afcb705d05179afce97d51b6677e46b5b48bf5 FAILED
Message-ID: <01010194697fd47e-90146193-2776-4b5a-bba2-704b41c54a8d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209855

--===============4042814204767810878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *40afcb705d05179afce97d51b6677e46b5b48bf5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 40afcb705d05179afce97d51b6677e46b5b48bf5
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:0a6c61110edb87aeecbb1cce3eae00dec3c654b3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 40afcb705d05179afce97d51b6677e46b5b48bf5' failed with exit code 128:
fatal: reference is not a tree: 40afcb705d05179afce97d51b6677e46b5b48bf5



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4042814204767810878==--

