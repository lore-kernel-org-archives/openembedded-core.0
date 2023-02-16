Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C985C6379F
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10156.1676508398555758337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dOBOWlT5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018657b0016e-eed24c1b-219c-42e7-a04d-39b59bb7f32f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508398;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xbg/Had7NdLyRNjL/oIAjILelZa9puXk+PLDl9aZmts=;
	b=dOBOWlT5+DwUDxJmIxxnrFq1LorUFa0co0s7ZFRYpA4jfrEktzjnnswhr0hKwFSX
	m0fTqeXaVIy/5pqLznyFhG68viN/DYng8et7XaTjJV2OqeRW/ogwYZAmDWsnu40ewLs
	cYP4QQ1p5oJ+ON6HX8c7HBXsjAnOq4V0AMwG3rkI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508398;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xbg/Had7NdLyRNjL/oIAjILelZa9puXk+PLDl9aZmts=;
	b=F1faO3x5hfLxLx8S2CuVWR8K1fMYQDeA0RciWebMSiFfub2yXT8JH1KZXZEH55Ge
	LapxWj5wGvXm/j4TXUbtc4lVjwyStH6xslYQTtS7AZPmyN5EMgnCOWi+YGka1WRlPLe
	uy1Hcl1x9sX3hbWEkC2AMzPrDm+r+TxgOmAJfPMM=
Content-Type: multipart/mixed; boundary="===============8323416267378080766=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.8.0 FAILED
Message-ID: <0101018657b0016e-eed24c1b-219c-42e7-a04d-39b59bb7f32f-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177265

--===============8323416267378080766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnutls* to *3.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gnutls failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (00:22:39.975815)
NOTE: Directory listing: ['bitbake-cookerdaemon.log', 'sstate-cache', 'buildhistory', 'upgrade-helper', 'workspace', 'conf', 'tmp', 'cache', 'downloads']
NOTE: Retrying server connection (#1)... (00:22:40.106908)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-bbd150a101ed0eae501303aadc7d5efc3621dd31"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bbd150a101ed0eae501303aadc7d5efc3621dd31"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (894 cached, 2 parsed). 1694 targets, 37 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-bbd150a101ed0eae501303aadc7d5efc3621dd31"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bbd150a101ed0eae501303aadc7d5efc3621dd31"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 17 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:08
Adding changed files:   5% |#                                   | ETA:  0:00:06
Adding changed files:   8% |##                                  | ETA:  0:00:05
Adding changed files:  10% |###                                 | ETA:  0:00:04
Adding changed files:  13% |####                                | ETA:  0:00:03
Adding changed files:  16% |#####                               | ETA:  0:00:03
Adding changed files:  18% |######                              | ETA:  0:00:03
Adding changed files:  21% |#######                             | ETA:  0:00:02
Adding changed files:  24% |########                            | ETA:  0:00:02
Adding changed files:  26% |#########                           | ETA:  0:00:02
Adding changed files:  29% |##########                          | ETA:  0:00:02
Adding changed files:  32% |###########                         | ETA:  0:00:02
Adding changed files:  34% |############                        | ETA:  0:00:02
Adding changed files:  37% |#############                       | ETA:  0:00:02
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  45% |################                    | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:01
Adding changed files:  51% |##################                  | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  64% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:00
Adding changed files:  72% |##########################          | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  77% |############################        | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  83% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:03
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.0.tar.xz...
INFO: Rebasing devtool onto 883cf91f676a91f5c655319a308e8015cd8ac8b0
WARNING: Command 'git rebase 883cf91f676a91f5c655319a308e8015cd8ac8b0' failed:
Auto-merging lib/Makefile.am
CONFLICT (content): Merge conflict in lib/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gnutls
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gnutls/gnutls_3.8.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8323416267378080766==--

