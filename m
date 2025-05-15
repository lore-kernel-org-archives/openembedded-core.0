Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BB1C54ED0
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11042.1747312314794889409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KwHqoIZf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mJtL+h5U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010196d3ee2207-99be0560-c051-4070-af16-44ebee2e11c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pyKdR+07ZL+GviGRM1uNgpiwL6d1FUpqP5DAfs3OPaA=;
	b=KwHqoIZfydcQvgTIKZGYck4jgU/YUccVQNQuJAB+2INFvn3wxHQnlJSpbtpytowG
	ld4sFwJQYcZIBFg0bcXsybXSoL2BUITYsb2tWWvpVFXcBLiWtoSW+7fCE4ZYuO7IeGL
	LVWf9l0R05dbDShKX5s8UryOT1IJfaJU5/mahvyA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pyKdR+07ZL+GviGRM1uNgpiwL6d1FUpqP5DAfs3OPaA=;
	b=mJtL+h5UJ7pA1EmU+Ek9+co9Gmd0kxvx8WdMSQ8O8IXHhxPsJ7OyfhV9+Kwet20i
	siM5wyj5wj95myd64m2DLobgUDRihhwHa+NM2AZrWcxidnq4zXmL9+/DBWMb1Osd2tF
	SFj4RVTFlViLGAjLhuq+zhJWVcIVUiTxYhl7i6RE=
Content-Type: multipart/mixed; boundary="===============9032007634096730598=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gperf: upgrading to 3.3 FAILED
Message-ID: <01010196d3ee2207-99be0560-c051-4070-af16-44ebee2e11c9-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216633

--===============9032007634096730598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gperf* to *3.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gperf -V 3.3
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:af9d4362a2e70f6978a0bf04b02e95702ba749d2"

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
Parsing of 938 .bb files complete (0 cached, 938 parsed). 1917 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:af9d4362a2e70f6978a0bf04b02e95702ba749d2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-22rhst6r: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-y36aot7_/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-y36aot7_/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  33% |############                        | ETA:  0:00:00
Adding changed files:  66% |########################            | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/gperf/gperf-3.3.tar.gz...
INFO: Rebasing devtool onto b927ca7af09300f1e51879ee2841358b3bf6689c
WARNING: Command 'git rebase b927ca7af09300f1e51879ee2841358b3bf6689c' failed:
CONFLICT (modify/delete): lib/getline.cc deleted in HEAD and modified in 33f1938 (Make the code C++17 compliant.).  Version 33f1938 (Make the code C++17 compliant.) of lib/getline.cc left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
lib/getline.cc: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9032007634096730598==--

