Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ABDC87FCF
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.12488.1752594938645097521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Nf8uK4MO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KObLpbB5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101980ecc78c7-e579ac1d-871c-40b7-868d-214e5acadd72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=30V9n2e/lvIKa5COuorGkNp0RZ4h9SvqkwqIki8F0d4=;
	b=Nf8uK4MOSa/Tog3gFT89jux9ANOau7q4cLfH3+Nackco2560eqZKAto0qXg8GB62
	DZwtUxBPbtdmgSP9sovkKaabP1rsoLTmbs4b8Dfz2SZZuqqxvggRdKkBGCVwMhoL4AN
	k1ZGgjqRc+tQBUx83r07j6sjPT5H12CkjWT7UB90=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=30V9n2e/lvIKa5COuorGkNp0RZ4h9SvqkwqIki8F0d4=;
	b=KObLpbB5TUu1QL0y9OuMdl5fl8Fohw1CJ9kmdtqn3HbQ4VJrPRU3o7DStC86Pbfy
	0bWdPl9fGS4ja/gLSESamv8MdtCPius3nwUSAws/1ppPhmmxKmBncYTfB9wTPraw+0v
	Miarjmf8RoWC6NjG2YpGZAUqZePhv8DrU7kpuBhU=
Content-Type: multipart/mixed; boundary="===============5431112016739365949=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.22.21 FAILED
Message-ID: <010101980ecc78c7-e579ac1d-871c-40b7-868d-214e5acadd72-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220334

--===============5431112016739365949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dpkg* to *1.22.21* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade dpkg -V 1.22.21 -S d72b038fd2113cb62972e4071db03dd1388394d8
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b659c4bee985b111aee78f3849e2efef946fdbb0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b659c4bee985b111aee78f3849e2efef946fdbb0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
ERROR: Revision d72b038fd2113cb62972e4071db03dd1388394d8 was found on multiple branches: 
  1.22.x
  trixie
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5431112016739365949==--

