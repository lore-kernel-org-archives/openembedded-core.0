Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58064C54E92
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11027.1747312306375871539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gZs5UIoA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VYJx+fqB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010196d3ede3d7-8e5d94ac-08d2-48de-93b9-8028f0192e7e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IDR1iWkvn3NY97sFQaMGeyQhBczu3pNmwfen53wzzlc=;
	b=gZs5UIoAqcNnvuO8CF3UkRXDCszemSiJbEcsJcy5lbhFIDJ69fKsH6HLUFr3ROIc
	R54g3bG2vWOdKhvKiAFR4pOeQs4tQvtWrY/MGo9FyyBv8pFrs97OwNMQj0U0ULyRg8I
	77PDUnUq5/GIvWSmMWsB7+KUHY2ExV7Gl9h++wzM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IDR1iWkvn3NY97sFQaMGeyQhBczu3pNmwfen53wzzlc=;
	b=VYJx+fqBgo8YYBXZiThzkbUHxXrPn8RuOgYa49DjwgJE3sxTl9nxjoQ+qhnjVBzG
	3tnc7Bh5Hl1WqdXeok+fUR78kKdrKmTGcLmnwxgumjn+ZcXDWKGXBplT5ZF9SMtHD90
	uUzHlZOM/7rHp/dX+nWofAjq3ZwQ480CWwu3vDEg=
Content-Type: multipart/mixed; boundary="===============0184528713005437340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] quilt,quilt-native: upgrading to 0.69,0.69 FAILED
Message-ID: <01010196d3ede3d7-8e5d94ac-08d2-48de-93b9-8028f0192e7e-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216582

--===============0184528713005437340==
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
Loaded 1916 entries from dependency cache.
Parsing recipes...done.
Parsing of 938 .bb files complete (937 cached, 1 parsed). 1917 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:8c1889471cf35f881def36851bc7e597a87dc9db"

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
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515060050.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515060050.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: Execution of 'git rebase devtool-no-overrides' failed with exit code 1:
error: cannot rebase: You have unstaged changes.
error: Please commit or stash them.

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/quilt-native/0.68/devtooltmp-nb6ri4v7/temp/log.do_patch.2764285
ERROR: Extracting source for quilt-native failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0184528713005437340==--

