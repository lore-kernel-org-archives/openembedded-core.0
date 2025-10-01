Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F615CCD1B0
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17930.1759325533110206195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ow55DI/S;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fi0rwOdF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101999ff97f99-0c7fff8c-58da-49b6-8805-179fda426386-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TJuTCuLglCM/dzhc3+gbklrVJyUhtt9UkxdNxdN9XGc=;
	b=Ow55DI/SW+3xP41TydxIbNr/NwoN1hqMfAgBdZK3beSQL+TZ5NEQLQKRQ9Gtc2Cg
	38VYrRyZq1/jVnk9Et00CFBaap6QXW5CLmk47wCV8tBfYtl0FTWXZJqHTo5aZXevcw3
	7mAGIu2yxucamgj01IssOA9MogkiS+wX/MGcJdVQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TJuTCuLglCM/dzhc3+gbklrVJyUhtt9UkxdNxdN9XGc=;
	b=fi0rwOdFSoX8pTDUgr/+WcrO5WnVj92+YzIlQxjsh1n8W90P4WQ5txfzyrW75uhh
	+qbvbt0ZeqLzs1EQ0ngAuZUL38eKvABarY6j7JNkDkQRxSc+gaPaVPdgTjsLP6oTyUv
	VLNHd+EyAGr657qXxlmBuvI8hC599PVuAFvw5LS0=
Content-Type: multipart/mixed; boundary="===============3799340843407365905=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 b9961792604af2ede4c9d0868947de2a8eccd549 FAILED
Message-ID: <010101999ff97f99-0c7fff8c-58da-49b6-8805-179fda426386-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224282

--===============3799340843407365905==
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
DISTRO_VERSION       = "5.2.99+snapshot-86df9b46cd541aa8926d4bcba2dca4c9f7d06d80"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:86df9b46cd541aa8926d4bcba2dca4c9f7d06d80"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b9961792604af2ede4c9d0868947de2a8eccd549
WARNING: Command 'git rebase b9961792604af2ede4c9d0868947de2a8eccd549' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in 6281eda (Add changes from do_patch).  Version 6281eda (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3799340843407365905==--

