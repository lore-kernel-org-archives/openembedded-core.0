Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC8CC87FCE
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.12486.1752594938205141583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=103MdZYR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YWW0peH0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101980ecc79c9-87fcc1be-faab-46d6-9b6c-56c1cf467b95-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eA3WtnRHkWrC3j5Yk+zFptOgiSIRhWo0ywkHE335WMU=;
	b=103MdZYR8avqb/aH2mitlf38DzSQk8RlowpQtTpApnjh6nAlzhqPwuyYL8+LgwLl
	uo0VlmsjqMq83HFe9xERh0T6zYcgXRND92eWAExtoZJ8O1X+5y/o69om0/GzvweJiH/
	/ItOBESFeGH1yw4weQoB5MMXx0OI+vdWAKJv0+nU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eA3WtnRHkWrC3j5Yk+zFptOgiSIRhWo0ywkHE335WMU=;
	b=YWW0peH0KnYJv9NS/Cia/VKADhDpaQ6rPpaSOuT7s3TCHcPmPG9I5RUiSHmWSRen
	VyrEYsedTAxvhgZjD8iZvkT3K2Tcn5EYPkiJzz9UX2tWcwdg7ulr7Nv8vA63yC5eVYx
	+92HNdYG6zpPYTStzsGEjcwXXpacmUDDXOnMOY4w=
Content-Type: multipart/mixed; boundary="===============7212334533998810830=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 a2287c3041a3f2a204eb942e09c015eab00dc7dd FAILED
Message-ID: <010101980ecc79c9-87fcc1be-faab-46d6-9b6c-56c1cf467b95-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220335

--===============7212334533998810830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnu-config* to *a2287c3041a3f2a204eb942e09c015eab00dc7dd* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S a2287c3041a3f2a204eb942e09c015eab00dc7dd
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d3c648679dc4a7d88eee3e2dba1b0e72f8280d63"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d3c648679dc4a7d88eee3e2dba1b0e72f8280d63"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 6 Mirrors 0 Missed 8 Current 15 (42% match, 72% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 65 tasks of which 51 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715093623.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715093623.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Bitbake Fetcher Error: FetchError('Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/srv/pokybuild/yocto-worker/auh/build/scripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20240823+git/devtooltmp-c00dgbyq/workdir/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20240823+git/devtooltmp-c00dgbyq/workdir/recipe-sysroot/usr/bin/crossscripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20240823+git/devtooltmp-c00dgbyq/workdir/recipe-sysroot-native/usr/sbin:/srv
 /pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20240823+git/devtooltmp-c00dgbyq/workdir/recipe-sysroot-native/usr/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20240823+git/devtooltmp-c00dgbyq/workdir/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20240823+git/devtooltmp-c00dgbyq/workdir/recipe-sysroot-native/bin:/srv/pokybuild/yocto-worker/auh/build/bitbake/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/srv/pokybuild"; git -c gc.autoDetach=false -c core.pager=cat -c safe.bareRepository=all -c clone.defaultRemoteName=origin remote set-url origin https://git.savannah.gnu.org/git/config.git failed with exit code 128, output:\nshell-init: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory\nfatal: Unable to read current working directory: No such file or directory\n',
  None)
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20240823+git/devtooltmp-c00dgbyq/temp/log.do_unpack.4030264
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7212334533998810830==--

