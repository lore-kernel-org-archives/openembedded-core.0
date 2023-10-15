Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBD3C04FE1
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.102661.1697399113972548689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VJgP9ED8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eq5QuxTV;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b34df056e-fe60be4a-e608-4b39-8789-b81c7dfa0858-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5Hi8mwfqu80XUqKJ7rlW8GFc1chRoiO5EZAz2XvP3m8=;
	b=VJgP9ED8cFjtUgw84V5hXe8GmW0aJCrQS22uWWTcXcc5ogFnV35ZeaDoYWJNGKAJ
	1H9g9C5V1oaYTVcs+GcgpCTROkVD2HPml6RZU2+nPYNyNLr+bfBkli/fr+YJ1wup6Dg
	/NP6P7ChzD12h6N8jOWcnF5Y6o2QaPontdPSYkm4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5Hi8mwfqu80XUqKJ7rlW8GFc1chRoiO5EZAz2XvP3m8=;
	b=eq5QuxTVwoomf+yz1hf4m2/6IevXM8OGHBSkjsASgDWIXLKPcOjylAwM+B3ax/gu
	BLxf5ArExAKekstkjhelD226hPpSY6kwsxL8HEyrUkH2IOc/hI7a6xMxSrjinQaXKvC
	J5vQDB7/oqd6lNv8KgoHSMkeZpVpZYgtWVbjE9pk=
Content-Type: multipart/mixed; boundary="===============5712865995768924608=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 28ea239c53a2d5d8800c472bc2452eaa16e37af2 FAILED
Message-ID: <0101018b34df056e-fe60be4a-e608-4b39-8789-b81c7dfa0858-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189169

--===============5712865995768924608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *28ea239c53a2d5d8800c472bc2452eaa16e37af2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S 28ea239c53a2d5d8800c472bc2452eaa16e37af2
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
Sstate summary: Wanted 9 Local 1 Mirrors 0 Missed 8 Current 20 (11% match, 72% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 65 tasks of which 60 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
ERROR: Bitbake Fetcher Error: FetchError('Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+git/devtooltmp-hc2hqsme/workdir/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+git/devtooltmp-hc2hqsme/workdir/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/
 auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+git/devtooltmp-hc2hqsme/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+git/devtooltmp-hc2hqsme/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+git/devtooltmp-hc2hqsme/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+git/devtooltmp-hc2hqsme/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c gc.autoDetach=false -c core.pager=cat remote set-url origin https://git.savannah.gnu.org/git/config.git failed with exit code 128, output:\nshell-init: error retrieving current directory: getcwd: cannot access parent 
 directories: No such file or directory\nfatal: Unable to read current working directory: No such file or directory\n', None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+git/devtooltmp-hc2hqsme/temp/log.do_unpack.690904
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5712865995768924608==--

