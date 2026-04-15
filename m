Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D347F42100
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19806.1776261867822313060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QsbaY610;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Yg+dv1gG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d917532d0-bbd90eec-1779-4a4f-b655-feba03949a3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261870;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H18Kon8t9egNUP6CZYAmal++XioNLJ3/tVRfAef1Eco=;
	b=QsbaY610ltTkv2+wpBMG6fMTJ5gdCsVX0sBtDf1a1ADe498XWwS3QQeIbBzROpw+
	2sJ09MB1SYq0/uGcpMV7vC9DWMmQTxfSAsFZz8ChAV8z6XZU3Fw17pxAIuMxt6T163o
	ZXikCeC9V8zlkTxECCgNh6a37OXLcPM8g/pCw+N4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261870;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H18Kon8t9egNUP6CZYAmal++XioNLJ3/tVRfAef1Eco=;
	b=Yg+dv1gGnWf4FmZhDqdPYbF1VJVLf4Gj9hY5K1bnOUCqm3f+DGG8vq44FVo1Xz+w
	5MXbeTIc90WOJJZtWFOmnT47AJvAfioWPq+xzrgt1kyWtq9VWG3lGxXD6k90ATTkaU3
	C4pgJcJ8IQYW8WTPDMX6Xwk4/viyG2RNcmnK7tLE=
Content-Type: multipart/mixed; boundary="===============1082514535218180242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools,lttng-ust,lttng-modules: upgrading to
 2.15.0,2.15.0,2.15.0 FAILED
Message-ID: <0101019d917532d0-bbd90eec-1779-4a4f-b655-feba03949a3e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235205

--===============1082514535218180242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-tools,lttng-ust,lttng-modules* to *2.15.0,2.15.0,2.15.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade lttng-tools -V 2.15.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-2bfa43adb4a5f93cdf8b825ac7a0b3c4da9a280b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2bfa43adb4a5f93cdf8b825ac7a0b3c4da9a280b"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
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
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1972 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-2bfa43adb4a5f93cdf8b825ac7a0b3c4da9a280b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2bfa43adb4a5f93cdf8b825ac7a0b3c4da9a280b"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
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
Adding changed files:  11% |####                                | ETA:  0:00:00
Adding changed files:  22% |########                            | ETA:  0:00:00
Adding changed files:  33% |############                        | ETA:  0:00:00
Adding changed files:  44% |################                    | ETA:  0:00:00
Adding changed files:  55% |####################                | ETA:  0:00:00
Adding changed files:  66% |########################            | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-tools/lttng-tools-2.15.0.tar.bz2...
INFO: Rebasing devtool onto 3e036860caeff72608ecc61bea3fad3fa01a53be
WARNING: Command 'git rebase 3e036860caeff72608ecc61bea3fad3fa01a53be' failed:
CONFLICT (modify/delete): tests/utils/testapp/userspace-probe-elf-binary/Makefile.am deleted in HEAD and modified in b7c40be (tests: do not strip a helper library).  Version b7c40be (tests: do not strip a helper library) of tests/utils/testapp/userspace-probe-elf-binary/Makefile.am left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
tests/utils/testapp/userspace-probe-elf-binary/Makefile.am: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1082514535218180242==--

