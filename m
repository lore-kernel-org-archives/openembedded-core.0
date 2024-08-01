Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F75EC54746
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.75734.1722536822069824083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Qimlo54h;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0FMK3uxk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101910f3201e5-c50d9697-17e4-4304-9579-5d936ca9922f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v5dr8fuMPQvOVwPL4et2cTao9seOXFNy37Big7/gp10=;
	b=Qimlo54hs/prTlT5VTFB/RU8JVwVXm8g+Pl3BF5Sdu4Ia0iM4S0xIPZJzNRv98bk
	kVnbcNXw4dWQg+AKN8S1CFuoRlRF4Hp+9UzkgTNvGDkUpW2gKatJDvA0dde2wUEDvZl
	ByrA5rq05SIZ3hHpTGvlrVAyucOOSQromTuPDwBA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v5dr8fuMPQvOVwPL4et2cTao9seOXFNy37Big7/gp10=;
	b=0FMK3uxkROPDEZj0xMrdhr+4K1C8f9dL2hUdw+klv+6UnylUDVPPIKeYS7qA0yCH
	no5LHvy1YdKiNf1HffKgiA+52HZquMm12mij4x4swL1/IG4l2uE0GG+4mwjB3dIqROY
	tXLER2yZrcpj6VmUk2NZZrIlW2nZnet2Hl+BdJtw=
Content-Type: multipart/mixed; boundary="===============8398830246766527685=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtool-native,nativesdk-libtool,libtool-cross,libtool:
 upgrading to 2.5.1,2.5.1,2.5.1,2.5.1 FAILED
Message-ID: <010101910f3201e5-c50d9697-17e4-4304-9579-5d936ca9922f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202766

--===============8398830246766527685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtool-native,nativesdk-libtool,libtool-cross,libtool* to *2.5.1,2.5.1,2.5.1,2.5.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libtool-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ee24706121ff0677198ae8a10fc3a2c86e338ab5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ee24706121ff0677198ae8a10fc3a2c86e338ab5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1884 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ee24706121ff0677198ae8a10fc3a2c86e338ab5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ee24706121ff0677198ae8a10fc3a2c86e338ab5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-yfvdqeuo: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-foj5pa0h/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-foj5pa0h/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://alpha.gnu.org/gnu/libtool/libtool-2.5.1.tar.gz...
INFO: Rebasing devtool onto 6706715020ca3a57a663c256c72b1590d5970b7b
WARNING: Command 'git rebase 6706715020ca3a57a663c256c72b1590d5970b7b' failed:
Auto-merging build-aux/ltmain.in
CONFLICT (content): Merge conflict in build-aux/ltmain.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libtool-native
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libtool-native/libtool-native_2.5.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8398830246766527685==--

