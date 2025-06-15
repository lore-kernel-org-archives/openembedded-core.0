Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB74C71135
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:41 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8856.1749993275954159520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PrOREyPY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ISlS/F2x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019773ba3ec5-1670fc2a-ba5e-4166-85bb-a5b7078b2320-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993275;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tC8X0sHcVVFnUmrMxuK7afhVzcrCqle/WgWo5p6kCsY=;
	b=PrOREyPYDgjWPRqXXN7NNNgAzKipy/1a3Ph67/EB5K6RDAfK7cAktekrzj0O2uM6
	m2WIHw1ZUVfLhtvSnL7ikZ6hcEFHZ3uC080CtB7r2b5W/ELql6h+8HTbmR+bU3f+meB
	atlXo3oVFfyq57jdFGQF3K+WqFnODli4uMQEhQzs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993275;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tC8X0sHcVVFnUmrMxuK7afhVzcrCqle/WgWo5p6kCsY=;
	b=ISlS/F2xI0EyjsCX32tzMpCFretdPxwAMcJKeo/DOHPvXGRc8tAJmvmHXcCr6sq/
	jIqyTYjnwrZIdI0xuLEGbyZUmibM0OjZ5svPsOUWjmw99eJi9ToknwMbiFfaL6BdY9X
	ApF4sm29aqfZMYGhmE+1PIirnC9ApPLA9D9zybwI=
Content-Type: multipart/mixed; boundary="===============9008082472585519109=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext-minimal-native,gettext: upgrading to 0.25,0.25 FAILED
Message-ID: <0101019773ba3ec5-1670fc2a-ba5e-4166-85bb-a5b7078b2320-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218650

--===============9008082472585519109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gettext-minimal-native,gettext* to *0.25,0.25* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gettext-minimal-native -V 0.25
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (0 cached, 935 parsed). 1910 targets, 39 skipped, 0 masked, 0 errors.
WARNING: QA Issue: gettext-minimal-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2922e9cebf7d3d943e72a0936ccdb0c31a9359b8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: QA Issue: gettext-minimal-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: gettext-minimal-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: gettext-minimal-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 605, in upgrade
    old_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 509, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gettext-minimal-native/0.23.1/sources-unpack/COPYING'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9008082472585519109==--

