Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809F2C3DA4F
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.173799.1692224343799280923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AtpE7DQI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FfeKfDE2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a006e4bee-1841bf9a-0aee-4f5b-88ca-22c91993ce18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5HsVCE6UNViBKgxGqdunLEa8J9DflUN1wgrbjTcgZ5o=;
	b=AtpE7DQIEqXKHshdD999/J9jPqn2FPNxsB5+NgA/UL50/13A7GIupF2QOAMzEy2B
	tG4NaoL1qjQbPM9VcbHBRW5+jxBW+lcUDU8iP370PvKlZxMoUAL20OcYqdMvHDRuuwK
	ppYMi/stOL+Ua+XJuuywXs/s5IKfYX8QqPADtSd0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5HsVCE6UNViBKgxGqdunLEa8J9DflUN1wgrbjTcgZ5o=;
	b=FfeKfDE2SxUGxWf2lAdBT9plT3i+8wtaF1If8m6cBYkdFmZ5GPRbk8kVry5c0r5m
	LjcsERWPDEtAApGlTB3lqaidTaAWNaWiTv+UvWCnmfEJNbX/ihNF5gWqNYDkCwxlv4P
	koYMrhR9uIrAKnUD95UGcvz7Md4DE054fafn3x34=
Content-Type: multipart/mixed; boundary="===============7224000644031363722=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 d4e37b5868ef910e3e52744c34408084bb13051c FAILED
Message-ID: <0101018a006e4bee-1841bf9a-0aee-4f5b-88ca-22c91993ce18-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186164

--===============7224000644031363722==
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
NOTE: Previous bitbake instance shutting down?, waiting to retry... (03:13:48.902878)
NOTE: Directory listing: ['cache', 'sstate-cache', 'buildhistory', 'workspace', 'upgrade-helper', 'bitbake-cookerdaemon.log', 'downloads', 'tmp', 'conf']
NOTE: Retrying server connection (#1)... (03:13:49.056223)
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
meta-yocto-bsp       = "tmp-auh-upgrades:774228d8cf8aadf20d3614e8b826b54b3ad84b5b"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 0 Mirrors 0 Missed 8 Current 21 (0% match, 72% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
WARNING: Failed to find a git repository in WORKDIR: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir
WARNING: gnu-config: the directory ${WORKDIR}/git (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir/git) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
WARNING: No source unpacked to S - either the gnu-config recipe doesn't use any source or the correct source directory could not be determined
NOTE: Tasks Summary: Attempted 65 tasks of which 60 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
ERROR: Bitbake Fetcher Error: FetchError('Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/native-intercept:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir/recipe-sysroot-native/usr/bin/x86_64-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c gc.autoDetach=false -c core.pager=cat clone -n -s /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.savannah.gnu.org.git.
 config.git/ /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir/git/ failed with exit code 128, output:\nfatal: destination path \'/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/workdir/git\' already exists and is not an empty directory.\n', None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20230216+gitAUTOINC+63acb96f92/devtooltmp-podpwmc0/temp/log.do_unpack.1133450
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7224000644031363722==--

