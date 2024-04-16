Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653E7C3DA46
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:14 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.13464.1713248049454445094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AmLowr9d;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QqYbsCrO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58a976c-37330f37-63a6-4a5f-ad60-b0672e22ad5c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QY7oqXxUm2CBN+sXqr0+WxTPNHhVwhvrPmdxVDIc8EQ=;
	b=AmLowr9d5BfRNKDieU1yLZlJEN7oSz7APytASjTcVxtSfmCrIA+UGlTwwh5YjTLl
	06Mw9uFNsqZyyTTSvPAZS8CyhICvKeodSN3szLichFnVWaruk9tvllt+CSRVBWLOqJg
	UsRHC5nH2pxw/S4gIHx+B6sl18H2FYdD/7p6j/8Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QY7oqXxUm2CBN+sXqr0+WxTPNHhVwhvrPmdxVDIc8EQ=;
	b=QqYbsCrOd3RqdzWHQbzicxkv9NSbdvWNub96/K70NfpK5xPplmWQaU4zQipwEPqA
	hhHs97AmaQ2W4TTMFOXkyjrp33ODF6HzTmUTsD0MS96PUBjQvYhkViPA0WYNLZHVl0t
	pqvSI6MwPCHvuTVFmbyKcbeyEex8sSBdkM6tzbfM=
Content-Type: multipart/mixed; boundary="===============6324158799133899927=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.21.0 FAILED
Message-ID: <0101018ee58a976c-37330f37-63a6-4a5f-ad60-b0672e22ad5c-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198355

--===============6324158799133899927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-utils* to *2.21.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libva-utils -V 2.21.0 -S c46adc8dff6120cbba3f03781e4d6df054dd8f21
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-9f6ed0e2c2b027a496274684d04f692886457b31"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9f6ed0e2c2b027a496274684d04f692886457b31"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout c46adc8dff6120cbba3f03781e4d6df054dd8f21' failed with exit code 128:
fatal: reference is not a tree: c46adc8dff6120cbba3f03781e4d6df054dd8f21



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6324158799133899927==--

