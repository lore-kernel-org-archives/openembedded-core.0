Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0115C27C6E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.17722.1690907332255327261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I2GH+Xs3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XqhsbgyZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010189b1ee4c20-081286e2-d4d4-4539-8e4c-aacddad3c6b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V+EkeTRGQzpSNpSTQCAzjdeLBgclRio0qFbHaYu1hQw=;
	b=I2GH+Xs3ANELmtA4Y8YjIDB3SUjXay4sCXbo1eKDdDeM7PxRQT0RQgREZMv5vbV1
	q4oXuIPp35xvc2XXzDxZCEHGqfe420JlEcyXzFiLQ9NqrqOuqchp/HfvxoSUfFChxpn
	10NugmxcPrjI6P7adz3xFqrbVF5WUg2a0nICP1FU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V+EkeTRGQzpSNpSTQCAzjdeLBgclRio0qFbHaYu1hQw=;
	b=XqhsbgyZ1ZMSszFiSxOQ9N0gV6vmPYP3MyNj+kSNSbTDgRBXSdR1SLwtmSMOvApf
	7OSzX2giuM8VAc04q1ntrF43DhYGN9QTH7+SK+ksoiDb3VRB3TwSXGCYkEhug+0MUwi
	m21Gg4LDdvSKSWkYauRJ9V9+ZpCyu3IsVPNjxcoc=
Content-Type: multipart/mixed; boundary="===============6840543049481307138=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 191c8b6876208ca8e08083aa4e096da9abbfbc74
 FAILED
Message-ID: <01010189b1ee4c20-081286e2-d4d4-4539-8e4c-aacddad3c6b4-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185320

--===============6840543049481307138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *191c8b6876208ca8e08083aa4e096da9abbfbc74* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe piglit failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (14:02:30.688299)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1160fcdcd4deb55354a9b97df27b378f6c3f6d78"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 191c8b6876208ca8e08083aa4e096da9abbfbc74
WARNING: Command 'git rebase 191c8b6876208ca8e08083aa4e096da9abbfbc74' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/piglit
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/piglit/piglit_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6840543049481307138==--

