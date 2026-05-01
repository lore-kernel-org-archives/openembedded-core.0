Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A135CD37B2
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15626.1777645545993906886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LiEayJe6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AnC3is7L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019de3ee73a9-60da61e2-042e-4c32-bd83-06542566fcd3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7w8/Bzi5zSHRqiutc8ZGy3rP2UfeaapTYiLw06OEwJg=;
	b=LiEayJe69kA+3k1HgZw/E77R/DmKWTPdTCg/cY6Qifkw81cR9aeIZwFHBIQF/qwF
	dT92K+ZDPPKomR1cgf5BloCVMrJSmHb3kU6aoZoumHNYf5srxrr8fNdMQB9WRNNxGHZ
	9302NDDDQK3WlSdbd8h27Ho2PVVk351wwdXx1hyc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7w8/Bzi5zSHRqiutc8ZGy3rP2UfeaapTYiLw06OEwJg=;
	b=AnC3is7LRoeZKEcDPOzDi2cROu7DV3gEQoYdeTq0WzKZyIymlv+Kt2tRnYHhc5s6
	lEZUdeg6TjNxV8zAeUXnFyfJX+eNh49bVSHlXZ7RA3OP3v7xbl0+mBtY2hzFiL+VPEy
	l7IyhVZEkaHE33AZDAMIU6CH3x4pQ14TeR+ckdqE=
Content-Type: multipart/mixed; boundary="===============7898522114642149470=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] time: upgrading to 1.10 FAILED
Message-ID: <0101019de3ee73a9-60da61e2-042e-4c32-bd83-06542566fcd3-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236264

--===============7898522114642149470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *time* to *1.10* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade time -V 1.10
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1976 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-556d02836d1b2b25cbf6ca64254c9b34fc21bddf"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:556d02836d1b2b25cbf6ca64254c9b34fc21bddf"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1977 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-556d02836d1b2b25cbf6ca64254c9b34fc21bddf"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:556d02836d1b2b25cbf6ca64254c9b34fc21bddf"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  35% |############                        | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/time/time-1.10.tar.gz...
INFO: Rebasing devtool onto a78fdffb61069986ab7aee798a1d5891fc4000ba
WARNING: Command 'git rebase a78fdffb61069986ab7aee798a1d5891fc4000ba' failed:
CONFLICT (modify/delete): src/resuse.c deleted in HEAD and modified in b7dc6b9 (include string.h for memset()).  Version b7dc6b9 (include string.h for memset()) of src/resuse.c left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
src/resuse.c: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7898522114642149470==--

