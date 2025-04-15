Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B4EC3ABB6
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.20163.1744723971422604722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IMDSRQ2w;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cxC6bpiv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019639a76051-bd65a054-20a9-4d2a-b156-5f17aa8f5503-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2uQbcjhiVbmV/fOqE5Y/NFC/MGHOlws4dFLsAdL22Jo=;
	b=IMDSRQ2wfaw6ExNUSJrjZxaTLLg5ThEoSEphNZmAPBqCKGXLJ41SSNG8Tl5sAdqy
	qvnTMgNSY0MNJV4ADq8ESaGTx+QpVbKKWPhh1adiIjNeXhYtIdAnjLsPowA2ZCnes3Y
	eDYhT3zVOewME1BgXO9qwY64LbZJ5oXzp+NDupKg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2uQbcjhiVbmV/fOqE5Y/NFC/MGHOlws4dFLsAdL22Jo=;
	b=cxC6bpivlXeeQZJQt4+GbD8k/FPTDQKic0fajYwEwD8ErWjK2I0X8XXwrt1ySpoN
	4StNEH7sdmUUf7tfK14poGgyjS+Wryet/XeA3oZj0qJ+dqK4VUH4bX6ZEwJ0nKkI0/e
	lZWv5BSkFKBfXiND4SG255yYGpkeDynop+C7KXXY=
Content-Type: multipart/mixed; boundary="===============3237288639740669521=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.76 FAILED
Message-ID: <0101019639a76051-bd65a054-20a9-4d2a-b156-5f17aa8f5503-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214935

--===============3237288639740669521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap* to *2.76* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libcap failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b73e08e9603610f49e9f526c136d66c981b9f52f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 929 .bb files complete (0 cached, 929 parsed). 1898 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b73e08e9603610f49e9f526c136d66c981b9f52f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-fjf2muoq: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-wfydjtqj/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-wfydjtqj/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.76.tar.xz...
INFO: Rebasing devtool onto 5613e2a8137abc1abcdc90ad63a5d25851b6d736
INFO: Rebasing devtool-override-class-nativesdk onto 5613e2a8137abc1abcdc90ad63a5d25851b6d736
WARNING: Command 'git rebase 5613e2a8137abc1abcdc90ad63a5d25851b6d736' failed:
Auto-merging libcap/execable.h
CONFLICT (content): Merge conflict in libcap/execable.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libcap
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libcap/libcap_2.76.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3237288639740669521==--

