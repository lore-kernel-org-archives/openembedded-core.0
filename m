Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C91CFC604
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:42 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.53344.1728588936244469837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IhYqTYhU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vyb90YP0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277edefef-f28ac285-2ab8-4e32-a126-aafd532eca01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CAsrPHz54IF3m718GVCKsiAkgW6+3Iqas9ahVGVlNYE=;
	b=IhYqTYhU0d7o9LoK9VF0SDhXVhuOMpcTBrmnnmMqgB/SmHcqmNE/g59UOVfbHX7U
	MbyQOv3PlYgpZV4LkC1HNk/dz4jHBusgQHBI+TDZmJo8P85EF6EJbtM7S6G4Isc3CSb
	qjRvckTD9ci7nA8PD+HtRUkfeSy3ZWkIyPJtbzIY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CAsrPHz54IF3m718GVCKsiAkgW6+3Iqas9ahVGVlNYE=;
	b=vyb90YP0ih62WDnDh/I/LtJX9TxpL4YhvRAZ+fa7XewzW9HWNVTjpqE+ycKejf75
	MecMRAfGC87lThSP9VRsCJcK/zgzgxPToMyNtGgOjF+qDe13FWZ4/3aMDv594EmgOf9
	oa8nz05XJWg9jqGaqjNUpgqS8nW7Z3jn+DS1tims=
Content-Type: multipart/mixed; boundary="===============7101704094691999698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go,go-cross-canadian-x86-64,go-cross-core2-64,go-crosssdk-x86_64-pokysdk-linux,go-runtime:
 upgrading to 1.23.2,1.23.2,1.23.2,1.23.2,1.23.2 FAILED
Message-ID: <0101019277edefef-f28ac285-2ab8-4e32-a126-aafd532eca01-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205431

--===============7101704094691999698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go,go-cross-canadian-x86-64,go-cross-core2-64,go-crosssdk-x86_64-pokysdk-linux,go-runtime* to *1.23.2,1.23.2,1.23.2,1.23.2,1.23.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe go failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4883290aa50b8c8e166f9fbf54700d29044f31ca"

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
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4883290aa50b8c8e166f9fbf54700d29044f31ca"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-qofb8q2p: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-vcoyqj6e/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-vcoyqj6e/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:03
Adding changed files:   7% |##                                  | ETA:  0:00:02
Adding changed files:  10% |###                                 | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  17% |######                              | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  24% |########                            | ETA:  0:00:01
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:01
Adding changed files:  35% |############                        | ETA:  0:00:01
Adding changed files:  38% |##############                      | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  49% |#################                   | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  77% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.23.2.src.tar.gz;name=main...
INFO: Rebasing devtool onto 6b83380e97dd331bef6df9777a36a67088ce0968
WARNING: Command 'git rebase 6b83380e97dd331bef6df9777a36a67088ce0968' failed:
Auto-merging src/make.bash
CONFLICT (content): Merge conflict in src/make.bash

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/go
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/go/go_1.23.2.bb
WARNING: Version is pinned to 1.22% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7101704094691999698==--

