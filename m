Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BA9CD342C
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.11423.1725172854620825268
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MOf9cDoo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Je0HX4cp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191ac50ab0f-f010eeed-ea7c-4e34-92d0-37c88e8b886b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WEKu0p3Z8z6Xef+aD8hqBEp6oIP7p3F9O9u/ND8b7ZM=;
	b=MOf9cDooyCIndigf1a2TLzF+1wbhNywDprvVoZ9HVppmmGd3JQIMl5GnOrI3rxqZ
	A07qwWC8YaaOzEJLt+0d35lgHR7RN0J4fag40UttVrBfR8HHKJuwHRyzq11L4Kucv8v
	f9oLQpiRKFohRi+1YmjetVGRMDmljEzbBzmDQs+s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WEKu0p3Z8z6Xef+aD8hqBEp6oIP7p3F9O9u/ND8b7ZM=;
	b=Je0HX4cp+V4iY0myfhl6vEBO5aD5qfX0faoIKdnYMZboyATe90AnBr4uMFejSbql
	h2usGmupy/Mnq6wGRyMXPULVNLp+C+J+zb3iuxufcuaPXZ7E5PZamKfT2f1rzoOm9+S
	L++srBYWMLZnsVzYZDSbgPY4ozCduNogH+T7vlzA=
Content-Type: multipart/mixed; boundary="===============2384120987901815915=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 46a89dd646114ad688909f6f488d3ba73b4117e3 FAILED
Message-ID: <01010191ac50ab0f-f010eeed-ea7c-4e34-92d0-37c88e8b886b-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204037

--===============2384120987901815915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *46a89dd646114ad688909f6f488d3ba73b4117e3* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake vulkan-samples' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-69fe8a0f5dace7480b8e2d398b3560c8d7759a73"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:69fe8a0f5dace7480b8e2d398b3560c8d7759a73"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 99 Local 91 Mirrors 0 Missed 8 Current 203 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 234 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 235 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-samples-git-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-samples-git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-samples-git-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-samples-git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-samples-git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-samples-git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 302 of 302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-samples-git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-samples-git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 888 of 908 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_fetch)
NOTE: recipe vulkan-samples-git-r0: task do_fetch: Started
NOTE: recipe vulkan-samples-git-r0: task do_fetch: Succeeded
NOTE: Running task 889 of 908 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_unpack)
NOTE: Running task 890 of 908 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-samples-git-r0: task do_unpack: Started
NOTE: recipe vulkan-samples-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-samples-git-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe vulkan-samples-git-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 890 tasks of which 887 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062931.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062931.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-samples/git/temp/log.do_prepare_recipe_sysroot.2665212
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: vulkan-samples-git-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-samples/git/temp/log.do_prepare_recipe_sysroot.2665212
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_prepare_recipe_sysroot) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2384120987901815915==--

