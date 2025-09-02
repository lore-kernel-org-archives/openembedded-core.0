Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B77CA100E
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.89787.1756850180157864169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tHaKVAGK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mG1oH4XC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101990c6e4d13-b5df9067-2d55-4c78-812b-ec3c9660e6e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EWJhmaxX6Qt11bSo1rlIhwZSWw/H+YIydFo3n82a88o=;
	b=tHaKVAGKCay46x65M7SrMlDw7mEQ1LxrUExKq+ZKDxiqhzX2daPNVW71GIgrCCW6
	Hs4wh+8ZU43vmzze8nNgiOd3PPrtZhI/k6o0m602Eg2wAtDjJV2ZUMoh4zXpZoIHvEX
	VB5rMwYHEWdFwf4bY208A58pnJfsVcQ8/A6dkBRU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EWJhmaxX6Qt11bSo1rlIhwZSWw/H+YIydFo3n82a88o=;
	b=mG1oH4XC0B4Ix1Le0OuWoZfUPQkQ/a/yFDAbE0z7XPUXh15RG2Kd7HtmShZna3As
	zduhyZMUQK1tnZYWOr+PkbSnINXU4l9EAVRf3jUWQ3q3o+CoyCX3bklUkd6OrCQ1crD
	Sj3HjnoVlzrBHNO13gMXanvxK4qKvnEZfTDhyF1c=
Content-Type: multipart/mixed; boundary="===============7123418943111595101=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext,gettext-minimal-native: upgrading to 0.26,0.26 FAILED
Message-ID: <010101990c6e4d13-b5df9067-2d55-4c78-812b-ec3c9660e6e2-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222755

--===============7123418943111595101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gettext,gettext-minimal-native* to *0.26,0.26* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gettext failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1940 targets, 45 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-4ad510a63fd88b7907b2a1b8feceace9758397d0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4ad510a63fd88b7907b2a1b8feceace9758397d0"

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
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1941 targets, 45 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-4ad510a63fd88b7907b2a1b8feceace9758397d0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4ad510a63fd88b7907b2a1b8feceace9758397d0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:07
Adding changed files:   3% |#                                   | ETA:  0:00:05
Adding changed files:   4% |#                                   | ETA:  0:00:04
Adding changed files:   6% |##                                  | ETA:  0:00:04
Adding changed files:   7% |##                                  | ETA:  0:00:03
Adding changed files:   9% |###                                 | ETA:  0:00:03
Adding changed files:  11% |###                                 | ETA:  0:00:03
Adding changed files:  12% |####                                | ETA:  0:00:03
Adding changed files:  14% |#####                               | ETA:  0:00:03
Adding changed files:  15% |#####                               | ETA:  0:00:03
Adding changed files:  17% |######                              | ETA:  0:00:03
Adding changed files:  19% |######                              | ETA:  0:00:03
Adding changed files:  20% |#######                             | ETA:  0:00:04
Adding changed files:  22% |#######                             | ETA:  0:00:04
Adding changed files:  23% |########                            | ETA:  0:00:04
Adding changed files:  25% |#########                           | ETA:  0:00:03
Adding changed files:  26% |#########                           | ETA:  0:00:03
Adding changed files:  28% |##########                          | ETA:  0:00:03
Adding changed files:  30% |##########                          | ETA:  0:00:03
Adding changed files:  31% |###########                         | ETA:  0:00:03
Adding changed files:  33% |###########                         | ETA:  0:00:03
Adding changed files:  34% |############                        | ETA:  0:00:03
Adding changed files:  36% |#############                       | ETA:  0:00:03
Adding changed files:  38% |#############                       | ETA:  0:00:03
Adding changed files:  39% |##############                      | ETA:  0:00:03
Adding changed files:  41% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  44% |###############                     | ETA:  0:00:02
Adding changed files:  45% |################                    | ETA:  0:00:02
Adding changed files:  47% |#################                   | ETA:  0:00:02
Adding changed files:  49% |#################                   | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  52% |##################                  | ETA:  0:00:02
Adding changed files:  53% |###################                 | ETA:  0:00:02
Adding changed files:  55% |###################                 | ETA:  0:00:02
Adding changed files:  57% |####################                | ETA:  0:00:01
Adding changed files:  58% |#####################               | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:01
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  63% |######################              | ETA:  0:00:01
Adding changed files:  64% |#######################             | ETA:  0:00:01
Adding changed files:  66% |#######################             | ETA:  0:00:01
Adding changed files:  68% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  72% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/gettext/gettext-0.26.tar.gz...
INFO: Rebasing devtool onto 8cae19b704f55de90932587290fdfa96b943f07d
WARNING: Command 'git rebase 8cae19b704f55de90932587290fdfa96b943f07d' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging gettext-runtime/configure.ac
CONFLICT (content): Merge conflict in gettext-runtime/configure.ac
Auto-merging gettext-tools/configure.ac
CONFLICT (content): Merge conflict in gettext-tools/configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 8cae19b704f55de90932587290fdfa96b943f07d
WARNING: Command 'git rebase 8cae19b704f55de90932587290fdfa96b943f07d' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging gettext-runtime/configure.ac
CONFLICT (content): Merge conflict in gettext-runtime/configure.ac
Auto-merging gettext-tools/configure.ac
CONFLICT (content): Merge conflict in gettext-tools/configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gettext
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gettext/gettext_0.26.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7123418943111595101==--

