Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE0BC47DB1
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:06 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4604.1704114720793203018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SCnuj14o;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZDesGcFi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018cc5270c7c-3b241047-ba17-45db-bc18-884d0e1b9cb2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0TNzWxsJz3/RmNKQgcSVZAK61ixaa+v8ehK6aSNE2O8=;
	b=SCnuj14oT85w5wwKtZ5uhhzNghWSi3varssO7Q2iR4ug2JqAC4OMht+axTSdHBtM
	qvxBKefEdR12oUjgIbJES7dlucY7YX0YIB97psQUsmB+scyayXO1hVqC4INNEOsgA2d
	8wIWP9zcRorLT7y9mIl4cS8NCAuoZHDaSSJL0VQI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0TNzWxsJz3/RmNKQgcSVZAK61ixaa+v8ehK6aSNE2O8=;
	b=ZDesGcFifPEi0YeodlQ7hxEeWhnkKiXKJ/v1qUa5DeLhAYS3XhSHbKg/hNK0YCBV
	TFv7aiV1IC8wAvjDeznJh2hB7yy4Asu768wfk/4B10XhQUkkm2RDs3Oe2vSiCPn74S3
	kZO+0kjNh2Gvm0lHvh55+L8mYhMvKsmJHys/Pxv8=
Content-Type: multipart/mixed; boundary="===============5050907702129334235=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 1d6d2400d4027025cb8edc86a139c9c581d672f7 FAILED
Message-ID: <0101018cc5270c7c-3b241047-ba17-45db-bc18-884d0e1b9cb2-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193170

--===============5050907702129334235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *1d6d2400d4027025cb8edc86a139c9c581d672f7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 1d6d2400d4027025cb8edc86a139c9c581d672f7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3b495697b5b5b4575d72c264e687cfef380f8f4e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3b495697b5b5b4575d72c264e687cfef380f8f4e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 1d6d2400d4027025cb8edc86a139c9c581d672f7' failed with exit code 128:
fatal: reference is not a tree: 1d6d2400d4027025cb8edc86a139c9c581d672f7



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5050907702129334235==--

