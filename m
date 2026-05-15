Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82017CD5BA5
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34813.1778851223005675442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ErvEtf2n;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=g0NYYOV3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e2bcb9f3a-53b6a170-67f1-403c-90fb-f42701f581ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N8IYsGTWGfinTE/w6UjnDa6iiXXiIgu1ywSDmELEx90=;
	b=ErvEtf2nDDTCEdMhjaC+0RSsLeGOvZ9b9oUJlXKVSXD4FssFmsgY5GsqZTk7Kh2S
	Esqk074cdyQUJsb5ekrybKGSwSTjBYD+NmHrYbPu+wWhMznNvs8IOuxTY7U9gFzWgbV
	HHtUNutpWHnXsHXaaCL+MGPWvjKRChjuzAhw3Rbs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N8IYsGTWGfinTE/w6UjnDa6iiXXiIgu1ywSDmELEx90=;
	b=g0NYYOV3C6nBCH2++ye8MdvxJ9W0QeDftsVQX0ZHTjOIbcpfplq3+TqMD+2J6qQj
	M/XjBgZwIOKWYMaba/8rru0G+12Dnic19hkutQQa96Fj2eQqEoB4o8iidMSleeYl2CL
	dVYk/02V6fUJSSrM+aLJo8YT2SnflENqiZoyBHcw=
Content-Type: multipart/mixed; boundary="===============6632101871505295072=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] busybox: upgrading to 1.38.0 FAILED
Message-ID: <0101019e2bcb9f3a-53b6a170-67f1-403c-90fb-f42701f581ac-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237090

--===============6632101871505295072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *busybox* to *1.38.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe busybox failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1974 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6748ffc31d3c76c34333358a2d55f51d520adc09"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6748ffc31d3c76c34333358a2d55f51d520adc09"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6748ffc31d3c76c34333358a2d55f51d520adc09"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6748ffc31d3c76c34333358a2d55f51d520adc09"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  30% |###########                         | ETA:  0:00:00
Adding changed files:  61% |######################              | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://busybox.net/downloads/busybox-1.38.0.tar.bz2;name=tarball...
INFO: Rebasing devtool onto 74f2aaa1408a0f17360eeef20520ea10fb308cbd
WARNING: Command 'git rebase 74f2aaa1408a0f17360eeef20520ea10fb308cbd' failed:
Auto-merging archival/libarchive/data_extract_all.c
CONFLICT (content): Merge conflict in archival/libarchive/data_extract_all.c
Auto-merging archival/libarchive/unsafe_prefix.c
Auto-merging testsuite/cpio.tests
CONFLICT (content): Merge conflict in testsuite/cpio.tests

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 74f2aaa1408a0f17360eeef20520ea10fb308cbd
WARNING: Command 'git rebase 74f2aaa1408a0f17360eeef20520ea10fb308cbd' failed:
Auto-merging archival/libarchive/data_extract_all.c
CONFLICT (content): Merge conflict in archival/libarchive/data_extract_all.c
Auto-merging archival/libarchive/unsafe_prefix.c
Auto-merging testsuite/cpio.tests
CONFLICT (content): Merge conflict in testsuite/cpio.tests

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-x86-64 onto 74f2aaa1408a0f17360eeef20520ea10fb308cbd
WARNING: Command 'git rebase 74f2aaa1408a0f17360eeef20520ea10fb308cbd' failed:
Auto-merging archival/libarchive/data_extract_all.c
CONFLICT (content): Merge conflict in archival/libarchive/data_extract_all.c
Auto-merging archival/libarchive/unsafe_prefix.c
Auto-merging testsuite/cpio.tests
CONFLICT (content): Merge conflict in testsuite/cpio.tests

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/busybox
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/busybox/busybox_1.38.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6632101871505295072==--

