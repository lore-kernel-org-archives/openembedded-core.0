Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2AD107638D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14744.1775054158882956932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ctCvHGf1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ly1/RbMK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d4978f9cc-c8742414-5b3d-494a-827f-8ad962b5c11c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KJ6aehY2RrgiFHhH19DPZ4Q1p33b2McMAG5gLYebdUg=;
	b=ctCvHGf1RzMUHf21Auo+vQWZYlg3kjOdyoJ6/w16IlC/TYoZ33PxFDeouRmXf5Yc
	rFRHIjw0zwmJ6Qv6D4LBfjDytlOwCpTFSZqvKKQezifWU+bQ+61caEp/NFJHZQYOj2z
	H20dyUCSprSrv2HxcA5NgtmMPDC34e66C2we5xj0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KJ6aehY2RrgiFHhH19DPZ4Q1p33b2McMAG5gLYebdUg=;
	b=Ly1/RbMKdkNjPLjy9vBPLIlY3R6HaeZCd6t5pBfVHz0DybX3JNw9BsVS099mNXH/
	h4d0ZtVS3RWwwan3FvHCYMwSEBzqRvT+B/NlnO6pZxcfA8lO/l5ga7DzT8T/VciGqRl
	bAdCf1jho9j3fq7r8sl8mlp3yqriMwvVhCQqMsg0=
Content-Type: multipart/mixed; boundary="===============7021845503071841378=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] autoconf: upgrading to 2.73 FAILED
Message-ID: <0101019d4978f9cc-c8742414-5b3d-494a-827f-8ad962b5c11c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234365

--===============7021845503071841378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *autoconf* to *2.73* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade autoconf -V 2.73
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-4793beb1b10bd10d7dddd2c9fa83ad71a48bed5e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4793beb1b10bd10d7dddd2c9fa83ad71a48bed5e"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 15 Local 9 Mirrors 0 Missed 6 Current 14 (60% match, 79% complete)
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 76 tasks of which 58 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401084007.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401084007.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: Bitbake Fetcher Error: UnpackError('Unpack command PATH="/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/autoconf/2.72/devtooltmp-3tyegfe4/workdir/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/autoconf/2.72/devtooltmp-3tyegfe4/workdir/recipe-sysroot/usr/bin/crossscripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/autoconf/2.72/devtooltmp-3tyegfe4/workdir/recipe-sysroot-native/usr/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/autoconf/2.72/devtooltmp-3tyegfe4/workdir/recipe-sysroot-native/usr/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/autoconf/2.72/devtooltmp-3tyegfe4/workdir/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-wo
 rker/auh/build/build/tmp/work/x86-64-v3-poky-linux/autoconf/2.72/devtooltmp-3tyegfe4/workdir/recipe-sysroot-native/bin:/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools" cp --force --preserve=timestamps --no-dereference --recursive -H "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch" "." failed with return value 1', 'file://program_prefix.patch')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/autoconf/2.72/devtooltmp-3tyegfe4/temp/log.do_unpack.937610
ERROR: Extracting source for autoconf failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7021845503071841378==--

