Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6DACCD18B
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.30911.1757937272301687583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m7cMdNWr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LmQ+i1Tp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101994d3a5285-560303b4-9895-4abb-a0d3-f819a7ad4060-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hBcbHaJ8WY5F3DEhDgQdzAvzhMEHxh83F+T8QC/sc+M=;
	b=m7cMdNWrgag1hPP5ENjz2JEeBb4g8BP7BaFD8n5rkLKpF/oH3bFvGCRlCWI9YXU3
	6sdcjjvDthWFfi8l/FiAAG3O9b/v4ayFf32hQIXHS2o5Ze0BOT1bh47ydXrXl/Vn4Fr
	VS+RzIcv0YPsXEdtOmE/K72mT8RHkOSmWNbdHVOA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hBcbHaJ8WY5F3DEhDgQdzAvzhMEHxh83F+T8QC/sc+M=;
	b=LmQ+i1TpL34E1maKtmQtFzjis35ixHE/cj3mUFK7baHEEK31annIDjDGIygFG1tm
	6B22v5Kk+IClXIlm7+WRAgEcyM6UhKAFJLTo3ABE0rU1XkiMMXwqJklEbhIh954uIN4
	JG7+tCuXmXPZUK2YWYLAfGif9jjiBnYITQeMMezE=
Content-Type: multipart/mixed; boundary="===============0133333931727437363=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 b9961792604af2ede4c9d0868947de2a8eccd549 FAILED
Message-ID: <010101994d3a5285-560303b4-9895-4abb-a0d3-f819a7ad4060-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223459

--===============0133333931727437363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *b9961792604af2ede4c9d0868947de2a8eccd549* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S b9961792604af2ede4c9d0868947de2a8eccd549
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b80995851c058b5561cbcb8c3870bc07af017f92"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b80995851c058b5561cbcb8c3870bc07af017f92"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b9961792604af2ede4c9d0868947de2a8eccd549
WARNING: Command 'git rebase b9961792604af2ede4c9d0868947de2a8eccd549' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in f2a171a (Add changes from do_patch).  Version f2a171a (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0133333931727437363==--

