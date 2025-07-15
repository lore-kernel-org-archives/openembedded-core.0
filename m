Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2746EC83F3E
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.12486.1752594938205141583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FFPhZfDj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hJI5SKEX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101980ecc773d-31e3e09a-8a72-4309-9599-cc314c4b7102-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594937;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4IhzwyL6vOMaATR4nSgYhdD+NoS7g0EJxB/yVXVuHRE=;
	b=FFPhZfDjtnwhwJp7wxxBcmmwmQ14aFSd8ZLopKwZwcQGI8LcpoqOXAGqT/hRYNRO
	YcpmPmUvbjA6m86bkOPIDgdoiqQQtJ9p9tddMLgP2BBC8SQQz/gaeKiYq6HI+NZ4gMv
	3T9b8Z3ZyF8VAbVCdpjr5/SWRpS2an5y0XMrSpCc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594937;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4IhzwyL6vOMaATR4nSgYhdD+NoS7g0EJxB/yVXVuHRE=;
	b=hJI5SKEXJmCJJCLqpuI2/tycN7jpeAR8i56DTjVgPLkJEAoldYiqfJCB++ksnMFw
	Ra3q8s/VZ/87htIEAMghldQ35Dgn3ao4e+fzhRB5Z9XcYwI+yqZx1CrZov272pY4wFX
	lIoDmmasP7MXd41A1Z+er2Ufi0wTWfHWsx1Qb9o8=
Content-Type: multipart/mixed; boundary="===============2229185506173296528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bindgen-cli: upgrading to 0.72.0 FAILED
Message-ID: <010101980ecc773d-31e3e09a-8a72-4309-9599-cc314c4b7102-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220329

--===============2229185506173296528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bindgen-cli* to *0.72.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade bindgen-cli -V 0.72.0 -S d0e7d6b5b763e93dd38f9ece05230979ede95a0a
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-cb8c95ad1a077ce3db2f46cdb4276dec2e372cda"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cb8c95ad1a077ce3db2f46cdb4276dec2e372cda"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 9 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision d0e7d6b5b763e93dd38f9ece05230979ede95a0a was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2229185506173296528==--

