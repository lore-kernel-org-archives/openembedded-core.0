Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85D7C83039
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.27787.1748786127441297873
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mw1eOBKJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mXZM6lv1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101972bc6f439-1800b413-cede-4767-8d01-423d0aa94d18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VnKM+NrYcKcYXICXwOoytwlFI0wg8nN+Udw2nJ737jI=;
	b=mw1eOBKJreQCiJJ1MYN9XAnNv8AWe6rg+ad/Ar/5CPEfHCQpdYj4xee/CR7V5ShW
	sYTjyI3A9YLLUO0e0T/4mdqnXfPVY0u/UdCDlsVKzyxLL+zNbQKuO3VYXZ2Y+oQnFG8
	rPJ2fTe/8JNQq595a6KTHTfVGJTwbg1G+72KlCPc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VnKM+NrYcKcYXICXwOoytwlFI0wg8nN+Udw2nJ737jI=;
	b=mXZM6lv1WTVnL7Kkim8/6KURCqLpEk2kgWOCrKFnDCpdeSpoqqRMCt4mu5CuMBQC
	s1YPlCot3pw/gy5HKkSZ+P1/ZVtzOh4qsptl5FRtUXwGAl4mJJjziddZTfs7ejGWlxE
	fyenXZP8SDaxkwSb0PSN5lOG9JKQptXPtsGSspAo=
Content-Type: multipart/mixed; boundary="===============1600634474450925747=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 37c28c9bb5c8038b316d9a2f3649980b334d0da6 FAILED
Message-ID: <010101972bc6f439-1800b413-cede-4767-8d01-423d0aa94d18-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217648

--===============1600634474450925747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *37c28c9bb5c8038b316d9a2f3649980b334d0da6* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 37c28c9bb5c8038b316d9a2f3649980b334d0da6
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a178c8fa1d81958fed2a2bd6210f3a86ee1ea4d3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 37c28c9bb5c8038b316d9a2f3649980b334d0da6
ERROR: Execution of 'git rev-list devtool-base..8db8ce9c528330f0b1261b07531b009732b08731' failed with exit code 128:
fatal: Invalid revision range devtool-base..8db8ce9c528330f0b1261b07531b009732b08731



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1600634474450925747==--

