Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B931C2FC1C
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.129643.1692086042270836397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=H+zhwlgY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kdRyvzDV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010189f82ffb38-a099eb1b-f18e-4cd6-a119-834612b034de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z8dFhFIPVFpR3UqJmAwhq78cjl0wFZ1WgQFmDoQtyT0=;
	b=H+zhwlgY2/dvtcgGtVlgy53V5GNrBHYiaOosRbZ0xlmUouLPbKfl83qjqbEHMJ/X
	/zZH5r5XDhn9HNX7JIPQp1SGzOhtfyYkEWkUwKoA+1o98VZFpTcWCEjA+igA/163uRc
	pkHqVMiILeGAOjJUIVZLAjg9mty+psMWSbCubFGs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z8dFhFIPVFpR3UqJmAwhq78cjl0wFZ1WgQFmDoQtyT0=;
	b=kdRyvzDVlSWsSNhpBVQBSqZSxTvOGkHuxsGA2P2hs859suqFlMG1IkaiPCGX4Anq
	NPxUHjAZpolGJzxUVe4l7zJfnJdzzWwOG2F/r98OQ94gXArbw6+dRp8FcHJcQCBsiTF
	vs6hQpXQVl7EP4B6iTa8VidbJB6lAWnEcLPHXQEY=
Content-Type: multipart/mixed; boundary="===============9089530189757881753=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 d4e37b5868ef910e3e52744c34408084bb13051c FAILED
Message-ID: <01010189f82ffb38-a099eb1b-f18e-4cd6-a119-834612b034de-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185966

--===============9089530189757881753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *d4e37b5868ef910e3e52744c34408084bb13051c* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S d4e37b5868ef910e3e52744c34408084bb13051c
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (05:57:47.724601)
Loading cache...done.
Loaded 1805 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d151ba95f69d7224241fb8c76c90bbe4b2fd9563"
workspace            = "master:d151ba95f69d7224241fb8c76c90bbe4b2fd9563"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 0 Mirrors 0 Missed 8 Current 21 (0% match, 72% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
WARNING: Failed to find a git repository in WORKDIR: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir
WARNING: gnu-config: the directory ${WORKDIR}/git (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir/git) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
WARNING: No source unpacked to S - either the gnu-config recipe doesn't use any source or the correct source directory could not be determined
NOTE: Tasks Summary: Attempted 65 tasks of which 60 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
ERROR: Bitbake Fetcher Error: FetchError('Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/native-intercept:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir/recipe-sysroot-native/usr/bin/x86_64-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c gc.autoDetach=false -c core.pager=cat clone -n -s /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.savannah.gnu.org.git.
 config.git/ /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir/git/ failed with exit code 128, output:\nfatal: destination path \'/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/workdir/git\' already exists and is not an empty directory.\n', None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-tb02uktv/temp/log.do_unpack.2296939
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9089530189757881753==--

