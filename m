Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26457C04E85
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.904.1657900668760969708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jc1dCHSq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010182029493ec-c8614826-bc32-442d-9628-1ada884387fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gvvq178bgtKmEIqlAV8RpPPTEQdhVilisym4AkT6mnI=;
	b=jc1dCHSq2cMCrgBM2/A9DyzjZAtkQ6Wc06dCnDpy/mCPpfqIXphPk3dQQhISY21q
	PlwvsuZKtVq8+9OaPvCwVWg5FRebZyiFhaF8mPsttYu5ZecRFcdOQ1xq/j8o9b046dy
	HJg2cBJvH3WXEpxZ/37mveVKHaJWnAkHw6reEZU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gvvq178bgtKmEIqlAV8RpPPTEQdhVilisym4AkT6mnI=;
	b=LhWX63U0/acqj7K0F0AkniDWam6MI/BWf5BGlEfRLDvrzpWMFp190AL/+UayiMJX
	fdVRoimU0pLhnR7DobexutRqsi7xo3Xxaut/mUpWa+ZBoi1Q7JZM5frocmjQo5HItg5
	ovGrCbmUpEMVOp5NLY/8s/8gYpn95sCpzEo1Ex/4=
Content-Type: multipart/mixed; boundary="===============0411227110628079266=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcr: upgrading to 3.90.0 FAILED
Message-ID: 
 <01010182029493ec-c8614826-bc32-442d-9628-1ada884387fe-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168088

--===============0411227110628079266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcr* to *3.90.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gcr failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-75a9b44b3562373bb266d0dc23c7fe035d2304bb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:75a9b44b3562373bb266d0dc23c7fe035d2304bb"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.
Parsing recipes...done.
Parsing of 890 .bb files complete (888 cached, 2 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-75a9b44b3562373bb266d0dc23c7fe035d2304bb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:75a9b44b3562373bb266d0dc23c7fe035d2304bb"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  21% |#######                             | ETA:  0:00:00
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//gcr/3.90/gcr-3.90.0.tar.xz;name=archive...
INFO: Rebasing devtool onto c47fc1424ff84bf17044c3b47bc5ab113942f57d
WARNING: Command 'git rebase c47fc1424ff84bf17044c3b47bc5ab113942f57d' failed:
CONFLICT (modify/delete): ui/meson.build deleted in HEAD and modified in c475aa6 (meson: Fix unknown kw argument in gnome.generate_gir). Version c475aa6 (meson: Fix unknown kw argument in gnome.generate_gir) of ui/meson.build left in tree.
Auto-merging gcr/meson.build
CONFLICT (content): Merge conflict in gcr/meson.build
Auto-merging gck/meson.build
CONFLICT (content): Merge conflict in gck/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gcr
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gcr/gcr_3.90.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0411227110628079266==--

