Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2EBC021AB
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42731.1738416060782910355
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OWL1lfKn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qY6caJw0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1ac0d2e-bb463a1f-f3b4-4189-8ae5-19bd31887a96-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416066;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PrKEl2oIbWELw5ACi5MU1h3SmHxN8ib+fTV40V4b9/s=;
	b=OWL1lfKn+V6mD5PrFZGc8MxpgrWvcj/LEsPV9iAoJKhFymCAcQMNNO2ln19uppmh
	SXh44wjD+gF+mIbWTAjW5tYJ/hnKsnUBW8hDKP6qpnoyZ37GsRtZ9x1CQLVcQdXOL7h
	Py6LW5WJYPm+hNY6YpD7P8LS82270Y9D4lFosl00=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416066;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PrKEl2oIbWELw5ACi5MU1h3SmHxN8ib+fTV40V4b9/s=;
	b=qY6caJw0xxECFwoPSYmUkLFfT46abxy70sSDrIRfOHKI0/aTwQE+mpsx5skBhmzm
	F9WjeoBF39WjKS+Uq1mTezdH8S2YD5xVdaISVNXXN4DCTMVI9JtcO4iclBso378QKV7
	KkvM4uBNw40tsfEv1cjtZMwWLG9U25Iu2fOoL0Rc=
Content-Type: multipart/mixed; boundary="===============1856555235161702533=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 40e3b440ef0f1c5e5abcf7c85f9de332e1f13503 FAILED
Message-ID: <01010194c1ac0d2e-bb463a1f-f3b4-4189-8ae5-19bd31887a96-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210583

--===============1856555235161702533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *40e3b440ef0f1c5e5abcf7c85f9de332e1f13503* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 40e3b440ef0f1c5e5abcf7c85f9de332e1f13503
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
workspace            = "tmp-auh-upgrades:2f0d5b93c1df29edd506913863cecb0e7f6a9951"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 40e3b440ef0f1c5e5abcf7c85f9de332e1f13503
ERROR: Execution of 'git rev-list devtool-base..8db8ce9c528330f0b1261b07531b009732b08731' failed with exit code 128:
fatal: Invalid revision range devtool-base..8db8ce9c528330f0b1261b07531b009732b08731



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1856555235161702533==--

