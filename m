Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E42CD3437
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11364.1725172854036783269
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VCK7q00t;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eH9S9Si8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010191ac50aaa7-9d9e2802-0681-4249-831f-fa253b29ae89-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/II3RBr9issglY5Rs5vlRn3G12F/uJMAmd4aNJYhmPw=;
	b=VCK7q00tROdglF3uAy6PuULribTLSb6yrnUJdojIaDfq10aqdg8FA/iFKSA8Rnz/
	Q6yJ28n3FQUwA99zX/8/heYQrUMwKKh8Jfj3df+7Wt6XNcQKM7kHN5ucgHucqntzSkN
	698sy+9LqRRex7ZWxALycERO5oQMfL91sHWLk73E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/II3RBr9issglY5Rs5vlRn3G12F/uJMAmd4aNJYhmPw=;
	b=eH9S9Si8EuKqie7xxxLRZLFLQyPcHvnGsMMNpAAwnPCCMhTXZEeDToZxQHnaS6sD
	7rdLdqpcBgtdYX0mZ1G88TEe1QO6NDTyskbm5tT/vNoizeq5F96KnhrCQ3dMR4bHEGa
	vozAHBjBudEpz7kb7MQt79TQuddrsVy8KF642QE8=
Content-Type: multipart/mixed; boundary="===============0427184686508314757=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 93b4bd2e0aaab1c22ae3e1a23f9e057a8f7451b2
 FAILED
Message-ID: <01010191ac50aaa7-9d9e2802-0681-4249-831f-fa253b29ae89-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204024

--===============0427184686508314757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *93b4bd2e0aaab1c22ae3e1a23f9e057a8f7451b2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake piglit' failed
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
Sstate summary: Wanted 432 Local 390 Mirrors 0 Missed 42 Current 562 (90% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 626 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 635 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 636 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 637 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 683 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 685 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 698 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 703 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 706 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 784 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 785 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 786 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_rpm_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 788 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_recipe_qa_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 815 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 816 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 862 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 994 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 923 of 994 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-demos-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-six-native-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-numpy-native-1.26.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe python3-mako-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-native-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-numpy-native-1.26.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-mako-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 989 of 994 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-mako-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-native-1.26.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-mako-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-native-1.26.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 994 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-native-1.26.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-native-1.26.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1734 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1811 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_fetch)
NOTE: Running setscene task 993 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1931 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1953 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.3.5-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1989 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_fetch)
NOTE: Running task 2078 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 2080 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 994 of 994 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: Running task 2157 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_write_config)
NOTE: Running task 2161 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 2164 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Started
NOTE: Running task 2176 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running task 2264 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2351 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 2359 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_unpack)
NOTE: Running task 2360 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.3.5-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2623 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 2637 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_collect_spdx_deps)
NOTE: Running task 2640 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_ipk)
NOTE: Running task 2641 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_deb)
NOTE: recipe python3-mako-1.3.5-r0: task do_patch: Started
NOTE: recipe python3-mako-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2646 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2647 of 2749 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Failed
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Failed
NOTE: recipe python3-mako-1.3.5-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk: Failed
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Failed
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-mako-1.3.5-r0: task do_collect_spdx_deps: Failed
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb: Failed
NOTE: recipe python3-mako-1.3.5-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2647 tasks of which 2626 didn't need to be rerun and 11 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062856.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062856.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 11 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa/24.0.7/temp/log.do_unpack.2661022
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2661071
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libglu/9.0.3/temp/log.do_unpack.2661076
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-mako/1.3.5/temp/log.do_prepare_recipe_sysroot.2661126
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-six/1.16.0/temp/log.do_package_write_ipk.2661171
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa-demos/8.5.0/temp/log.do_patch.2661250
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2661082
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa/24.0.7/temp/log.do_prepare_recipe_sysroot.2661043
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-mako/1.3.5/temp/log.do_collect_spdx_deps.2661170
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-six/1.16.0/temp/log.do_package_write_deb.2661172
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-mako/1.3.5/temp/log.do_patch.2661165
Summary: There were 11 ERROR messages, returning a non-zero exit code.

ERROR: mesa-2_24.0.7-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libglu-2_9.0.3-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-mako-1.3.5-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-six-1.16.0-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: mesa-demos-8.5.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa/24.0.7/temp/log.do_unpack.2661022
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2661071
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libglu/9.0.3/temp/log.do_unpack.2661076
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack) failed with exit code '1'
ERROR: mesa-2_24.0.7-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-mako/1.3.5/temp/log.do_prepare_recipe_sysroot.2661126
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-mako-1.3.5-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-six/1.16.0/temp/log.do_package_write_ipk.2661171
ERROR: python3-six-1.16.0-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa-demos/8.5.0/temp/log.do_patch.2661250
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2661082
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa/24.0.7/temp/log.do_prepare_recipe_sysroot.2661043
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-mako/1.3.5/temp/log.do_collect_spdx_deps.2661170
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: python3-mako-1.3.5-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-six/1.16.0/temp/log.do_package_write_deb.2661172
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_deb) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-mako/1.3.5/temp/log.do_patch.2661165
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.5.bb:do_patch) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0427184686508314757==--

