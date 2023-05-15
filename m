Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250E5CA9EAC
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.3714.1684186748009481278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WZIf0zSy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a56ef-a6f325f9-78ef-4fa9-ae45-729319508a54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0y9UP7+TSouyOXTdLKtF6D/06mrZnTzXb8/NxK8a7Wg=;
	b=WZIf0zSypPM+ec7e/oR7YwsFpEBGJihSrexqmb+Go7zJV6r8ausk9ELQM7tm06lw
	NS23gd+CQdJttk4i14qNhkLQPSz5PBs8vgvTYhp85i1n/DQI1JW4S53DQ9ksaV89v97
	nUftWx0myeQSuqmjcFHUYgBuIUN9Fn0SAMmCE+k4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0y9UP7+TSouyOXTdLKtF6D/06mrZnTzXb8/NxK8a7Wg=;
	b=HhOmKGiu/Za+XrVOVvD1tB48h0auKDuQYzrD1VVcc7fB3ERKGW6qcvpTLHF4wtZG
	1Bekn2Aq3BYpPGS+TQxykJ1sIdzx459AxfzZYNWupsohPrvtkJ4Ja0LzCnN+gG3VprX
	NsOhAV9SeOx/ECdGARFuOHyjNs0OnrOnJVfFNLo4=
Content-Type: multipart/mixed; boundary="===============8252986106361574046=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 61060d64ef5ae63c97dca5d93bb30dd7c1f2e2fa FAILED
Message-ID: <01010188215a56ef-a6f325f9-78ef-4fa9-ae45-729319508a54-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181330

--===============8252986106361574046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *61060d64ef5ae63c97dca5d93bb30dd7c1f2e2fa* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 61060d64ef5ae63c97dca5d93bb30dd7c1f2e2fa
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (14:21:30.992899)
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5ada958fe33d0f91c7d5fe2a640d4bdfaadc3de0"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 61060d64ef5ae63c97dca5d93bb30dd7c1f2e2fa' failed with exit code 128:
fatal: reference is not a tree: 61060d64ef5ae63c97dca5d93bb30dd7c1f2e2fa



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8252986106361574046==--

