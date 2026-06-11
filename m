Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D54CD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:37 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50407.1781195495833571318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fU17x3Tn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rYqAIDUC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb786561c-7c382f1b-1623-4280-b5c2-445e7f74648d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195495;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6cgZ0WDyT24OcTxzFpivMKOEDbGjyZXR7I0jxh7VBDc=;
	b=fU17x3TnKQLCF0Gr/udEcpbf9Ez3LzpSXtJpQd2IjLrHn0A0WP2K7tH2d0tdHcl+
	9ewYAHiORcgw2hVq7kMF4htk39N7r6saBJdtZODWTfsnrZ/oyHWlKxf/2bTybIUh9dp
	oQI1qFX3a3DiYnJ52O0NHg0HnzdkNUn1dY7f8RWU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195495;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6cgZ0WDyT24OcTxzFpivMKOEDbGjyZXR7I0jxh7VBDc=;
	b=rYqAIDUCY6cbxv3eVHl8mfJCwYLIHdgVPq86RVMIrJQh6THx11NZm3xlvEtTfcGQ
	AVKEClnWdGSoF4aA6zaSjoMb5af8rytB3mj+mkKwxuqbUwW8CSUliNmw6QPszppmmNM
	VMoB06ezSqQKJTuPjrncu/YS8E2wByw2OEH6AL7o=
Content-Type: multipart/mixed; boundary="===============1155286930545253173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-system-native,qemu-native,qemu: upgrading to
 11.0.1,11.0.1,11.0.1 FAILED
Message-ID: <0101019eb786561c-7c382f1b-1623-4280-b5c2-445e7f74648d-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238459

--===============1155286930545253173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-system-native,qemu-native,qemu* to *11.0.1,11.0.1,11.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu-system-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9c3514949834d1c7ad96172badc39a7a7cf156fa"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9c3514949834d1c7ad96172badc39a7a7cf156fa"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9c3514949834d1c7ad96172badc39a7a7cf156fa"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9c3514949834d1c7ad96172badc39a7a7cf156fa"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:11
Adding changed files:   4% |#                                   | ETA:  0:00:08
Adding changed files:   7% |##                                  | ETA:  0:00:07
Adding changed files:   9% |###                                 | ETA:  0:00:06
Adding changed files:  12% |####                                | ETA:  0:00:06
Adding changed files:  14% |#####                               | ETA:  0:00:05
Adding changed files:  16% |######                              | ETA:  0:00:05
Adding changed files:  19% |######                              | ETA:  0:00:05
Adding changed files:  21% |#######                             | ETA:  0:00:04
Adding changed files:  24% |########                            | ETA:  0:00:04
Adding changed files:  26% |#########                           | ETA:  0:00:04
Adding changed files:  29% |##########                          | ETA:  0:00:04
Adding changed files:  31% |###########                         | ETA:  0:00:04
Adding changed files:  33% |############                        | ETA:  0:00:03
Adding changed files:  36% |#############                       | ETA:  0:00:03
Adding changed files:  38% |#############                       | ETA:  0:00:03
Adding changed files:  41% |##############                      | ETA:  0:00:03
Adding changed files:  43% |###############                     | ETA:  0:00:03
Adding changed files:  45% |################                    | ETA:  0:00:03
Adding changed files:  48% |#################                   | ETA:  0:00:03
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  53% |###################                 | ETA:  0:00:02
Adding changed files:  55% |####################                | ETA:  0:00:02
Adding changed files:  58% |####################                | ETA:  0:00:02
Adding changed files:  60% |#####################               | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  72% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:06
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-11.0.1.tar.xz...
INFO: Rebasing devtool onto 8ed01ead1028fc3b5e4230e6c4145c19c4b93c21
WARNING: Command 'git rebase 8ed01ead1028fc3b5e4230e6c4145c19c4b93c21' failed:
Auto-merging target/riscv/kvm/kvm-cpu.c
CONFLICT (content): Merge conflict in target/riscv/kvm/kvm-cpu.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/qemu-system-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/qemu-system-native/qemu-system-native_11.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1155286930545253173==--

