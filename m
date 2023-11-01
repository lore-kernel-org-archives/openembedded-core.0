Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36FFC10F29
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.8495.1698848705261213275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DrKeU5Nq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=a6hz8gxF;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460799-69e88213-7494-494f-9c02-620becf04bdc-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iiL5Hr1BgcHqqqEkcyEr37wpj53fLPNUovNnMsz29D8=;
	b=DrKeU5NqBWBr0/QIC2sxGoUjy55+9vcHAKYvr3R+Gp/UYVAN5stQGnpPo4CdcgZV
	Ol6E4kvRsUve8cEk5617WIEVuDeID6Eld3fVMZuaHYKDm9ceMgIKNIuDpfMtNU/3Kdq
	+/kF9g3JgwF07q7zQNQUjeoO7VHfU9td0o7pwiOw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iiL5Hr1BgcHqqqEkcyEr37wpj53fLPNUovNnMsz29D8=;
	b=a6hz8gxFbGTCOo8OMP6QhSOV/kiTHjyL0AZ1y1TcDuxLDx9Esi3vuT5AqJguTSe+
	d3RKv+MTyctrTC5X1pg1bTxofC/PXmKsWve57AweTJ8D3QdK4mT6DhHeeg7TZUaLaFL
	4MCMJYkTiCHCBF4U/VhBqP72zDOwmZrQoZ1j2f+0=
Content-Type: multipart/mixed; boundary="===============3217939720738371803=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.12.0 FAILED
Message-ID: <0101018b8b460799-69e88213-7494-494f-9c02-620becf04bdc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189968

--===============3217939720738371803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.12.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3 -V 3.12.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:43:40.410246)
Loading cache...done.
Loaded 1842 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6e38f57c8f0bc68ea564765af10ac63d64160ab3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e38f57c8f0bc68ea564765af10ac63d64160ab3"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 31 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1842 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6e38f57c8f0bc68ea564765af10ac63d64160ab3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e38f57c8f0bc68ea564765af10ac63d64160ab3"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 2 Mirrors 0 Missed 1 Current 25 (66% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   4% |#                                   | ETA:  0:00:04
Adding changed files:   8% |###                                 | ETA:  0:00:03
Adding changed files:  12% |####                                | ETA:  0:00:02
Adding changed files:  16% |######                              | ETA:  0:00:02
Adding changed files:  21% |#######                             | ETA:  0:00:02
Adding changed files:  25% |#########                           | ETA:  0:00:01
Adding changed files:  29% |##########                          | ETA:  0:00:01
Adding changed files:  33% |############                        | ETA:  0:00:01
Adding changed files:  37% |#############                       | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  50% |##################                  | ETA:  0:00:01
Adding changed files:  54% |###################                 | ETA:  0:00:01
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.python.org/ftp/python/3.12.0/Python-3.12.0.tar.xz...
INFO: Rebasing devtool onto 34e787aba0e5820731d3e9cb6d7b26a8d68ad328
WARNING: Command 'git rebase 34e787aba0e5820731d3e9cb6d7b26a8d68ad328' failed:
CONFLICT (modify/delete): setup.py deleted in HEAD and modified in 10ff2dd (Do not add /usr/lib/termcap to linker flags to avoid host contamination).  Version 10ff2dd (Do not add /usr/lib/termcap to linker flags to avoid host contamination) of setup.py left in tree.

INFO: Rebasing devtool-override-class-native onto 34e787aba0e5820731d3e9cb6d7b26a8d68ad328
ERROR: Execution of 'git checkout devtool-override-class-native' failed with exit code 1:
error: you need to resolve your current index first
setup.py: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3217939720738371803==--

