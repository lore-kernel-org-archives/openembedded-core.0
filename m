Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CBBC8303F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1435.1751386810851649396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TlrthZBX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tpAIrvaS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010197c6c9e695-ce804c88-32b7-42db-967d-23526b2f48c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TnyQejnfBphbRb++qZl4EiS0dHGwfbNR7Lc6Np4W2zU=;
	b=TlrthZBX2ysygW6ZwNrm3cD4ZAg0lK+cThTW3q17Lfm2z7eGW+eVmxgdnRGUoShv
	sELNSEZU3F7JO6jj/RB+nSD4H0M2QbYhYsawWKlkbhH5huxogWlm2pto5JmieYMpXLd
	UiVQK9wHHRUueJiyUQZwVFAbyqhH+sz8EZ+E+R4U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TnyQejnfBphbRb++qZl4EiS0dHGwfbNR7Lc6Np4W2zU=;
	b=tpAIrvaSI9Eg46ETnEbGReZomgzNB4+Oa5TTmHKGVXRqH2H2bV3yYJ+tWAvtWqdK
	nuPWH1ygR7xBnGk7KTHDxg0ZWPxMqmPoMJEKYv4qir+wWZeZumo+b1KV0gA5rD2Tj5N
	n9p4y0DI9QtAKn5y3ckcPTHHmYbDP82xUtL/TtuI=
Content-Type: multipart/mixed; boundary="===============2855618327183156737=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.22.20 FAILED
Message-ID: <01010197c6c9e695-ce804c88-32b7-42db-967d-23526b2f48c4-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219622

--===============2855618327183156737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dpkg* to *1.22.20* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade dpkg -V 1.22.20 -S 8243233fc5173110798cbc22711fb4675a356d02
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b9b8832383b6a363460fce53ab62c978d57bcecf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b9b8832383b6a363460fce53ab62c978d57bcecf"

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
ERROR: Revision 8243233fc5173110798cbc22711fb4675a356d02 was found on multiple branches: 
  1.22.x
  trixie
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2855618327183156737==--

