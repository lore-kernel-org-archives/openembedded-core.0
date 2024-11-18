Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AF8D60048
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.4795.1731964611516974672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RkS0dL1E;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xAM5uaNS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934122a91e-90ed669e-8078-44b4-9992-8296de0ba70b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964610;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5tvGu8aApIuL8KnV9yJS6rR8R3K0Tdl+kfdeVMJfkY8=;
	b=RkS0dL1ETLuXg5xr8jQk0EcqCIbvJzAc/RZMZxiYxbk2rPGn6tVAuQ79ACzMMICY
	O3bLK0WzSIqbczmubBiTN+JuKF/RNw+klYJk0dQcvWdmTU7Ye+NFr+xlZFEnl5ZyO3L
	bxWzputBOlEI2kkEkCTh4It90iihU2kmDeJjibmg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964610;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5tvGu8aApIuL8KnV9yJS6rR8R3K0Tdl+kfdeVMJfkY8=;
	b=xAM5uaNSPM6EOqn/hB1gofyVNH03dTDZxojbjj3K8P2inKgznXsekZOL6Iyr9NCC
	DUAo2V5xk7UHUMAhn44gdNotyz0HDcU9m6b9H0p9srhIxNtjQ3y+v7WaiecHV+AaNff
	3vC7Fe/FUj0RhxtBPotJbvBZ+eDEe+I6kQh6KKnc=
Content-Type: multipart/mixed; boundary="===============4799313202428874221=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.11 FAILED
Message-ID: <010101934122a91e-90ed669e-8078-44b4-9992-8296de0ba70b-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207255

--===============4799313202428874221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.11* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade btrfs-tools -V 6.11 -S 8859114eaee39c117ff95f5b60b4e81fc22f96e7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:6823f2c8d0f8b6bd91cd2cc7bd29383d3134020a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 16 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 8859114eaee39c117ff95f5b60b4e81fc22f96e7 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4799313202428874221==--

