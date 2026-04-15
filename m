Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3565FF42119
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19806.1776261867822313060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uAsx/U9F;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yptLF9RF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d9175260f-eed31905-b50d-4c31-b9e4-bd612b6f5b3f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HhTgngS2011IPSppO9kesSxEdMCSllxRwW1M0ylMg4k=;
	b=uAsx/U9Fmv5ZIiS/9h0b6Uv/4GRG/AfPcRh4CqcHPU4L3LrGP0gcCRjHvKAIFWH+
	VWqtoyDlcBx2UPQwUhlqJsuOTDM/N71M9DgtVZWrxtry6noPizZ1j1KBSTLzm5dx6BI
	qAaQBjQA5Y/KGPN2GZ82tuYVlnm1iVr+3y/IsECQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HhTgngS2011IPSppO9kesSxEdMCSllxRwW1M0ylMg4k=;
	b=yptLF9RF8KXyhQc29ZpFvzvetwkP9mpTqiKZu3ZBRtEHcJy9aEZoHRqgrTrZGz+z
	geb+r39mzpRUNefjfVp42XSj0177qHgc1nhTPQDEl8dwkux+Fcw6adtIs1NsgcuevkP
	o9kJZajD0RbVf4j/9hcOU+wLXC+wEJoQAXP3UEus=
Content-Type: multipart/mixed; boundary="===============3524949123143889961=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot-tools,u-boot: upgrading to 2026.04,2026.04 FAILED
Message-ID: <0101019d9175260f-eed31905-b50d-4c31-b9e4-bd612b6f5b3f-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235202

--===============3524949123143889961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *u-boot-tools,u-boot* to *2026.04,2026.04* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe u-boot failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1971 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (950 cached, 1 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-274ce0c0d73fd82b63c522580aed9dbac51ba09c"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:274ce0c0d73fd82b63c522580aed9dbac51ba09c"
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
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 88dc2788777babfd6322fa655df549a019aa1e69
WARNING: Command 'git rebase 88dc2788777babfd6322fa655df549a019aa1e69' failed:
Auto-merging boot/image-fit-sig.c
CONFLICT (content): Merge conflict in boot/image-fit-sig.c
Auto-merging test/py/tests/test_vboot.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-genericarm64 onto 88dc2788777babfd6322fa655df549a019aa1e69
WARNING: Command 'git rebase 88dc2788777babfd6322fa655df549a019aa1e69' failed:
Auto-merging boot/image-fit-sig.c
CONFLICT (content): Merge conflict in boot/image-fit-sig.c
Auto-merging test/py/tests/test_vboot.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-qemuarm64 onto 88dc2788777babfd6322fa655df549a019aa1e69
WARNING: Command 'git rebase 88dc2788777babfd6322fa655df549a019aa1e69' failed:
Auto-merging boot/image-fit-sig.c
CONFLICT (content): Merge conflict in boot/image-fit-sig.c
Auto-merging test/py/tests/test_vboot.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-riscv32 onto 88dc2788777babfd6322fa655df549a019aa1e69
WARNING: Command 'git rebase 88dc2788777babfd6322fa655df549a019aa1e69' failed:
Auto-merging boot/image-fit-sig.c
CONFLICT (content): Merge conflict in boot/image-fit-sig.c
Auto-merging test/py/tests/test_vboot.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-riscv64 onto 88dc2788777babfd6322fa655df549a019aa1e69
WARNING: Command 'git rebase 88dc2788777babfd6322fa655df549a019aa1e69' failed:
Auto-merging boot/image-fit-sig.c
CONFLICT (content): Merge conflict in boot/image-fit-sig.c
Auto-merging test/py/tests/test_vboot.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/u-boot
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/u-boot/u-boot_2026.04.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3524949123143889961==--

