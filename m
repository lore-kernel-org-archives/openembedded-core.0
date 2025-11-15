Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FCCCED615
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11937.1763224718180011512
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VWivgUL1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=llABinbr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a886259b8-382e38a7-8c0e-4636-bf60-b5b497586c4a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GJZmH5nEn+pwzwxwhCn+2WVJGvv/5Oj8z4ofyCtocls=;
	b=VWivgUL1V7Oqgp6G6FhAdR1VaYaRC9zQqlNtQzekBhO8+9IazCIjSTXmSDgQV7cr
	M12LqKZzoR21G1gkekuOcxyKsOUNCn+jlnKkl1IntFmHiH3PqjMOgKeX62LhmVhSAt3
	tcvjIzS1QPc2CjnRZIhWEAmsaJAVeUAfRxBTMZCI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GJZmH5nEn+pwzwxwhCn+2WVJGvv/5Oj8z4ofyCtocls=;
	b=llABinbrjoWKQvBw+j0xjTdxPT33h0y9ynFShgskiku2Jj2zMbANV+q+BmPmYlxo
	lpYfBo4y5yubTLNrpYpsNqAoZfl0NyDgtqFN8IDGdySHftGz318qTG/RGp0eRMakddM
	Q47UM1tIjBWMZDLpP0sPiGpjd/f9alOrzmaFUfgo=
Content-Type: multipart/mixed; boundary="===============5002910054521461504=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.14.0 FAILED
Message-ID: <0101019a886259b8-382e38a7-8c0e-4636-bf60-b5b497586c4a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226386

--===============5002910054521461504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3* to *3.14.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-2013c17cd7ed757d43a4113d3644cad63db5e78e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:2013c17cd7ed757d43a4113d3644cad63db5e78e"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-2013c17cd7ed757d43a4113d3644cad63db5e78e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:2013c17cd7ed757d43a4113d3644cad63db5e78e"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   4% |#                                   | ETA:  0:00:03
Adding changed files:   8% |###                                 | ETA:  0:00:02
Adding changed files:  13% |####                                | ETA:  0:00:01
Adding changed files:  17% |######                              | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  26% |#########                           | ETA:  0:00:01
Adding changed files:  30% |###########                         | ETA:  0:00:01
Adding changed files:  35% |############                        | ETA:  0:00:01
Adding changed files:  39% |##############                      | ETA:  0:00:01
Adding changed files:  43% |###############                     | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:01
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  61% |######################              | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  83% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching http://www.python.org/ftp/python/3.14.0/Python-3.14.0.tar.xz...
INFO: Rebasing devtool onto 3f16cdcbc5b7a768ad4ee6cad6cd1b425541a32d
WARNING: Command 'git rebase 3f16cdcbc5b7a768ad4ee6cad6cd1b425541a32d' failed:
Auto-merging Lib/test/test_locale.py
CONFLICT (content): Merge conflict in Lib/test/test_locale.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 3f16cdcbc5b7a768ad4ee6cad6cd1b425541a32d
WARNING: Command 'git rebase 3f16cdcbc5b7a768ad4ee6cad6cd1b425541a32d' failed:
Auto-merging Lib/test/test_locale.py
CONFLICT (content): Merge conflict in Lib/test/test_locale.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3/python3_3.14.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5002910054521461504==--

