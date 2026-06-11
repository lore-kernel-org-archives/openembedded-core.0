Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8B2CDB46A
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50413.1781195499022840083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hDXxttBR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WGIuatOB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019eb7868fd3-8eb18083-5bd9-40a6-8e88-0f7e88cc9dff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195509;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/5T/92iNYEFXT50dfIxAlyA4o0GlhssiU/aYRTa1Lxw=;
	b=hDXxttBRASL/GXTQBua+NFGXeG4+9RtfHkp/79EVw4ppq2l07TYQjOjNKJRrHRBn
	sFQV9EMlI/Tr2k8H3vQEQEnbHCyGFJuQBo1beikmejyt1VJ5gAzdfvZSJ8VooZ5vQB0
	Ld99UGuoeE0SWVzfdxPQZgvc3diqC6IX2lgN+Fx0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195509;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/5T/92iNYEFXT50dfIxAlyA4o0GlhssiU/aYRTa1Lxw=;
	b=WGIuatOB6Im1dMLvzecpaDyb7mh62PzUKRq3NRY9T0nN67DD6Qne3tmWEkyF/4o8
	cBJfWWqQk9PmNrv1Y3x7vbuyIyQXwWEWfewR4f4QYFnLQtMiQ8mp+plTRT1jLLnsrc8
	DXduxqifuR6m8saBjmDlibT86ZHM9QnJFMhZbzzo=
Content-Type: multipart/mixed; boundary="===============8529897564866544753=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 6.0.1 FAILED
Message-ID: <0101019eb7868fd3-8eb18083-5bd9-40a6-8e88-0f7e88cc9dff-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238508

--===============8529897564866544753==
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
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ca1552e1a958892bc10c13c65375447b7f3431b2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ca1552e1a958892bc10c13c65375447b7f3431b2"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
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
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/rpm.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8529897564866544753==--

