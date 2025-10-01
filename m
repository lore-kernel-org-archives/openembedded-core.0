Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AA5CCD1BD
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.17925.1759325532145562689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n6+3Rc/T;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KNHteuH1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101999ff966cd-c8f63505-d74c-495b-a905-bff218994de2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hxPRzpmVqUidpLtsV4S66ABg6aqegDWrlGfEU00YSPA=;
	b=n6+3Rc/TIaN9sUXN2/R9qAJUU2PeoZQRy+5eJaufzHsgwGxWOZtKHClZ9HYXLAX7
	X2tuAseM5m7y3sDn9DSO2GjQb+ef6JVCQ1BtbT7k62ZyJzptVboIS7KxBN9HkDrBC40
	3LGFCXVJHIFUeK1/oBrf/6lAwNgMGYmsfJxADmhc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hxPRzpmVqUidpLtsV4S66ABg6aqegDWrlGfEU00YSPA=;
	b=KNHteuH1SNPM9raEa4sxBRPPYzzXCbEouSA4AxnGzU2BuAmsjNUkV0ttUkNw0fBj
	0KOS05qeOBFnxQELyHsZBVLH934bgNC0vFUYUZNy1TFLnL4140MIm89z4haRpK+MlSG
	cBEGPleuh1hJGBrNTNwWunR6i2iLjN0EHbUMpPNM=
Content-Type: multipart/mixed; boundary="===============2573733459253215118=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 7f05d217867b2af52b0a28c6d1c91df97e1b5b39 FAILED
Message-ID: <010101999ff966cd-c8f63505-d74c-495b-a905-bff218994de2-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224261

--===============2573733459253215118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *7f05d217867b2af52b0a28c6d1c91df97e1b5b39* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 7f05d217867b2af52b0a28c6d1c91df97e1b5b39
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
DISTRO_VERSION       = "5.2.99+snapshot-e3490dd7fd4dc5f4dddd67212b72dd0ebe7f063e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e3490dd7fd4dc5f4dddd67212b72dd0ebe7f063e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 7f05d217867b2af52b0a28c6d1c91df97e1b5b39' failed with exit code 128:
fatal: unable to read tree (7f05d217867b2af52b0a28c6d1c91df97e1b5b39)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2573733459253215118==--

