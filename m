Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CA7C47073
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.63625.1702649868434889207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Pg67t8U+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H3e71m1j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c6dd72e5a-dcc63da9-7fba-4663-a01b-8f57a7e7da8a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aKqjkkE/1+aujkPE0KyglOBI0HswfsMwpuL7SNH6zSQ=;
	b=Pg67t8U+O5lNFTSqqxUPCzCp5Zdhh7fkyLyjQm6ZTyPnVV9MA260+wmZPb0g3FVn
	MSrNQmCHAYcG8mTb+3xrVJPB2sRsvbeX+0iF1dkHfM9w+BUxe+ORofKIg6skaZXUKLO
	rcEiDlWrKn45PyF+GZzMboPItTxNRCmZGqFBkPJo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aKqjkkE/1+aujkPE0KyglOBI0HswfsMwpuL7SNH6zSQ=;
	b=H3e71m1juaAajuNTfy7cAZ0IujvOXMmoGnmF7Z+zUfCxE0UZfDYm+1c0yrzsxQCH
	l04eSVGq2Y7D2b2Fpj1XC9ughTusxw1PaoDKlhcpu0hLcNhtpa+hPM/08u3Zm8FuE9T
	eNWILGjlgfUx2tDbINPuIoEntei31uqWyas65OYw=
Content-Type: multipart/mixed; boundary="===============6579993022133557246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] waffle: upgrading to 1.8.0 FAILED
Message-ID: <0101018c6dd72e5a-dcc63da9-7fba-4663-a01b-8f57a7e7da8a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192506

--===============6579993022133557246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *waffle* to *1.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe waffle failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-cf470c5b663c79fa6d930dcbe6a37b93674afb59"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cf470c5b663c79fa6d930dcbe6a37b93674afb59"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 580b912a30085528886603942c100c7b309b3bdb
WARNING: Command 'git rebase 580b912a30085528886603942c100c7b309b3bdb' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
Auto-merging src/waffle/meson.build
CONFLICT (content): Merge conflict in src/waffle/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/waffle
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/waffle/waffle_1.8.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6579993022133557246==--

