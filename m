Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8FFC76196
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.12144.1678895725895848613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lcHgDZcj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010186e5fbc7b6-114449b8-f3b6-459c-bb35-a433569d59d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895729;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OwznFY6uRCb4EXTnwa7pPlzl3FvEvAhCZ5McF66AiYA=;
	b=lcHgDZcjcoYVbd/k3AiDLQ+OVCs1XM/k29ANwqf3uw47UXQlURzNYpduuoD/BArd
	IgA6Ond4laIWV8gmS4GRBMCnrkPI5o3g0EJXIlotmZbYoDWFzZ+BzNIJKIBZg58Olq3
	ObEvVO57AP0mPVaWTxov26WRpo10j4AccOcKXUx8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895729;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OwznFY6uRCb4EXTnwa7pPlzl3FvEvAhCZ5McF66AiYA=;
	b=aBdcnYD65c7fGOUlcf1FdSKEHTgiwf2bP3jPZeHyrb6YhyrFlwSbASWizq/j6ugC
	3jjB748dftgl25OZMFf6YAyetRx2oUv59msntsBo9yPfRDCrTGy/EyjAheUW7fxZ20s
	o5T6U1+kwPGa4/MjjRELAxc+VexyxYDteWSX7ujE=
Content-Type: multipart/mixed; boundary="===============6997612594312953870=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.6.2 FAILED
Message-ID: <01010186e5fbc7b6-114449b8-f3b6-459c-bb35-a433569d59d6-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:28 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178642

--===============6997612594312953870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.6.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgit2 failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (15:19:47.952504)
Loading cache...done.
Loaded 1791 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2f5cd6e6ebc67653cbd44eac269041de50201396"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2f5cd6e6ebc67653cbd44eac269041de50201396"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 25ec37379ed07b10c4ecc6143cf6018cabc8f857
WARNING: Command 'git rebase 25ec37379ed07b10c4ecc6143cf6018cabc8f857' failed:
Auto-merging tests/libgit2/CMakeLists.txt
CONFLICT (content): Merge conflict in tests/libgit2/CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libgit2
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libgit2/libgit2_1.6.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6997612594312953870==--

