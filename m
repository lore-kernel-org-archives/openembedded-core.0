Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B3FC55166
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 05:45:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5346.1785390308810816929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 22:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Qapx/ls2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pR4OiiB8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fb18e1ace-5da65827-e9fe-4006-8806-f3341e248627-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785390308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jcgwbE+zpObfpzjo3hQCa85QeW9ypAMbuYPlgJhcqCU=;
	b=Qapx/ls2VrvBHOf5QtGFwjW5FPdNmnoufxlarK6jkCOw0AvB5Vyp+ySn2N4ji/mQ
	4msc8kYm/UhMEMI/X/fQxYKRVl5PTCSTdWO+n5z+p1ZkgxQXGy+4Y7ROVDoYlHlGX5r
	pslLlUBiSAKMwJThq79Cldma4Jza/2GmnK0JCYzM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785390308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jcgwbE+zpObfpzjo3hQCa85QeW9ypAMbuYPlgJhcqCU=;
	b=pR4OiiB8VMebYNZUFVJ4KlZpUQRVqUcyX/oUvvVY8Rj+mr42ltuZvZ3xDgqhBVTd
	eiy14zPYnHRCq/gkSQDaHEPrFo/VL7Mm1nIl1xXCYqNSGQkeSPU733W4St6BD9wXFQu
	60IYEBNtf1aaCp+Pdl179fTUB4QY/qB+LQ6lSEik=
Content-Type: multipart/mixed; boundary="===============6988439024787906680=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.20.0 FAILED
Message-ID: <0101019fb18e1ace-5da65827-e9fe-4006-8806-f3341e248627-000000@us-west-2.amazonses.com>
Date: Thu, 30 Jul 2026 05:45:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.30-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242318

--===============6988439024787906680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.20.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade shadow -V 4.20.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 954 .bb files complete (0 cached, 954 parsed). 1983 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-e0eada1839dba0bf0b0f8c2aba01b0c8c939dc3f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e0eada1839dba0bf0b0f8c2aba01b0c8c939dc3f"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
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
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/tmp-recipetool-m4xib0p6.bb: tmp-recipetool-m4xib0p6: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-m4xib0p6-CLOSED"
done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 40 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-e0eada1839dba0bf0b0f8c2aba01b0c8c939dc3f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e0eada1839dba0bf0b0f8c2aba01b0c8c939dc3f"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-m4xib0p6: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-m4xib0p6-CLOSED"
WARNING: tmp-recipetool-m4xib0p6: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-m4xib0p6-CLOSED"
WARNING: tmp-recipetool-m4xib0p6: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-m4xib0p6-CLOSED"
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: tmp-recipetool-m4xib0p6: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-m4xib0p6-CLOSED"
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   5% |#                                   | ETA:  0:00:02
Adding changed files:  10% |###                                 | ETA:  0:00:01
Adding changed files:  16% |#####                               | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  26% |#########                           | ETA:  0:00:01
Adding changed files:  32% |###########                         | ETA:  0:00:01
Adding changed files:  37% |#############                       | ETA:  0:00:01
Adding changed files:  43% |###############                     | ETA:  0:00:00
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/shadow-maint/shadow/releases/download/4.20.0/shadow-4.20.0.tar.gz...
INFO: Rebasing devtool onto 558fd26c0493ddae8e065a03fc5b37098099aa74
WARNING: Command 'git rebase 558fd26c0493ddae8e065a03fc5b37098099aa74' failed:
CONFLICT (modify/delete): src/expiry.c deleted in HEAD and modified in ea1059d (Give unused function arguments names as GCC 10 will fail otherwise.).  Version ea1059d (Give unused function arguments names as GCC 10 will fail otherwise.) of src/expiry.c left in tree.
CONFLICT (modify/delete): src/logoutd.c deleted in HEAD and modified in ea1059d (Give unused function arguments names as GCC 10 will fail otherwise.).  Version ea1059d (Give unused function arguments names as GCC 10 will fail otherwise.) of src/logoutd.c left in tree.

INFO: Rebasing devtool-override-class-native onto 558fd26c0493ddae8e065a03fc5b37098099aa74
ERROR: Execution of 'git checkout devtool-override-class-native' failed with exit code 1:
error: you need to resolve your current index first
src/expiry.c: needs merge
src/logoutd.c: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6988439024787906680==--

