Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CA1C54E74
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1239.1710522011678765484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=enMiOLqG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mAZq4bvj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e430e9075-aadc73e0-2e9b-41a0-b54a-31ab8d6674db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Tvtfv4yEogAg2NkYnZCvGMXNH9IWXDLnon0HFHR0SiQ=;
	b=enMiOLqGzYBM0cFJfOpu4uwlxl4/DIb/dzj0AgUVjnkEe/H8BiKYt74Bccp5FsCl
	om3cxCOo1OdcTyBliiyEejV2BFzr/Lk+UZeH2LEi9U8cI7El9QBnWtC0yqw1GeFVrPf
	TFmDfNFhInsTDuX/chgMfO5H1Lw7ZUnGYNI7MKtI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Tvtfv4yEogAg2NkYnZCvGMXNH9IWXDLnon0HFHR0SiQ=;
	b=mAZq4bvjVz25KpHi2HScJB9hv2ZZB9R6HjPiud/RBp4dFDCqKu5m5eL4WWCkUQ2J
	e2UV51KJDZUObBJBsg+gt5Z0b69omVwZuv592gejVhjaJpwmAizaoe0V5CKXCAQR9m3
	d6GptY0HsGTzq4kdPY49hx9J4sryOyNAED1BFD74=
Content-Type: multipart/mixed; boundary="===============1604910169582759422=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.19.1.1 FAILED
Message-ID: <0101018e430e9075-aadc73e0-2e9b-41a0-b54a-31ab8d6674db-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197168

--===============1604910169582759422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.19.1.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-296947b23ab615ab760247f08842bcd51c9c9ab5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:296947b23ab615ab760247f08842bcd51c9c9ab5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 13b4521341781293c41ac898aa9c2d2f6bc1f21d
WARNING: Command 'git rebase 13b4521341781293c41ac898aa9c2d2f6bc1f21d' failed:
Auto-merging docs/CMakeLists.txt
CONFLICT (content): Merge conflict in docs/CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_4.19.1.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1604910169582759422==--

