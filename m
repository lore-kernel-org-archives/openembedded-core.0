Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AABCC7EE30
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.13817.1681581686930866656
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YNF3mfZ3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018786143ded-d531fc6a-df5f-45f5-8263-3f9389aa41dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fl78EAdX6Pic10C0jLTUlyyEFa+I5ywwQnfuyRLd8sw=;
	b=YNF3mfZ3Lj5CIsJCSzKeNJrsoLwwB5MBGxnHBwB36/U6stmI3AxUVEczSRqxmZjg
	tbCBKvNvPwY+V5iHEbbOxAp0teYxiEvY6CP5fwao01iE8puajrbxcFUMelEZJXRQhK1
	CdVR5e/DG4ZxlVvivKHf3ZXdhJ+v4k405fnN8LTQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fl78EAdX6Pic10C0jLTUlyyEFa+I5ywwQnfuyRLd8sw=;
	b=CgiP/loL2ifCMll82RKCWKEt7jCAeNa9E7qGB/7KojMEt3vsepggZ2XWWOOEsOiU
	+QVM4sm3imcZEN/a9kjIg4kzSONLlHK80rWVcsvWyuOCTGorQn82qIBc03rInkcusnP
	xf2uiQYkHd3PerdXsMBnnNJIN/8eYXIvJf+Nml7U=
Content-Type: multipart/mixed; boundary="===============6475925890280543631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.23.0 FAILED
Message-ID: <0101018786143ded-d531fc6a-df5f-45f5-8263-3f9389aa41dd-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180087

--===============6475925890280543631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.23.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libinput failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (15:11:46.584571)
Loading cache...done.
Loaded 1799 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9cd85c62b1ee0b91e7c8244ecad5604d3d31da5f"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0b005eb64b12603e65a620a77c67ec62fd03f413
WARNING: Command 'git rebase 0b005eb64b12603e65a620a77c67ec62fd03f413' failed:
Auto-merging quirks/50-system-dell.quirks
CONFLICT (content): Merge conflict in quirks/50-system-dell.quirks

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libinput
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libinput/libinput_1.23.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6475925890280543631==--

