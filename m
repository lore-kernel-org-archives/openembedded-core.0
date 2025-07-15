Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5012C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.12159.1752594929585824869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PEcxSTFH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CdG2Clij;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101980ecc52a7-027971f4-d550-48d5-a5e0-ee530fa8c7be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594928;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a6EbeVJz5n84UkHUJFKnJj8v62ozajKVTKFHIcGqu2U=;
	b=PEcxSTFH+vDaTdiLju/Cfe+y7cmIKy3L8wHqjkJ980nWnM0ivGrhaA7X/agZpKyF
	fU4Fl/c4ERqKIRrsHWSWuZ6b1y3N/PTyiO2EcxESLR75q13s8dYIfLJnvI/RtQVZF4s
	NZ3bfRr9JIruLnQbV33xKQ2WVg16WIRPhI/GKrok=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594928;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a6EbeVJz5n84UkHUJFKnJj8v62ozajKVTKFHIcGqu2U=;
	b=CdG2Clijl8Twi0GR1uZj1cQHvT2eCgZyNFxyax7GPdpCMZ+6R1LHRKP55c8oryEj
	y1r7nSrfbIQJ/1Vcq0xYK7whwmSc6ghbLmdw/HLaUs2cjIGkqlyuIdTVuK9vl0bjyR3
	KjQPFHsZZnFT0CzvgJP6Q4fAG/Uc/L/EwUbkaGF8=
Content-Type: multipart/mixed; boundary="===============0907947887681957627=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext,gettext-minimal-native: upgrading to 0.25.1,0.25.1
 FAILED
Message-ID: <010101980ecc52a7-027971f4-d550-48d5-a5e0-ee530fa8c7be-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220310

--===============0907947887681957627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gettext,gettext-minimal-native* to *0.25.1,0.25.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gettext failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a4dfd5bf1b1524252189bd9d300b8e6606c311c2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a4dfd5bf1b1524252189bd9d300b8e6606c311c2"

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
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1929 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a4dfd5bf1b1524252189bd9d300b8e6606c311c2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a4dfd5bf1b1524252189bd9d300b8e6606c311c2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:06
Adding changed files:   3% |#                                   | ETA:  0:00:04
Adding changed files:   4% |#                                   | ETA:  0:00:04
Adding changed files:   6% |##                                  | ETA:  0:00:03
Adding changed files:   8% |##                                  | ETA:  0:00:03
Adding changed files:   9% |###                                 | ETA:  0:00:03
Adding changed files:  11% |####                                | ETA:  0:00:03
Adding changed files:  13% |####                                | ETA:  0:00:03
Adding changed files:  14% |#####                               | ETA:  0:00:03
Adding changed files:  16% |#####                               | ETA:  0:00:03
Adding changed files:  18% |######                              | ETA:  0:00:03
Adding changed files:  19% |#######                             | ETA:  0:00:03
Adding changed files:  21% |#######                             | ETA:  0:00:04
Adding changed files:  23% |########                            | ETA:  0:00:04
Adding changed files:  24% |########                            | ETA:  0:00:03
Adding changed files:  26% |#########                           | ETA:  0:00:03
Adding changed files:  28% |##########                          | ETA:  0:00:03
Adding changed files:  29% |##########                          | ETA:  0:00:03
Adding changed files:  31% |###########                         | ETA:  0:00:03
Adding changed files:  33% |###########                         | ETA:  0:00:03
Adding changed files:  34% |############                        | ETA:  0:00:03
Adding changed files:  36% |#############                       | ETA:  0:00:02
Adding changed files:  38% |#############                       | ETA:  0:00:02
Adding changed files:  39% |##############                      | ETA:  0:00:02
Adding changed files:  41% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  44% |################                    | ETA:  0:00:02
Adding changed files:  46% |################                    | ETA:  0:00:02
Adding changed files:  47% |#################                   | ETA:  0:00:02
Adding changed files:  49% |#################                   | ETA:  0:00:02
Adding changed files:  51% |##################                  | ETA:  0:00:02
Adding changed files:  52% |###################                 | ETA:  0:00:02
Adding changed files:  54% |###################                 | ETA:  0:00:02
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  57% |####################                | ETA:  0:00:01
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  62% |######################              | ETA:  0:00:01
Adding changed files:  64% |#######################             | ETA:  0:00:01
Adding changed files:  66% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  72% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/gettext/gettext-0.25.1.tar.gz...
INFO: Rebasing devtool onto bce991407902432d11f872bde06455ed10b97471
WARNING: Command 'git rebase bce991407902432d11f872bde06455ed10b97471' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging gettext-runtime/configure.ac
CONFLICT (content): Merge conflict in gettext-runtime/configure.ac
Auto-merging gettext-tools/configure.ac
CONFLICT (content): Merge conflict in gettext-tools/configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gettext
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gettext/gettext_0.25.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0907947887681957627==--

