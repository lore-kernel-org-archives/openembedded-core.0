Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D2ACD37BD
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11344.1725172853160169470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TpXHMdGE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PhfhwbRD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50a724-70e55ddb-3002-4b30-812d-57ecaf14f6df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lBiPu4hJVQ2IBBD8mRNbhwDX5O6jmg0cCGhIEkD4VaY=;
	b=TpXHMdGEwjieX+PN+MoTMtjHcn4aJ7YX7EuXng52oUxEIG5vbkcn2i943MXLsgoQ
	mG0GN9zYAE25g+l9+lC86nxc05XxD2O0PWb+30ogbmCb/V+E1UdKnjHFMIgxV5nutLa
	MTXjr7EqcBFqgJ3TID2zIi7mNoA+jH2h4TlbwV5A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lBiPu4hJVQ2IBBD8mRNbhwDX5O6jmg0cCGhIEkD4VaY=;
	b=PhfhwbRDyc3w4TRWab2GmG5pEGbg15TUMMWyXPRMRLqcwjnueEoBRey02x6rX9C7
	mnlPmsa0D3LfzDxFazE3myFHUX7VZxFebAQ6eWO7SP6S/36RfP1YBUw42ZK+shJit6Z
	nj5+MqrhOWypjierj/3sHgOVXQFO+fBm3G8jVv0E=
Content-Type: multipart/mixed; boundary="===============1107511293099904178=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.7.1 FAILED
Message-ID: <01010191ac50a724-70e55ddb-3002-4b30-812d-57ecaf14f6df-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203984

--===============1107511293099904178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nfs-utils* to *2.7.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake nfs-utils' failed
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
DISTRO_VERSION       = "5.0+snapshot-ae0abf6bc5a042b7a57fd7144e3af09a957ed950"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ae0abf6bc5a042b7a57fd7144e3af09a957ed950"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 405 Local 375 Mirrors 0 Missed 30 Current 588 (92% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 597 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 599 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 701 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 706 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 769 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 770 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 771 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 772 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 776 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 800 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.10.0.bb:do_create_spdx_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nfs-utils-2.6.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nfs-utils-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnl-1_3.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nfs-utils-2.6.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 930 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 931 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nfs-utils-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 934 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 936 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 939 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nfs-utils-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnl-1_3.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.10.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 942 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rpcbind-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nfs-utils-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevent-2.1.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnl-1_3.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 984 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 985 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnl-1_3.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevent-2.1.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnl-1_3.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1555 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1744 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1836 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_fetch)
NOTE: Running task 1842 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1997 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevent-2.1.12-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Started
NOTE: Running task 2089 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 2162 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb:do_fetch)
NOTE: Running task 2195 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: Running task 2349 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe nfs-utils-2.6.4-r0: task do_fetch: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2586 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_collect_spdx_deps)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libevent-2.1.12-r0: task do_fetch: Succeeded
NOTE: Running task 2634 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_unpack)
NOTE: Running task 2635 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevent-2.1.12-r0: task do_unpack: Started
NOTE: recipe libevent-2.1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevent-2.1.12-r0: task do_unpack: Succeeded
NOTE: Running task 2636 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_patch)
NOTE: Running task 2637 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_collect_spdx_deps)
NOTE: recipe nfs-utils-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 2638 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb:do_unpack)
NOTE: recipe libevent-2.1.12-r0: task do_patch: Started
NOTE: recipe libevent-2.1.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe nfs-utils-2.6.4-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: Running task 2639 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 2640 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe rpcbind-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 2641 of 2743 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb:do_unpack)
NOTE: recipe rpcbind-1.2.7-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe rpcbind-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Failed
NOTE: recipe libevent-2.1.12-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe nfs-utils-2.6.4-r0: task do_unpack: Failed
NOTE: recipe quota-4.09-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Failed
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe libevent-2.1.12-r0: task do_collect_spdx_deps: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe e2fsprogs-1.47.1-r0: task do_collect_spdx_deps: Failed
NOTE: recipe libevent-2.1.12-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2641 tasks of which 2623 didn't need to be rerun and 11 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060529.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060529.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 11 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2584695
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_patch.2584716
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libevent/2.1.12/temp/log.do_prepare_recipe_sysroot.2584762
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nfs-utils/2.6.4/temp/log.do_unpack.2584787
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/quota/4.09/temp/log.do_patch.2584807
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_collect_spdx_deps.2584729
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_prepare_recipe_sysroot.2584717
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libevent/2.1.12/temp/log.do_collect_spdx_deps.2584782
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2584711
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_collect_spdx_deps.2584742
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libevent/2.1.12/temp/log.do_patch.2584778
Summary: There were 11 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: e2fsprogs-1.47.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libevent-2.1.12-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: nfs-utils-2.6.4-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: quota-4.09-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2584695
ERROR: base-files-3.0.14-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_patch.2584716
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch) failed with exit code '1'
ERROR: e2fsprogs-1.47.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libevent/2.1.12/temp/log.do_prepare_recipe_sysroot.2584762
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: libevent-2.1.12-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nfs-utils/2.6.4/temp/log.do_unpack.2584787
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/quota/4.09/temp/log.do_patch.2584807
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_collect_spdx_deps.2584729
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_prepare_recipe_sysroot.2584717
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: e2fsprogs-1.47.1-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libevent/2.1.12/temp/log.do_collect_spdx_deps.2584782
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: libevent-2.1.12-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2584711
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_collect_spdx_deps.2584742
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libevent/2.1.12/temp/log.do_patch.2584778
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevent/libevent_2.1.12.bb:do_patch) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1107511293099904178==--

