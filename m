Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175F9C54E9D
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.36978.1709330716940266826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ALL/BAW1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FGG4XHj2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dfc0cd4c7-289eadfd-6ad8-4169-8bfe-d2981f8d0cab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8t/rUp7MC1q2iSsoW/RqSx7hjWWjF0h9i9ACdV0nO3A=;
	b=ALL/BAW1LqN1KnNl9LybxeJsfyTiY8g7E+gNUPUrP7HaE3vD8kkYUHlKuRozofml
	B8rFNZoaDuA9+sLaWOFsBB7uKzDEPg9mVwmq6UBakSys9ie1CJ7xMI5J9YaCrEBD1N5
	6ssuNLsgkfv+5t4F22FTWBGHJNiCduZvSQtVJa0w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8t/rUp7MC1q2iSsoW/RqSx7hjWWjF0h9i9ACdV0nO3A=;
	b=FGG4XHj2dEBtKEHCDOxkmWOnWB2eDYD8uM/tupqPQjsoSQlDRwwnwfI9J/q5QFqO
	npHau0JEOw0fH9P49Psgun6kkBzjRwwhYJ1Lkb27lr8HR9TksQDyiBBvqJSfx8qPjOp
	CqkbJ8I5z8zGDfcNp0lAw0PIehtKqG4jPOK1d/DY=
Content-Type: multipart/mixed; boundary="===============3066314018087900994=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.73.0 FAILED
Message-ID: <0101018dfc0cd4c7-289eadfd-6ad8-4169-8bfe-d2981f8d0cab-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196514

--===============3066314018087900994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdnf* to *0.73.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libdnf -V 0.73.0 -S 1f30b3479528e8b62754f9047195c8e5a31f07ed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1866 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6efb960d0860fe43e93ac19651553c6ce088a469"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6efb960d0860fe43e93ac19651553c6ce088a469"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 1f30b3479528e8b62754f9047195c8e5a31f07ed was found on multiple branches: 
  dnf-4-master
  jkolarik/history-fix-transactions-merge
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3066314018087900994==--

