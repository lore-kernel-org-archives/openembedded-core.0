Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A484FC3DA6A
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1383.1721071149250212099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=G4bDsUzO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TJoDTErq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010190b7d59ec0-44e97eb1-9a35-477b-8a7f-85018d40091a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UhMZy7DbdnZEw/5EmxN+3q/vJtsSws3ANWLfDdnZyBU=;
	b=G4bDsUzOJ7eEKCurQW8w1GdQnqqo96YudG1DZ8V0Re0Uw1aCiKrL2JwOqoLeCkKN
	UNW8oWN2+hz/jIPaXAOMs/TCCNKMUlS4/0m4NhmXZCwiARZ2FupDcNw47KVxIML5okj
	dDiCrY0OwoTjBEew41s40yw+WxCuN/qRF400g4sw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UhMZy7DbdnZEw/5EmxN+3q/vJtsSws3ANWLfDdnZyBU=;
	b=TJoDTErqQsbUhqjXhB52p9GyhhgNarysWh/SZKT4bJBS7jUvfitYbH/DLhaQoiKb
	RBXRVUuoeadEpunJ0RtnyY53MudvT2sbk4KGDsKpL92VsrO8AzDR9ShKCZzhPTrstlX
	qMb6IBb1u5Yyl1zGVyxYSzTl3TOfyd8wJ7wvmgKk=
Content-Type: multipart/mixed; boundary="===============1186840666523183192=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.50 FAILED
Message-ID: <01010190b7d59ec0-44e97eb1-9a35-477b-8a7f-85018d40091a-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202055

--===============1186840666523183192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgpg-error* to *1.50* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgpg-error failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-da769138b981a2b9ab4842ab2449e62766a54369"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:da769138b981a2b9ab4842ab2449e62766a54369"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-da769138b981a2b9ab4842ab2449e62766a54369"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:da769138b981a2b9ab4842ab2449e62766a54369"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-icwv3hfu: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5xbc4bqh/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5xbc4bqh/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.50.tar.bz2...
INFO: Rebasing devtool onto fa3aaac7cff20a5b2816869dd3f434fec7035863
WARNING: Command 'git rebase fa3aaac7cff20a5b2816869dd3f434fec7035863' failed:
Auto-merging src/gpg-error.m4
CONFLICT (content): Merge conflict in src/gpg-error.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libgpg-error
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libgpg-error/libgpg-error_1.50.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1186840666523183192==--

