Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9C2C48BF1
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4586.1704114719522619721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HY4yocKA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W0aFpn58;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018cc52707d9-425da8a5-bf3e-40e7-96cd-f9964687cbf0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+6CDJtXEBZsWMDg/7GG/koAb34eeA8tG9FIPE4mXm9o=;
	b=HY4yocKALyohyTWi49ZU0Nb8MvQUgP7FOTm7uFQU/z06dglFJ/W4EDPHDCEH9Xo1
	MWjYT/1omEjKloL2M7keoTbTpwes1bELfccrtenbWtzLj37CIylD2QpVJeOgkmFTZKQ
	bdXVcnp03xmnudaePUyHIsd2wZhnttCJHOSGKyg4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+6CDJtXEBZsWMDg/7GG/koAb34eeA8tG9FIPE4mXm9o=;
	b=W0aFpn58GJBJJzQk5uH1IelqHEZUNl2cdHIPyOd/Qt75gyhsrV3Sm7R73T0afZR8
	CGaFNiLjrDMMcXGZbgNo8VNNwn1OG4gFjFXiyN6uJHdRvHRdA0xLGlnzvG+HLxhwlra
	t1JO7HK0NcmggFhVzx6aieuyTHCwnTvhPS/9HWZ4=
Content-Type: multipart/mixed; boundary="===============4979084656469542823=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-runtime: upgrading to 1.21.5 FAILED
Message-ID: <0101018cc52707d9-425da8a5-bf3e-40e7-96cd-f9964687cbf0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193113

--===============4979084656469542823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-runtime* to *1.21.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe go-runtime failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-76915d596234ce40d182e30049d737a6dfea653b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:76915d596234ce40d182e30049d737a6dfea653b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (912 cached, 2 parsed). 1848 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-76915d596234ce40d182e30049d737a6dfea653b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:76915d596234ce40d182e30049d737a6dfea653b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:05
Adding changed files:   4% |#                                   | ETA:  0:00:03
Adding changed files:   7% |##                                  | ETA:  0:00:03
Adding changed files:   9% |###                                 | ETA:  0:00:03
Adding changed files:  12% |####                                | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  17% |######                              | ETA:  0:00:02
Adding changed files:  19% |#######                             | ETA:  0:00:02
Adding changed files:  22% |########                            | ETA:  0:00:02
Adding changed files:  24% |########                            | ETA:  0:00:02
Adding changed files:  27% |#########                           | ETA:  0:00:02
Adding changed files:  29% |##########                          | ETA:  0:00:02
Adding changed files:  32% |###########                         | ETA:  0:00:02
Adding changed files:  34% |############                        | ETA:  0:00:02
Adding changed files:  37% |#############                       | ETA:  0:00:02
Adding changed files:  39% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  44% |################                    | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  49% |#################                   | ETA:  0:00:01
Adding changed files:  51% |##################                  | ETA:  0:00:01
Adding changed files:  54% |###################                 | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  64% |#######################             | ETA:  0:00:01
Adding changed files:  66% |########################            | ETA:  0:00:01
Adding changed files:  69% |########################            | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:03
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.21.5.src.tar.gz;name=main...
INFO: Rebasing devtool onto 748c51cc68c7fbff778436facd5b8c4ad736d4e9
WARNING: Command 'git rebase 748c51cc68c7fbff778436facd5b8c4ad736d4e9' failed:
Auto-merging src/cmd/go/internal/envcmd/env.go
Auto-merging src/cmd/go/internal/work/exec.go
CONFLICT (content): Merge conflict in src/cmd/go/internal/work/exec.go

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/go-runtime
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/go-runtime/go-runtime_1.21.5.bb
WARNING: Version is pinned to 1.20% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4979084656469542823==--

