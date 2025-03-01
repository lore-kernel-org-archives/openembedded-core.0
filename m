Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C59DC36013
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.7058.1740828328036645143
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RgUIXduJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Gd2g8msQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019551746748-cfd97845-05ff-47cc-a193-d65ed343acbe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XcTNxSuU5nQKnMMBBu2GNhOLo29/LEBMN/aUNrrlNWE=;
	b=RgUIXduJFjOC3kMp9fYruuQ3WcVNCzzFW56OmmztVvIrxay02QLMCEX0N78heHHu
	bkqJsREElDgEyG7yk8bohSrIMHRd3TB6embvlkxwOYghIr/u147z3wB6IVinUHTSfD4
	udwWekxPiPcpV1pZIqIIjsS+KqxebQjwkitT/2ig=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XcTNxSuU5nQKnMMBBu2GNhOLo29/LEBMN/aUNrrlNWE=;
	b=Gd2g8msQtNU/NfOIyYQzexYQTUrTP4GYwBITU5PwH0fzLDv0eS3vtoD/b+uBLSXU
	WzsOWk7ruoQRPfK1tJKdqb5X5GGN2Pk1bLR8/olh3PIH0AVfmVEG6ozQ6Oc5trh5ci0
	d7NfIBNIktNErBQPy7CEVSspNcflAW6aheDFNB7w=
Content-Type: multipart/mixed; boundary="===============4052984539178706044=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] babeltrace2: upgrading to 2.1.0 FAILED
Message-ID: <0101019551746748-cfd97845-05ff-47cc-a193-d65ed343acbe-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212167

--===============4052984539178706044==
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
workspace            = "tmp-auh-upgrades:7f5ecf84d47eff17c17209c93e070483c593e2e5"

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
--===============4052984539178706044==--

