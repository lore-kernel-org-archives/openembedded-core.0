Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17BDCCA496
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.615.1654100323787427613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ub7blpf5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010181200fea97-cd05c694-1fa3-410b-8a8d-ce8841a86b64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/ZORcqlkwETDv0xa1zuLw0S9Z4FNsivxqGjJEOCjY1E=;
	b=Ub7blpf5LY/LdXan0WWcDEmjzDFEaKOrBbavLYDYDcgy8tT5FngudTe7dFSPD6kC
	jyiMhI7oV7B/f54ZvvVq/iWTjNbQd1Qf83f83QeD0whoib3ghA2yffUtaW2yNZMOd3g
	PCRL82fb4uRiSeXiLKeLdA/zPaAGPKzs6cj9dkvM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/ZORcqlkwETDv0xa1zuLw0S9Z4FNsivxqGjJEOCjY1E=;
	b=IyP6Bahn+NnJYxbGKhiejifsETx73FJzO1LOQaX2oQACutmvd4TqJrk9y1VyHYHS
	g62NlIkqSoDGmFX0xt9XjDkviyiXu3q8hmMQ/n2cfTk9zQA6XwoszMaVu3ujXW3xqyX
	cYCLZYmQ3LM2j+4nGigWAyE1ZzibkhxecsSME8DY=
Content-Type: multipart/mixed; boundary="===============0554338217779270110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 02ba26b218d3d3db6c56e014655faf463cefa983 FAILED
Message-ID: 
 <01010181200fea97-cd05c694-1fa3-410b-8a8d-ce8841a86b64-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:42 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166400

--===============0554338217779270110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *02ba26b218d3d3db6c56e014655faf463cefa983* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S 02ba26b218d3d3db6c56e014655faf463cefa983
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-693b7126fbef93868d315ed8a4aaa4f4f192378e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:693b7126fbef93868d315ed8a4aaa4f4f192378e"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 0 Mirrors 0 Missed 8 Current 12 (0% match, 60% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
WARNING: Failed to find a git repository in WORKDIR: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/workdir
WARNING: gnu-config: the directory ${WORKDIR}/git (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/workdir/git) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
WARNING: No source unpacked to S - either the gnu-config recipe doesn't use any source or the correct source directory could not be determined
NOTE: Tasks Summary: Attempted 56 tasks of which 51 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
ERROR: Bitbake Fetcher Error: FetchError('Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/native-intercept:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/workdir/recipe-sysroot-native/usr/bin/x86_64-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/
 yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c core.fsyncobjectfiles=0 -c gc.autoDetach=false -c core.pager=cat clone -n -s /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.savannah.gnu.org.git.config.git/ /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0
 /devtooltmp-wwp2vgcj/workdir/git/ failed with exit code 128, output:\nfatal: destination path \'/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/workdir/git\' already exists and is not an empty directory.\n', None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220516+gitAUTOINC+f56a714038-r0/devtooltmp-wwp2vgcj/temp/log.do_unpack.4093579
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0554338217779270110==--

