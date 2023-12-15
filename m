Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FE8C47DB0
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.63151.1702649867628759006
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DaPw5KBS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MMNUIz69;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c6dd72ac5-3785b356-4e32-4513-b703-64797336a673-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qVZbCdbf/BenTfGmAusqvBhzXF/uD6g330o9lO8hUOg=;
	b=DaPw5KBSYrxakhirwHsWL0ZVnKoyMH6RSAcOV+zZDodF/UMb+pJyGA6XbHOrJjRL
	MW6JkslLn2NAEMwXSWDztHboSAbrrmWXhJEFgc+83l2xECQ2wDWVAwdLL6rrAIR/+LU
	jr5kJR1F3khnRU9xEhKfZLVCCdsX4g7TOel/Gdkc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qVZbCdbf/BenTfGmAusqvBhzXF/uD6g330o9lO8hUOg=;
	b=MMNUIz692T7Tu614F6iKBlBf1YZK5GvNvnN2I9rPNQ75eexrc7lU1ztz15FLNr/a
	kquwJrTtouz+L/Iq+48sBPdCWCPpEtyMzOAsc5H1xHkf0wxdAxGJuz4bKkIzrnDleUv
	oNGjXgxsipQ7Ihoam8klpHPqKaES+10yeoEgGS3g=
Content-Type: multipart/mixed; boundary="===============8196388686187438767=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-bootchart: upgrading to 235 FAILED
Message-ID: <0101018c6dd72ac5-3785b356-4e32-4513-b703-64797336a673-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192491

--===============8196388686187438767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-bootchart* to *235* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-bootchart failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1846 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3bb688de751df35afebb89f5555057ea1eace62d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3bb688de751df35afebb89f5555057ea1eace62d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7
WARNING: Command 'git rebase 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7' failed:
Auto-merging src/architecture.h
CONFLICT (content): Merge conflict in src/architecture.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7
WARNING: Command 'git rebase 8ab9680a1bd5eb8fe7a7dcc44897af7ee41e56e7' failed:
Auto-merging src/architecture.h
CONFLICT (content): Merge conflict in src/architecture.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-bootchart
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-bootchart/systemd-bootchart_235.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8196388686187438767==--

