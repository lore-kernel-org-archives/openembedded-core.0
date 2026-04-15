Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6667F428FA
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19821.1776261880313926298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nR2yGYzI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tWulSh7w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91756c75-46f014fb-8d45-4883-82d4-afe99155c83c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xKWcO84MohijQD7GS21+Sz5ijucYwSmpL2hiZD/NeMc=;
	b=nR2yGYzIapurJYFMeD2DqaRgRMO4pYfbwlBy12vBIJpdgl0A+YDSWDpcOORerhbk
	3QibdiPMVYNgMVDIjvSkdQuun++0y++6Y/ocACPzn4VfXQwmdEeAj+fBPUNxaikzxxP
	9IXNMOhABoL7KkpH/3wVVAcX6VRRkR/k6RHczW9E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xKWcO84MohijQD7GS21+Sz5ijucYwSmpL2hiZD/NeMc=;
	b=tWulSh7wxDhYXFDJhCB0w0OIYYirgJiYVh/wq0TYc+p8ubBbbm8STetGaQ/tWpFB
	S9pMuD/QC4hBV4NFpwoSPwm88GR2ZSykIC0n/NtBYoEVAQ+TM1MZtbaap5SbuEqF7E6
	IaELQCeiJPspoXT5wbA8c7eQh7DYvANy3nDW+GOQ=
Content-Type: multipart/mixed; boundary="===============2982971873896241870=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 6.0.1 FAILED
Message-ID: <0101019d91756c75-46f014fb-8d45-4883-82d4-afe99155c83c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235257

--===============2982971873896241870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm* to *6.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-8ac5c9b0b455630f5cb2c238863942c1b55362a9"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8ac5c9b0b455630f5cb2c238863942c1b55362a9"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 58a917a6c5e24e9e8a01976c17d2eee06249b9b6
WARNING: Command 'git rebase 58a917a6c5e24e9e8a01976c17d2eee06249b9b6' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt
Auto-merging tests/pinned/rpmlibver.txt
CONFLICT (content): Merge conflict in tests/pinned/rpmlibver.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_6.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2982971873896241870==--

