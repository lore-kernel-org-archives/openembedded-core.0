Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4A3C79F99
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 05:28:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8782.1788672481434980052
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 22:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gMsrF1ev;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SaA+4bAz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a07530149f-747c0fee-4a90-487b-a89f-68bec6496942-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788672480;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jl72PaFvqdTsczwjJffBvR5UaZh2A9wycMifmBCEWg8=;
	b=gMsrF1evzfsutchpOB4oyHlmxL/cqE8J2xZ9aEQW9gD/PPGd5kam2KHNDLFDgklw
	XSM5h55Z9bogwiFPcvU68SLd4oPcyACGIkHO/90jMiMQak5sxo4XbtX5oBTGJF3ALFj
	IcMmZ/i8dUg1VkN/RwOK4Bti9szQ/Jirlz+uq+oI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788672480;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jl72PaFvqdTsczwjJffBvR5UaZh2A9wycMifmBCEWg8=;
	b=SaA+4bAzQvTKRCLzr3q5Vrul779unBfTxZ0Sk45AB4c5RWfe7oVksA5sEDBXRYSs
	VoOnCgBRUgdsTiOGx2es3uZ2nqqSK5tQ7M3pePuRLjw7NPZq56GKV5YaOyL6lfAn+Fr
	hq9ZuUQEZZ8uCVOq46Z99d8quhlS7norxkxCLHcM=
Content-Type: multipart/mixed; boundary="===============7387143459245791471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jan Schmidt <jan@centricular.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-rs: upgrading to 1.29.2 FAILED
Message-ID: <010101a07530149f-747c0fee-4a90-487b-a89f-68bec6496942-000000@us-west-2.amazonses.com>
Date: Sun, 6 Sep 2026 05:28:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.06-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 05:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245198

--===============7387143459245791471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-rs* to *1.29.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gstreamer1.0-plugins-rs -V 1.29.2 -S 2859bf0fa0097651193ea4b80532d7ffe46b11e9
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1988 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-02890c1eff104de94ad22023232fd36baaf228dc"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:02890c1eff104de94ad22023232fd36baaf228dc"
meta-yocto-bsp       
meta-poky            = "master:3bb1295755628c4facec3a0a2800a9c12345ce00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 2859bf0fa0097651193ea4b80532d7ffe46b11e9' failed with exit code 128:
fatal: unable to read tree (2859bf0fa0097651193ea4b80532d7ffe46b11e9)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7387143459245791471==--

