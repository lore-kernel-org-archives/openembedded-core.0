Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F47C282D2
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7047.1740828318618550201
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GXAcJMDE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JIm9FftW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010195517441ce-4e1ab5f3-e3f3-4d20-8095-d74ec8e517b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I2rZ5y5GbfQTsnfze5BSpMo27u1Xaf+R2jd5+zg1TV4=;
	b=GXAcJMDEHXlxz2VU9KgI7YTKs29bnDMwut1fkr6nvf1VtSfaHq3FV4KFNpaXYOno
	APBIJ2siDo6AdF/M6Egx8CY1KruG7P+NWuLB6TFP+Fb489h0rIlo+/O7WqIkGXMR2PB
	dpIv2ghu9zQ/hJ5ZqCQjAOZlk0/V6z5Kx2Vs0VAY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I2rZ5y5GbfQTsnfze5BSpMo27u1Xaf+R2jd5+zg1TV4=;
	b=JIm9FftW4um0spCChWW/jzXD2dbZ4jBkrDZJtPxrU9DtTtgWp3IcsVKbAm2ykGwe
	YdKSV1n05XDJBfpuYgnM9In8mo9oWAcsIfAEHaHbiUXZ9WmyTlg4WHVLYVwsGrM34xP
	3iS0dWRW/omKz/iE1xkNC+qTtgABi6BGkZB5cbVo=
Content-Type: multipart/mixed; boundary="===============5287232702315969347=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.20.1 FAILED
Message-ID: <01010195517441ce-4e1ab5f3-e3f3-4d20-8095-d74ec8e517b1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212135

--===============5287232702315969347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm* to *4.20.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c8dc5ea575a2e9c1488036d12f4b75f6a5a49120
WARNING: Command 'git rebase c8dc5ea575a2e9c1488036d12f4b75f6a5a49120' failed:
Auto-merging lib/rpmscript.c
CONFLICT (content): Merge conflict in lib/rpmscript.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_4.20.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5287232702315969347==--

