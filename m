Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14CBC54751
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.131415.1723748333645538745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ACzs8ILz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QtjXYzuf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019157683c27-d0a16c5e-809e-40f9-9439-317eb447ea4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9hHuU889sd57054xKqOrUMQ3jmIddgL1w5ZvBvxeOgg=;
	b=ACzs8ILzZHWHtR7zSSQxTI8SRfXFb+url7yVQFJqkI9UA2h6HkS45Zo3GAC3FSNb
	F2MICY40ly8/36cSd2MZPgzicN5ZvzOtmfaTnOeV+SaGr/ucGLZb/VYJHWGIprNCHyH
	jjvSGr3lZL4mgrIjyjtrSKRrpUt8iZJzBd3i64Iw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9hHuU889sd57054xKqOrUMQ3jmIddgL1w5ZvBvxeOgg=;
	b=QtjXYzufyziEl9J0tgnLdWKEIVaaqDCxXMkrAGVG5FnGLAPye7FSE4z6uUK5GSWr
	EmMlQy1Ox8PRhH/MObJJTIpDJfgGGmk3i0sOWqJQfS7uRRiapJwo9vO5SJok8CMeOI6
	jwf/ABQJQ7DCoEjQFEQ999t0SBAq5/+9Qaxx7WKM=
Content-Type: multipart/mixed; boundary="===============5400824646411037463=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 39e772fc26705bb170db248e5372a81ed5ffd67f FAILED
Message-ID: <0101019157683c27-d0a16c5e-809e-40f9-9439-317eb447ea4d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203399

--===============5400824646411037463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *39e772fc26705bb170db248e5372a81ed5ffd67f* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 39e772fc26705bb170db248e5372a81ed5ffd67f
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-46a146e0183d74841888f346183ac265c5449665"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46a146e0183d74841888f346183ac265c5449665"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 39e772fc26705bb170db248e5372a81ed5ffd67f' failed with exit code 128:
fatal: reference is not a tree: 39e772fc26705bb170db248e5372a81ed5ffd67f



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5400824646411037463==--

