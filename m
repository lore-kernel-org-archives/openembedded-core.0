Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44335C19F30
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.42723.1738416054165155538
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gP0WPSjr;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MnCy7a9n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010194c1ac1721-b4dd300c-9ce2-42b7-a64f-6541f312dd71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416068;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OjzehoT2Hs3EB8nR0V72k8vOUDmx8Vsyd+bTzY4/0/Y=;
	b=gP0WPSjrUrGmKa+Io0Mr8U+/gnaGO/0lhLDPsv5TPD7Hi4jULPZeZjXxqIK2N4t9
	DXfRjTMRNMB1mH3dvCxyUlW5H7j+vAcMPk8AUq3WkFfuG8ddvAxoWXZTWjh+g6rx8dM
	vGKuWJA4uPumX0f84I+aOEg+pzvkLO1e915qK3Ag=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416068;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OjzehoT2Hs3EB8nR0V72k8vOUDmx8Vsyd+bTzY4/0/Y=;
	b=MnCy7a9nzgFSJcZ0uXXRkMpjP4doJ70g03yZWNyeXWX8MIEUW8Pp0Mpz5cSqw7wE
	3hY3U75N+7pEd84dKO9fkgUMGxoZDxJa4/fWpmsrnC0RcoRPKAG9dHJTO7IK4CDqstN
	9/uZkg7hPFe7FJuCMmtdH9tvQW/g93IrGEOaBeFo=
Content-Type: multipart/mixed; boundary="===============1849210689976201631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] babeltrace2: upgrading to 2.1.0 FAILED
Message-ID: <01010194c1ac1721-b4dd300c-9ce2-42b7-a64f-6541f312dd71-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210590

--===============1849210689976201631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *babeltrace2* to *2.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe babeltrace2 failed.
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
workspace            = "tmp-auh-upgrades:4ba09a5b61e26e6998c48d83f9d092b50c8c68c3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0
WARNING: Command 'git rebase e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0' failed:
Auto-merging ChangeLog
CONFLICT (content): Merge conflict in ChangeLog

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/babeltrace2
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/babeltrace2/babeltrace2_2.1.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1849210689976201631==--

