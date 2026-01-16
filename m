Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402C6D4899A
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1444.1768526752375640149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SRDrhW23;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=honM0dnQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019bc468a7ab-b97a7414-25f8-4b42-9a6d-5a9373df598c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WXnkqW5dNKNJuFjhlFNSq1DN70Tl7rYRO+aYszx0EPM=;
	b=SRDrhW238OuKIp9yjFhUIZLeakCK5rYAslmfJ5DiH8tDsP3c0jyUrwe3JZA387hX
	xmDRHtW/1qbp57ZFHg5+CZevERXaKHCVYvgBISy0oVEQUhWwcMhp3x4XUOgGrs3IU57
	gk6fNDRJ2Z3clFdIuVIfywnfacdOL8VFz3RJjFr0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WXnkqW5dNKNJuFjhlFNSq1DN70Tl7rYRO+aYszx0EPM=;
	b=honM0dnQ5n6DOEC9dszwB7UARGG1P9fe5V0YSiNh+xgRtcwP3LWh1DzNjqQUAyt+
	iZ/AGjs3h58rOVnbQuWYiQn3tYTesCtSz931JfpCm24OqYUoXFrHumA7yDhcP5+hYOW
	Ha4ZrJrkVjyd59YZ2plp75JZ32kauVaTcY+CGJ38=
Content-Type: multipart/mixed; boundary="===============9151393113276204550=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mdadm: upgrading to 4.5 FAILED
Message-ID: <0101019bc468a7ab-b97a7414-25f8-4b42-9a6d-5a9373df598c-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229481

--===============9151393113276204550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mdadm* to *4.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mdadm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-c980a0a873d9f458d98d8e9aabd9044e0b159a9a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c980a0a873d9f458d98d8e9aabd9044e0b159a9a"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
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
INFO: Rebasing devtool onto 8f0c7692d48414ff7b3fe927ce75799c65ef24b1
WARNING: Command 'git rebase 8f0c7692d48414ff7b3fe927ce75799c65ef24b1' failed:
Auto-merging raid6check.c
CONFLICT (content): Merge conflict in raid6check.c
Auto-merging restripe.c
CONFLICT (content): Merge conflict in restripe.c
Auto-merging swap_super.c
CONFLICT (content): Merge conflict in swap_super.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mdadm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mdadm/mdadm_4.5.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9151393113276204550==--

