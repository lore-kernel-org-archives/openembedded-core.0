Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DB5C54FB3
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11030.1747312308491238990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mwm5m22G;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YzOhdvgT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010196d3ee16fc-1f543d3d-8013-4a2b-83c4-be001dd30950-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FIquVQNE74RQznM6GRAgNMaz7pFrZz/MVmAXN6gIZ1M=;
	b=mwm5m22Gez3JKo06x1FReHtv1/vPKZ7MeJITEWAMbdZ2WWZu1hRgG/ki+XS4YACb
	0BSqErqAc07J3QqEYZSPZeoavucqmui2ESyEnmNy9dnBHcqQh2bY8Fd2s+YcivAVKDB
	pcO9rB/lBSYc2TocG8FU+fLHCnW0OE6y7k0iSn+o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FIquVQNE74RQznM6GRAgNMaz7pFrZz/MVmAXN6gIZ1M=;
	b=YzOhdvgT4uuJasSrx1zqhOMRI9Y3PVCeTGWBV6yK9GFKy0ywUiZU0a5beRGNS/wM
	ZIRGtOiRoX6X0Ed0x9uYUjTREyh+dW/UvnRlcl5RakTeMlYO1KfXp8W9fMltDW838xr
	aPKwkKr5stz4oS2T1RDnqG5jlMwmIGOyjENy4X3k=
Content-Type: multipart/mixed; boundary="===============5064079573607088637=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia: upgrading to 1.8.0 FAILED
Message-ID: <01010196d3ee16fc-1f543d3d-8013-4a2b-83c4-be001dd30950-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216623

--===============5064079573607088637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia* to *1.8.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rpm-sequoia -V 1.8.0 -S 29545a41b24cb09e37aa85722a333e0924166d13
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:54f5db8eeb9b13c7b6fb6dee6341e7a1b908f489"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 29545a41b24cb09e37aa85722a333e0924166d13' failed with exit code 128:
fatal: unable to read tree (29545a41b24cb09e37aa85722a333e0924166d13)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5064079573607088637==--

