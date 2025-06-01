Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15833C7113C
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.27775.1748786129144655672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=npgpksU7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jOf9Cw66;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101972bc6abee-5a388e76-f93b-4b51-8b2d-76e6484a555a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786130;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cZkJcnaoKF4BX79xVjLZxHCZCVL4J0VCgoNXUyrVEAg=;
	b=npgpksU7teNTWq4xoeul91+idfAfQkz3Kke85HpeFI86SWR8/FKfpiMSYBE09R1F
	ib6DARoocAbi2GN1HFVo3eq7WZXT/CfG3zP4jhlKUM2PVYad3K0KwuEY0LgNkx/mnBP
	gkDRwJeYXOE0BOTwxZfEAHc+ZvRrqnCTA9j/YJuk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786130;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cZkJcnaoKF4BX79xVjLZxHCZCVL4J0VCgoNXUyrVEAg=;
	b=jOf9Cw66Q174zepbWCvZpLFH+ohcyvux1ykJ5j6Tszi9owjHFWWoDslvCP6woJXJ
	zAfNq1dkrjo5gBaYpxaR2hpf1/TVB0VpR8BoaoPdPJ8YFeKMH6r3y6UquxsaWNbeyLn
	Eta01zSLyTYVOI456831vv2ZNAe60QMDFYGMRhs4=
Content-Type: multipart/mixed; boundary="===============1203235058845670477=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.193 FAILED
Message-ID: <010101972bc6abee-5a388e76-f93b-4b51-8b2d-76e6484a555a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217582

--===============1203235058845670477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *elfutils* to *0.193* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe elfutils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:522a3d7ccc7452cd1a1036e1aa1cf42edde160e4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:522a3d7ccc7452cd1a1036e1aa1cf42edde160e4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-p1nf4og2: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-at63h8e6/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-at63h8e6/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/elfutils/ftp/0.193/elfutils-0.193.tar.bz2...
INFO: Rebasing devtool onto 8c67b2b7f02fc31cdcd1e5ad2f2aeb3c9d74d181
WARNING: Command 'git rebase 8c67b2b7f02fc31cdcd1e5ad2f2aeb3c9d74d181' failed:
Auto-merging libelf/Makefile.am
CONFLICT (content): Merge conflict in libelf/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 8c67b2b7f02fc31cdcd1e5ad2f2aeb3c9d74d181
WARNING: Command 'git rebase 8c67b2b7f02fc31cdcd1e5ad2f2aeb3c9d74d181' failed:
Auto-merging libelf/Makefile.am
CONFLICT (content): Merge conflict in libelf/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/elfutils
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/elfutils/elfutils_0.193.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1203235058845670477==--

