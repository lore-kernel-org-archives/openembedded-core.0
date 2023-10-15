Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870EAC04FE2
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.102662.1697399114021377821
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KT0oT+mj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dw+K6VC9;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b34df05d6-be52ae25-3af6-48a3-ba5f-3ba1f8f19366-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KHRxNLE+S5G1L9J2wgaNEWF914a51Nk6tt+2xK4eYqE=;
	b=KT0oT+mj9tDKQ7upu8rwTxijyKdbhLH2anxySmc7WtY902hr7elQUl87oupCE3LC
	zroMwQmdGBBbGUA/DIwY4M3ZNWPcTwOdYIOAxny/lixnt9EO2//lw2BDD/RdO9zpsLB
	7SudCrFu6dRnk25urMm7Kokv/5foQY0ONAKVNl1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KHRxNLE+S5G1L9J2wgaNEWF914a51Nk6tt+2xK4eYqE=;
	b=dw+K6VC9qEN1cz2Zyd+tInhuxsbJm51t1imolRJOtnaZs17jmK4PeGDQXXDUqyCz
	d+IYCxsa3m6P6bx0C0TdD9o1xadyQvCISkBZdFaGEbsotZCYMDVa4uzkD2iebb8DyEI
	fBpgrqnEeH4Ml80TyQrbCjqMUvslzRKToUmnwPGU=
Content-Type: multipart/mixed; boundary="===============7136569404008465712=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.21.3 FAILED
Message-ID: <0101018b34df05d6-be52ae25-3af6-48a3-ba5f-3ba1f8f19366-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189170

--===============7136569404008465712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.21.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe go-runtime failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-7342bb7470faba521af5bb91254e1e7ecf8c873d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7342bb7470faba521af5bb91254e1e7ecf8c873d"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (911 cached, 2 parsed). 1846 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-7342bb7470faba521af5bb91254e1e7ecf8c873d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7342bb7470faba521af5bb91254e1e7ecf8c873d"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:10
Adding changed files:   4% |#                                   | ETA:  0:00:07
Adding changed files:   7% |##                                  | ETA:  0:00:06
Adding changed files:   9% |###                                 | ETA:  0:00:06
Adding changed files:  12% |####                                | ETA:  0:00:05
Adding changed files:  14% |#####                               | ETA:  0:00:05
Adding changed files:  17% |######                              | ETA:  0:00:05
Adding changed files:  19% |#######                             | ETA:  0:00:05
Adding changed files:  22% |########                            | ETA:  0:00:05
Adding changed files:  24% |########                            | ETA:  0:00:05
Adding changed files:  27% |#########                           | ETA:  0:00:05
Adding changed files:  29% |##########                          | ETA:  0:00:04
Adding changed files:  32% |###########                         | ETA:  0:00:04
Adding changed files:  34% |############                        | ETA:  0:00:04
Adding changed files:  37% |#############                       | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:04
Adding changed files:  42% |###############                     | ETA:  0:00:04
Adding changed files:  44% |################                    | ETA:  0:00:04
Adding changed files:  47% |################                    | ETA:  0:00:03
Adding changed files:  49% |#################                   | ETA:  0:00:03
Adding changed files:  52% |##################                  | ETA:  0:00:03
Adding changed files:  54% |###################                 | ETA:  0:00:03
Adding changed files:  57% |####################                | ETA:  0:00:03
Adding changed files:  59% |#####################               | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  64% |#######################             | ETA:  0:00:02
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  69% |#########################           | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:07
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.21.3.src.tar.gz;name=main...
INFO: Rebasing devtool onto ce58834f078aea2639af9e0e18e138b29b1f1dd6
WARNING: Command 'git rebase ce58834f078aea2639af9e0e18e138b29b1f1dd6' failed:
Auto-merging src/cmd/go/internal/envcmd/env.go
Auto-merging src/cmd/go/internal/work/exec.go
CONFLICT (content): Merge conflict in src/cmd/go/internal/work/exec.go

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/go-runtime
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/go-runtime/go-runtime_1.21.3.bb
WARNING: Version is pinned to 1.20% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7136569404008465712==--

