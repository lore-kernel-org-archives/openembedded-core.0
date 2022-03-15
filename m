Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2D7C352AA
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.10407.1647349735123762117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=updho7d/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db2183c-8bdc3692-b2e0-4f10-b0b3-72326ebd51d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xwSJir+NGU6FG1IMEIDo2PcbGrUvCxptU9hCudNjrbM=;
	b=updho7d/9vMNF4LX5G8+rrmVXV7nYcwSoObJQfq9tObu3Chi/n1ig5fP6alPlS1s
	CsCLAjO6srZUuEEfH8p3PGppzKPbAEb2aerMU25aqLHDjwtNcdzm+Ti5diyGGHQKwFv
	jX+gXS4tciP96XBLV5H+miry7zgbV2zoGaKAgHX0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xwSJir+NGU6FG1IMEIDo2PcbGrUvCxptU9hCudNjrbM=;
	b=Bi9jM2uwlB6R+I8nVsw0b/1hJ3XWLe7Fk5BHNwrczyQFy/tNZUEHtViPwRZABNmJ
	XVfRZaVTj4ip+CoPRQ1YDAMLg6QUiVJkISCX19HFSEpsXEM8kvRDY0FaZoBINwhv4w8
	LODzVpBrulotHb3yXXbOjonPqv3D9TiuGcnv2I5U=
Content-Type: multipart/mixed; boundary="===============6994272089578734192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd: upgrading to 250.4 FAILED
Message-ID: 
 <0101017f8db2183c-8bdc3692-b2e0-4f10-b0b3-72326ebd51d3-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:53 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163256

--===============6994272089578734192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd* to *250.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1521 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-21af5c2b7862e9ce9f5f1d5bf4161f26f49542b9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:21af5c2b7862e9ce9f5f1d5bf4161f26f49542b9"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 037160fc69b9490f37c917b76befecdf233b77b8
WARNING: Command 'git rebase 037160fc69b9490f37c917b76befecdf233b77b8' failed:
Auto-merging src/fundamental/meson.build
CONFLICT (content): Merge conflict in src/fundamental/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 037160fc69b9490f37c917b76befecdf233b77b8
WARNING: Command 'git rebase 037160fc69b9490f37c917b76befecdf233b77b8' failed:
Auto-merging src/fundamental/meson.build
CONFLICT (content): Merge conflict in src/fundamental/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/systemd
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/systemd/systemd_250.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6994272089578734192==--

