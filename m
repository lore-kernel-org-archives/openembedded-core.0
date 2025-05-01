Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC84C3ABB8
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1799.1746113609915206846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JtuwXzUB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nZCvt72v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101968c7b3d98-00e42d70-8d70-4b7d-b4a3-42acb2962a54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113609;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UrCDIpuxKiRbUfXf9ANe1aMNJcswATiZlSmsHS0v6OM=;
	b=JtuwXzUB3W5VsS7OxSZ00jf6sF71R8YWKG+DSQzdV086Y28Ttswp+/oiUdls3HUy
	gImJt7DU7Bycw6aPBKxvwIlb/Zuh+6bL8sEc6U3MFjAfbFCtxbPBaCITRImalpwd55t
	V0+sNMDuJKxfGZ67b1QCSdI5beo7ehWz2F8/jx5c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113609;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UrCDIpuxKiRbUfXf9ANe1aMNJcswATiZlSmsHS0v6OM=;
	b=nZCvt72vqd52i127sAM7gOjI4C19kU8XtQgJUc+cIyZsRHgvkPSS6KxqJde5M+t1
	bCbnZ+fFgdKBgQtw/TKt+/WfZIXzbcTahrrZXAo5hAns7V146R8TvYLdHc4tGjad836
	syLHgcWxpukDVcNMwkUS4PzY5zrs6T5Zf4SXnDTE=
Content-Type: multipart/mixed; boundary="===============2940686161384177425=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] quilt,quilt-native: upgrading to 0.69,0.69 FAILED
Message-ID: <010101968c7b3d98-00e42d70-8d70-4b7d-b4a3-42acb2962a54-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215782

--===============2940686161384177425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *quilt,quilt-native* to *0.69,0.69* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade quilt-native -V 0.69
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Parsing recipes...done.
Parsing of 929 .bb files complete (928 cached, 1 parsed). 1898 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
WARNING: QA Issue: quilt-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
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
workspace            = "tmp-auh-upgrades:81c9fe2b57212cbfbc48c9ace3231a0e7ab91fbe"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: QA Issue: quilt-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: quilt-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
WARNING: QA Issue: quilt-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: devtool-source.bbclass [native-last]
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are []
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: []
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function do_patch
| DEBUG: Executing python function patch_do_patch
| DEBUG: Searching for run-ptest in paths:
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
| DEBUG: Using /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/run-ptest for run-ptest
| DEBUG: Searching for test.sh in paths:
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
| DEBUG: Using /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/test.sh for test.sh
| DEBUG: Searching for 0001-tests-Allow-different-output-from-mv.patch in paths:
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
| DEBUG: Using /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch for 0001-tests-Allow-different-output-from-mv.patch
| NOTE: Applying patch '0001-tests-Allow-different-output-from-mv.patch' (../meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch)
| NOTE: self._current is None
| NOTE: patches is [{'file': '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch', 'strippath': '1', 'filemd5': '6935b97a52117b7324bb77eba5176f7d'}]
| NOTE: applying patch {'file': '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch', 'strippath': '1', 'filemd5': '6935b97a52117b7324bb77eba5176f7d'}
| DEBUG: Python function patch_do_patch finished
| DEBUG: Python function do_patch finished
| DEBUG: Executing python function do_qa_patch
| DEBUG: Python function do_qa_patch finished
| DEBUG: Executing python function devtool_post_patch
| DEBUG: Executing python function do_patch
| DEBUG: Executing python function patch_do_patch
| DEBUG: Searching for run-ptest in paths:
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
| DEBUG: Using /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/run-ptest for run-ptest
| DEBUG: Searching for test.sh in paths:
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
| DEBUG: Using /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/test.sh for test.sh
| DEBUG: Searching for 0001-tests-Allow-different-output-from-mv.patch in paths:
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
| DEBUG: Using /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch for 0001-tests-Allow-different-output-from-mv.patch
| DEBUG: Searching for gnu_patch_test_fix_target.patch in paths:
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/class-target
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/forcevariable
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/class-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/poky
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/layer-core
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/pn-quilt-native
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/linux
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/task-patch
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-0.68/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/
|     /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/files/
| DEBUG: Using /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch for gnu_patch_test_fix_target.patch
| NOTE: Applying patch '0001-tests-Allow-different-output-from-mv.patch' (../meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch)
| NOTE: self._current is None
| NOTE: patches is [{'file': '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch', 'strippath': '1', 'filemd5': '6935b97a52117b7324bb77eba5176f7d'}]
| NOTE: applying patch {'file': '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch', 'strippath': '1', 'filemd5': '6935b97a52117b7324bb77eba5176f7d'}
| NOTE: Applying patch 'gnu_patch_test_fix_target.patch' (../meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch)
| NOTE: self._current is 0
| NOTE: patches is [{'file': '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/0001-tests-Allow-different-output-from-mv.patch', 'strippath': '1', 'filemd5': '6935b97a52117b7324bb77eba5176f7d'}, {'file': '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch', 'strippath': '1', 'filemd5': '42e95b1bd14bccccc353249de7e7f3f3'}]
| NOTE: applying patch {'file': '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch', 'strippath': '1', 'filemd5': '42e95b1bd14bccccc353249de7e7f3f3'}
| DEBUG: Python function patch_do_patch finished
| DEBUG: Python function do_patch finished
| DEBUG: Python function devtool_post_patch finished
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501061843.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501061843.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: Execution of 'git rebase devtool-no-overrides' failed with exit code 1:
error: cannot rebase: You have unstaged changes.
error: Please commit or stash them.

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/quilt-native/0.68/devtooltmp-nm2jisav/temp/log.do_patch.3085003
ERROR: Extracting source for quilt-native failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2940686161384177425==--

