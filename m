Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB4EC0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.42624.1738416047960102175
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bSmiLN2B;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oQhEUZgL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194c1ac23db-68fabf92-c3b4-4dc7-b38e-d87477734b0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5R9lr5RaqYZBREFvLY6ebI5v3VWHYqn3XqD0owS2RfM=;
	b=bSmiLN2Bsky7utJ7g8D94kQs68PFSLfXCUfS9zLOLnzGXNB46ZYHjm6df/ipyJzP
	792zyYqP+pMD54Pg8ik6vuxxHAVex8wIEeNzg0upAGcd/sz++2KtcmWjzGLEz7BiPqa
	LyJ6DRAinyNNspF1s4A53wFnEajP4UZOB9To7IAs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5R9lr5RaqYZBREFvLY6ebI5v3VWHYqn3XqD0owS2RfM=;
	b=oQhEUZgLcwecFxUGHdcwNBBx8gr8HoiSpTubEebnVV9z5TxOhUN0rmgainU62eSs
	RcWoJJ41RCa7Byp/IXdECMwrjKkqXPXA6yeMC+xvGu/gp6S5stequMcTqWFKTFGvJIO
	thxuR1JW9DZpk5wBo6FDwH9/+WaF25GmZlvRGfKk=
Content-Type: multipart/mixed; boundary="===============2418636536443129709=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Enet=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libseccomp: upgrading to 2.6.0 FAILED
Message-ID: <01010194c1ac23db-68fabf92-c3b4-4dc7-b38e-d87477734b0c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210601

--===============2418636536443129709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libseccomp* to *2.6.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libseccomp failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:054ebb8d3ac1be9bbeffe4511bda5d52fbc5843a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c7c0caed1d04292500ed4b9bb386566053eb9775
WARNING: Command 'git rebase c7c0caed1d04292500ed4b9bb386566053eb9775' failed:
Auto-merging CHANGELOG
CONFLICT (content): Merge conflict in CHANGELOG
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libseccomp
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libseccomp/libseccomp_2.6.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2418636536443129709==--

