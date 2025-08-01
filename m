Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B994CA0EE9
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.88632.1754057270748679038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ekXBwyoY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OrX9XGkH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019865f5e3c2-fe4e4c27-d7ca-4490-90ec-500f0f60557f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3+TTZPVH07/ow3/5PGizyugDgMTNJO0LO/jt5UTU6m8=;
	b=ekXBwyoYJCRVJdHv6Oaa6tM1Snn9lZMudMs5kQVNmTNc3oE8ptCGbAycyDIUG8NK
	42D/OHk/tpFlF1LXkaRRWNrjU1rxe878avrHpECMXvMi7MqdqAnNm9ur4Bo8KSvimcA
	HNVwy9gqvzyH4Eh1WTqcVSjj0QfAC2/pELjLM0tQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3+TTZPVH07/ow3/5PGizyugDgMTNJO0LO/jt5UTU6m8=;
	b=OrX9XGkHqtPRFfyIWbDSOf/se/rVBcD9zkK6MClLw6/LEhQ4UYbjGb4bus3NMmc/
	WTjgAA46Os2RzRbMppAi+JQaIzGWreh3bYxI2R04ilQLvJ5Zq18dJgOkJb19Pfz8oce
	wvjccHLLO5TX1RW/fk5lw2COzzCG93THGOkMvf/I=
Content-Type: multipart/mixed; boundary="===============1211533507303891510=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.22.21 FAILED
Message-ID: <0101019865f5e3c2-fe4e4c27-d7ca-4490-90ec-500f0f60557f-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221268

--===============1211533507303891510==
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
Loaded 1933 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-59a59f3bbd4cf3d0ed310c67850f8ebf58b83b43"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:59a59f3bbd4cf3d0ed310c67850f8ebf58b83b43"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
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
--===============1211533507303891510==--

