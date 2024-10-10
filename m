Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA7CD0D78D
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:42 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.53256.1728588943051199225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bvbmEOqf;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=riLIpcPb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277eeee9b-f2315104-250b-43ab-a109-64a9381b6922-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728589000;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7loDu5xcuKadRz/xEGNu15lqOMdI3yEKFyBQqMHvGdk=;
	b=bvbmEOqfwVRGwDKK424TMfhCUhVU1Im8I3Iah0s+tS9SDDk2MSq8W0Lsx1drm2LC
	Rd3qtSUtaJ8pTJZUxQgcpMk8cK1j9Pwhk/MeMZMxnz5RyRn6qPoz+LIRkuwzZKjt7Mw
	p7Yb8dGo5nX2nTmiK1GHrJpsiEUoKCuqZQdE01K8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728589000;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7loDu5xcuKadRz/xEGNu15lqOMdI3yEKFyBQqMHvGdk=;
	b=riLIpcPbyTpBUYucCNGdhnVT2HT5mg3kJybx5vwDkxwXNxi+eHHRNcbI/ZHpXZC1
	aMywVk4MPgAvzD/909nU/pvYhIwE0WreL8TSGhyA+bvU7gKRkCT0x/oVpsKMMOl6mr5
	ubBJMTVpYCsQmGdVbLXYzqLLxFVymMq4wAJmOBMA=
Content-Type: multipart/mixed; boundary="===============4631126510872924836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.11 FAILED
Message-ID: <0101019277eeee9b-f2315104-250b-43ab-a109-64a9381b6922-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205622

--===============4631126510872924836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.11* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade btrfs-tools -V 6.11 -S 8859114eaee39c117ff95f5b60b4e81fc22f96e7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:efad6559c6ecd3dba0a4507afb420ce5a1338f20"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 8859114eaee39c117ff95f5b60b4e81fc22f96e7 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4631126510872924836==--

