Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B378CD343D
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15609.1777645532270387654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=moqIaFv7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=b7qNSArv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019de3ee3539-b555c4e7-8aba-43fa-9852-ff8606f10020-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pNfOIoOn7r7F8R1qO6Fy/VvhrXFFVNRy+QCMVaWuV5A=;
	b=moqIaFv7nYctMReJJdf/Ed+xGZ5HFKHqF3TiblB+mo2gYW9zxX6gEFHz8ZU3HzgT
	77e1ezfXFibYUNyrTvcgPq/JenS5/EUIzznfJZRWtpmJEbX9ewiOhm/T12tyJw2KCVz
	x1Z2KFFCUzoYQwoRysrUZnQ8yjxMCUUoa8HGnkj8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pNfOIoOn7r7F8R1qO6Fy/VvhrXFFVNRy+QCMVaWuV5A=;
	b=b7qNSArv79ehsE0Xl9Q/hios198fjhb6l9rHE39QgSXZ3B6BSxNrAsOPKsaHmsBm
	pl5KlzfOzHeG7vy1q/ZQzAd1h4V6dAb30AhSkOe8vE+DImv1mbW1w+XNfacd8sTgIgT
	PICA5PLozJgXeLgOiFXhPToqroEUCuMozLblf+Tw=
Content-Type: multipart/mixed; boundary="===============4213450796453551203=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssl: upgrading to 4.0.0 FAILED
Message-ID: <0101019de3ee3539-b555c4e7-8aba-43fa-9852-ff8606f10020-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236206

--===============4213450796453551203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssl* to *4.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe openssl failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-5ccc663757cc7663aad89ab5f20d5599888e2ca1"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:5ccc663757cc7663aad89ab5f20d5599888e2ca1"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1977 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-5ccc663757cc7663aad89ab5f20d5599888e2ca1"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:5ccc663757cc7663aad89ab5f20d5599888e2ca1"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
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
Adding changed files:   4% |#                                   | ETA:  0:00:02
Adding changed files:   8% |###                                 | ETA:  0:00:01
Adding changed files:  12% |####                                | ETA:  0:00:02
Adding changed files:  16% |######                              | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  25% |#########                           | ETA:  0:00:01
Adding changed files:  29% |##########                          | ETA:  0:00:01
Adding changed files:  33% |############                        | ETA:  0:00:01
Adding changed files:  38% |#############                       | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:00
Adding changed files:  50% |##################                  | ETA:  0:00:00
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  72% |#########################           | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  88% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching http://www.openssl.org/source/openssl-4.0.0.tar.gz...
INFO: Rebasing devtool onto 5e78d7b90176f0560675e3d740e7a57a5cdc0072
WARNING: Command 'git rebase 5e78d7b90176f0560675e3d740e7a57a5cdc0072' failed:
Auto-merging test/helpers/handshake.c
CONFLICT (content): Merge conflict in test/helpers/handshake.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 5e78d7b90176f0560675e3d740e7a57a5cdc0072
WARNING: Command 'git rebase 5e78d7b90176f0560675e3d740e7a57a5cdc0072' failed:
Auto-merging test/helpers/handshake.c
CONFLICT (content): Merge conflict in test/helpers/handshake.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/openssl
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/openssl/openssl_4.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4213450796453551203==--

