Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7929C3DA46
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.18369.1718475799123707062
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bV6Aiygq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JgN3u1rz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101901d23b7a7-7dbbc47c-4e70-4aeb-83af-a71d6b9d3295-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YDzEb2lITOZMrJaDjX4dGoJZprBDhmuZoUNCGWxB9qw=;
	b=bV6AiygqUZ7WxGHwVntm/uwsMtkwrgtyDw69c1IxPad0JTeQ20LLIlqErcZB/ZS1
	YYdNU9au/o09gMK/xM+6l04Tr1Tb8H4BNawr9qpt5L20xVu7MhA8WWcslRhlMfJIT40
	eCgTrbMoRA0m1LflwPHtVkQLdUGYPA9Vbkkf2Kv0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YDzEb2lITOZMrJaDjX4dGoJZprBDhmuZoUNCGWxB9qw=;
	b=JgN3u1rzbNT1G4uPYQKwUGhozZQ96dXiapKM/ar1ld1e2C9TKtm+RWBS6dsYi/mC
	7P+xe+pluDEfxJNOwPxT+7ecU/1v1w8pOTBFtXC0YgdvIx0NbyaQg7Mk0919lsbsjsL
	C37Yk9vksE96Za74G4WxtJ06SEY2LaHYXqnfXdjk=
Content-Type: multipart/mixed; boundary="===============8801623413725688685=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 256 FAILED
Message-ID: <010101901d23b7a7-7dbbc47c-4e70-4aeb-83af-a71d6b9d3295-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200682

--===============8801623413725688685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *256* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-02ed16691eb2b434f9c18ee73d7eea240df0c126"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:02ed16691eb2b434f9c18ee73d7eea240df0c126"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5c79cdec10a547a866764a66e1e14898112a00cd
WARNING: Command 'git rebase 5c79cdec10a547a866764a66e1e14898112a00cd' failed:
Auto-merging src/network/networkd-neighbor.c
CONFLICT (content): Merge conflict in src/network/networkd-neighbor.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot/systemd-boot_256.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8801623413725688685==--

