Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEA9D48990
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1427.1768526743464383750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=C0DbAdU4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dJlLysBi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019bc4688415-40762ac9-3674-4cd5-bccc-5907e093a157-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BuqAuLOHMEb2JJCbEvRblqqrBQII5LhfNzhs7U52Tik=;
	b=C0DbAdU4jBnGN2U8bfQqtzm059DDFEFbaGLGBvaxmxVQvoUD2OfbjzuwIUVdXOtk
	VRCBI7bSfgVVx0eCuCKr5S/zR0xZGWylQvqknKHgo6TXENuXbzE94r+WIbovR3YmAWz
	hgny5TSM6auUpPPm2iBeTYGyFkukOMEs0sEW7Y1o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BuqAuLOHMEb2JJCbEvRblqqrBQII5LhfNzhs7U52Tik=;
	b=dJlLysBiReSPbvfMm8rkqa+D9Mg1sX2Zz43minkawQvsnTQsixtm+ZeRZ51SJ8FQ
	pyyc84v9GkX/rjW96PMnPTvCKBwAFVxZdTISlz1lLoHqL6KwOHl8QLY7lnDDEVDW6yo
	OrP9CUgMZuRWlCbRimTEiNvdHl0eEZYWKen+639Q=
Content-Type: multipart/mixed; boundary="===============8263901478045738740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu,qemu-native,qemu-system-native: upgrading to
 10.2.0,10.2.0,10.2.0 FAILED
Message-ID: <0101019bc4688415-40762ac9-3674-4cd5-bccc-5907e093a157-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229450

--===============8263901478045738740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu,qemu-native,qemu-system-native* to *10.2.0,10.2.0,10.2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1957 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-beb0a16ac408d741213b635ab6151f5a921bd129"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:beb0a16ac408d741213b635ab6151f5a921bd129"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 15 Local 15 Mirrors 0 Missed 0 Current 18 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1956 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-beb0a16ac408d741213b635ab6151f5a921bd129"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:beb0a16ac408d741213b635ab6151f5a921bd129"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 13 Mirrors 0 Missed 1 Current 14 (92% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:15
Adding changed files:   4% |#                                   | ETA:  0:00:11
Adding changed files:   6% |##                                  | ETA:  0:00:09
Adding changed files:   8% |##                                  | ETA:  0:00:08
Adding changed files:  10% |###                                 | ETA:  0:00:07
Adding changed files:  12% |####                                | ETA:  0:00:07
Adding changed files:  14% |#####                               | ETA:  0:00:06
Adding changed files:  16% |#####                               | ETA:  0:00:06
Adding changed files:  18% |######                              | ETA:  0:00:06
Adding changed files:  20% |#######                             | ETA:  0:00:06
Adding changed files:  22% |########                            | ETA:  0:00:05
Adding changed files:  24% |########                            | ETA:  0:00:05
Adding changed files:  26% |#########                           | ETA:  0:00:05
Adding changed files:  28% |##########                          | ETA:  0:00:05
Adding changed files:  31% |###########                         | ETA:  0:00:05
Adding changed files:  33% |###########                         | ETA:  0:00:04
Adding changed files:  35% |############                        | ETA:  0:00:04
Adding changed files:  37% |#############                       | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:04
Adding changed files:  41% |##############                      | ETA:  0:00:04
Adding changed files:  43% |###############                     | ETA:  0:00:04
Adding changed files:  45% |################                    | ETA:  0:00:03
Adding changed files:  47% |#################                   | ETA:  0:00:03
Adding changed files:  49% |#################                   | ETA:  0:00:03
Adding changed files:  51% |##################                  | ETA:  0:00:03
Adding changed files:  53% |###################                 | ETA:  0:00:03
Adding changed files:  55% |####################                | ETA:  0:00:03
Adding changed files:  57% |####################                | ETA:  0:00:03
Adding changed files:  60% |#####################               | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  64% |#######################             | ETA:  0:00:02
Adding changed files:  66% |#######################             | ETA:  0:00:02
Adding changed files:  68% |########################            | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:02
Adding changed files:  72% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  80% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:07
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-10.2.0.tar.xz...
INFO: Rebasing devtool onto 5ef3c4102b0aba750c103c3498d4c2a9f7ff2059
WARNING: Command 'git rebase 5ef3c4102b0aba750c103c3498d4c2a9f7ff2059' failed:
Auto-merging configure
CONFLICT (content): Merge conflict in configure

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/qemu
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/qemu/qemu_10.2.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8263901478045738740==--

