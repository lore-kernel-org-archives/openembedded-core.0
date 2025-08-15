Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1C2CA0EEC
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11406.1755263217886317834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=imOPDJnP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FpDNUdEY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010198add72e21-1bd91abe-42c0-49b2-b8f5-3d0549bc68ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263217;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bdxFc2yr+KGab5/IoiCDIYuWpWtuHbQrnOzJSXq5QJU=;
	b=imOPDJnPC2ThH94z4y/JvPOuN1GsRtnc47daynn5xysgvXELhXkEnWdlaaKJ0yFE
	4Fd9WzUVYFwawVIVkCZjY0DDVG2wRQCj+mTmSUZyIbcDPxP62xjCsq9wC8GRaqPqABz
	2Dtfbju0zeWVMeLhW9+OJvCfE7NgVKCNDDi4/PhA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263217;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bdxFc2yr+KGab5/IoiCDIYuWpWtuHbQrnOzJSXq5QJU=;
	b=FpDNUdEYiSim5rO/tWJNFZu+NscuwpQ+eJpTqCjHvKFwA9EKBQQGS39xpftd9L6W
	+Ct8j5eLrvNjiq11gBhtf2oD2hYv9MIE+/OVcxbK6DkCxxvbzfDymkQ40ylfhXx0oS4
	X6wmLKjbxuuw4fUCsfNri3OZv4q5rtjRE7lY8HwA=
Content-Type: multipart/mixed; boundary="===============2678119511444188174=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-cross-core2-64,go,go-cross-canadian-x86-64,go-runtime,go-crosssdk-x86_64-pokysdk-linux:
 upgrading to 1.25.0,1.25.0,1.25.0,1.25.0,1.25.0 FAILED
Message-ID: <01010198add72e21-1bd91abe-42c0-49b2-b8f5-3d0549bc68ce-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:06:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221885

--===============2678119511444188174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-cross-core2-64,go,go-cross-canadian-x86-64,go-runtime,go-crosssdk-x86_64-pokysdk-linux* to *1.25.0,1.25.0,1.25.0,1.25.0,1.25.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe go-cross-core2-64 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c6296eeb3e297cad60d5ce7a8afd40a1e5ee0690"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c6296eeb3e297cad60d5ce7a8afd40a1e5ee0690"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1942 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-c6296eeb3e297cad60d5ce7a8afd40a1e5ee0690"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c6296eeb3e297cad60d5ce7a8afd40a1e5ee0690"

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
Adding changed files:   4% |#                                   | ETA:  0:00:03
Adding changed files:   8% |###                                 | ETA:  0:00:02
Adding changed files:  12% |####                                | ETA:  0:00:01
Adding changed files:  16% |######                              | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  25% |#########                           | ETA:  0:00:01
Adding changed files:  29% |##########                          | ETA:  0:00:01
Adding changed files:  33% |############                        | ETA:  0:00:01
Adding changed files:  38% |#############                       | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  50% |##################                  | ETA:  0:00:01
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  72% |#########################           | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.25.0.src.tar.gz;name=main...
INFO: Rebasing devtool onto 8d95eacfcdf31ba4f937c5e123f4a4759ace337e
WARNING: Command 'git rebase 8d95eacfcdf31ba4f937c5e123f4a4759ace337e' failed:
Auto-merging src/cmd/dist/build.go
CONFLICT (content): Merge conflict in src/cmd/dist/build.go

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/go-cross-core2-64
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/go-cross-core2-64/go-cross-core2-64_1.25.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2678119511444188174==--

