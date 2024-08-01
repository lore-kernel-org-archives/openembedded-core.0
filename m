Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82892C5475C
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.75501.1722536830976121809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Bl2mLFle;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VIrt+Kf8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101910f32250c-0d77cf5f-a1c4-4fa1-895d-87aa5845c9ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6UIlKhRUS3uqhaVVRUKBcnDkvBI2mW98Is1yURUZSKY=;
	b=Bl2mLFleaxfJ5r/3E3Ua9W+7Ew0yvjr0yLwEu0Xw2izgoczMqFmE8DBASzJ8oBGp
	rUKYde5Z666L6gazQqSuXuCJW9IL1K8reKeWCk/J5XSScgFKujq94eEvhvGgAakqkBd
	QkzD/5VVSthmNz8nuLdDDhfD/zCxFvtIyyWowzqs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6UIlKhRUS3uqhaVVRUKBcnDkvBI2mW98Is1yURUZSKY=;
	b=VIrt+Kf8s3g6/7mqx5xcnuQMG5b0Ocws0HtL73l7/lQkAZq6p/ggD7eYPd/dvM9m
	9y1AuZpMNJPWoyziavdyIyJ58rT+r7NOnElu37efwlY2gAbgSmS2XCHeF7KK0n7iC66
	yu0rA0YMlu1E4srb1OgUlnfKLOKGZ2cvKCd7QS9A=
Content-Type: multipart/mixed; boundary="===============4685709716934667496=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 39e772fc26705bb170db248e5372a81ed5ffd67f FAILED
Message-ID: <010101910f32250c-0d77cf5f-a1c4-4fa1-895d-87aa5845c9ca-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202827

--===============4685709716934667496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *39e772fc26705bb170db248e5372a81ed5ffd67f* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 39e772fc26705bb170db248e5372a81ed5ffd67f
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-6a07a1b7ccb67e4a5b53ef0ea58661becdce4ad4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6a07a1b7ccb67e4a5b53ef0ea58661becdce4ad4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 39e772fc26705bb170db248e5372a81ed5ffd67f' failed with exit code 128:
fatal: reference is not a tree: 39e772fc26705bb170db248e5372a81ed5ffd67f



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4685709716934667496==--

