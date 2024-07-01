Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F456C52D71
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2105.1719853075733477967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QtP31WJv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mB1S/B8m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101906f3b4a61-641157bb-e51a-447d-8a19-f418f6d3d3ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V5HT0UpHyTsigaK0l1zJaGOrn76jqkpos1Rb/GDA5Q0=;
	b=QtP31WJv6sINQJxcmaMc9k5LDxqczqxUSn7zcvkPpWvQRgVbccfg+YR2U9+WSCEX
	nHbA7RC409l8FwGcS9aOQYu5Qv8AYQc5ifUVG+NzH0iNK4Xy7qDWlJw9W15mUrZjkng
	vuLGVL9/TFOBB0Hi9xg2pSU7jbFYJUjHZZw5vGTU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V5HT0UpHyTsigaK0l1zJaGOrn76jqkpos1Rb/GDA5Q0=;
	b=mB1S/B8mR08pcMLpuS5g5F0bzIeKw3TguLF+KRs6NbJiRN8u5zmm/RFAAZuz1hAz
	rAfTjDuAkXpVeegHkx+iCvLTGzyc9m7PStwH+tdUuxuwzMafMWWTzCp+LeUtJOjx92z
	l662FhmpuVDMMuGP//HfBczIvKRz8lrLFFzS1Sc0=
Content-Type: multipart/mixed; boundary="===============4734994317378359427=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd: upgrading to 256 FAILED
Message-ID: <010101906f3b4a61-641157bb-e51a-447d-8a19-f418f6d3d3ce-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201322

--===============4734994317378359427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd* to *256* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-74741c9e37621d9720e8bd72a0f2c390739aea0f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:74741c9e37621d9720e8bd72a0f2c390739aea0f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5c79cdec10a547a866764a66e1e14898112a00cd
WARNING: Command 'git rebase 5c79cdec10a547a866764a66e1e14898112a00cd' failed:
Auto-merging src/network/networkd-neighbor.c
CONFLICT (content): Merge conflict in src/network/networkd-neighbor.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 5c79cdec10a547a866764a66e1e14898112a00cd
WARNING: Command 'git rebase 5c79cdec10a547a866764a66e1e14898112a00cd' failed:
Auto-merging src/network/networkd-neighbor.c
CONFLICT (content): Merge conflict in src/network/networkd-neighbor.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd/systemd_256.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4734994317378359427==--

