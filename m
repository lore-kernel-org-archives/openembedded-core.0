Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD58C25B57
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.8478.1698848703396694100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a1X/jI3v;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DwDtyd5Y;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460178-3f7c0ff7-6f84-4ef5-9fd0-6ee144d4331e-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WTfehHhDaEhGbghePuM2b/LRK89GVkrqzsNp6oCk3Hw=;
	b=a1X/jI3v0wxAoiYM1uXVDnjLfbCzYStmTB981HV7rY8ZykpOShT3SSxAjus35AjV
	NW39rAQernhI3NCpRgEJEX8I/RLHX6K+iUEMRQpGdtduWIIJ9tFDmUVtHtlPETKX9Jt
	NaStYLCzLGmHUjv9rZ6KUAZcWXE24F/g5i9Fu+Yo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WTfehHhDaEhGbghePuM2b/LRK89GVkrqzsNp6oCk3Hw=;
	b=DwDtyd5YY20pwkl4dNqIku9docyW7bAdu1qfi6ZtXvxmgyNPTn+wdqdpnX/XeVom
	xUbfUNv4dd7WHmhkeEEA0Ae3u3EqXq8c4cb8vpTVTa/zNggtjVOQpjRyZ+IqN2i8W6V
	DODzIl+daOzSqh1r8IWetdvGi+Z0loN4alDRJjMY=
Content-Type: multipart/mixed; boundary="===============7988205243857091472=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.21.3 FAILED
Message-ID: <0101018b8b460178-3f7c0ff7-6f84-4ef5-9fd0-6ee144d4331e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189927

--===============7988205243857091472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.21.3* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake go' failed
Loading cache...done.
Loaded 1843 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-61bdecd48dc10dce701e2ef019f7811282bdfd3f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:61bdecd48dc10dce701e2ef019f7811282bdfd3f"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 28 Mirrors 0 Missed 14 Current 246 (66% match, 95% complete)
Removing 3 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 798 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_recipe_qa)
NOTE: Running task 842 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package)
NOTE: recipe go-1.20.10-r0: task do_recipe_qa: Started
NOTE: recipe go-1.20.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 843 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_fetch)
NOTE: recipe go-1.20.10-r0: task do_fetch: Started
NOTE: recipe go-1.20.10-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_unpack)
NOTE: Running task 852 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe go-runtime-1.20.10-r0: task do_package: Started
NOTE: recipe go-1.20.10-r0: task do_unpack: Started
NOTE: recipe go-1.20.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe go-1.20.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe go-1.20.10-r0: task do_unpack: Succeeded
NOTE: Running task 853 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_patch)
NOTE: Running task 854 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_collect_spdx_deps)
NOTE: recipe go-1.20.10-r0: task do_patch: Started
NOTE: recipe go-1.20.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe go-1.20.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe go-1.20.10-r0: task do_patch: Succeeded
NOTE: Running task 855 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 856 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_populate_lic)
NOTE: recipe go-1.20.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe go-1.20.10-r0: task do_populate_lic: Started
NOTE: recipe go-1.20.10-r0: task do_populate_lic: Succeeded
NOTE: recipe go-1.20.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 857 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_configure)
NOTE: Running task 858 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_compile)
NOTE: recipe go-1.20.10-r0: task do_compile: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package unihash changed to ab2df200d4847db8b16feb09c54ba1c25eff276f914ca93a91991efaccc4e94f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_packagedata became valid
NOTE: Running setscene task 283 of 288 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 288 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_create_spdx_setscene)
NOTE: recipe go-runtime-1.20.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe go-runtime-1.20.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 288 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_packagedata_setscene)
NOTE: recipe go-runtime-1.20.10-r0: task do_packagedata_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe go-1.20.10-r0: task do_compile: Succeeded
NOTE: Running task 862 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_install)
NOTE: recipe go-1.20.10-r0: task do_install: Started
NOTE: recipe go-1.20.10-r0: task do_install: Succeeded
NOTE: Running task 863 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_package)
NOTE: Running task 864 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_populate_sysroot)
NOTE: recipe go-1.20.10-r0: task do_populate_sysroot: Started
NOTE: recipe go-1.20.10-r0: task do_package: Started
NOTE: recipe go-1.20.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe go-1.20.10-r0: task do_package: Succeeded
NOTE: Running task 865 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_packagedata)
NOTE: recipe go-1.20.10-r0: task do_packagedata: Started
NOTE: recipe go-1.20.10-r0: task do_packagedata: Succeeded
NOTE: Running task 866 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_create_spdx)
NOTE: Running task 867 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_package_write_rpm)
NOTE: Running task 868 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_package_qa)
NOTE: recipe go-1.20.10-r0: task do_create_spdx: Started
NOTE: recipe go-1.20.10-r0: task do_package_write_rpm: Started
NOTE: recipe go-1.20.10-r0: task do_package_qa: Started
NOTE: recipe go-1.20.10-r0: task do_package_qa: Succeeded
NOTE: recipe go-1.20.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 869 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_create_runtime_spdx)
NOTE: recipe go-1.20.10-r0: task do_create_runtime_spdx: Started
NOTE: recipe go-1.20.10-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe go-1.20.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 870 of 870 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go_1.20.10.bb:do_build)
NOTE: Tasks Summary: Attempted 870 tasks of which 850 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 21 ERROR messages, returning a non-zero exit code.

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: Taskhash mismatch ab2df200d4847db8b16feb09c54ba1c25eff276f914ca93a91991efaccc4e94f versus f456c5cc30c9f916775dfd959d605e6ff66a035173d1548e2d17bb6feb6860a3 for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7988205243857091472==--

