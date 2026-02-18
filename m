Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57204C531F6
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1420.1771440098325640533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xogNBqt7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CHU4Y+HG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c720efd30-9c4dc5b9-774e-4075-bfe4-c76e45bc712a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fq2E+wrf/3tDEOIHFjioDlaiLK8c4yhFzbkBsETeMPQ=;
	b=xogNBqt726W+QSc2gX+siGxkEcvoq4HSN0iInGjBMDdQZgyKmX1ANuYrxG4KKchy
	Du08uB8LU2kHrmjmLlA2u42iaelT5e/92RS7+wCkd3I/ZusH7/SXqXeC9rDghFEXGOB
	KGxIJfgKxdyUZgFbwoY3X+myYKEOUt3Ud+8XxI60=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fq2E+wrf/3tDEOIHFjioDlaiLK8c4yhFzbkBsETeMPQ=;
	b=CHU4Y+HGtwHmD6bXyeyeTs8UOHrbPY0bNiGr35gByMcoiW4QdDaEQoP8G+Wq1LNp
	OkOmNFzp+1AtfErw3BST3DbSQuJd0pwrEpxx8lJvDL6TQAJdhmRjfM2IuDO3IvlKf7F
	Eum0WhIN5rwLAtTFDFShXVrV6w9v87N2HOZZfqwc=
Content-Type: multipart/mixed; boundary="===============3680526554175178891=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.31.0 FAILED
Message-ID: <0101019c720efd30-9c4dc5b9-774e-4075-bfe4-c76e45bc712a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231385

--===============3680526554175178891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.31.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libinput failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-1bf4f302e80e54d3e35b2485eebff20acd715e32"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:1bf4f302e80e54d3e35b2485eebff20acd715e32"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
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
INFO: Rebasing devtool onto 659967488e1e66d7fb7210c6b86860c8e1e5bed4
WARNING: Command 'git rebase 659967488e1e66d7fb7210c6b86860c8e1e5bed4' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libinput
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libinput/libinput_1.31.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3680526554175178891==--

