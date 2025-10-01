Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033FCCCD1A5
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18072.1759325536079836896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E249Gd7w;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RBXMhYoF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101999ff96a73-43988ad8-a70f-4d02-b2e3-9681981e571d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=82ByNKE5daQ9fqhFQFE4+umJbPrcS/M7ZHcCvHS5DWg=;
	b=E249Gd7wWQ0qM2ZLQUUwklUSP6D0U8vLZeef8yWDZ6+WFGu8Nz0+TVe+n7QM7M1k
	nzRTGp663VmbVlTkR+jH3UkFCtEYq37LwaJ/ZqzBcxQA4Yz00cC0u+JTCqagonej5Cb
	OoZ4bziqDQFvBRdALs3KP9bWQkiddUcwcvFv1gDk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=82ByNKE5daQ9fqhFQFE4+umJbPrcS/M7ZHcCvHS5DWg=;
	b=RBXMhYoFZwNzM+18RVlG2tOQjvAVcSztxG6m1xJcuzbfzX7T3d3fGZCaqvdbYUk1
	/JLQIUzPY++WmKDrJKLlA5EmWq+V5/DCniFBjsbmj+6iSWHwHb7OvAOvAk8thZce8iz
	JxAjhECNI4XzplP9rVxo6QGV10+5c0rIIlOIp+CU=
Content-Type: multipart/mixed; boundary="===============2601970254096287745=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] which: upgrading to 2.23 FAILED
Message-ID: <010101999ff96a73-43988ad8-a70f-4d02-b2e3-9681981e571d-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224263

--===============2601970254096287745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *which* to *2.23* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe which failed.
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
DISTRO_VERSION       = "5.2.99+snapshot-03432f7d0f1df8aad488dc4da71cfba98fec7fc9"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:03432f7d0f1df8aad488dc4da71cfba98fec7fc9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1940 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-03432f7d0f1df8aad488dc4da71cfba98fec7fc9"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:03432f7d0f1df8aad488dc4da71cfba98fec7fc9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/which/which-2.23.tar.gz...
INFO: Rebasing devtool onto e3e9c698e1d59b4caed1be09426f3710c12130e5
WARNING: Command 'git rebase e3e9c698e1d59b4caed1be09426f3710c12130e5' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/which
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/which/which_2.23.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2601970254096287745==--

