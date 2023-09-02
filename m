Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5DBCA1007
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.5724.1693650552705124210
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DqIG4q0v;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CbFtWc+j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a557084ff-d062829a-f9f9-4a97-9648-5ffde315371a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=hbleq7WoaHaC4gqvwbq4F/SN3ULH/YqCDW/aXb1MbsI=;
	b=DqIG4q0vOZ08FdIrG/3CDMhIHEzIWmcbJuOYEYNlP1mJv33PgACJczs/gdtBAwXm
	cmBh81S4rSkmC/YAQVlTFhEAUKgikVNYlu1+ldPEJajoDdLbUoNQJ32TCd8+eaGl6zn
	B4PZfgWFVVXxffnJPM3jpGCPOFUuw7u9Vsk+lsJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=hbleq7WoaHaC4gqvwbq4F/SN3ULH/YqCDW/aXb1MbsI=;
	b=CbFtWc+jk5D32Kefvlsfvc6CVqL9FyMKjdq0qTxz/3KzDmWTb7PSsAdxwKDv6akf
	hwTaHyZAhLhwRodEUn5mCQqHbaWWCC2vJmxROLA7DnzhXU6Gzl0lGqo9vfhFcgoJXQJ
	NCCM4MmEPEzMfjYWxwearweLps3UgRvN00WMJhfE=
Content-Type: multipart/mixed; boundary="===============4139769898111509698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.22.0 FAILED
Message-ID: <0101018a557084ff-d062829a-f9f9-4a97-9648-5ffde315371a-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187043

--===============4139769898111509698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.22.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe dpkg failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (11:47:42.543029)
NOTE: Directory listing: ['tmp', 'cache', 'bitbake-cookerdaemon.log', 'downloads', 'buildhistory', 'workspace', 'conf', 'sstate-cache', 'upgrade-helper']
NOTE: Retrying server connection (#1)... (11:47:42.861260)
Loading cache...done.
Loaded 1807 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-a21a94dea0a6c659c8f6ea190f78eea05b0c281e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a21a94dea0a6c659c8f6ea190f78eea05b0c281e"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 30 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 744487c98a622b9b38c22c6ca330315af4a30a11
WARNING: Command 'git rebase 744487c98a622b9b38c22c6ca330315af4a30a11' failed:
Auto-merging debian/changelog
CONFLICT (content): Merge conflict in debian/changelog

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 744487c98a622b9b38c22c6ca330315af4a30a11
WARNING: Command 'git rebase 744487c98a622b9b38c22c6ca330315af4a30a11' failed:
Auto-merging debian/changelog
CONFLICT (content): Merge conflict in debian/changelog

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/dpkg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/dpkg/dpkg_1.22.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4139769898111509698==--

