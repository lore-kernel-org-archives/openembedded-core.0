Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39162C54ED5
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1252.1710522012844129201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A5bGwrhw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ViJWQ5BZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e430e9222-cea36549-4637-456f-a2ea-e97d92a05b74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WoSKxoQk73d0CiE6IS0dH4tdEkcneszpzLfIHta6T7o=;
	b=A5bGwrhwUk+o/fng9Y9OkVGnmDwp2vklbpzj1TmTNE68HyC9EqZnayltF1O9+47t
	t5XjSwabFNoE/PnVxtdBfSBAADAYn5GRO+okEAX/PFy/lgybhmInRNnJ3hZvcYSIHds
	vP/L8uJtJlXY/r5ZiQxqyR5sSTkR5PxCPfKPKEGc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WoSKxoQk73d0CiE6IS0dH4tdEkcneszpzLfIHta6T7o=;
	b=ViJWQ5BZCitHk5PSlZ97OeiDCOFPILHual08ja1FPllvO9uk7Q6UALS3XaeFPD69
	kRffIc4oQp49KE1OxEzFVThm+1bAhSOhloqW2gQCL7Yq4lcHsSG9J9lGtoCyRXU87nI
	VZCGJxduwnH6aJnlNsBNLLv+sLHLPKk5QO+UCDmw=
Content-Type: multipart/mixed; boundary="===============6524250027612624390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 32022caedd6a177a7717aa8680cbe179e1045935 FAILED
Message-ID: <0101018e430e9222-cea36549-4637-456f-a2ea-e97d92a05b74-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197193

--===============6524250027612624390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *32022caedd6a177a7717aa8680cbe179e1045935* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 32022caedd6a177a7717aa8680cbe179e1045935
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-285d24403c9255ed41003cd20f6e9e093e95905f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:285d24403c9255ed41003cd20f6e9e093e95905f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 32022caedd6a177a7717aa8680cbe179e1045935' failed with exit code 128:
fatal: reference is not a tree: 32022caedd6a177a7717aa8680cbe179e1045935



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6524250027612624390==--

