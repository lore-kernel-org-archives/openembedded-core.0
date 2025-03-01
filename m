Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F7CC282E3
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7056.1740828325429646193
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VPlWw6Ai;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Jvtqirf6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101955174484c-4f54aa93-99f0-416f-918c-1ab57f432f35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0Kfjx+/gd9+B7zKyhGwpwRnbWm+zokvN33hg1pybieI=;
	b=VPlWw6Ai/2xwoBTcm5nR5ekwRNKTDVzPp6iNkTYf5jWc5hiWggctEc4uUClLBQdK
	CMmS+aubtumwBB+LpBNJVJGpMgg69TkrkQqTzu9rtpF2eJyc933wgfJNqjDzJnb/7ol
	5QwLKuf9i487P4cOPTqTlcGjQjcb+NjsQn2XLpQI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0Kfjx+/gd9+B7zKyhGwpwRnbWm+zokvN33hg1pybieI=;
	b=Jvtqirf6Jr1hB2+6t/sM9wiL1C2fnfibaUphyRPD4SFWr3jEExQywfKK9aT9zK2P
	JkQ+zr0bS+3SahCgNWUcg19blDIwCxvdGDjRBxASpkNlE8lpCg5EsNpV52WG/c76ZVM
	2wbek/5EmRRAZuiJOhqTalcDngSP+ixjTFig0DWE=
Content-Type: multipart/mixed; boundary="===============6793906206531517259=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 40afcb705d05179afce97d51b6677e46b5b48bf5 FAILED
Message-ID: <010101955174484c-4f54aa93-99f0-416f-918c-1ab57f432f35-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212139

--===============6793906206531517259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *40afcb705d05179afce97d51b6677e46b5b48bf5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 40afcb705d05179afce97d51b6677e46b5b48bf5
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:cc9bc84087935d0263534342891297e66880985e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 40afcb705d05179afce97d51b6677e46b5b48bf5' failed with exit code 128:
fatal: reference is not a tree: 40afcb705d05179afce97d51b6677e46b5b48bf5



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6793906206531517259==--

