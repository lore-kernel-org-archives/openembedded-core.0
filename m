Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E43AC87FCA
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1423.1751386820096998693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yK8uizAY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=J3pWcZ4X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197c6ca2c5d-af413d4e-4fc7-4696-971c-641750dfb855-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386827;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p/lkshDfW5eJHgrhQLojnZe91GsWDBW3eHKLm18Biwc=;
	b=yK8uizAY+eYoC/iVeYWVBxWI1tsGI66sbivBUsgW0au2csq7dw1rXWCE8meTCp29
	D5Fyy1NcPiSKlDf9igt6R2dJIRtfbmsLBkXxxe7gzn7j+S7vnHocpAlPeCGhMJt2DcP
	dClz0wYEgUsRe0ybb0fKsO4UhtSSN+AdXjWJwOUI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386827;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p/lkshDfW5eJHgrhQLojnZe91GsWDBW3eHKLm18Biwc=;
	b=J3pWcZ4XOnT4keBVfdwiux0X0vyYXhsMIy0hOoxC/zmxvDZ7IelQkxB5V+QZaClR
	AHzf74hk8ghkrIixYe6KgK3DTrsOjvtDECuJmPE63dpOVajaKthQNXX2xYBpjHGK1Vq
	H5USY4GB4m+xD/WtMdb39C/W503q13bhP3ZiMMfs=
Content-Type: multipart/mixed; boundary="===============4392616324757913997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 270bd1f696f2e19e7281dc18c77033b17bfadb1d FAILED
Message-ID: <01010197c6ca2c5d-af413d4e-4fc7-4696-971c-641750dfb855-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219683

--===============4392616324757913997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *270bd1f696f2e19e7281dc18c77033b17bfadb1d* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 270bd1f696f2e19e7281dc18c77033b17bfadb1d
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-94ce2da69db4e63c5a66df23cc698d5ca1755e4b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:94ce2da69db4e63c5a66df23cc698d5ca1755e4b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 270bd1f696f2e19e7281dc18c77033b17bfadb1d
WARNING: Command 'git rebase 270bd1f696f2e19e7281dc18c77033b17bfadb1d' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in abe110b (Add changes from do_patch).  Version abe110b (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4392616324757913997==--

